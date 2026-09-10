---
description: Inicia um novo projeto com todos os agentes colaborando automaticamente
agent: tech-lead
---

# Comando: /start-project

## Descrição
Inicia o fluxo completo de desenvolvimento com todos os agentes. O Tech Lead orquestra a sequência de agentes automaticamente.

## Uso
```
/start-project "descrição do projeto"
```

## Parâmetros
- `descrição` (obrigatório): Descreva o projeto em 1-2 frases

## Fluxo Executado
1. **Tech Lead** - Coleta requisitos do projeto
2. **Architect** - Define tecnologias e arquitetura
3. **Data Engineer** - Modela banco de dados
4. **UI/UX** - Cria design da interface
5. **Backend Dev** - Implementa lógica do servidor
6. **Backend Reviewer** - Revisa código backend
7. **Frontend Dev** - Implementa interface
8. **Frontend Reviewer** - Revisa código frontend
9. **Security** - Auditoria de segurança
10. **QA Engineer** - Cria testes automatizados
11. **DevOps** - Configura CI/CD e deploy
12. **Documentation** - Gera documentação completa

## Exemplo de Interação
```
Você: /start-project "Sistema de gestão escolar para escolas médias"

Tech Lead: Olá! Sou o Tech Lead que vai orquestrar seu projeto.
Vou fazer algumas perguntas para entender melhor:

1. Qual o público-alvo? (escolas pequenas, médias, grandes?)
2. Qual o orçamento estimado?
3. Tem preferência por alguma stack tecnológica?
4. Prazo desejado para o MVP?

Você: Escolas médias, orçamento moderado, React + Node, 3 meses

Tech Lead: Perfeito! Vou iniciar o fluxo.

→ Invocando @architect com contexto do projeto...

Architect: Entendi! Preciso de mais algumas informações:
1. Quantos usuários simultâneos esperados?
2. Tem integração com sistemas existentes?
3. Precisa de app mobile também?

[continua o fluxo...]
```

## Verificações Antes de Iniciar
1. Verifica se o `.env` está configurado
2. Se não estiver, sugere: "Execute /setup primeiro"
3. Pede confirmação antes de iniciar o fluxo

## Comandos Relacionados
- `/setup` - Configurar ambiente antes de iniciar
- `/status` - Verificar progresso do projeto
- `/resume [agente]` - Retomar de um agente específico
- `/skip [agente]` - Pular um agente
- `/redo [agente]` - Refazer trabalho de um agente
