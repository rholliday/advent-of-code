[CmdletBinding()]

$list = (Get-Content input.txt).toCharArray()
$script:houses = @()
$current_santa = "0,0"
$current_robo = "0,0"
$script:houses += "0,0"

function move_santa($loc,$move)
{
    [int[]]$coords = $loc -split ','
    switch($move)
    {
        "<" { $coords[0]-- }
        ">" { $coords[0]++ }
        "^" { $coords[1]++ }
        "v" { $coords[1]-- }
    }
    $new_loc = $coords -join ','
    if($script:houses -notcontains $new_loc)
    {
        $script:houses += $new_loc
    }
    return $new_loc
}

for($i = 0; $i -lt $list.count; $i += 2)
{
    $current_santa = move_santa $current_santa $list[$i]
    $current_robo = move_santa $current_robo $list[$i+1]
}
$script:houses.count