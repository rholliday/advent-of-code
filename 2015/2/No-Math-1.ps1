[CmdletBinding()]

$list = Get-Content input.txt
$total = 0
foreach($present in $list)
{
    [int[]]$dimensions = $present -split 'x'
    #2*l*w + 2*w*h + 2*h*l
    $area = ((2 * ($dimensions[0] * $dimensions[1])) + (2 * ($dimensions[1] * $dimensions[2])) + (2 * ($dimensions[2] * $dimensions[0])))
    $dimensions = $dimensions | Sort-Object
    $extra = $dimensions[0] * $dimensions[1]
    $total += $area + $extra
}
$total