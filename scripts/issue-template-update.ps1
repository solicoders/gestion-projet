# Update issue template from lab-starter repository to all labs

function confirm_to_continue($message) {
    $title    = $message 
    $question = "Are you sure you want to proceed?"
    $choices  = '&Yes', '&No'
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
    if ($decision -eq 1) {
        exit
    } 
}

# Emplacement des labs 
$labs_web_path = $PSScriptRoot + "/../../"
$lab_starter_issue_template_path = $labs_web_path + "lab-starter/.github/ISSUE_TEMPLATE/"
cd $labs_web_path


$labs_web = Get-ChildItem . -Filter * 

foreach($lab_web in $labs_web){

    $lab_web_name = $lab_web.Name
    $lab_web_full_name =$lab_web.FullName 

    # Ne pas toucher les template de lab-starter
    if($lab_web.Name -eq "gestion-projet"){continue}

    Write-Host "Modifier les template de $lab_web_name"
    # confirm_to_continue("Modifier les template de $lab_web_name")

    # Delete templates if exist
    $issue_template_path = $lab_web_full_name + "/.github/ISSUE_TEMPLATE"


    if (Test-Path $issue_template_path) {
        Write-Host "Delete : $issue_template_path "
        rm $issue_template_path -r -force
    }

    # Create .github folder if not exist 
    if (-not(Test-Path ($lab_web_full_name + "/.github"))) {
        mkdir ($lab_web_full_name + "/.github")
    }
    if (-not(Test-Path ($lab_web_full_name + "/.github/ISSUE_TEMPLATE"))) {
        mkdir ($lab_web_full_name + "/.github/ISSUE_TEMPLATE")
    }

    # # Copy files
    copy-Item -Path ($labs_web_path + "gestion-projet/.github/ISSUE_TEMPLATE/*") -Destination ($lab_web_full_name + "/.github/ISSUE_TEMPLATE/")

}

