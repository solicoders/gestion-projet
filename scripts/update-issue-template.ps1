# Update issue template from gestion-project repository to all
# labs

Get-ChildItem . -Filter * | 
Foreach-Object {
    # input
    $lab_full_path = $_.FullName
    $lab_name = $_.Name

    # Delete templates if exist
    $issue_template_path = $lab_full_path + "/.github/ISSUE_TEMPLATE"
    if (Test-Path $issue_template_path) {
        Write-Host $issue_template_path
    }
    
  

    # Copy files
    # copy-Item -Path .\gestion-projet\.github\ISSUE_TEMPLATE\ -Destination .\lab-powershell\.github -Recurse


    # cd $FullName
    # git add .
    # git commit -m "save"
    # git push
}