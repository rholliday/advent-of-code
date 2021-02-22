[CmdletBinding()]

$list = Get-Content input.txt

$vowels = 'a', 'e', 'i', 'o', 'u'
$naughties = 'ab', 'cd', 'pq', 'xy'
$nice_strings = 0
foreach($string in $list)
{
    $nice = $true
    $vowel_count = 0
    $double_letter = $false
    for($i = 0; $i -lt $string.length; $i++)
    {
        if($vowels -contains $string.SubString($i,1))
        {
            $vowel_count++
        }
        # Have to prevent out of range errors.
        if(($i + 1) -eq $string.length)
        {
            break
        }
        if($naughties -contains $string.SubString($i,2))
        {
            $nice = $false
            break
        }
        if($string.SubString($i,1) -eq $string.SubString($i+1,1))
        {
            $double_letter = $true
        }
    }
    if($vowel_count -lt 3 -or !$double_letter)
    {
        $nice = $false
    }
    if($nice)
    {
        $nice_strings++
    }
}
$nice_strings