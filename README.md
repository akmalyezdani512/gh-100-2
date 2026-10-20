# gh-100-2

## Count Entra-synced Exchange Online users

The PowerShell script at `scripts/count-entra-synced-users.ps1` connects to
Exchange Online interactively and counts the user objects where `IsDirSynced`
is true.

Prerequisites:

- PowerShell 5.1 or later
- An Exchange Online account with permission to read recipient information

Install the Exchange Online module if needed, then run the script:

```powershell
Install-Module ExchangeOnlineManagement -Scope CurrentUser
./scripts/count-entra-synced-users.ps1
```

The script signs in using the Exchange Online module's interactive
authentication, prints the count, and disconnects. The count reflects
directory-synced user objects visible to the signed-in account in Exchange
Online.