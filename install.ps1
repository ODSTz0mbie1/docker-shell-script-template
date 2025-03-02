# Ensure Docker is installed and available
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Error "Error: Docker is not installed or not found in PATH."
    exit 1
}

# Build the Docker image
try {
    docker build -t script1 .
} catch {
    Write-Error "Error: Docker build failed"
    exit 1
}

# Define the alias string
$alias = "docker run --rm -v /:/app/data script1 -d $(pwd).Substring(3)"

# Add the alias to the user's PowerShell profile
$profilePath = $PROFILE.CurrentUserAllHosts

# Check if the alias already exists in the profile to avoid duplicates
if (-not (Test-Path $profilePath)) {
    New-Item -ItemType File -Path $profilePath -Force
}

if (-not (Select-String -Path $profilePath -Pattern "Set-Alias testscript")) {
    Add-Content -Path $profilePath -Value "`nSet-Alias testscript '$alias'"
    Write-Output "Added alias to $profilePath."
} else {
    Write-Output "Alias 'testscript' already exists in $profilePath."
}

# Apply the alias to the current session
Set-Alias testscript $alias
Write-Output "Alias 'testscript' is now available in this session."

exit 0