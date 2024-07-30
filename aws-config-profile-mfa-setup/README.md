### AWS CLI Profile and MFA Session Token setup

The following scripts and text file can be used to setup AWS CLI profiles to interact (switch roles) using awscli in either Linux or Windows. These scripts utilize the awscli command to configure profiles and do not interact directly with the .aws/config or .aws/credentials files and is therefore non-destructive to already existing configurations (unless a matching profile exists).

##### For Windows
- **awscli_env_profile_setup.ps1**
- **awscli_mfa_session_token.ps1**
- **accounts.txt**

#### Assumtions
These scripts assume that there is at least an initial profile setup with the credentials provided when AWS account created. However, they do not assume that those credentials are configured as the default profile.

#### Usage
The **awscli_env_profile_setup** script only needs to be run to initially setup the profiles for all the environments listed in the **accounts.txt** and can be run again if new accounts are added. The **awscli_mfa_session_token** script sets up the reference profile and uses MFA to retrireve and configure a session token (currently the scirpt defaults to 24 hours) and can be run daily.

The input file for **awscli_env_profile_setup** (accounts.txt), should contain a newline delimited list of account alias and number formatted as `alias:account_number`.

##### Variables
| Variable | Script | Default Value |
| --- | --- | --- |
| REGION | awscli_env_profile_setup | us-east-1 |
| OUTPUT_FORMAT | awscli_env_profile_setup | json |
| ROLE | awscli_env_profile_setup |  |
| MY_AUTHENTICATOR_NAME | awscli_mfa_session_token | |
| DEFAULT_PROFILE | awscli_mfa_session_token | default |
| DEFAULT_ACCOUNT | awscli_mfa_session_token |  |
| ARN_MFA | awscli_mfa_session_token | json |
| TOKEN_DURATION | awscli_mfa_session_token | 86400 |

MY_AUTHENTICATOR_NAME can be found either on your MFA device listed as account name (everything before `@`) or in AWS Console under your account security credentials in the MFA section under identifier (everything after `...:mfa/`).

##### Powershell
```powershell
./awscli_env_profile_setup.ps1 accounts.txt

awscli_mfa_session_token.ps1 $($MFA_Code)
```


---

