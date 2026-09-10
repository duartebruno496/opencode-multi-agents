---
description: Configura CI/CD, infraestrutura e processo de deploy
agent: tech-lead
---

# Comando: /deploy

## Descrição
Inicia a configuração de infraestrutura, CI/CD e processo de deploy do projeto.

## Uso
```
/deploy
/deploy [plataforma]
```

## Parâmetros
- `plataforma` (opcional): Plataforma de deploy (aws, vercel, docker, heroku). Se não especificado, pergunta ao usuário.

## Agentes Invocados
1. **DevOps Engineer** - Configuração principal
2. **QA Engineer** - Testes antes do deploy
3. **Documentation** - Documenta processos

## Fluxo Executado
1. Tech Lead pergunta sobre plataforma e configurações
2. Invoca DevOps Engineer para configurar infraestrutura
3. Invoca QA Engineer para testes de integração
4. Invoca Documentation para documentar processos
5. Retorna instruções de deploy

## Exemplo de Interação
```
Você: /deploy aws

Tech Lead: Configurando deploy para AWS

→ Invocando @devops...
→ Invocando @qa-engineer...

DevOps: Configuração AWS em andamento.

Qual serviço da AWS deseja usar?
1. EC2 (VMs tradicionais)
2. ECS/Fargate (containers)
3. Lambda (serverless)
4. Elastic Beanstalk (PaaS)

Você: 2

DevOps: Configurando ECS/Fargate...

## Configuração AWS

### Serviços
- **Compute:** ECS Fargate
- **Database:** RDS PostgreSQL
- **Storage:** S3
- **CDN:** CloudFront
- **DNS:** Route 53

### Arquivos Criados
- `aws/task-definition.json`
- `aws/service.json`
- `aws/pipeline.yml`
- `Dockerfile`
- `docker-compose.yml`

### Custos Estimados
- ECS Fargate: ~R$ 150/mês
- RDS: ~R$ 100/mês
- S3: ~R$ 10/mês
- **Total:** ~R$ 260/mês

QA Engineer: Testes de integração concluídos.
- Testes passaram: ✅ 45/45
- Cobertura: 82%

Tech Lead: Configuração de deploy concluída!

## Próximos Passos
1. Configure as variáveis de ambiente na AWS
2. Execute: `./deploy.sh`
3. Acesse: https://seu-dominio.com

## Comandos Úteis
```bash
# Deploy completo
./deploy.sh

# Deploy apenas frontend
./deploy.sh --frontend

# Ver logs
aws logs tail /ecs/seu-app --follow

# Rollback
./deploy.sh --rollback
```
```

## Plataformas Suportadas
| Plataforma | Complexidade | Custo |
|------------|--------------|-------|
| AWS | Alta | Variável |
| Vercel | Baixa | Free tier |
| Docker | Média | Variável |
| Heroku | Baixa | $5+/mês |

## Comandos Relacionados
- `/start-project` - Incluir deploy no fluxo completo
- `/review-code` - Revisar antes de deployar
- `/security-audit` - Garantir segurança antes de deploy
