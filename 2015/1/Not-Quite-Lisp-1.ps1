[CmdletBinding()]

$steps = (Get-Content input.txt).toCharArray()
$floor = 0
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
}
$floor