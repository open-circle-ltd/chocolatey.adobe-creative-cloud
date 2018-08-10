# itigo.adobe-creative-cloud install

# defaults Settings
$ErrorActionPreference = 'Stop'; # stop on all errors

# Parameters Settings
$PackageParameters = Get-PackageParameters

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = 'https://ccmdls.adobe.com/AdobeProducts/KCCC/1/win32/CreativeCloudSet-Up.exe'
  checksum       = 'ECCE22BCE6A0612947E4003775A911CB835D62CF5301C8E991955FD6AEBC4006'
  checksumType   = 'sha256'
  checksum64     = ''
  checksumType64 = ''
  silentArgs     = '/quiet'
}

Install-ChocolateyPackage @packageArgs

if(Get-Item -Path "C:\Users\Public\Desktop\Adobe Creative Cloud.lnk" -ErrorAction SilentlyContinue) {
  Remove-Item `
    -Path "C:\Users\Public\Desktop\Adobe Creative Cloud.lnk" `
    -Recurse
  Write-Output `
    -InputObject "Remove Shortcut C:\Users\Public\Desktop\Adobe Creative Cloud.lnk"
}

if ($PackageParameters.NOAUTOSTARTHARD) {
  Set-ItemProperty `
    -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run32" "Adobe Creative Cloud" `
    -Value ([byte[]](0x03,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00))
  Write-Output `
   -InputObject "Disable Adobe Creative Cloud Autostart"
} else {
  Set-ItemProperty `
    -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run32" `
    -Name "Adobe Creative Cloud" `
    -Value ([byte[]](0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00))
  Set-ItemProperty `
    -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run32" `
    -Name "AdobeAAMUpdater-1.0" `
    -Value ([byte[]](0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00))
  Set-ItemProperty `
    -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run32" `
    -Name "AdobeGCInvoker-1.0" `
    -Value ([byte[]](0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00))
}
