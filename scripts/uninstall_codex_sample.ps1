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

function Remove-PathIfExists {
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][string]$Label
    )

    if (-not (Test-Path -LiteralPath $Path)) {
        Write-Log "[skip] ${Label}: not found: $Path"
        return
    }

    Remove-Item -LiteralPath $Path -Recurse -Force
    Write-Log "[remove] ${Label}: $Path"
}

function Remove-FileIfSame {
    param(
        [Parameter(Mandatory = $true)][string]$Sample,
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][string]$Label
    )

    if (-not (Test-Path -LiteralPath $Path)) {
        Write-Log "[skip] ${Label}: not found: $Path"
        return
    }

    if ((Get-FileHash -LiteralPath $Sample).Hash -eq (Get-FileHash -LiteralPath $Path).Hash) {
        Remove-Item -LiteralPath $Path -Force
        Write-Log "[remove] ${Label}: $Path"
    } else {
        Write-Log "[skip] ${Label}: differs from sample: $Path"
    }
}

function Get-RelativeItemSignature {
    param([Parameter(Mandatory = $true)][string]$Root)

    $resolvedRoot = (Resolve-Path -LiteralPath $Root).Path
    Get-ChildItem -LiteralPath $resolvedRoot -Recurse -Force | ForEach-Object {
        $relativePath = $_.FullName.Substring($resolvedRoot.Length).TrimStart([System.IO.Path]::DirectorySeparatorChar, [System.IO.Path]::AltDirectorySeparatorChar)
        $normalizedPath = $relativePath -replace '\\', '/'
        if ($_.PSIsContainer) {
            "D:$normalizedPath"
        } else {
            $hash = (Get-FileHash -LiteralPath $_.FullName).Hash
            "F:${normalizedPath}:$hash"
        }
    } | Sort-Object
}

function Test-DirectorySame {
    param(
        [Parameter(Mandatory = $true)][string]$Sample,
        [Parameter(Mandatory = $true)][string]$Path
    )

    $sampleItems = @(Get-RelativeItemSignature -Root $Sample)
    $pathItems = @(Get-RelativeItemSignature -Root $Path)
    $diff = Compare-Object -ReferenceObject $sampleItems -DifferenceObject $pathItems
    return $null -eq $diff
}

function Remove-DirectoryIfSame {
    param(
        [Parameter(Mandatory = $true)][string]$Sample,
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][string]$Label
    )

    if (-not (Test-Path -LiteralPath $Path)) {
        Write-Log "[skip] ${Label}: not found: $Path"
        return
    }

    if (Test-DirectorySame -Sample $Sample -Path $Path) {
        Remove-Item -LiteralPath $Path -Recurse -Force
        Write-Log "[remove] ${Label}: $Path"
    } else {
        Write-Log "[skip] ${Label}: differs from sample: $Path"
    }
}

$scriptDir = Split-Path -Parent $PSCommandPath
$repoRoot = (Resolve-Path -LiteralPath (Join-Path $scriptDir "..")).Path
$sampleDir = Join-Path $repoRoot ".codex-sample"

if (-not (Test-Path -LiteralPath $sampleDir -PathType Container)) {
    throw ".codex-sample not found: $sampleDir"
}

if (-not (Test-Path -LiteralPath $ProjectRoot -PathType Container)) {
    throw "project root not found: $ProjectRoot"
}

$targetRoot = (Resolve-Path -LiteralPath $ProjectRoot).Path

Write-Log "Source: $sampleDir"
Write-Log "Target: $targetRoot"

Remove-FileIfSame `
    -Sample (Join-Path $sampleDir "AGENTS.md") `
    -Path (Join-Path $targetRoot "AGENTS.md") `
    -Label "AGENTS.md"

Remove-PathIfExists -Path (Join-Path $targetRoot ".agents") -Label ".agents"

Remove-FileIfSame `
    -Sample (Join-Path $sampleDir "config.toml") `
    -Path (Join-Path (Join-Path $targetRoot ".codex") "config.toml") `
    -Label ".codex/config.toml"

Remove-PathIfExists -Path (Join-Path $targetRoot "domains_ja") -Label "domains_ja"
Remove-PathIfExists -Path (Join-Path $targetRoot "operating_ja") -Label "operating_ja"
Remove-PathIfExists -Path (Join-Path $targetRoot "templates") -Label "templates"

Remove-DirectoryIfSame `
    -Sample (Join-Path $sampleDir "project-local") `
    -Path (Join-Path $targetRoot "project-local") `
    -Label "project-local"

Remove-FileIfSame `
    -Sample (Join-Path $sampleDir "README.md") `
    -Path (Join-Path $targetRoot "README.md") `
    -Label "README.md"

Remove-PathIfExists -Path (Join-Path $targetRoot "codex_setup_README.md") -Label "codex_setup_README.md"

$codexDir = Join-Path $targetRoot ".codex"
if ((Test-Path -LiteralPath $codexDir -PathType Container) -and -not (Get-ChildItem -LiteralPath $codexDir -Force | Select-Object -First 1)) {
    Remove-Item -LiteralPath $codexDir -Force
    Write-Log "[remove] .codex: empty directory removed: $codexDir"
}

Write-Log "Done."
