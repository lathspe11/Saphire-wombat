<#
.SYNOPSIS
    Script to To run a shell script on a Linux VM. 
.DESCRIPTION
    To run a shell script on a Linux VM. Azure bug (Feature) prevents any output from being displayed
    Script runs and can push output to a logfile. Errors are propengated to Powershell

.NOTES
    Author: Dan Williams 
    Date:   August 8, 2018
#>

# Name of Resource Group VM is associated with
$rgName = 'NSGTest'
# Name of the VM to run the script on
$vmName = 'dansnsgvm' 
# Path to Script on your system to run on the VM
$scriptPath = "C:\Users\dwilliams3\Programs\PS Scripts\bash\run_vm_mon.sh"
Invoke-AzureRmVMRunCommand -ResourceGroupName $rgName -VMName $vmName -CommandId RunShellScript -ScriptPath $scriptPath
