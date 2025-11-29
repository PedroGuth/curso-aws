# Curso: AWS Básico - Criando seu Primeiro Servidor na Nuvem

## Visão Geral do Curso

Este curso ensina os fundamentos da AWS para criar e gerenciar servidores na nuvem. Você aprenderá a configurar uma arquitetura básica com servidores web, banco de dados e armazenamento, utilizando os principais serviços da AWS.

**Arquitetura Alvo:**
- Multi-AZ deployment
- Application Load Balancer
- Auto Scaling Group
- Amazon EFS para armazenamento compartilhado
- Amazon Aurora com réplicas
- Amazon S3 para armazenamento de objetos
- Sub-redes públicas e privadas
- NAT Gateway para acesso à internet

---

## Módulo 1: Introdução à AWS e Conceitos Básicos

### Objetivos de Aprendizado
- Entender o que é AWS e seus principais serviços
- Compreender conceitos básicos de nuvem
- Conhecer os componentes da arquitetura que vamos construir
- Criar uma conta AWS e navegar no console

### Conteúdo
1. **O que é AWS?**
   - Introdução à Amazon Web Services
   - Principais serviços que vamos usar
   - Regiões e Availability Zones
   - Modelo de preços (pay-as-you-go)

2. **Conceitos Básicos de Nuvem**
   - O que é computação em nuvem
   - Benefícios da nuvem
   - Infraestrutura como serviço (IaaS)

3. **Componentes da Arquitetura**
   - Visão geral da arquitetura que vamos construir
   - Servidores (EC2)
   - Banco de dados (Aurora)
   - Armazenamento (EFS e S3)
   - Balanceador de carga (ALB)

4. **Primeiros Passos na AWS**
   - Criar conta AWS
   - Navegar no Console AWS
   - Configurar billing alerts
   - Entender o Free Tier

---

## Módulo 2: Fundamentos de Networking na AWS - VPC e Sub-redes

### Objetivos de Aprendizado
- Criar e configurar uma VPC
- Entender o conceito de sub-redes públicas e privadas
- Configurar CIDR blocks e roteamento
- Implementar isolamento de rede

### Conteúdo
1. **Amazon Virtual Private Cloud (VPC)**
   - O que é uma VPC
   - CIDR blocks e IP addressing
   - Default VPC vs. Custom VPC
   - Limites e quotas

2. **Sub-redes (Subnets)**
   - Sub-redes públicas vs. privadas
   - Availability Zones e distribuição de sub-redes
   - IP addressing em sub-redes
   - Route Tables e roteamento

3. **Internet Gateway**
   - Função do Internet Gateway
   - Configuração e anexação à VPC
   - Roteamento de tráfego público

4. **NAT Gateway**
   - Necessidade de NAT Gateway
   - NAT Gateway vs. NAT Instance
   - Configuração em sub-redes públicas
   - Custos e considerações

5. **Hands-on: Configurando a Base de Rede**
   - Criar VPC com CIDR apropriado
   - Criar sub-redes públicas (2 AZs)
   - Criar sub-redes privadas para aplicação (2 AZs)
   - Criar sub-redes privadas para banco de dados (2 AZs)
   - Configurar Internet Gateway
   - Configurar NAT Gateways
   - Configurar Route Tables

---

## Módulo 3: Security Groups e Network ACLs

### Objetivos de Aprendizado
- Implementar segurança em nível de rede
- Configurar Security Groups
- Entender Network ACLs
- Aplicar princípios de menor privilégio

### Conteúdo
1. **Security Groups**
   - Conceito de firewall stateful
   - Regras de entrada (Inbound) e saída (Outbound)
   - Associação com recursos
   - Default Security Groups

2. **Network ACLs**
   - Firewall stateless
   - Regras numeradas e ordem de avaliação
   - Diferenças entre Security Groups e NACLs
   - Quando usar cada um

3. **Best Practices de Segurança**
   - Princípio de menor privilégio
   - Segregação por camadas
   - Security Groups para cada camada
   - Revisão e auditoria de regras

4. **Hands-on: Configurando Segurança de Rede**
   - Criar Security Group para Load Balancer
   - Criar Security Group para Application Servers
   - Criar Security Group para Database
   - Configurar regras específicas por camada
   - Testar conectividade

---

## Módulo 4: Application Load Balancer (ALB)

### Objetivos de Aprendizado
- Entender o papel do Load Balancer na arquitetura
- Configurar um Application Load Balancer
- Implementar health checks
- Configurar listeners e target groups

### Conteúdo
1. **Load Balancing na AWS**
   - Tipos de Load Balancers (ALB, NLB, CLB, GWLB)
   - Quando usar Application Load Balancer
   - Benefícios de distribuição de carga

2. **Application Load Balancer**
   - Arquitetura e componentes
   - Listeners e Rules
   - Target Groups
   - Health Checks e configuração

3. **Integração com Auto Scaling**
   - Registro automático de instâncias
   - Desregistro de instâncias não saudáveis
   - Distribuição entre múltiplas AZs

5. **Hands-on: Configurando o ALB**
   - Criar Application Load Balancer
   - Configurar em sub-redes públicas
   - Criar Target Group
   - Configurar Health Checks
   - Configurar Listener (HTTP/HTTPS)
   - Testar distribuição de carga

---

## Módulo 5: Amazon EC2 e Auto Scaling

### Objetivos de Aprendizado
- Criar e configurar instâncias EC2
- Entender Auto Scaling Groups
- Configurar políticas de scaling
- Implementar alta disponibilidade com Auto Scaling

### Conteúdo
1. **Amazon EC2 Fundamentals**
   - Tipos de instâncias
   - AMIs (Amazon Machine Images)
   - User Data scripts
   - Instance Metadata Service

2. **Launch Templates**
   - Criando templates reutilizáveis
   - Configuração de AMI, instance type, security groups
   - User data para inicialização
   - Versionamento de templates

3. **Auto Scaling Groups**
   - Conceito e benefícios
   - Configuração básica
   - Múltiplas Availability Zones
   - Health checks e replacement de instâncias

4. **Scaling Policies**
   - Target Tracking Scaling (básico)
   - Step Scaling (básico)
   - Configuração de métricas (CPU, memória)

5. **Hands-on: Configurando Auto Scaling**
   - Criar Launch Template
   - Criar Auto Scaling Group
   - Configurar para múltiplas AZs
   - Configurar políticas de scaling
   - Integrar com ALB Target Group
   - Testar scaling automático

---

## Módulo 6: Amazon Elastic File System (EFS)

### Objetivos de Aprendizado
- Entender armazenamento compartilhado
- Configurar Amazon EFS
- Montar EFS em instâncias EC2
- Implementar backup e lifecycle management

### Conteúdo
1. **Armazenamento Compartilhado na AWS**
   - EFS vs. EBS vs. S3
   - Casos de uso para EFS
   - Performance e throughput

2. **Amazon EFS**
   - Sistema de arquivos gerenciado
   - Multi-AZ nativo
   - Escalabilidade automática
   - Performance modes (General Purpose, Max I/O)

3. **EFS Mount Targets**
   - O que são Mount Targets
   - Configuração em sub-redes
   - Security Groups para EFS
   - DNS e resolução de nomes

4. **Backup Básico do EFS**
   - Por que fazer backup
   - AWS Backup básico
   - Restaurar de backup

5. **Hands-on: Configurando EFS**
   - Criar sistema de arquivos EFS
   - Criar Mount Targets em sub-redes de aplicação
   - Configurar Security Groups
   - Montar EFS em instâncias EC2
   - Testar acesso compartilhado
   - Configurar backup

---

## Módulo 7: Amazon Aurora - Banco de Dados Gerenciado

### Objetivos de Aprendizado
- Entender Amazon Aurora
- Configurar cluster Aurora
- Implementar réplicas de leitura
- Configurar backup e restore

### Conteúdo
1. **Amazon Aurora Overview**
   - Aurora vs. RDS tradicional
   - Compatibilidade com MySQL e PostgreSQL
   - Arquitetura e storage
   - Performance e escalabilidade

2. **Aurora Clusters**
   - Primary instance
   - Aurora Replicas (read replicas)
   - Failover automático
   - Endpoints (cluster e instance)

3. **Configuração de Alta Disponibilidade**
   - Multi-AZ deployment
   - Automatic failover
   - RTO e RPO do Aurora
   - Monitoring failover events

4. **Subnet Groups e Security**
   - DB Subnet Groups
   - Security Groups para Aurora
   - Isolamento em sub-redes privadas

5. **Backup e Restore**
   - Automated backups
   - Point-in-time recovery
   - Snapshot manual
   - Restaurar de backup

6. **Hands-on: Configurando Aurora**
   - Criar DB Subnet Group
   - Criar cluster Aurora (Primary)
   - Adicionar Aurora Replica
   - Configurar Security Groups
   - Testar conectividade
   - Configurar backups
   - Testar failover

---

## Módulo 8: Amazon S3 - Armazenamento de Objetos

### Objetivos de Aprendizado
- Entender o que é Amazon S3
- Criar e gerenciar buckets
- Fazer upload e download de arquivos
- Configurar permissões e versionamento

### Conteúdo
1. **O que é Amazon S3?**
   - Armazenamento de objetos na nuvem
   - Casos de uso comuns
   - Diferença entre S3, EFS e EBS
   - Estrutura: Buckets e Objects

2. **Criando e Gerenciando Buckets**
   - Nomenclatura de buckets (regras globais)
   - Escolhendo a região
   - Configurações básicas
   - Organização de objetos

3. **Upload e Download de Arquivos**
   - Upload via Console AWS
   - Upload via AWS CLI (básico)
   - Download de arquivos
   - Gerenciamento de objetos

4. **Permissões e Acesso**
   - Bucket policies
   - Access Control Lists (ACLs)
   - Public vs. Private buckets
   - IAM policies para S3

5. **Versionamento**
   - Habilitar versionamento
   - Gerenciar versões de objetos
   - Restaurar versões anteriores

6. **Storage Classes**
   - Standard
   - Standard-IA (Infrequent Access)
   - Glacier (arquivamento)
   - Quando usar cada classe

7. **Hands-on: Trabalhando com S3**
   - Criar bucket
   - Fazer upload de arquivos
   - Configurar permissões
   - Habilitar versionamento
   - Testar acesso público e privado
   - Configurar lifecycle policies básicas

---

## Módulo 9: Segurança Básica na AWS

### Objetivos de Aprendizado
- Entender conceitos básicos de segurança na AWS
- Configurar IAM básico
- Implementar encryption básico
- Aplicar boas práticas de segurança

### Conteúdo
1. **IAM (Identity and Access Management) Básico**
   - O que é IAM
   - Usuários, grupos e roles
   - Políticas básicas (policies)
   - IAM roles para EC2

2. **Encryption Básico**
   - Encryption at rest (EBS, EFS, Aurora, S3)
   - Encryption in transit (HTTPS/TLS)
   - Quando usar encryption

3. **Security Groups - Revisão e Boas Práticas**
   - Revisar Security Groups criados
   - Princípio de menor privilégio
   - Regras específicas por camada
   - Testar conectividade

4. **Logging Básico**
   - CloudWatch Logs
   - VPC Flow Logs (conceito básico)
   - Por que fazer logging

5. **Boas Práticas de Segurança**
   - Não usar root user para operações diárias
   - Habilitar MFA
   - Revisar permissões regularmente
   - Manter sistemas atualizados

6. **Hands-on: Configurando Segurança Básica**
   - Criar usuário IAM
   - Configurar IAM role para EC2
   - Habilitar encryption nos recursos
   - Revisar Security Groups
   - Habilitar CloudWatch Logs básico

---

## Módulo 10: Monitoramento Básico com CloudWatch

### Objetivos de Aprendizado
- Entender o que é CloudWatch
- Visualizar métricas básicas
- Criar dashboards simples
- Configurar alertas básicos

### Conteúdo
1. **Amazon CloudWatch - Introdução**
   - O que é CloudWatch
   - Métricas vs. Logs
   - Dashboards
   - Alarms

2. **Métricas Básicas por Serviço**
   - EC2: CPU, memória, rede
   - ALB: requisições, latência
   - Auto Scaling: número de instâncias
   - Aurora: conexões, CPU
   - S3: armazenamento, requisições

3. **CloudWatch Logs Básico**
   - O que são logs
   - Log groups e streams
   - Visualizar logs de aplicação
   - Retenção de logs

4. **Alertas Básicos**
   - Criar alarmes simples
   - Notificações por email
   - Quando criar alertas

5. **Hands-on: Configurando Monitoramento Básico**
   - Visualizar métricas de EC2
   - Criar dashboard simples
   - Criar alarme de CPU
   - Configurar notificação por email
   - Visualizar logs básicos

---

## Módulo 11: Backup Básico na AWS

### Objetivos de Aprendizado
- Entender a importância de backups
- Configurar backups automáticos
- Fazer snapshots manuais
- Restaurar de backups

### Conteúdo
1. **Por que Fazer Backup?**
   - Proteção contra perda de dados
   - Recuperação de desastres
   - Conformidade e requisitos

2. **Backup do Banco de Dados (Aurora)**
   - Backup automático
   - Snapshots manuais
   - Point-in-time recovery
   - Restaurar de backup

3. **Backup do Sistema de Arquivos (EFS)**
   - AWS Backup básico
   - Criar backup de EFS
   - Restaurar EFS

4. **Backup de Instâncias EC2**
   - AMIs (Amazon Machine Images)
   - Criar AMI de uma instância
   - Launchar instância de uma AMI
   - Snapshots de EBS

5. **Backup no S3**
   - Versionamento (já visto)
   - Lifecycle policies básicas
   - Cross-region replication (conceito)

6. **Hands-on: Configurando Backups**
   - Configurar backup automático do Aurora
   - Criar snapshot manual do Aurora
   - Criar AMI de uma instância EC2
   - Configurar backup básico do EFS
   - Testar restauração de backup

---

## Recursos e Materiais Adicionais

### Documentação Oficial AWS
- [VPC Documentation](https://docs.aws.amazon.com/vpc/)
- [EC2 Documentation](https://docs.aws.amazon.com/ec2/)
- [EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/)
- [Application Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/)
- [Amazon EFS](https://docs.aws.amazon.com/efs/)
- [Amazon Aurora](https://docs.aws.amazon.com/aurora/)
- [Amazon S3](https://docs.aws.amazon.com/s3/)
- [CloudWatch](https://docs.aws.amazon.com/cloudwatch/)

### Ferramentas Úteis
- AWS Pricing Calculator
- AWS Architecture Icons
- AWS Free Tier

---

## Pré-requisitos

- Nenhum conhecimento prévio de AWS necessário
- Conhecimento básico de computadores e internet
- Acesso a conta AWS (pode usar Free Tier)
- Vontade de aprender!

---

## Duração Estimada

- **Total:** 20-25 horas
- **Teoria:** 8-10 horas
- **Hands-on Labs:** 12-15 horas

---

## Metodologia

- Aulas teóricas com exemplos práticos
- Hands-on labs em cada módulo
- Foco em prática e criação de servidores
- Material de referência e documentação

