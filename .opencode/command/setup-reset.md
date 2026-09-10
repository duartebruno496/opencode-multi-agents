---
description: Reseta a configuração do ambiente e pede confirmação
agent: setup
---

# Comando: /setup-reset

## Descrição
Reseta toda a configuração do ambiente, apagando o arquivo `.env` e pedindo confirmação.

## Uso
```
/setup-reset
```

## Fluxo Executado
1. Mostra configuração atual
2. Pede confirmação (duas vezes)
3. Faz backup do `.env` atual
4. Apaga o `.env`
5. Orienta sobre próximos passos

## Exemplo de Interação
```
Você: /setup-reset

Setup Agent: ⚠️ Atenção! Você está prestes a resetar toda a configuração.

## Configuração Atual
- Provedor: Anthropic
- Modelo: claude-sonnet-4-6
- Status: ✅ Conectado

Isso apagará:
- Arquivo .env com todas as chaves
- Configurações de servicios

Tem certeza que deseja continuar? (sim/não)
Você: sim

⚠️ Última chance! Isso não pode ser desfeito.
Confirma o reset? (sim/não)
Você: sim

✅ Configuração resetada com sucesso.

## Próximos Passos
1. Execute /setup para reconfigurar
2. Suas chaves antigas estão em .env.backup

⚠️ IMPORTANTE:
- Suas API keys ainda funcionam
- Você pode recuperar em .env.backup
- Execute /setup para configurar novamente
```

## Arquivos Afetados
- `.env` → Removido
- `.env.backup` → Criado (backup)

## Segurança
- Backup sempre é criado antes do reset
- Duas confirmações necessárias
- Mensagem clara sobre consequências

## Comandos Relacionados
- `/setup` - Configurar novamente
- `/setup-status` - Ver configuração atual
