[CmdletBinding()]

$list = (Get-Content input.txt).toCharArray()
$houses = @()
$current_santa = "0,0"
$current_robo = "0,0"
$houses += "0,0"
# for $i +2 ?
for($i = 0; $i -lt $list.count; $i += 2)
{
    [int[]]$coords_santa = $current_santa -split ','
    # Could make this part into a function called twice.
    switch($list[$i])
    {
        "<" { $coords_santa[0]-- }
        ">" { $coords_santa[0]++ }
        "^" { $coords_santa[1]++ }
        "v" { $coords_santa[1]-- }
    }
    $new_loc_santa = $coords_santa -join ','
    if($houses -notcontains  $new_loc_santa)
    {
        $houses += $new_loc_santa
    }
    $current_santa = $new_loc_santa

    [int[]]$coords_robo = $current_robo -split ','
    switch($list[$i+1])
    {
        "<" { $coords_robo[0]-- }
        ">" { $coords_robo[0]++ }
        "^" { $coords_robo[1]++ }
        "v" { $coords_robo[1]-- }
    }
    $new_loc_robo = $coords_robo -join ','
    if($houses -notcontains  $new_loc_robo)
    {
        $houses += $new_loc_robo
    }
    $current_robo = $new_loc_robo
}
$houses.count