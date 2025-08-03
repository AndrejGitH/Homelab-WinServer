#Script for creating users in AD

Import-Module ActiveDirectory

function Generate-RandomPassword {
    $length = 12
    $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+-="
    while ($true) {
        $password = -join (1..$length | ForEach-Object { $chars[(Get-Random -Maximum $chars.Length)] })
        if ($password -match '[A-Z]' -and $password -match '[a-z]' -and $password -match '[!@#\$%\^&\*\(\)_\+\-=]') { return $password }
    }
}


$ouPath = "OU=IT Users,OU=Users,OU=Zilina,DC=dnsserverforest,DC=local"

$employees = @(
    @{FullName = "Clay Malek"; Username = "cmalek"},
    @{FullName = "Mike Malek"; Username = "mmalek"}
)

foreach($employee in $employees){
    $fullName = $employee.FullName
    $username = $employee.Username
    $upn = "$username@dnsserverforest.local"

    $password = Generate-RandomPassword
    $securePassword = ConvertTo-SecureString $password -AsPlainText -Force

    New-ADUser -Name $fullName `
        -GivenName $fullName.Split(" ")[0] `
        -Surname $fullName.Split(" ")[1] `
        -DisplayName $fullName `
        -SamAccountName $username `
        -UserPrincipalName $upn `
        -Path $ouPath `
        -AccountPassword $securePassword `
        -Enabled $true `
        -ChangePasswordAtLogon $true

    Write-Host "Created user: $fullName (Username: $username) with initial password: $password"
}

Get-ADUser -Filter * -SearchBase $ouPath | Select-Object Name, DistinguishedName
