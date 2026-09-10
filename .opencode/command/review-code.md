---
description: Inicia revisão completa de código com backend-reviewer, frontend-reviewer e security
agent: tech-lead
---

# Comando: /review-code

## Descrição
Inicia uma revisão completa de código, invocando os agentes de revisão e segurança para analisar todo o projeto.

## Uso
```
/review-code
/review-code [caminho/diretorio]
```

## Parâmetros
- `caminho` (opcional): Diretório ou arquivo para revisar. Se não especificado, revisa todo o projeto.

## Agentes Invocados
1. **Backend Reviewer** - Revisa código backend
2. **Frontend Reviewer** - Revisa código frontend
3. **Security** - Auditoria de segurança

## Fluxo Executado
1. Tech Lead identifica os arquivos para revisão
2. Invoca Backend Reviewer para analisar código do servidor
3. Invoca Frontend Reviewer para analisar código da interface
4. Invoca Security para auditoria de segurança
5. Consolida resultados em relatório único

## Exemplo de Interação
```
Você: /review-code src/

Tech Lead: Iniciando revisão completa do diretório src/

→ Invocando @backend-reviewer...
→ Invocando @frontend-reviewer...
→ Invocando @security...

Backend Reviewer: Revisão concluída.
- Arquivos revisados: 15
- Problemas encontrados: 3 (1 crítico, 2 médios)

Frontend Reviewer: Revisão concluída.
- Componentes revisados: 8
- Problemas encontrados: 2 (2 médios)

Security: Auditoria concluída.
- Vulnerabilidades: 1 (1 média)

Tech Lead: Relatório Consolidado:

## Resumo da Revisão
| Agente | Arquivos | Problemas | Status |
|--------|----------|-----------|--------|
| Backend Reviewer | 15 | 3 | ⚠️ |
| Frontend Reviewer | 8 | 2 | ⚠️ |
| Security | 23 | 1 | ⚠️ |

## Problemas Críticos
1. [Backend] SQL Injection em users/repository.ts:42
2. [Security] XSS em dashboard/component.tsx:15

## Recomendações
- Corrigir problemas críticos antes de prosseguir
- Considerar adicionar rate limiting

Deseja corrigir os problemas automaticamente? (s/n)
```

## Checklists de Revisão

### Backend
- [ ] Validação de input
- [ ] SQL parametrizado
- [ ] Autenticação verificada
- [ ] Tratamento de erros

### Frontend
- [ ] Acessibilidade
- [ ] Performance
- [ ] Responsividade
- [ ] State management

### Security
- [ ] OWASP Top 10
- [ ] Autenticação
- [ ] Autorização
- [ ] Criptografia

## Comandos Relacionados
- `/start-project` - Iniciar projeto completo
- `/security-audit` - Apenas auditoria de segurança
- `/redo [agente]` - Refazer revisão de um agente
