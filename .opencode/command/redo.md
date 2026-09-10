---
description: Refaz o trabalho de um agente específico
agent: tech-lead
---

# Comando: /redo

## Descrição
Refaz o trabalho de um agente específico, mantendo o contexto do projeto.

## Uso
```
/redo [agente]
```

## Parâmetros
- `agente` (obrigatório): Nome do agente para refazer

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
1. Tech Lead identifica o agente para refazer
2. Carrega contexto do projeto
3. Invoca o agente novamente
4. Substitui resultados anteriores

## Exemplo de Interação
```
Você: /redo architect

Tech Lead: Refazendo trabalho do Architect.

Motivo? (opcional)
Você: Quero usar outras tecnologias

Tech Lead: Entendido. Vou invocar o Architect novamente com suas novas preferências.

→ Invocando @architect...

Architect: Refazendo análise de arquitetura.

Você mencionou que quer mudar as tecnologias.
Quais tecnologias prefere usar?

Você: Quero usar Go ao invés de Node.js

Architect: Análise refazida com as novas preferências.

## Nova Recomendação
- Frontend: React + TypeScript (mantido)
- Backend: Go + Gin (anterior: Node.js + NestJS)
- Banco: PostgreSQL (mantido)

[continua o fluxo...]
```

## Quando Usar
- Quando não gostou do resultado
- Quando quer mudar decisões
- Quando houve erro na execução

## Aviso
⚠️ Refazer um agente pode afetar agentes posteriores.
O Tech Lead verificará dependências antes de refazer.

## Comandos Relacionados
- `/status` - Ver progresso atual
- `/resume [agente]` - Retomar agente
- `/skip [agente]` - Pular agente
