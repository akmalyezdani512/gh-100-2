$ErrorActionPreference = 'Stop'

if (-not (Get-Module -ListAvailable -Name ExchangeOnlineManagement)) {
    throw "The ExchangeOnlineManagement module is required. Install it with: Install-Module ExchangeOnlineManagement -Scope CurrentUser"
}

Import-Module ExchangeOnlineManagement -MinimumVersion '3.0.0'

$connected = $false

try {
    Connect-ExchangeOnline -ShowBanner:$false
    $connected = $true

    $syncedUserCount = (
        Get-User -ResultSize Unlimited |
            Where-Object { $_.IsDirSynced -eq $true } |
            Measure-Object
    ).Count

    Write-Output "Entra-synced Exchange Online users: $syncedUserCount"
}
finally {
    if ($connected) {
        Disconnect-ExchangeOnline -Confirm:$false
    }
}
