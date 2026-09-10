---
description: Executa o ciclo completo de desenvolvimento com todos os 12 agentes
agent: tech-lead
---

# Comando: /full-cycle

## Descrição
Executa o ciclo completo de desenvolvimento, passando por todos os 12 agentes de forma sequencial e automatizada.

## Uso
```
/full-cycle "descrição do projeto"
```

## Parâmetros
- `descrição` (obrigatório): Descreva o projeto detalhadamente

## Fluxo Completo
```
1. Setup Agent (se necessário)
   ↓
2. Tech Lead (orquestra)
   ↓
3. Architect (define estrutura)
   ↓
4. Data Engineer (modela dados)
   ↓
5. UI/UX (design)
   ↓
6. Backend Dev (implementa)
   ↓
7. Backend Reviewer (revisa)
   ↓
8. Frontend Dev (implementa)
   ↓
9. Frontend Reviewer (revisa)
   ↓
10. Security (auditoria)
   ↓
11. QA Engineer (testes)
   ↓
12. DevOps (deploy)
   ↓
13. Documentation (docs)
   ↓
14. Tech Lead (relatório final)
```

## Exemplo de Interação
```
Você: /full-cycle "Plataforma de e-commerce para roupas"

Tech Lead: Iniciando ciclo completo de desenvolvimento.

## Fase 1: Configuração
✅ Setup já configurado
✅ Ambiente validado

## Fase 2: Planejamento
→ Invocando @architect...

Architect: Análise concluída.
- Stack: React + Node.js + PostgreSQL
- Custo estimado: R$ 300/mês
- Tempo MVP: 2 meses

→ Invocando @data-engineer...

Data Engineer: Schema criado.
- Tabelas: 8
- Relações: 12
- Índices: 15

[... continua para todos os agentes ...]

## Fase 3: Implementação
→ Invocando @ui-ux...
→ Invocando @backend-dev...
→ Invocando @frontend-dev...

[... continua ...]

## Fase 4: Qualidade
→ Invocando @backend-reviewer...
→ Invocando @frontend-reviewer...
→ Invocando @security...
→ Invocando @qa-engineer...

[... continua ...]

## Fase 5: Deploy
→ Invocando @devops...
→ Invocando @documentation...

Tech Lead: Ciclo completo finalizado!

## Relatório Final

### Resumo do Projeto
- **Nome:** Plataforma de e-commerce
- **Stack:** React + Node.js + PostgreSQL
- **Arquivos criados:** 45
- **Linhas de código:** 3.200

### Arquivos Principais
```
src/
├── backend/
│   ├── controllers/
│   ├── services/
│   └── routes/
├── frontend/
│   ├── components/
│   └── pages/
├── database/
│   ├── migrations/
│   └── seeds/
└── docs/
```

### Próximos Passos
1. Revise o código gerado
2. Configure variáveis de ambiente
3. Execute: ./deploy.sh
4. Acesse: https://seu-dominio.com

### Métricas
| Métrica | Valor |
|---------|-------|
| Arquivos | 45 |
| Linhas de código | 3.200 |
| Testes | 85 |
| Cobertura | 78% |
| Vulnerabilidades | 0 |
```

## Duração Estimada
- Projetos simples: 15-30 minutos
- Projetos médios: 30-60 minutos
- Projetos complexos: 1-2 horas

## Comandos Relacionados
- `/start-project` - Fluxo com interação do usuário
- `/status` - Verificar progresso
- `/skip [agente]` - Pular um agente específico
- `/redo [agente]` - Refazer trabalho de um agente
