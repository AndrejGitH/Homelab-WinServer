# Update-DomainComputers.ps1
# This script runs gpupdate /force on specified computers.
# Usage: Run from a domain-joined machine with remoting enabled.
# Author: YourName, Date: 2025-07-27

$computers = @("WinServerUi", "Sales-Smith")
foreach ($computer in $computers) {
    Invoke-Command -ComputerName $computer -ScriptBlock { gpupdate /force }
}
