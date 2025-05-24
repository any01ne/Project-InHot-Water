$users = @(
    @{Name='itjkowalski'; OU='OU=IT'},
    @{Name='hrnowak'; OU='OU=HR'}
)
foreach ($user in $users) {
    New-ADUser -Name $user.Name -Path $user.OU -AccountPassword (ConvertTo-SecureString 'P@ssw0rd!' -AsPlainText -Force) -Enabled $true
}