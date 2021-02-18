[CmdletBinding()]

$steps = (Get-Content input.txt).toCharArray()
$floor = 0
$char_count = 1
foreach($step in $steps)
{
    if($step -eq '(')
    {
        $floor++
    } elseif($step -eq ')') {
        $floor--
    } else {
        Write-Error "Invalid step: $($step)"
    }
    if($floor -lt 0)
    {
        Write-Host "Entered basement at position $($char_count)"
        break
    }
    $char_count++
}