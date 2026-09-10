---
description: Configura o ambiente do projeto na primeira execução
agent: setup
---

# Comando: /setup

## Descrição
Inicia o Setup Agent para configurar o ambiente do projeto. Este comando deve ser executado na primeira vez que você usar o sistema.

## Uso
```
/setup
```

## O que acontece
1. O Setup Agent verifica se já existe configuração
2. Se não existir, coleta informações interativamente
3. Gera os arquivos de configuração (.env, .gitignore)
4. Valida a conexão com o provedor de IA
5. Retorna um relatório com o que foi configurado

## Exemplo de Interação
```
Você: /setup

Setup Agent: Olá! Sou o Setup Agent. Vou configurar seu ambiente.

Qual provedor de IA você deseja usar?
1. Anthropic (Claude) - Recomendado
2. OpenAI (GPT)
3. Google Gemini

Você: 1

Setup Agent: Cole sua API Key do Anthropic:

Você: sk-ant-api03-xxxxx...

Setup Agent: ✅ Configuração concluída!

Arquivos criados:
- .env (configurações sensíveis)
- .gitignore (proteção de arquivos)

Próximo passo: /start-project "descrição do projeto"
```

## Arquivos Criados
- `.env` - Configurações sensíveis (nunca commitar)
- `.env.example` - Template sem valores sensíveis
- `.gitignore` - Lista de arquivos ignorados pelo Git

## Comandos Relacionados
- `/setup-status` - Ver configuração atual
- `/setup-reset` - Reconfigurar ambiente
- `/start-project` - Iniciar projeto após configuração
