[CmdletBinding()]

$list = (Get-Content input.txt).toCharArray()
$houses = @()
$current = "0,0"
$houses += $current
foreach($move in $list)
{
    [int[]]$coords = $current -split ','
    switch($move)
    {
        "<" { $coords[0]-- }
        ">" { $coords[0]++ }
        "^" { $coords[1]++ }
        "v" { $coords[1]-- }
    }
    $new_loc = $coords -join ','
    if($houses -notcontains  $new_loc)
    {
        $houses += $new_loc
    }
    $current = $new_loc
}
$houses.count