[CmdletBinding()]

$list = Get-Content input.txt
$total = 0
foreach($present in $list)
{
    [int[]]$dimensions = $present -split 'x'
    [int[]]$sides = (2 * ($dimensions[0] + $dimensions[1])), (2 * ($dimensions[0] + $dimensions[2])), (2 * ($dimensions[1] + $dimensions[2])) | Sort-Object
    $ribbon = $dimensions[0] * $dimensions[1] * $dimensions[2]
    $total += $sides[0] + $ribbon
}
$total