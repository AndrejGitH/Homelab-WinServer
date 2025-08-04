Import-Module ActiveDirectory

$usernames = @("cmalek")

foreach($username in $usernames){

try{


Remove-ADUser -Identity $username -Confirm:$true
Write-Host "User with username $username was successfully removed!"

}

catch {

Write-Host "User with username $username could not be removed! Reason: $($_.Exception.Message)"

}

}