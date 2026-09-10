---
description: Retoma o trabalho a partir de um agente específico
agent: tech-lead
---

# Comando: /resume

## Descrição
Retoma o fluxo de trabalho a partir de um agente específico, mantendo o contexto anterior.

## Uso
```
/resume [agente]
```

## Parâmetros
- `agente` (obrigatório): Nome do agente para retomar

## Agentes Disponíveis
- architect
- data-engineer
- ui-ux
- backend-dev
- backend-reviewer
- frontend-dev
- frontend-reviewer
- security
- qa-engineer
- devops
- documentation

## Fluxo Executado
1. Tech Lead carrega contexto do projeto
2. Identifica o agente solicitado
3. Invoca o agente com contexto completo
4. Continua fluxo a partir dali

## Exemplo de Interação
```
Você: /resume backend-dev

Tech Lead: Retomando trabalho a partir do Backend Dev.

Contexto do projeto:
- Nome: Plataforma de e-commerce
- Stack: React + Node.js + PostgreSQL
- Progresso: 40%

→ Invocando @backend-dev com contexto...

Backend Dev: Retomando implementação.

Último ponto parado:
- Controllers criados: auth, users, products
- Faltam: orders, payments

Continuando implementação...

[continua o fluxo...]
```

## Quando Usar
- Quando o fluxo foi interrompido
- Quando quer retomar de um agente específico
- Quando houve erro e precisa refazer

## Comandos Relacionados
- `/status` - Ver progresso atual
- `/skip [agente]` - Pular agente
- `/redo [agente]` - Refazer trabalho
