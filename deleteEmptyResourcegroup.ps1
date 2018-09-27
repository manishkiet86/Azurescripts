#==================================================
#This PS script is used to remove Empty resource groups
#==================================================

#Login-AzureRmAccount
$resourcegroup = Get-AzureRmResourceGroup

#Set-ExecutionPolicy RemoteSigned


foreach($existingresource in $resourcegroup)
{
$res= Get-AzureRmResource -ResourceGroupName $existingresource.ResourceGroupName
Write-Host( $existingresource.ResourceGroupName + ")->Count:" + $res.length  + " (" + $existingresource.ResourceId +")" )
if($res.Length -eq 0)
    {
         Remove-AzureRmResourceGroup -Name $existingresource.ResourceGroupName -Force
        Write-Host("deleted:" + $existingresource.ResourceGroupName )
    }
} 