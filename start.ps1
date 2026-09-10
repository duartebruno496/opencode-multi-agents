# ============================================
# opencode-multi-agents - Start Script (Windows)
# ============================================

# Cores
$Cyan    = "Cyan"
$Green   = "Green"
$Yellow  = "Yellow"
$Blue    = "Blue"
$Red     = "Red"
$White   = "White"

function Print-Info    { param($Msg) Write-Host "[INFO] $Msg" -ForegroundColor $Blue }
function Print-OK      { param($Msg) Write-Host "[OK] $Msg" -ForegroundColor $Green }
function Print-Warn    { param($Msg) Write-Host "[AVISO] $Msg" -ForegroundColor $Yellow }
function Print-Error   { param($Msg) Write-Host "[ERRO] $Msg" -ForegroundColor $Red }

# ── Banner ──────────────────────────────────────────────
function Show-Banner {
    Write-Host ""
    Write-Host "=============================================" -ForegroundColor $Cyan
    Write-Host "  opencode-multi-agents v0.1.0" -ForegroundColor $Cyan
    Write-Host "=============================================" -ForegroundColor $Cyan
    Write-Host ""
}

# ── Instalar opencode ───────────────────────────────────
function Install-OpenCode {
    Print-Info "Instalando opencode (pode levar alguns segundos)..."
    Write-Host ""

    # Verifica se npm está disponível
    if (Get-Command npm -ErrorAction SilentlyContinue) {
        Print-Info "Usando npm para instalar..."
        npm install -g opencode-ai 2>$null
        if ($LASTEXITCODE -eq 0) {
            Print-OK "opencode instalado via npm"
            return
        }
    }

    # Método alternativo: baixar binário do GitHub
    Print-Info "Baixando binário diretamente..."
    $arch = if ([Environment]::Is64BitOperatingSystem) { "x86_64" } else { "x86" }
    $url = "https://github.com/anomalyco/opencode/releases/latest/download/opencode-windows-$arch.exe"
    $installDir = "$env:USERPROFILE\.opencode\bin"
    $destFile = "$installDir\opencode.exe"

    try {
        New-Item -ItemType Directory -Force -Path $installDir | Out-Null
        Invoke-WebRequest -Uri $url -OutFile $destFile -UseBasicParsing
        
        # Adicionar ao PATH atual
        $env:PATH = "$installDir;$env:PATH"
        
        # Adicionar ao PATH permanentemente (usuário)
        $currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
        if ($currentPath -notlike "*$installDir*") {
            [Environment]::SetEnvironmentVariable("Path", "$installDir;$currentPath", "User")
        }
        
        Print-OK "opencode instalado em $installDir"
    }
    catch {
        Print-Error "Falha na instalação automática."
        Write-Host ""
        Print-Info "Instale manualmente:"
        Write-Host "  npm install -g opencode-ai" -ForegroundColor $Yellow
        Write-Host "  ou baixe de: https://opencode.ai" -ForegroundColor $Yellow
        exit 1
    }
}

# ── Verificar opencode ──────────────────────────────────
function Check-OpenCode {
    # Verifica no PATH
    if (Get-Command opencode -ErrorAction SilentlyContinue) {
        Print-OK "opencode encontrado"
        return
    }

    # Verifica diretórios comuns no Windows
    $paths = @(
        "$env:USERPROFILE\.opencode\bin\opencode.exe",
        "$env:LOCALAPPDATA\opencode\bin\opencode.exe",
        "$env:PROGRAMFILES\opencode\bin\opencode.exe"
    )
    foreach ($p in $paths) {
        if (Test-Path $p) {
            $dir = Split-Path $p
            $env:PATH = "$dir;$env:PATH"
            Print-OK "opencode encontrado em $dir"
            return
        }
    }

    # Não encontrou, instalar
    Install-OpenCode

    if (-not (Get-Command opencode -ErrorAction SilentlyContinue)) {
        Print-Error "Não foi possível iniciar o opencode."
        exit 1
    }
    Print-OK "opencode instalado com sucesso"
}

# ── Verificar opencode.json ─────────────────────────────
function Check-Config {
    if (-not (Test-Path "opencode.json")) {
        Print-Error "opencode.json não encontrado!"
        Print-Info "Execute .\install.ps1 primeiro para instalar os agentes."
        exit 1
    }
    Print-OK "configuração encontrada"
}

# ── Verificar .env (opcional) ───────────────────────────
function Check-Env {
    if (-not (Test-Path ".env")) {
        Print-Info "Arquivo .env não encontrado (ok se usar modelo gratuito)"
        return $false
    }

    $envContent = Get-Content .env -Raw -ErrorAction SilentlyContinue
    if ($envContent -match "OPENCODE_API_KEY=(.+)" -and $Matches[1].Length -ge 20 -and $Matches[1] -ne "sua-chave-aqui") {
        Print-OK "API key configurada"
        return $true
    }

    Print-Info "Usando modelo gratuito (nenhuma API key necessária)"
    return $false
}

# ── Verificar Node.js ───────────────────────────────────
function Check-Node {
    if (-not (Get-Command node -ErrorAction SilentlyContinue) -and -not (Get-Command npx -ErrorAction SilentlyContinue)) {
        Print-Warn "Node.js não encontrado. opencode pode precisar dele."
        Write-Host "  Instale Node.js: https://nodejs.org" -ForegroundColor $Yellow
    }
}

# ── Mostrar instruções ──────────────────────────────────
function Show-Help {
    param($Mode = "ready")

    Write-Host ""
    Write-Host "═══════════════════════════════════════════" -ForegroundColor $Blue
    Write-Host "  COMO USAR O OPENCODE-MULTI-AGENTS" -ForegroundColor $Blue
    Write-Host "═══════════════════════════════════════════" -ForegroundColor $Blue
    Write-Host ""
    Write-Host "A partir daqui, você entrará na interface do opencode."
    Write-Host "Dentro dela, digite os comandos abaixo."
    Write-Host ""
    Write-Host "NUNCA digite /comandos no terminal!" -ForegroundColor $Yellow
    Write-Host "Os /comandos são digitados DENTRO da interface do opencode."
    Write-Host ""
    Write-Host "Primeira vez:" -ForegroundColor $Cyan
    Write-Host "  1. Digite:  " -NoNewline; Write-Host "/setup" -ForegroundColor $Green
    Write-Host "     → Configure seu modelo (gratuito ou pago)"
    Write-Host "  2. Digite:  " -NoNewline; Write-Host '/start-project "descrição do projeto"' -ForegroundColor $Green
    Write-Host "     → O time de agentes trabalha para você"
    Write-Host ""
    Write-Host "Comandos disponíveis:" -ForegroundColor $Cyan
    Write-Host "  /setup           - Configurar ambiente (gratuito ou pago)"
    Write-Host "  /setup-status    - Ver configuração atual"
    Write-Host "  /start-project   - Iniciar novo projeto"
    Write-Host "  /full-cycle      - Ciclo completo automatizado"
    Write-Host "  /review-code     - Revisar código"
    Write-Host "  /security-audit  - Auditoria de segurança"
    Write-Host "  /deploy          - Configurar deploy"
    Write-Host "  /status          - Ver progresso"
    Write-Host ""
    Write-Host "═══════════════════════════════════════════" -ForegroundColor $Blue
    Write-Host "  MANTER ATUALIZADO" -ForegroundColor $Blue
    Write-Host "═══════════════════════════════════════════" -ForegroundColor $Blue
    Write-Host ""
    Write-Host "Se você fez FORK deste repositório:" -ForegroundColor $Cyan
    Write-Host '  → No GitHub: clique em "Sync fork" para atualizar'
    Write-Host "  → No terminal:"
    Write-Host "      git fetch upstream && git merge upstream/main" -ForegroundColor $Green
    Write-Host ""
    Write-Host 'Se usou "Use this template":' -ForegroundColor $Cyan
    Write-Host "  → Não recebe atualizações automáticas"
    Write-Host "  → Para copiar uma versão nova, rode: " -NoNewline; Write-Host ".\install.ps1" -ForegroundColor $Green
    Write-Host ""

    if ($Mode -eq "first") {
        Write-Host "→ Execute " -NoNewline; Write-Host "/setup" -ForegroundColor $Green -NoNewline; Write-Host " ao entrar para escolher seu modelo." -ForegroundColor $Yellow
        Write-Host "  Padrão: modelo gratuito (sem API key). Opções pagas disponíveis."
        Write-Host ""
    }
}

# ════════════════════════════════════════════════════════
#  MAIN
# ════════════════════════════════════════════════════════
Show-Banner

Print-Info "Verificando ambiente..."
Write-Host ""

Check-OpenCode
Check-Config
Check-Node

Write-Host ""
$hasKey = Check-Env
if ($hasKey) {
    Print-OK "API key configurada"
    Write-Host ""
    Show-Help "ready"
} else {
    Print-Warn "Configuração inicial necessária"
    Write-Host ""
    Show-Help "first"
}

Print-Info "Iniciando opencode..."
Write-Host ""
opencode
