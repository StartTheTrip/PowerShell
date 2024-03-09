#Downloads all files from an HTTP directory
$outputdir = 'output'
$url = 'http://synthzone.com/midi/roland/jd990/ftp/'

# enable TLS 1.2 and TLS 1.1 protocols
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12, [Net.SecurityProtocolType]::Tls11

$WebResponse = Invoke-WebRequest -Uri $url
# get the list of links, skip the first one ("../") and download the files
$WebResponse.Links | Select-Object -ExpandProperty href -Skip 1 | ForEach-Object {
    Write-Host "Downloading file '$_'"
    $filePath = Join-Path -Path $outputdir -ChildPath $_
    $fileUrl  = $url
    Invoke-WebRequest -Uri $fileUrl -OutFile $filePath
}