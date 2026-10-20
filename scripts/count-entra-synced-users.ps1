$ErrorActionPreference = 'Stop'

if (-not (Get-Module -ListAvailable -Name ExchangeOnlineManagement)) {
    throw "The ExchangeOnlineManagement module is required. Install it with: Install-Module ExchangeOnlineManagement -Scope CurrentUser"
}

Import-Module ExchangeOnlineManagement

$connected = $false

try {
    Connect-ExchangeOnline -ShowBanner:$false
    $connected = $true

    $users = Get-User -ResultSize Unlimited
    $syncedUserCount = @($users | Where-Object { $_.IsDirSynced -eq $true }).Count

    Write-Output "Entra-synced Exchange Online users: $syncedUserCount"
}
finally {
    if ($connected) {
        Disconnect-ExchangeOnline -Confirm:$false
    }
}
