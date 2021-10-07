
function Get-FzfLocation {
    param(
        [Parameter(Mandatory = $false)] [string] $Filter = "",
        [Parameter(Mandatory = $false)] [string] $Path = ".",
        [Parameter(Mandatory = $false)] [int] $Depth = 10,
        [switch] $Directory
    )

    Get-ChildItem -Recurse -Directory:$Directory -Path $Path -Filter $Filter -Depth $Depth |
     Select-Object FullName -ExpandProperty FullName |
      fzf
}

function Set-FzfLocation {
    param(
        [Parameter(Mandatory = $false)] [string] $Filter = "",
        [Parameter(Mandatory = $false)] [string] $Path = ".",
        [Parameter(Mandatory = $false)] [int] $Depth = 10,
        [switch] $Directory
    )

    Get-FzfLocation -Directory:$Directory -Filter $Filter -Depth $Depth | Set-Location
}

Set-Alias -Name cd-fzf -Value Set-FzfLocation