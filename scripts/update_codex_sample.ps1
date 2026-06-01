param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$ProjectRoot
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Write-Log {
    param([string]$Message)
    Write-Host $Message
}

function Update-File {
    param(
        [Parameter(Mandatory = $true)][string]$Source,
        [Parameter(Mandatory = $true)][string]$Destination,
        [Parameter(Mandatory = $true)][string]$Label
    )

    $parent = Split-Path -Parent $Destination
    if ($parent -and -not (Test-Path -LiteralPath $parent)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }

    Copy-Item -LiteralPath $Source -Destination $Destination -Force
    Write-Log "[update] ${Label}: $Destination"
}

function Update-Directory {
    param(
        [Parameter(Mandatory = $true)][string]$Source,
        [Parameter(Mandatory = $true)][string]$Destination,
        [Parameter(Mandatory = $true)][string]$Label
    )

    $parent = Split-Path -Parent $Destination
    if ($parent -and -not (Test-Path -LiteralPath $parent)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }

    if (Test-Path -LiteralPath $Destination) {
        Remove-Item -LiteralPath $Destination -Recurse -Force
    }

    Copy-Item -LiteralPath $Source -Destination $Destination -Recurse
    Write-Log "[update] ${Label}: $Destination"
}

function Copy-DirectoryIfAbsent {
    param(
        [Parameter(Mandatory = $true)][string]$Source,
        [Parameter(Mandatory = $true)][string]$Destination,
        [Parameter(Mandatory = $true)][string]$Label
    )

    if (Test-Path -LiteralPath $Destination) {
        Write-Log "[skip] ${Label}: preserve existing project-local data: $Destination"
        return
    }

    $parent = Split-Path -Parent $Destination
    if ($parent -and -not (Test-Path -LiteralPath $parent)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }

    Copy-Item -LiteralPath $Source -Destination $Destination -Recurse
    Write-Log "[copy] ${Label}: $Destination"
}

$scriptDir = Split-Path -Parent $PSCommandPath
$repoRoot = (Resolve-Path -LiteralPath (Join-Path $scriptDir "..")).Path
$sampleDir = Join-Path $repoRoot ".codex-sample"
$codexConfigTemplate = Join-Path $sampleDir "codex_config_template.toml"

if (-not (Test-Path -LiteralPath $sampleDir -PathType Container)) {
    throw ".codex-sample not found: $sampleDir"
}

if (-not (Test-Path -LiteralPath $ProjectRoot)) {
    New-Item -ItemType Directory -Path $ProjectRoot -Force | Out-Null
}

$targetRoot = (Resolve-Path -LiteralPath $ProjectRoot).Path

Write-Log "Source: $sampleDir"
Write-Log "Target: $targetRoot"

Update-File `
    -Source (Join-Path $sampleDir "AGENTS.md") `
    -Destination (Join-Path $targetRoot "AGENTS.md") `
    -Label "AGENTS.md"

Update-Directory `
    -Source (Join-Path $sampleDir ".agents") `
    -Destination (Join-Path $targetRoot ".agents") `
    -Label ".agents"

Update-File `
    -Source $codexConfigTemplate `
    -Destination (Join-Path (Join-Path $targetRoot ".codex") "config.toml") `
    -Label ".codex/config.toml"

Update-Directory `
    -Source (Join-Path $sampleDir "domains_ja") `
    -Destination (Join-Path $targetRoot "domains_ja") `
    -Label "domains_ja"

Update-Directory `
    -Source (Join-Path $sampleDir "operating_ja") `
    -Destination (Join-Path $targetRoot "operating_ja") `
    -Label "operating_ja"

Update-Directory `
    -Source (Join-Path $sampleDir "templates") `
    -Destination (Join-Path $targetRoot "templates") `
    -Label "templates"

Copy-DirectoryIfAbsent `
    -Source (Join-Path $sampleDir "project-local") `
    -Destination (Join-Path $targetRoot "project-local") `
    -Label "project-local"

$sampleReadme = Join-Path $sampleDir "README.md"
$readmePath = Join-Path $targetRoot "README.md"
if (-not (Test-Path -LiteralPath $readmePath)) {
    Update-File -Source $sampleReadme -Destination $readmePath -Label "README.md"
} elseif ((Get-FileHash -LiteralPath $sampleReadme).Hash -eq (Get-FileHash -LiteralPath $readmePath).Hash) {
    Update-File -Source $sampleReadme -Destination $readmePath -Label "README.md"
} else {
    Update-File `
        -Source $sampleReadme `
        -Destination (Join-Path $targetRoot "codex_setup_README.md") `
        -Label "codex_setup_README.md"
}

Write-Log "Done."
