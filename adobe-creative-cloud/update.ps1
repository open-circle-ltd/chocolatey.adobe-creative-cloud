import-module au

$url                 = 'https://helpx.adobe.com/creative-cloud/release-note/cc-release-notes.html'
$checksumTypePackage = "SHA512"
function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1'   = @{
            "(^\s*[$]*checksumPackage\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(^\s*[$]*checksumTypePackage\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
        }; 
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $url -UseBasicParsing -DisableKeepAlive

    $reLatestbuild = "(.*<p>Version.*)"
    $download_page.RawContent -imatch $reLatestbuild
    $latestbuild = $Matches[0]

    $reVersion = "\bv?[0-9]+\.[0-9]+\.[0-9]+(?:\.[0-9]+)(?:\.[0-9]+)?\b"
    $latestbuild -imatch $reVersion
    $version = $Matches[0]
  
    $urlPackage = "https://ccmdls.adobe.com/AdobeProducts/KCCC/1/win32/CreativeCloudSet-Up.exe"

    return @{ 
        URL32          = $urlPackage;
        ChecksumType32 = $checksumTypePackage;
        Version        = $version
    }
}

function global:au_AfterUpdate ($Package) {
    Set-DescriptionFromReadme $Package -SkipFirst 3
}
update -ChecksumFor all
