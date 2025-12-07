#!/bin/bash
set -e
exec > /var/log/user-data.log 2>&1

# ============================================
# VARIÁVEIS - ALTERE CONFORME SEU AMBIENTE
# ============================================
EFS_FILE_SYSTEM_ID="fs-0c451d23d6c6ba52b"
RDS_ENDPOINT="seu-rds-endpoint.region.rds.amazonaws.com"
RDS_USERNAME="admin"
RDS_PASSWORD="sua-senha-aqui"
RDS_DATABASE="meubanco"
# ============================================

EFS_MOUNT_POINT="/mnt/efs"
LOCAL_WEB_DIR="/var/www/html"
EFS_WEB_DIR="${EFS_MOUNT_POINT}/html"

yum update -y
yum install -y amazon-efs-utils httpd php php-fpm php-mysqlnd php-pdo

mkdir -p ${EFS_MOUNT_POINT}
sleep 30
mount -t efs -o tls ${EFS_FILE_SYSTEM_ID}:/ ${EFS_MOUNT_POINT}
mountpoint -q ${EFS_MOUNT_POINT} || exit 1
echo "${EFS_FILE_SYSTEM_ID}:/ ${EFS_MOUNT_POINT} efs _netdev,tls 0 0" >> /etc/fstab

mkdir -p ${EFS_WEB_DIR}
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Cria arquivo PHP local (na instância EC2) que lista arquivos dinamicamente
cat > ${LOCAL_WEB_DIR}/index.php << 'ENDOFPHP'
<?php
$localDir = '/var/www/html';
$instanceId = @file_get_contents('http://169.254.169.254/latest/meta-data/instance-id') ?: 'N/A';
$files = @scandir($localDir) ?: array();
$files = array_diff($files, array('.', '..', 'index.php'));
$files = array_values($files); // Reindexa o array
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Demonstração EFS - Arquivos Locais</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #232f3e;
            border-bottom: 3px solid #ff9900;
            padding-bottom: 10px;
        }
        .info {
            background-color: #e6f2ff;
            padding: 15px;
            border-left: 4px solid #0066cc;
            margin: 20px 0;
        }
        .file-list {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 4px;
            margin: 15px 0;
        }
        .file-item {
            padding: 8px;
            margin: 5px 0;
            background-color: white;
            border-left: 3px solid #ff9900;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .file-item a {
            color: #0066cc;
            text-decoration: none;
            font-weight: bold;
        }
        .file-item a:hover {
            text-decoration: underline;
        }
        .file-size {
            color: #666;
            font-size: 0.9em;
        }
        a {
            color: #0066cc;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📁 Arquivos Locais (EC2 Instance)</h1>
        <div class="info">
            <strong>Localização:</strong> <?php echo htmlspecialchars($localDir); ?><br>
            <strong>Status:</strong> Armazenado localmente na instância EC2<br>
            <strong>Comportamento:</strong> Este arquivo existe apenas nesta instância específica<br>
            <strong>Instance ID:</strong> <?php echo htmlspecialchars($instanceId); ?><br>
            <strong>Total de arquivos:</strong> <?php echo count($files); ?>
        </div>
        <div class="file-list">
            <h3>Arquivos Locais Disponíveis (Lista Dinâmica):</h3>
            <?php if (empty($files)): ?>
                <div class="file-item">Nenhum arquivo encontrado (exceto este index.php)</div>
            <?php else: ?>
                <?php foreach ($files as $file): ?>
                    <?php
                    $filePath = $localDir . '/' . $file;
                    $fileSize = is_file($filePath) ? filesize($filePath) : 0;
                    $fileSizeFormatted = $fileSize > 1024 ? number_format($fileSize / 1024, 2) . ' KB' : $fileSize . ' bytes';
                    $icon = is_dir($filePath) ? '📁' : '📄';
                    ?>
                    <div class="file-item">
                        <span>
                            <?php echo $icon; ?> 
                            <?php if (is_file($filePath)): ?>
                                <a href="<?php echo htmlspecialchars($file); ?>"><?php echo htmlspecialchars($file); ?></a>
                            <?php else: ?>
                                <?php echo htmlspecialchars($file); ?>
                            <?php endif; ?>
                        </span>
                        <span class="file-size"><?php echo $fileSizeFormatted; ?></span>
                    </div>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>
        <p><a href="/efs/">👉 EFS</a> | <a href="/rds.php">🗄️ RDS</a></p>
    </div>
</body>
</html>
ENDOFPHP

echo "Arquivo local da instância EC2" > ${LOCAL_WEB_DIR}/local-file-1.txt
echo "Não compartilhado entre instâncias" > ${LOCAL_WEB_DIR}/local-file-2.txt

cat > ${LOCAL_WEB_DIR}/db_config.php << DBCONF
<?php define('DB_HOST','${RDS_ENDPOINT}');define('DB_USER','${RDS_USERNAME}');define('DB_PASS','${RDS_PASSWORD}');define('DB_NAME','${RDS_DATABASE}');function getDBConnection(){try{return new PDO("mysql:host=".DB_HOST.";dbname=".DB_NAME,DB_USER,DB_PASS,[PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION]);}catch(PDOException $e){return null;}}
DBCONF

cat > ${LOCAL_WEB_DIR}/rds.php << 'RDSPHP'
<?php require_once 'db_config.php';$message='';$error='';$sql="CREATE TABLE IF NOT EXISTS mensagens(id INT AUTO_INCREMENT PRIMARY KEY,nome VARCHAR(100),descricao TEXT,instance_id VARCHAR(50),created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)";if($_SERVER['REQUEST_METHOD']==='POST'&&isset($_POST['nome'])){$pdo=getDBConnection();if($pdo){try{$pdo->exec($sql);$stmt=$pdo->prepare("INSERT INTO mensagens(nome,descricao,instance_id)VALUES(?,?,?)");$instanceId=@file_get_contents('http://169.254.169.254/latest/meta-data/instance-id')?:'N/A';$stmt->execute([$_POST['nome'],$_POST['descricao'],$instanceId]);$message='Salvo!';}catch(PDOException $e){$error='Erro: '.$e->getMessage();}}else{$error='Erro de conexão';}}$dados=[];$pdo=getDBConnection();if($pdo){try{$pdo->exec($sql);$stmt=$pdo->query("SELECT * FROM mensagens ORDER BY created_at DESC");$dados=$stmt->fetchAll(PDO::FETCH_ASSOC);}catch(PDOException $e){$error='Erro: '.$e->getMessage();}}$instanceId=@file_get_contents('http://169.254.169.254/latest/meta-data/instance-id')?:'N/A';?>
<!DOCTYPE html><html lang="pt-BR"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1.0"><title>RDS MySQL</title><style>body{font-family:Arial,sans-serif;max-width:900px;margin:50px auto;padding:20px;background-color:#f5f5f5}.container{background-color:white;padding:30px;border-radius:8px;box-shadow:0 2px 4px rgba(0,0,0,0.1);margin-bottom:20px}h1{color:#232f3e;border-bottom:3px solid #ff9900;padding-bottom:10px}.form-group{margin-bottom:15px}label{display:block;margin-bottom:5px;font-weight:bold;color:#232f3e}input[type="text"],textarea{width:100%;padding:10px;border:1px solid #ddd;border-radius:4px;box-sizing:border-box}textarea{min-height:80px}button{background-color:#ff9900;color:white;padding:12px 30px;border:none;border-radius:4px;cursor:pointer;font-size:16px;font-weight:bold}button:hover{background-color:#ec7211}.message{padding:15px;margin:15px 0;border-radius:4px}.success{background-color:#d4edda;color:#155724}.error{background-color:#f8d7da;color:#721c24}table{width:100%;border-collapse:collapse;margin-top:20px}th,td{padding:12px;text-align:left;border-bottom:1px solid #ddd}th{background-color:#232f3e;color:white}tr:hover{background-color:#f5f5f5}.info{background-color:#e6f2ff;padding:15px;border-left:4px solid #0066cc;margin:20px 0}a{color:#0066cc;text-decoration:none}a:hover{text-decoration:underline}.badge{background-color:#ff9900;color:white;padding:3px 8px;border-radius:3px;font-size:12px}</style></head><body><div class="container"><h1>🗄️ RDS MySQL</h1><div class="info"><strong>Instance:</strong> <?=htmlspecialchars($instanceId)?><br><strong>DB:</strong> <?=DB_NAME?><br><strong>Host:</strong> <?=DB_HOST?></div><?php if($message):?><div class="message success"><?=htmlspecialchars($message)?></div><?php endif;?><?php if($error):?><div class="message error"><?=htmlspecialchars($error)?></div><?php endif;?><h2>📝 Adicionar Registro</h2><form method="POST"><div class="form-group"><label>Nome:</label><input type="text" name="nome" required></div><div class="form-group"><label>Descrição:</label><textarea name="descricao"></textarea></div><button type="submit">💾 Salvar</button></form></div><div class="container"><h2>📊 Registros</h2><p>Total: <span class="badge"><?=count($dados)?></span></p><?php if(empty($dados)):?><p>Nenhum registro. Adicione acima!</p><?php else:?><table><tr><th>ID</th><th>Nome</th><th>Descrição</th><th>Instance</th><th>Data</th></tr><?php foreach($dados as $r):?><tr><td><?=$r['id']?></td><td><?=htmlspecialchars($r['nome'])?></td><td><?=htmlspecialchars($r['descricao'])?></td><td><?=$r['instance_id']?></td><td><?=$r['created_at']?></td></tr><?php endforeach;?></table><?php endif;?><p style="margin-top:20px"><a href="/">← Locais</a> | <a href="/efs/">EFS</a></p></div></body></html>
RDSPHP

# Cria arquivo PHP no EFS (compartilhado entre todas as instâncias) que lista arquivos dinamicamente
cat > ${EFS_WEB_DIR}/index.php << 'ENDOFPHP'
<?php
$efsDir = '/mnt/efs/html';
$instanceId = @file_get_contents('http://169.254.169.254/latest/meta-data/instance-id') ?: 'N/A';
$files = @scandir($efsDir) ?: array();
$files = array_diff($files, array('.', '..', 'index.php'));
$files = array_values($files); // Reindexa o array
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Demonstração EFS - Arquivos Compartilhados</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #232f3e;
            border-bottom: 3px solid #ff9900;
            padding-bottom: 10px;
        }
        .info {
            background-color: #e6f7e6;
            padding: 15px;
            border-left: 4px solid #00aa00;
            margin: 20px 0;
        }
        .file-list {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 4px;
            margin: 15px 0;
        }
        .file-item {
            padding: 8px;
            margin: 5px 0;
            background-color: white;
            border-left: 3px solid #00aa00;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .file-item a {
            color: #0066cc;
            text-decoration: none;
            font-weight: bold;
        }
        .file-item a:hover {
            text-decoration: underline;
        }
        .file-size {
            color: #666;
            font-size: 0.9em;
        }
        a {
            color: #0066cc;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🌐 Arquivos Compartilhados (Amazon EFS)</h1>
        <div class="info">
            <strong>Localização:</strong> <?php echo htmlspecialchars($efsDir); ?><br>
            <strong>Status:</strong> Armazenado no Amazon EFS<br>
            <strong>Comportamento:</strong> Este arquivo é compartilhado entre TODAS as instâncias que montam este EFS<br>
            <strong>Instance ID atual:</strong> <?php echo htmlspecialchars($instanceId); ?><br>
            <strong>Total de arquivos:</strong> <?php echo count($files); ?>
        </div>
        <div class="file-list">
            <h3>Arquivos no EFS Disponíveis (Lista Dinâmica):</h3>
            <?php if (empty($files)): ?>
                <div class="file-item">Nenhum arquivo encontrado (exceto este index.php)</div>
            <?php else: ?>
                <?php foreach ($files as $file): ?>
                    <?php
                    $filePath = $efsDir . '/' . $file;
                    $fileSize = is_file($filePath) ? filesize($filePath) : 0;
                    $fileSizeFormatted = $fileSize > 1024 ? number_format($fileSize / 1024, 2) . ' KB' : $fileSize . ' bytes';
                    $icon = is_dir($filePath) ? '📁' : '📄';
                    ?>
                    <div class="file-item">
                        <span>
                            <?php echo $icon; ?> 
                            <?php if (is_file($filePath)): ?>
                                <a href="<?php echo htmlspecialchars($file); ?>"><?php echo htmlspecialchars($file); ?></a>
                            <?php else: ?>
                                <?php echo htmlspecialchars($file); ?>
                            <?php endif; ?>
                        </span>
                        <span class="file-size"><?php echo $fileSizeFormatted; ?></span>
                    </div>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>
        <p><a href="/">👈 Local</a> | <a href="/rds.php">🗄️ RDS</a></p>
    </div>
</body>
</html>
ENDOFPHP

echo "Arquivo no EFS compartilhado" > ${EFS_WEB_DIR}/shared-file-1.txt
echo "Visível em todas as instâncias" > ${EFS_WEB_DIR}/shared-file-2.txt
echo '{"message":"EFS compartilhado","time":"'$(date -Iseconds)'"}' > ${EFS_WEB_DIR}/shared-data.json

chown -R apache:apache ${LOCAL_WEB_DIR} ${EFS_WEB_DIR}
chmod -R 755 ${LOCAL_WEB_DIR} ${EFS_WEB_DIR}

cat > /etc/httpd/conf.d/efs.conf << EOF
# Alias para servir arquivos do EFS
# Funciona tanto para /efs quanto para /efs/
Alias /efs ${EFS_WEB_DIR}/

# Configuração do diretório EFS
<Directory "${EFS_WEB_DIR}">
    Options Indexes FollowSymLinks
    AllowOverride None
    Require all granted
    DirectoryIndex index.php index.html
</Directory>
EOF


# Configura PHP-FPM e Apache para processar PHP
echo "Configurando PHP-FPM..."

# Prepara o diretório do socket PHP-FPM
mkdir -p /var/run/php-fpm
chown apache:apache /var/run/php-fpm
chmod 755 /var/run/php-fpm

# Configura o pool www do PHP-FPM
cat > /etc/php-fpm.d/www.conf << 'EOF'
[www]
user=apache
group=apache
listen=/var/run/php-fpm/www.sock
listen.owner=apache
listen.group=apache
listen.mode=0660
pm=dynamic
pm.max_children=50
pm.start_servers=5
pm.min_spare_servers=5
pm.max_spare_servers=35
EOF

systemctl enable php-fpm
systemctl start php-fpm
sleep 3

if [ -S /var/run/php-fpm/www.sock ]; then
    chown apache:apache /var/run/php-fpm/www.sock
    chmod 660 /var/run/php-fpm/www.sock
fi

rm -f /etc/httpd/conf.d/php-fpm.conf /etc/httpd/conf.modules.d/15-php.conf
echo 'LoadModule proxy_module modules/mod_proxy.so
LoadModule proxy_fcgi_module modules/mod_proxy_fcgi.so' > /etc/httpd/conf.modules.d/00-proxy.conf
echo '<FilesMatch \.(php|phar)$>
SetHandler "proxy:unix:/var/run/php-fpm/www.sock|fcgi://localhost"
</FilesMatch>
DirectoryIndex index.php index.html' > /etc/httpd/conf.d/php.conf

cat >> /etc/php-fpm.d/www.conf << EOF
env[RDS_ENDPOINT]=\$RDS_ENDPOINT
env[RDS_USERNAME]=\$RDS_USERNAME
env[RDS_PASSWORD]=\$RDS_PASSWORD
env[RDS_DATABASE]=\$RDS_DATABASE
EOF

systemctl enable httpd
systemctl restart php-fpm httpd