param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$ProjectRoot,

    [Parameter(Mandatory = $false)]
    [switch]$Force
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Write-Log {
    param([string]$Message)
    Write-Host $Message
}

function Assert-TargetChildPath {
    param([Parameter(Mandatory = $true)][string]$Path)

    $root = [System.IO.Path]::GetFullPath($script:TargetRootForSafety).TrimEnd(
        [System.IO.Path]::DirectorySeparatorChar,
        [System.IO.Path]::AltDirectorySeparatorChar
    )
    $fullPath = [System.IO.Path]::GetFullPath($Path).TrimEnd(
        [System.IO.Path]::DirectorySeparatorChar,
        [System.IO.Path]::AltDirectorySeparatorChar
    )
    $prefix = $root + [System.IO.Path]::DirectorySeparatorChar

    if ($fullPath -eq $root -or -not $fullPath.StartsWith($prefix, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "refusing to modify path outside target root: $Path"
    }
}

function Ensure-ParentDirectory {
    param([Parameter(Mandatory = $true)][string]$Path)

    $parent = Split-Path -Parent $Path
    if ($parent -and -not (Test-Path -LiteralPath $parent)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }
}

function Remove-ManagedPathIfExists {
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][string]$Label,
        [Parameter(Mandatory = $true)][string]$Reason
    )

    if (-not (Test-Path -LiteralPath $Path)) {
        return
    }

    Assert-TargetChildPath -Path $Path
    Remove-ManagedPath -Path $Path
    Write-Log "[remove] ${Label}: ${Reason}: $Path"
}

function Remove-ManagedPath {
    param([Parameter(Mandatory = $true)][string]$Path)

    Assert-TargetChildPath -Path $Path
    for ($attempt = 1; $attempt -le 5; $attempt++) {
        try {
            Remove-Item -LiteralPath $Path -Recurse -Force -ErrorAction Stop
            return
        } catch {
            if ($attempt -eq 5) {
                throw
            }
            Start-Sleep -Milliseconds (200 * $attempt)
        }
    }
}

function Update-File {
    param(
        [Parameter(Mandatory = $true)][string]$Source,
        [Parameter(Mandatory = $true)][string]$Destination,
        [Parameter(Mandatory = $true)][string]$Label
    )

    Assert-TargetChildPath -Path $Destination

    if (-not (Test-Path -LiteralPath $Source -PathType Leaf)) {
        Remove-ManagedPathIfExists -Path $Destination -Label $Label -Reason "source retired"
        return
    }

    if (Test-Path -LiteralPath $Destination -PathType Container) {
        Remove-ManagedPathIfExists -Path $Destination -Label $Label -Reason "replace directory with file"
    }

    Ensure-ParentDirectory -Path $Destination
    Copy-Item -LiteralPath $Source -Destination $Destination -Force
    Write-Log "[update] ${Label}: $Destination"
}

function Update-Directory {
    param(
        [Parameter(Mandatory = $true)][string]$Source,
        [Parameter(Mandatory = $true)][string]$Destination,
        [Parameter(Mandatory = $true)][string]$Label
    )

    Assert-TargetChildPath -Path $Destination

    if (-not (Test-Path -LiteralPath $Source -PathType Container)) {
        Remove-ManagedPathIfExists -Path $Destination -Label $Label -Reason "source retired"
        return
    }

    Ensure-ParentDirectory -Path $Destination
    if (Test-Path -LiteralPath $Destination) {
        Remove-ManagedPath -Path $Destination
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

    Assert-TargetChildPath -Path $Destination

    if (-not (Test-Path -LiteralPath $Source -PathType Container)) {
        Write-Log "[skip] ${Label}: source not found and existing project-local data is preserved: $Destination"
        return
    }

    if (Test-Path -LiteralPath $Destination) {
        Write-Log "[skip] ${Label}: preserve existing project-local data: $Destination"
        return
    }

    Ensure-ParentDirectory -Path $Destination
    Copy-Item -LiteralPath $Source -Destination $Destination -Recurse
    Write-Log "[copy] ${Label}: $Destination"
}

function Remove-CodexDirectoryIfEmpty {
    $codexDir = Join-Path $script:TargetRootForSafety ".codex"
    if ((Test-Path -LiteralPath $codexDir -PathType Container) -and -not (Get-ChildItem -LiteralPath $codexDir -Force | Select-Object -First 1)) {
        Assert-TargetChildPath -Path $codexDir
        Remove-Item -LiteralPath $codexDir -Force
        Write-Log "[remove] .codex: empty directory removed: $codexDir"
    }
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
$script:TargetRootForSafety = $targetRoot

Write-Log "Source: $sampleDir"
Write-Log "Target: $targetRoot"
if ($Force) {
    Write-Log "Mode: force (README.md will be replaced; project-local/ is preserved)"
}

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
if ($Force) {
    Update-File -Source $sampleReadme -Destination $readmePath -Label "README.md"
    Remove-ManagedPathIfExists `
        -Path (Join-Path $targetRoot "codex_setup_README.md") `
        -Label "codex_setup_README.md" `
        -Reason "superseded by forced README.md update"
} elseif (-not (Test-Path -LiteralPath $sampleReadme -PathType Leaf)) {
    Remove-ManagedPathIfExists `
        -Path (Join-Path $targetRoot "codex_setup_README.md") `
        -Label "codex_setup_README.md" `
        -Reason "source retired"
    Write-Log "[skip] README.md: source not found and project README is preserved: $readmePath"
} elseif (-not (Test-Path -LiteralPath $readmePath)) {
    Update-File -Source $sampleReadme -Destination $readmePath -Label "README.md"
} elseif ((Get-FileHash -LiteralPath $sampleReadme).Hash -eq (Get-FileHash -LiteralPath $readmePath).Hash) {
    Update-File -Source $sampleReadme -Destination $readmePath -Label "README.md"
} else {
    Update-File `
        -Source $sampleReadme `
        -Destination (Join-Path $targetRoot "codex_setup_README.md") `
        -Label "codex_setup_README.md"
}

Remove-CodexDirectoryIfEmpty
Write-Log "Done."
