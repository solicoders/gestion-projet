
Get-ChildItem . -Filter * | 
Foreach-Object {
    # input
    $FullName = $_.FullName
    $File_Name = $_.Name

    Write-Host $FullName

    cd $FullName
    git add .
    git commit -m "save"
    git push

    # run_toppt($File_Name)
}