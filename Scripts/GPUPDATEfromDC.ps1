# This script runs gpupdate /force on specified computers.
# Usage: Run from a domain-joined machine with remoting enabled.


$computers = @("WinServerUi", "Sales-Smith")
foreach ($computer in $computers) {
    Invoke-Command -ComputerName $computer -ScriptBlock { gpupdate /force }
}
