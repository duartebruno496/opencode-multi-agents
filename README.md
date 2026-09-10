# opencode-multi-agents

12 agentes especializados para o [opencode](https://opencode.ai), trabalhando em colaboração para desenvolver projetos completos.

## Visão Geral

Este pacote fornece um time completo de agentes de IA que colaboram automaticamente para criar projetos de software, desde a concepção até o deploy.

```
Usuário → Tech Lead → Architect → Data Engineer → UI/UX → Backend → Frontend → Security → QA → DevOps → Documentation
```

## Agentes

| # | Agente | Função |
|---|--------|--------|
| 1 | **Tech Lead** | Orquestra todos os agentes |
| 2 | **Architect** | Define tecnologias e arquitetura |
| 3 | **Data Engineer** | Modela banco de dados |
| 4 | **UI/UX** | Cria design da interface |
| 5 | **Backend Dev** | Implementa APIs e lógica |
| 6 | **Backend Reviewer** | Revisa código backend |
| 7 | **Frontend Dev** | Implementa interface |
| 8 | **Frontend Reviewer** | Revisa código frontend |
| 9 | **Security** | Auditoria de segurança |
| 10 | **QA Engineer** | Cria testes automatizados |
| 11 | **DevOps** | Configura CI/CD e deploy |
| 12 | **Documentation** | Gera documentação |

## Instalação

### Opção 1: GitHub Template (Recomendado)

1. Clique em "Use this template" no GitHub
2. Clone o repositório criado
3. Execute o setup

### Opção 2: Script de Instalação

```bash
# Clonar repositório
git clone https://github.com/seu-usuario/opencode-multi-agents.git
cd opencode-multi-agents

# Executar instalação
./install.sh /caminho/do/seu/projeto
```

### Opção 3: Instalação Manual

```bash
# Copiar arquivos para seu projeto
cp -r .opencode/ /caminho/do/seu/projeto/
cp opencode.json /caminho/do/seu/projeto/
cp .env.example /caminho/do/seu/projeto/
```

## Configuração

### 1. Configurar Ambiente

Execute o comando de setup no opencode:

```
/setup
```

O Setup Agent irá:
- Perguntar qual provedor de IA usar (Anthropic, OpenAI, etc)
- Coletar sua API key
- Configurar o modelo
- Validar a conexão
- Gerar os arquivos necessários

### 2. Iniciar Projeto

```
/start-project "Sistema de gestão escolar para escolas médias"
```

O Tech Lead irá:
- Fazer perguntas sobre o projeto
- Orquestrar todos os agentes
- Cada agente faz suas perguntas e executa seu trabalho
- Ao final, sugere o próximo agente automaticamente

## Comandos Disponíveis

| Comando | Descrição |
|---------|-----------|
| `/setup` | Configurar ambiente (API keys) |
| `/start-project` | Iniciar novo projeto |
| `/full-cycle` | Ciclo completo automatizado |
| `/review-code` | Revisão de código |
| `/security-audit` | Auditoria de segurança |
| `/deploy` | Configurar deploy |
| `/status` | Ver progresso |
| `/resume [agente]` | Retomar agente específico |
| `/skip [agente]` | Pular agente |
| `/redo [agente]` | Refazer agente |
| `/setup-status` | Ver configuração |
| `/setup-reset` | Resetar configuração |

## Fluxo de Trabalho

```
┌─────────────────────────────────────────────────────────────┐
│  USUÁRIO                                                    │
│  "Quero criar um SaaS de gestão escolar"                   │
└─────────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│  TECH LEAD                                                  │
│  Pergunta: orçamento, prazo, stack                          │
│  → Invoca: Architect                                        │
└─────────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│  ARCHITECT                                                  │
│  Define: React + Node + PostgreSQL                          │
│  → Invoca: Data Engineer + UI/UX                            │
└─────────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│  DATA ENGINEER + UI/UX (paralelo)                           │
│  Data: Schema do banco │ UI/UX: Design da interface         │
│  → Invoca: Backend Dev + Frontend Dev                       │
└─────────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│  BACKEND DEV + FRONTEND DEV (paralelo)                      │
│  Implementam código                                         │
│  → Invoca: Reviewers                                        │
└─────────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│  SECURITY + QA + DEVOPS + DOCUMENTATION                     │
│  Segurança, testes, deploy, docs                            │
│  → Relatório final                                          │
└─────────────────────────────────────────────────────────────┘
```

## Provedores Suportados

| Provedor | Modelos | Status |
|----------|---------|--------|
| Anthropic | Claude | ✅ Recomendado |
| OpenAI | GPT-4 | ✅ |
| Google | Gemini | ✅ |
| LM Studio | Local | ✅ Gratuito |
| OpenRouter | Múltiplos | ✅ |

## Estrutura do Projeto

```
.opencode/
├── agents/           # 12+1 agentes
│   ├── tech-lead.md
│   ├── architect.md
│   ├── data-engineer.md
│   ├── backend-dev.md
│   ├── backend-reviewer.md
│   ├── frontend-dev.md
│   ├── frontend-reviewer.md
│   ├── ui-ux.md
│   ├── security.md
│   ├── documentation.md
│   ├── devops.md
│   ├── qa-engineer.md
│   └── setup.md
├── command/          # Comandos
│   ├── setup.md
│   ├── start-project.md
│   ├── review-code.md
│   ├── security-audit.md
│   ├── deploy.md
│   ├── full-cycle.md
│   ├── status.md
│   ├── resume.md
│   ├── skip.md
│   ├── redo.md
│   ├── setup-status.md
│   └── setup-reset.md
└── skills/           # Skills
    ├── api-design/
    ├── database-design/
    ├── security-best-practices/
    └── testing-strategies/
```

## Contribuição

1. Fork o projeto
2. Crie uma branch (`git checkout -b feature/novo-agente`)
3. Commit suas mudanças (`git commit -m 'Adiciona novo agente'`)
4. Push para a branch (`git push origin feature/novo-agente`)
5. Abra um Pull Request

## Licença

MIT - Veja [LICENSE](LICENSE) para mais detalhes.

## Links Úteis

- [opencode](https://opencode.ai) - Documentação oficial
- [GitHub](https://github.com/anomalyco/opencode) - Código fonte
- [Issues](https://github.com/anomalyco/opencode/issues) - Reportar bugs

## Agradecimentos

- Equipe do opencode pela ferramenta incrível
- Comunidade open source
