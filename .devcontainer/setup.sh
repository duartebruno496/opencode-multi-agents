#!/bin/bash

# ============================================
# Codespaces Setup - opencode-multi-agents
# ============================================

# NÃO usar set -e aqui para não abortar no primeiro erro

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

# ── 1. Instalar opencode ──────────────────────────────────
echo -e "${BLUE}[INFO]${NC} Verificando opencode..."

if command -v opencode &> /dev/null; then
    echo -e "${GREEN}[OK]${NC} opencode já está instalado"
else
    echo -e "${BLUE}[INFO]${NC} Instalando opencode..."
    
    if curl -fsSL https://opencode.ai/install | bash 2>/tmp/opencode-install.log; then
        echo -e "${GREEN}[OK]${NC} opencode instalado"
    else
        echo -e "${YELLOW}[AVISO]${NC} Instalador padrão falhou, tentando método alternativo..."
        # Método alternativo: baixa binário diretamente
        mkdir -p "$HOME/.local/bin"
        ARCH=$(uname -m)
        [ "$ARCH" = "aarch64" ] && ARCH="aarch64" || ARCH="x86_64"
        curl -sL "https://opencode.ai/releases/latest/opencode-linux-${ARCH}" -o "$HOME/.local/bin/opencode" 2>/dev/null
        chmod +x "$HOME/.local/bin/opencode" 2>/dev/null
    fi
fi

# ── 2. Garantir que opencode está no PATH ─────────────────
OCDIR=""
[ -f "$HOME/.opencode/bin/opencode" ]      && OCDIR="$HOME/.opencode/bin"
[ -f "$HOME/.local/bin/opencode" ]         && OCDIR="$HOME/.local/bin"
[ -f "/usr/local/bin/opencode" ]           && OCDIR="/usr/local/bin"

if [ -n "$OCDIR" ]; then
    # Tornar persistente no .bashrc
    if ! grep -q "opencode" ~/.bashrc 2>/dev/null; then
        echo "export PATH=\"$OCDIR:\$PATH\"" >> ~/.bashrc
    fi
    export PATH="$OCDIR:$PATH"
    echo -e "${GREEN}[OK]${NC} opencode adicionado ao PATH"
fi

# Verificar se agora funciona
if ! command -v opencode &> /dev/null; then
    echo -e "${YELLOW}[AVISO]${NC} opencode não encontrado no PATH."
    echo "O start.sh vai tentar instalar automaticamente quando rodado."
fi

# ── 3. Tornar scripts executáveis ─────────────────────────
chmod +x start.sh install.sh 2>/dev/null || true
echo -e "${GREEN}[OK]${NC} scripts executáveis configurados"

# ── 4. Criar .env se não existir ──────────────────────────
if [ ! -f ".env" ]; then
    cp .env.example .env
    echo -e "${YELLOW}[INFO]${NC} Arquivo .env criado (configure com /setup dentro do opencode)"
fi

# ── 5. Resumo ─────────────────────────────────────────────
echo
echo -e "${GREEN}=============================================${NC}"
echo -e "${GREEN}  Tudo pronto!${NC}"
echo -e "${GREEN}=============================================${NC}"
echo
echo -e "  Para iniciar, execute no terminal:"
echo -e "  ${CYAN}./start.sh${NC}"
echo
echo -e "  ${YELLOW}IMPORTANTE:${NC}"
echo -e "  O script vai abrir o opencode para você."
echo -e "  DENTRO dele, digite ${CYAN}/setup${NC} primeiro."
echo
