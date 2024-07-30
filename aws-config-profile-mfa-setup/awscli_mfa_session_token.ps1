# Updates MFA Session token
# need to set MY_AUTHENTICATION_NAME and DEFAULT_PROFILE (if not using default)

if ($args[0] -eq $null) {
  Write-Output "USAGE: $($MyInvocation.MyCommand.Name) <MAF code>"
  exit 1
}


$MY_AUTHENTICATOR_NAME = "<INSERT MFA IDENTITY>"
$DEFAULT_PROFILE = "default"
$DEFAULT_ACCOUNT = "<INSERT AWS ACCOUNT NUMBER>"
$ARN_MFA = "arn:aws:iam::$($DEFAULT_ACCOUNT):mfa/$($MY_AUTHENTICATOR_NAME)"
$TOKEN_DURATION = 86400 #24 hours
$MFA_SOURCE_PROFILE = "<INSERT AWS CONFIG PROFILE NAME FOR MFA SESSION>"


# Get session credentials
$AWS_SESSION_TOKEN = $(aws sts get-session-token --duration-seconds $TOKEN_DURATION --serial-number $ARN_MFA --token-code $args[0] --profile $DEFAULT_PROFILE --output text)

#setup awscli profile 
aws configure set --profile $MFA_SOURCE_PROFILE region us-east-1
aws configure set --profile $MFA_SOURCE_PROFILE output json
aws configure set --profile $MFA_SOURCE_PROFILE aws_access_key_id $(($AWS_SESSION_TOKEN -Split '\s+')[1])
aws configure set --profile $MFA_SOURCE_PROFILE aws_secret_access_key $(($AWS_SESSION_TOKEN -Split '\s+')[3])
aws configure set --profile $MFA_SOURCE_PROFILE aws_session_token $(($AWS_SESSION_TOKEN -Split '\s+')[4])
