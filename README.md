# gh-100-2

## Count Entra-synced Exchange Online users

The PowerShell script at `scripts/count-entra-synced-users.ps1` connects to
Exchange Online interactively and counts the user objects where `IsDirSynced`
is true.

Prerequisites:

- PowerShell 5.1 or later
- ExchangeOnlineManagement module version 3.0.0 or later
- An Exchange Online account assigned the **View-Only Recipients** management
  role, directly or through a role group

Install the Exchange Online module if needed, then run the script:

```powershell
Install-Module ExchangeOnlineManagement -MinimumVersion 3.0.0 -Scope CurrentUser
./scripts/count-entra-synced-users.ps1
```

The script signs in using the Exchange Online module's interactive
authentication, prints the count, and disconnects. The count reflects
directory-synced user objects visible to the signed-in account in Exchange
Online. The script retrieves all user objects and filters them locally by
`IsDirSynced`; large tenants may take longer to process.