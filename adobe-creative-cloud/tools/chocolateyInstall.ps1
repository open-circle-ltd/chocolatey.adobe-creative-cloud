# adobe-creative-cloud install

# Globale Settings
$ErrorActionPreference = 'Stop';
$PackageParameters = Get-PackageParameters

$toolsDir            = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$checksumPackage     = '42afc3773dc4bb0c7166b6baf896f99a75ce4ec049d906f7b9ad21dd88c81197dd070a98ad8c9658f22c23623e50679f09ec4cb83fdc9c1d773997cea6224641'
$checksumTypePackage = 'SHA512'

Import-Module -Name "$($toolsDir)\helpers.ps1"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  checksum       = $checksumPackage
  checksumType   = $checksumTypePackage
  url            = 'https://ccmdls.adobe.com/AdobeProducts/KCCC/1/win32/CreativeCloudSet-Up.exe'
  silentArgs     = '/quiet'
}

Install-ChocolateyPackage @packageArgs

if ($PackageParameters.RemoveDesktopIcons) {
    Remove-DesktopIcons -Name "Adobe Creative Cloud" -Desktop "Public"
}

if ($PackageParameters.NoAutostartHard) {
    Update-RegistryValue `
        -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run32" `
        -Name "Adobe Creative Cloud" `
        -Type Binary `
        -Value ([byte[]](0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00)) `
        -Message "Disable Adobe Creative Cloud Autostart"
}
