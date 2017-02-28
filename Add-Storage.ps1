#START OF SCRIPT
if ( (Get-PSSnapin -Name NutanixCmdletsPSSnapin -ErrorAction SilentlyContinue) -eq $null )
{
    Add-PsSnapin NutanixCmdletsPSSnapin
}


#Vars
$ContainerName = "NUVEEN01"
$StoragePoolName = "SP1"

#Get Storage Pool
$SP = Get-NTNXStoragePool -SearchString $StoragePoolName 
New-NTNXContainer -StoragePoolId $sp.id  -Name $ContainerName 
#Add to VCenter
Add-NTNXNfsDatastore -ContainerName $ContainerName  -DatastoreName $ContainerName 
