---
description: Mostra o status atual do projeto e em qual agente está
agent: tech-lead
---

# Comando: /status

## Descrição
Mostra o progresso atual do projeto, incluindo qual agente está trabalhando e o que já foi concluído.

## Uso
```
/status
```

## Informações Exibidas
1. Agente atual
2. Progresso geral
3. Arquivos criados
4. Próximos passos
5. Problemas pendentes

## Exemplo de Interação
```
Você: /status

Tech Lead: Status do Projeto

## Progresso Geral
██████████░░░░░░░░░░ 50%

## Agente Atual
**Backend Dev** - Implementando APIs

## Agentes Concluídos
✅ Architect - Estrutura definida
✅ Data Engineer - Schema criado
✅ UI/UX - Design pronto
✅ Backend Dev - Em andamento

## Agentes Pendentes
⏳ Backend Reviewer
⏳ Frontend Dev
⏳ Frontend Reviewer
⏳ Security
⏳ QA Engineer
⏳ DevOps
⏳ Documentation

## Arquivos Criados (12)
- src/backend/controllers/auth.ts
- src/backend/controllers/users.ts
- src/backend/services/auth.ts
- src/backend/services/users.ts
- src/backend/repositories/users.ts
- src/backend/routes/auth.ts
- src/backend/routes/users.ts
- src/database/schema.sql
- src/database/migrations/001_create_users.sql
- src/frontend/components/Button.tsx
- src/frontend/components/Input.tsx
- src/frontend/pages/Login.tsx

## Problemas Pendentes
- Nenhum

## Próximos Passos
1. Backend Dev vai terminar APIs restantes
2. Backend Reviewer vai revisar código
3. Frontend Dev vai implementar interface

## Tempo Estimado
- Restante: ~20 minutos
- Total: ~45 minutos
```

## Status dos Agentes
| Agente | Status | Início | Fim |
|--------|--------|--------|-----|
| Architect | ✅ Concluído | 10:00 | 10:05 |
| Data Engineer | ✅ Concluído | 10:05 | 10:10 |
| UI/UX | ✅ Concluído | 10:10 | 10:15 |
| Backend Dev | 🔄 Em andamento | 10:15 | - |
| Backend Reviewer | ⏳ Aguardando | - | - |
| Frontend Dev | ⏳ Aguardando | - | - |
| Frontend Reviewer | ⏳ Aguardando | - | - |
| Security | ⏳ Aguardando | - | - |
| QA Engineer | ⏳ Aguardando | - | - |
| DevOps | ⏳ Aguardando | - | - |
| Documentation | ⏳ Aguardando | - | - |

## Comandos Relacionados
- `/start-project` - Iniciar novo projeto
- `/resume [agente]` - Retomar agente específico
- `/skip [agente]` - Pular agente
- `/redo [agente]` - Refazer agente
