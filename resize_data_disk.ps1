param(
[String]$rgName,
[String]$vmName,
[int]$size,
[int]$disknumber
)
$vm = Get-AzVM -ResourceGroupName $rgName -Name $vmName
Stop-AzVM -ResourceGroupName $rgName -Name $vmName  -force
Get-AzDisk -ResourceGroupName $rgName -DiskName $vm.StorageProfile.DataDisks[$disknumber].Name
$disk.DiskSizeGB = $size
Update-AzDisk -ResourceGroupName $rgName -Disk $disk -DiskName $disk.Name
Start-AzVM -ResourceGroupName $rgName -Name $vmName
