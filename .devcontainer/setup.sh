#!/bin/bash

# ============================================
# Codespaces Setup - opencode-multi-agents
# ============================================

set -e

export DEBIAN_FRONTEND=noninteractive

# Cores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo
echo -e "${CYAN}=============================================${NC}"
echo -e "${CYAN}  opencode-multi-agents - Configurando...${NC}"
echo -e "${CYAN}=============================================${NC}"
echo

# Instalar opencode
if ! command -v opencode &> /dev/null; then
    echo -e "${BLUE}[INFO]${NC} Instalando opencode..."
    curl -fsSL https://opencode.ai/install | bash
fi

# Adicionar opencode ao PATH
if [[ ":$PATH:" != *":$HOME/.opencode/bin:"* ]]; then
    echo 'export PATH="$HOME/.opencode/bin:$PATH"' >> ~/.bashrc
    export PATH="$HOME/.opencode/bin:$PATH"
fi

# Tornar scripts executáveis
chmod +x start.sh install.sh 2>/dev/null || true

# Criar .env a partir do example se não existir
if [ ! -f ".env" ]; then
    cp .env.example .env
    echo -e "${YELLOW}[AVISO]${NC} .env criado a partir do example."
    echo -e "        Configure sua API key dentro do /setup (dentro do opencode)."
fi

echo
echo -e "${GREEN}[OK]${NC} opencode instalado e configurado!"
echo

# Mostrar instruções no terminal
cat << 'EOF'

═══════════════════════════════════════════
  COMO COMEÇAR (leia até o final!)
═══════════════════════════════════════════

  1. Execute o comando abaixo para iniciar o opencode:
       start.sh

  2. DENTRO da interface do opencode, digite:
       /setup

     → Isso configura seu provedor de IA e API key
     → Fica tudo no arquivo .env (nunca é commitado)

  3. Depois digite:
       /start-project "descrição do seu projeto"

     → Os 12 agentes trabalham em colaboração
     → Cada um faz perguntas e executa sua parte

IMPORTANTE: /comandos são digitados DENTRO do opencode,
NÃO no terminal bash.

Arquivos de configuração:
  .env           - Suas chaves (NUNCA compartilhe)
  .env.example   - Modelo sem chaves
  .gitignore     - Protege o .env de commit

═══════════════════════════════════════════
EOF

echo -e "${GREEN}Pronto! Digite: ${BLUE}start.sh${NC}"
echo