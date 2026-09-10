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

RECOMENDADO (Gratuito):
  1. OpenCode Big Pickle - Modelo gratuito, sem API key
  
OPÇÕES PAGAS (requerem API key):
  2. Anthropic (Claude)
  3. OpenAI (GPT-4)
  4. Google Gemini

Você: 1

Setup Agent: ✅ Ótima escolha! Nenhuma API key necessária.
O modelo gratuito já está configurado.

Arquivos criados:
- .env (configurações)
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
