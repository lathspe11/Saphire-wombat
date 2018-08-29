#Excel modifies the format of the CSV files from what powershell puts out. 
#This script will read your file in and output it in the common format
#Otherwise the diff program will mark every line a change 

Param([string]$filePath)
#Clear
Function Select-FolderDialog {
  param([string]$Description="Select Folder",[string]$RootFolder="Desktop")

  [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") |
  Out-Null

  $objForm = New-Object System.Windows.Forms.FolderBrowserDialog 
  $objForm.Rootfolder = $RootFolder
  $objForm.Description = $Description
  $Show = $objForm.ShowDialog()
  If ($Show -eq "OK")
  {
    Return $objForm.SelectedPath
  } else {
    Write-Error "Operation cancelled by user."
  }
}
Function Get-FileName($initialDirectory)
{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.initialDirectory = $initialDirectory
    $OpenFileDialog.filter = "CSV (*.csv)| *.csv"
    $OpenFileDialog.ShowDialog() | Out-Null
    $OpenFileDialog.filename
}

$csvsubPath = Get-FileName("C:\Users\dwilliams3\Programs") 
$csvsubPath
$P = Import-Csv $csvsubPath 
$P | Export-Csv $csvsubPath -NoTypeInformation
