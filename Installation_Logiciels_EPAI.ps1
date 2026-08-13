<#
.SYNOPSIS
    installation de logiciels utilisées dans le cadre de la formation d'apprenti informaticien à l'EPAI

.DESCRIPTION
    Ce script vérifie pour chaque paquet s'il est déjà installé via winget :
    - s'il est installé, il tente une mise à jour (winget upgrade)
    - sinon, il l'installe (winget install)
    Packages concernés :
    - Docker.DockerDesktop
    - JGraph.Draw
    - Git.Git
    - GitHub.cli
    - EclipseAdoptium.Temurin.25.JDK
    - EclipseAdoptium.Temurin.25.JRE
    - JohnMacFarlane.Pandoc
    - Microsoft.Sqlcmd
    - Chocolatey.Chocolatey
    - DBeaver.DBeaver.Community
    - WiresharkFoundation.Wireshark
    - Devolutions.RemoteDesktopManager

.PARAMETER <ParameterName>
    aucun paramètre n'est requis pour l'ecécution de ce script
.EXAMPLE
    An example of how to run the script.
    PS C:\> & .\Installation_Logiciels_EPAI.ps1 

.NOTES
    Author: Chavagnat Adrien
    Date: 13.08.2026
    Version: 1.26.0
    Script Purpose: a l'intention des futures apprenti-e-s informaticiens
    Dependencies: aucune dépendance n'est requise

.LINK
    

#>

# Begin Script

$packages = @(
    "Docker.DockerDesktop",
    "JGraph.Draw",
    "Git.Git",
    "GitHub.cli",
    "EclipseAdoptium.Temurin.25.JDK",
    "EclipseAdoptium.Temurin.25.JRE",
    "JohnMacFarlane.Pandoc",
    "Microsoft.Sqlcmd",
    "Chocolatey.Chocolatey",
    "DBeaver.DBeaver.Community",
    "WiresharkFoundation.Wireshark",
    "Devolutions.RemoteDesktopManager"
)

function Install-OrUpdate-Package {
    param(
        [Parameter(Mandatory = $true)]
        [string]$PackageId
    )

    Write-Host "`n=== $PackageId ===" -ForegroundColor Cyan

    # Vérifie si le paquet est déjà installé (correspondance exacte de l'id)
    $installed = winget list --id $PackageId --exact --accept-source-agreements | Select-String -SimpleMatch $PackageId

    if ($installed) {
        Write-Host "Déjà installé -> vérification des mises à jour..." -ForegroundColor Yellow
        winget upgrade --id $PackageId --exact --accept-source-agreements --accept-package-agreements

        if ($LASTEXITCODE -eq 0) {
            Write-Host "$PackageId à jour." -ForegroundColor Green
        }
        else {
            # winget renvoie un code non nul si aucune mise à jour n'est disponible
            Write-Host "$PackageId déjà à la dernière version (ou mise à jour non disponible)." -ForegroundColor DarkYellow
        }
    }
    else {
        Write-Host "Non installé -> installation en cours..." -ForegroundColor Yellow
        winget install --id $PackageId --exact --accept-source-agreements --accept-package-agreements

        if ($LASTEXITCODE -eq 0) {
            Write-Host "$PackageId installé avec succès." -ForegroundColor Green
        }
        else {
            Write-Host "Echec de l'installation de $PackageId (code $LASTEXITCODE)." -ForegroundColor Red
        }
    }
}

foreach ($package in $packages) {
    Install-OrUpdate-Package -PackageId $package
}

Write-Host "`nInstallation/mise à jour terminée." -ForegroundColor Cyan