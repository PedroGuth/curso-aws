# 🚀 Curso Básico de AWS - Criando seu Primeiro Servidor na Nuvem

> **Aprenda os fundamentos da AWS do zero: desde conceitos básicos até criar uma arquitetura completa de alta disponibilidade com servidores, banco de dados e armazenamento na nuvem.**

[![AWS](https://img.shields.io/badge/AWS-Certified-FF9900?style=for-the-badge&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)
[![Cloud](https://img.shields.io/badge/Cloud-Computing-4285F4?style=for-the-badge&logo=google-cloud&logoColor=white)](https://aws.amazon.com/)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)

## 📚 Diferencial Exclusivo: Livro Online Interativo

🎓 **Este curso inclui um livro online completo e interativo!**

Acesse o livro digital com todo o conteúdo do curso, exemplos práticos, exercícios e muito mais:

👉 **[📖 Acessar Livro Online](https://turing.education/book/aws-basico)**

O livro online oferece:
- ✅ Conteúdo completo do curso em formato digital
- ✅ Navegação intuitiva e responsiva
- ✅ Exemplos de código interativos
- ✅ Exercícios práticos hands-on
- ✅ Acesso de qualquer dispositivo
- ✅ Atualizações contínuas

**Combine o repositório com o livro online para uma experiência de aprendizado completa!**

---

## 📋 Sobre o Curso

Este curso **AWS Básico** foi desenvolvido para iniciantes que desejam aprender a criar e gerenciar servidores na nuvem AWS. Você aprenderá desde os conceitos fundamentais até construir uma arquitetura completa de alta disponibilidade com múltiplos serviços AWS integrados.

### 🎯 O que você vai aprender

- ✅ Fundamentos da AWS e computação em nuvem
- ✅ Networking: VPC, Sub-redes, Internet Gateway, NAT Gateway
- ✅ Segurança: Security Groups, Network ACLs, IAM básico
- ✅ Application Load Balancer (ALB)
- ✅ Amazon EC2 e Auto Scaling
- ✅ Amazon EFS para armazenamento compartilhado
- ✅ Amazon Aurora com réplicas de leitura
- ✅ Amazon S3 para armazenamento de objetos
- ✅ Monitoramento com CloudWatch
- ✅ Backup e recuperação de desastres

### 🏗️ Arquitetura que você vai construir

Ao final do curso, você terá criado uma arquitetura completa de alta disponibilidade:

- ✅ **Multi-AZ deployment** - Alta disponibilidade em múltiplas zonas
- ✅ **Application Load Balancer** - Distribuição de carga
- ✅ **Auto Scaling Group** - Escalabilidade automática
- ✅ **Amazon EFS** - Armazenamento compartilhado
- ✅ **Amazon Aurora** - Banco de dados com réplicas
- ✅ **Amazon S3** - Armazenamento de objetos
- ✅ **Sub-redes públicas e privadas** - Isolamento de rede
- ✅ **NAT Gateway** - Acesso à internet seguro

## 📚 Estrutura do Curso

### **Módulo 1 - Introdução à AWS e Conceitos Básicos**
Fundamentos da AWS, conceitos de nuvem, principais serviços e primeiros passos no console.

**Conteúdo:**
- O que é AWS e principais serviços
- Conceitos básicos de computação em nuvem
- Regiões e Availability Zones
- Modelo de preços (pay-as-you-go)
- Criar conta AWS e navegar no console
- Configurar billing alerts e Free Tier

### **Módulo 2 - Fundamentos de Networking: VPC e Sub-redes**
Criação e configuração de VPC, sub-redes públicas e privadas, roteamento e isolamento de rede.

**Conteúdo:**
- Amazon Virtual Private Cloud (VPC)
- CIDR blocks e IP addressing
- Sub-redes públicas vs. privadas
- Internet Gateway
- NAT Gateway
- Route Tables e roteamento
- Hands-on: Configurando a base de rede

### **Módulo 3 - Security Groups e Network ACLs**
Implementação de segurança em nível de rede com firewalls stateful e stateless.

**Conteúdo:**
- Security Groups (firewall stateful)
- Network ACLs (firewall stateless)
- Regras de entrada e saída
- Princípio de menor privilégio
- Segregação por camadas
- Hands-on: Configurando segurança de rede

### **Módulo 4 - Application Load Balancer (ALB)**
Configuração de distribuição de carga com health checks e integração com Auto Scaling.

**Conteúdo:**
- Tipos de Load Balancers na AWS
- Application Load Balancer (ALB)
- Listeners e Rules
- Target Groups
- Health Checks
- Integração com Auto Scaling
- Hands-on: Configurando o ALB

### **Módulo 5 - Amazon EC2 e Auto Scaling**
Criação de instâncias EC2, Launch Templates e Auto Scaling Groups para alta disponibilidade.

**Conteúdo:**
- Amazon EC2 Fundamentals
- Tipos de instâncias e AMIs
- Launch Templates
- Auto Scaling Groups
- Scaling Policies
- Multi-AZ deployment
- Hands-on: Configurando Auto Scaling

### **Módulo 6 - Amazon Elastic File System (EFS)**
Armazenamento compartilhado com EFS, mount targets e backup.

**Conteúdo:**
- Armazenamento compartilhado na AWS
- Amazon EFS vs. EBS vs. S3
- EFS Mount Targets
- Performance modes
- Backup com AWS Backup
- Hands-on: Configurando EFS

### **Módulo 7 - Amazon Aurora - Banco de Dados Gerenciado**
Configuração de cluster Aurora com réplicas, failover automático e backup.

**Conteúdo:**
- Amazon Aurora Overview
- Aurora Clusters e réplicas
- Multi-AZ deployment
- Automatic failover
- DB Subnet Groups
- Backup e restore
- Hands-on: Configurando Aurora

### **Módulo 8 - Amazon S3 - Armazenamento de Objetos**
Criação e gerenciamento de buckets S3, permissões, versionamento e storage classes.

**Conteúdo:**
- O que é Amazon S3
- Criando e gerenciando buckets
- Upload e download de arquivos
- Permissões e acesso
- Versionamento
- Storage Classes
- Hands-on: Trabalhando com S3

### **Módulo 9 - Segurança Básica na AWS**
Conceitos de segurança, IAM básico, encryption e boas práticas.

**Conteúdo:**
- IAM (Identity and Access Management) básico
- Usuários, grupos e roles
- Encryption at rest e in transit
- Security Groups - boas práticas
- CloudWatch Logs básico
- VPC Flow Logs
- Hands-on: Configurando segurança básica

### **Módulo 10 - Monitoramento Básico com CloudWatch**
Visualização de métricas, criação de dashboards e configuração de alertas.

**Conteúdo:**
- Amazon CloudWatch - Introdução
- Métricas básicas por serviço
- CloudWatch Logs
- Dashboards
- Alertas e notificações
- Hands-on: Configurando monitoramento

### **Módulo 11 - Backup Básico na AWS**
Configuração de backups automáticos, snapshots e restauração.

**Conteúdo:**
- Por que fazer backup
- Backup do Aurora
- Backup do EFS
- Backup de instâncias EC2 (AMIs)
- Backup no S3
- Hands-on: Configurando backups

## 🛠️ Tecnologias e Serviços AWS

- **Amazon VPC** - Virtual Private Cloud
- **Amazon EC2** - Elastic Compute Cloud
- **Application Load Balancer** - Distribuição de carga
- **Auto Scaling** - Escalabilidade automática
- **Amazon EFS** - Elastic File System
- **Amazon Aurora** - Banco de dados gerenciado
- **Amazon S3** - Simple Storage Service
- **Amazon CloudWatch** - Monitoramento
- **AWS IAM** - Identity and Access Management
- **AWS Backup** - Backup e recuperação

## 📦 Estrutura do Projeto

```
11-Basico AWS/
├── README.md                              # Este arquivo
├── arquitetura-aws-alta-disponibilidade.md # Conteúdo completo do curso
├── Basico-AWS.pdf                         # Material em PDF
└── Curso-Basico-AWS.png                   # Imagem do curso
```

## 🚀 Como Começar

### Pré-requisitos

- Conta AWS (pode usar Free Tier)
- Conhecimento básico de computadores e internet
- Navegador web moderno
- Vontade de aprender!

### Configuração Inicial

1. **Crie uma conta AWS:**
   - Acesse [aws.amazon.com](https://aws.amazon.com)
   - Crie uma conta (Free Tier disponível)
   - Configure billing alerts

2. **Acesse o Console AWS:**
   - Faça login no [AWS Console](https://console.aws.amazon.com)
   - Familiarize-se com a interface

3. **Siga os módulos:**
   - Comece pelo Módulo 1
   - Siga a ordem sequencial
   - Pratique cada hands-on lab

## 📖 Recursos de Aprendizado

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

- [AWS Pricing Calculator](https://calculator.aws/)
- [AWS Architecture Icons](https://aws.amazon.com/architecture/icons/)
- [AWS Free Tier](https://aws.amazon.com/free/)

## 💡 Casos de Uso

Este curso prepara você para:

- **Deploy de aplicações web** - Servidores escaláveis na nuvem
- **Arquiteturas de alta disponibilidade** - Multi-AZ e failover
- **Armazenamento na nuvem** - EFS, S3 e backups
- **Banco de dados gerenciado** - Aurora com réplicas
- **Monitoramento e alertas** - CloudWatch e métricas
- **Segurança básica** - IAM, Security Groups, encryption

## 🎓 Metodologia

- ✅ **Aulas teóricas** com exemplos práticos
- ✅ **Hands-on labs** em cada módulo
- ✅ **Foco em prática** e criação de servidores
- ✅ **Material de referência** e documentação
- ✅ **Arquitetura completa** ao final do curso

## ⏱️ Duração Estimada

- **Total:** 20-25 horas
- **Teoria:** 8-10 horas
- **Hands-on Labs:** 12-15 horas

## 🔒 Segurança e Boas Práticas

- Configuração adequada de Security Groups
- Princípio de menor privilégio
- IAM roles ao invés de access keys
- Encryption at rest e in transit
- Monitoramento e logging
- Backup regular

## 📊 Projeto Final

Ao final do curso, você terá criado:

1. ✅ VPC completa com sub-redes públicas e privadas
2. ✅ Application Load Balancer configurado
3. ✅ Auto Scaling Group com múltiplas instâncias
4. ✅ Amazon EFS montado e funcionando
5. ✅ Cluster Aurora com réplicas
6. ✅ Buckets S3 configurados
7. ✅ Monitoramento com CloudWatch
8. ✅ Backups configurados
9. ✅ Segurança implementada

## 🎯 Para Quem é Este Curso?

- ✅ Iniciantes em AWS
- ✅ Desenvolvedores que querem aprender cloud
- ✅ Profissionais de TI interessados em nuvem
- ✅ Estudantes de tecnologia
- ✅ Quem quer criar seu primeiro servidor na nuvem

## 📈 Próximos Passos

Após completar este curso, você estará preparado para:

- Criar e gerenciar infraestrutura na AWS
- Implementar arquiteturas de alta disponibilidade
- Trabalhar com múltiplos serviços AWS
- Preparar-se para certificações AWS
- Avançar para cursos mais especializados

## 🏆 Certificação

Este curso prepara você para:

- **AWS Certified Cloud Practitioner** (fundamentos)
- **AWS Certified Solutions Architect - Associate** (próximo nível)
- Certificações específicas de serviços AWS

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para:

1. Fazer fork do projeto
2. Criar uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abrir um Pull Request

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 👨‍🏫 Sobre o Instrutor

**Pedro Guth** - Especialista em AWS e Cloud Computing

- AWS Certified Solutions Architect
- Especialista em infraestrutura cloud
- Criador de conteúdo técnico

## 📞 Suporte

- 📧 Email: [seu-email@exemplo.com]
- 💬 Issues: [GitHub Issues](https://github.com/PedroGuth/curso-aws/issues)
- 📚 Documentação: [Wiki do Projeto](https://github.com/PedroGuth/curso-aws/wiki)

## 🌟 Destaques do Curso

- ✅ **📖 Livro Online Interativo** - Acesso completo em [turing.education/book/aws-basico](https://turing.education/book/aws-basico)
- ✅ **11 Módulos Completos** - Do básico ao avançado
- ✅ **Hands-on Labs Práticos** - Aprenda fazendo
- ✅ **Arquitetura Completa** - Crie uma infraestrutura real
- ✅ **Zero Pré-requisitos** - Comece do zero
- ✅ **Free Tier Compatível** - Aprenda sem custos
- ✅ **Material Completo** - PDF e documentação incluídos

## ⚠️ Importante

- Use a **Free Tier** da AWS para praticar sem custos
- Configure **billing alerts** para evitar surpresas
- Siga as **boas práticas de segurança** desde o início
- Pratique cada **hands-on lab** para fixar o aprendizado

---

<div align="center">

**⭐ Se este curso foi útil para você, considere dar uma estrela no repositório! ⭐**

[⬆ Voltar ao topo](#-curso-básico-de-aws---criando-seu-primeiro-servidor-na-nuvem)

</div>







