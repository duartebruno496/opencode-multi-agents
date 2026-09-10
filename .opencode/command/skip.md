---
description: Pula um agente específico no fluxo de trabalho
agent: tech-lead
---

# Comando: /skip

## Descrição
Pula um agente específico no fluxo de trabalho e vai direto para o próximo.

## Uso
```
/skip [agente]
```

## Parâmetros
- `agente` (obrigatório): Nome do agente para pular

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
1. Tech Lead identifica o agente para pular
2. Marca como "pulado" no progresso
3. Invoca o próximo agente na sequência
4. Passa contexto mesmo sem execução

## Exemplo de Interação
```
Você: /skip ui-ux

Tech Lead: Pulando agente UI/UX.

Motivo? (opcional)
Você: Não preciso de design, já tenho wireframes

Tech Lead: Anotado. UI/UX pulado.

→ Invocando @frontend-dev com contexto...

Frontend Dev: Recebi o contexto.
- Não houve design do UI/UX
- Vou usar os wireframes fornecidos pelo usuário

[continua o fluxo...]
```

## Quando Usar
- Quando já tem algo pronto (ex: design já existe)
- Quando não precisa daquela etapa
- Para acelerar o fluxo

## Aviso
⚠️ Pular agentes pode afetar a qualidade do projeto.
O Tech Lead avisará se o agente pulado for crítico.

## Comandos Relacionados
- `/status` - Ver progresso atual
- `/resume [agente]` - Retomar agente
- `/redo [agente]` - Refazer agente
