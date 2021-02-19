[CmdletBinding()]
param()

function Get-Hash($someString)
{
    # https://gist.github.com/dalton-cole/4b9b77db108c554999eb
    $md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
    $utf8 = New-Object -TypeName System.Text.UTF8Encoding
    $hash = [System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($someString)))
    return $hash.ToLower() -replace '-', ''
}

$key = "bgvyzdsv"
$zerocount = 6

$match = $false
$answer = ""
$i = 1
while(!$match)
{
    $test_hash = Get-Hash "$($key)$($i)"
    if($test_hash.SubString(0,$zerocount) -eq "".PadLeft($zerocount,'0'))
    {
        $match = $true
        $answer = $i
    }
    $i++
}
$answer