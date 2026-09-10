#!/bin/bash

# ============================================
# opencode-multi-agents - Start Script
# ============================================

set -e

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

print_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
print_success() { echo -e "${GREEN}[OK]${NC} $1"; }
print_warning() { echo -e "${YELLOW}[AVISO]${NC} $1"; }
print_error() { echo -e "${RED}[ERRO]${NC} $1"; }

# Banner de boas-vindas
show_banner() {
    echo
    echo -e "${CYAN}=============================================${NC}"
    echo -e "${CYAN}  opencode-multi-agents v0.1.0${NC}"
    echo -e "${CYAN}=============================================${NC}"
    echo
}

# Verificar se o opencode está instalado
check_opencode() {
    if ! command -v opencode &> /dev/null; then
        print_error "opencode não encontrado!"
        echo
        print_info "Instale o opencode com:"
        echo -e "${YELLOW}  curl -fsSL https://opencode.ai/install | bash${NC}"
        echo
        print_info "Depois execute este script novamente."
        exit 1
    fi
    print_success "opencode encontrado"
}

# Verificar se opencode.json existe
check_config() {
    if [ ! -f "opencode.json" ]; then
        print_error "opencode.json não encontrado!"
        print_info "Execute ./install.sh primeiro para instalar os agentes."
        exit 1
    fi
    print_success "configuração encontrada"
}

# Verificar se o .env está configurado
check_env() {
    if [ ! -f ".env" ]; then
        print_warning "Arquivo .env não encontrado."
        return 1
    fi
    
    if ! grep -q "OPENCODE_API_KEY=" .env 2>/dev/null || grep -q "OPENCODE_API_KEY=$" .env 2>/dev/null || grep -q "OPENCODE_API_KEY=sua-chave-aqui" .env 2>/dev/null; then
        print_warning "API Key ainda não configurada."
        return 1
    fi
    
    # Validar se a key tem formato plausível
    local key
    key=$(grep "^OPENCODE_API_KEY=" .env | cut -d'=' -f2-)
    if [ ${#key} -lt 20 ]; then
        print_warning "API Key parece inválida (muito curta)."
        return 1
    fi
    
    return 0
}

# Mostrar instruções de uso
show_help() {
    echo -e "${BLUE}═══════════════════════════════════════════${NC}"
    echo -e "${BLUE}  COMO USAR O OPENCODE-MULTI-AGENTS${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════${NC}"
    echo
    echo "A partir daqui, você entrará na interface do opencode."
    echo "Dentro dela, digite os comandos abaixo."
    echo
    echo -e "${YELLOW}NUNCA digite /comandos no terminal!${NC}"
    echo "Os /comandos são digitados DENTRO da interface do opencode."
    echo
    echo -e "${CYAN}Primeira vez:${NC}"
    echo "  1. Digite:  ${GREEN}/setup${NC}"
    echo "     → Configure seu provedor de IA e API key"
    echo "  2. Digite:  ${GREEN}/start-project \"descrição do projeto\"${NC}"
    echo "     → O time de agentes trabalha para você"
    echo
    echo -e "${CYAN}Comandos disponíveis:${NC}"
    echo "  /setup           - Configurar ambiente (API key)"
    echo "  /setup-status    - Ver configuração atual"
    echo "  /start-project   - Iniciar novo projeto"
    echo "  /full-cycle      - Ciclo completo automatizado"
    echo "  /review-code     - Revisar código"
    echo "  /security-audit  - Auditoria de segurança"
    echo "  /deploy          - Configurar deploy"
    echo "  /status          - Ver progresso"
    echo
    echo -e "${BLUE}═══════════════════════════════════════════${NC}"
    echo
    if [ "$1" = "first" ]; then
        echo -e "${YELLOW}→ Você ainda não configurou a API key.${NC}"
        echo -e "  Digite ${GREEN}/setup${NC} logo ao entrar. É o primeiro passo."
        echo
    fi
}

# Verificar se existe npm/npx
check_npm() {
    if ! command -v node &> /dev/null && ! command -v npx &> /dev/null; then
        print_warning "Node.js não encontrado. opencode pode precisar dele."
        echo "  Instale Node.js: https://nodejs.org"
    fi
}

# Main
main() {
    show_banner
    
    print_info "Verificando ambiente..."
    echo
    
    check_opencode
    check_config
    check_npm
    
    echo
    if check_env; then
        print_success "API key configurada"
        echo
        show_help "ready"
    else
        print_warning "Configuração inicial necessária"
        echo
        show_help "first"
    fi
    
    print_info "Iniciando opencode..."
    echo
    exec opencode
}

main "$@"