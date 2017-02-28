#START OF SCRIPT
if ( (Get-PSSnapin -Name NutanixCmdletsPSSnapin -ErrorAction SilentlyContinue) -eq $null )
{
    Add-PsSnapin NutanixCmdletsPSSnapin
}

Get-NTNXNfsDatastore | Where-Object {$_.containername -eq "NUVEEN01"} | Remove-NTNXNfsDatastore
$container = Get-NTNXContainer -SearchString "nuveen01"
Remove-NTNXContainer -Id $container.id -IgnoreSmallFiles $true

