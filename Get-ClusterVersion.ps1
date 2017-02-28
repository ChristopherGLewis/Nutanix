#START OF SCRIPT
if ( (Get-PSSnapin -Name NutanixCmdletsPSSnapin -ErrorAction SilentlyContinue) -eq $null )
{
    Add-PsSnapin NutanixCmdletsPSSnapin
}

$clusterIP = ("10.21.59.37", "10.21.49.37")

$clusterIP | ForEach-Object {
      Connect-NTNXCluster -Server $_ -AcceptInvalidSSLCerts -UserName "admin" -Password (ConvertTo-SecureString "nutanix/4u"  -AsPlainText -Force)  | Out-Null
}


Get-NTNXCluster -Servers $clusterIP | Select-Object name,version,nccversion,numnodes  


