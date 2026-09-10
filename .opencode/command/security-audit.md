---
description: Executa auditoria completa de segurança no projeto
agent: tech-lead
---

# Comando: /security-audit

## Descrição
Inicia uma auditoria completa de segurança, focando em vulnerabilidades, proteção de dados e conformidade.

## Uso
```
/security-audit
/security-audit [caminho/diretorio]
```

## Parâmetros
- `caminho` (opcional): Diretório ou arquivo para auditar. Se não especificado, audita todo o projeto.

## Agentes Invocados
1. **Security Specialist** - Auditoria principal
2. **Backend Reviewer** - Análise de segurança no backend

## Fluxo Executado
1. Tech Lead mapeia arquivos do projeto
2. Invoca Security Specialist para auditoria completa
3. Invoca Backend Reviewer para análise específica de backend
4. Consolida resultados em relatório de segurança

## Exemplo de Interação
```
Você: /security-audit

Tech Lead: Iniciando auditoria de segurança completa

→ Invocando @security...
→ Invocando @backend-reviewer...

Security: Auditoria em andamento...

## Relatório de Segurança

### Resumo Executivo
- **Nível de Risco:** Médio
- **Vulnerabilidades:** 4
- **Compliance:** Pendente

### Vulnerabilidades Encontradas

#### Altas
1. **SQL Injection** - users/repository.ts:42
   - Risco: Acesso não autorizado ao banco
   - Solução: Usar queries parametrizadas

2. **XSS Refletido** - search/component.tsx:15
   - Risco: Injeção de scripts maliciosos
   - Solução: Sanitizar output

#### Médias
1. **CSRF** - api/orders/route.ts:28
   - Solução: Adicionar token CSRF

2. **Senhas fracas** - auth/service.ts:45
   - Solução: Adicionar validação de complexidade

### Recomendações
1. Implementar Content Security Policy
2. Adicionar rate limiting
3. Configurar CORS restritivo

Backend Reviewer: Análise de segurança backend concluída.
- Headers de segurança: ⚠️ Incompleto
- Autenticação: ✅ Adequada
- Validação de input: ⚠️ Parcial

Tech Lead: Auditoria concluída. 
Recomendação: Corrigir vulnerabilidades altas antes de deploy.

Deseja que eu invoque o @backend-dev para corrigir? (s/n)
```

## OWASP Top 10 Verificado
- [ ] A01: Broken Access Control
- [ ] A02: Cryptographic Failures
- [ ] A03: Injection
- [ ] A04: Insecure Design
- [ ] A05: Security Misconfiguration
- [ ] A06: Vulnerable Components
- [ ] A07: Authentication Failures
- [ ] A08: Data Integrity Failures
- [ ] A09: Logging Failures
- [ ] A10: SSRF

## Comandos Relacionados
- `/review-code` - Revisão completa (inclui segurança)
- `/start-project` - Incluir segurança no fluxo completo
- `/redo security` - Refazer auditoria após correções
