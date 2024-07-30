# This script will setup awscli profiles for given list of environments (newline delimited in format profile_name:account_number)

if ($args[0] -eq $null) {
  Write-Output "USAGE: $($MyInvocation.MyCommand.Name) <accounts.txt>"
  exit 1
}


$REGION = "us-east-1"
$OUTPUT_FORMAT = "json"
$ROLE = "<INSERT ROLE NAME>"
$MFA_SOURCE_PROFILE = "<INSERT AWS CONFIG PROFILE NAME FOR MFA SESSION>"


foreach($account in Get-Content $args[0]) {
  $account_name,$account_number = $account.split(':')
  
  # Write-Output "Configuring $account_name with $account_number"
  aws configure set --profile $account_name region $REGION
  aws configure set --profile $account_name output $OUTPUT_FORMAT
  aws configure set --profile $account_name role_arn "arn:aws:iam::$($account_number):role/$($ROLE)"
  aws configure set --profile $account_name source_profile $MFA_SOURCE_PROFILE
}
