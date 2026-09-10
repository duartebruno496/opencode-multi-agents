---
description: Mostra a configuração atual do ambiente
agent: setup
---

# Comando: /setup-status

## Descrição
Mostra o status atual da configuração do ambiente, incluindo provedor, modelo e serviços configurados.

## Uso
```
/setup-status
```

## Informações Exibidas
1. Provedor de IA configurado
2. Modelo selecionado
3. Serviços opcionais configurados
4. Status de conexão

## Exemplo de Interação
```
Você: /setup-status

Setup Agent: Status da Configuração

## Ambiente
- **Provedor:** Anthropic
- **Modelo:** claude-sonnet-4-6
- **Status:** ✅ Conectado

## Serviços
| Serviço | Status | Configuração |
|---------|--------|--------------|
| GitHub Token | ✅ Configurado | ghp_**** |
| AWS | ⚠️ Parcial | us-east-1 |
| Database | ❌ Não configurado | - |

## Arquivos
- .env: ✅ Existe
- .env.example: ✅ Existe
- .gitignore: ✅ Existe

## Última Configuração
- Data: 2024-01-15 10:30
- Usuário: bruno

## Ações Disponíveis
- `/setup` - Reconfigurar ambiente
- `/start-project` - Iniciar projeto
```

## Comandos Relacionados
- `/setup` - Configurar ambiente
- `/setup-reset` - Resetar configuração
- `/start-project` - Iniciar projeto
