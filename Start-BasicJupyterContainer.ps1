<# Script to start jupyter container and open jupyter in browser

Use this command in Stream Deck with System:Open button
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -windowstyle hidden -file "this_script.ps1"

#>

$PORT = '8889'
$CONTAINER_NAME = 'Lab'
$CONTAINER = 'jupyter/minimal-notebook:latest'

#verify Docker is installed and running
if ( -not (docker -v) ) {
  Write-Output 'Docker is not running'
  exit
}

# pull the latest image
docker pull ${CONTAINER}

# prune images
docker image prune -f

# If container exists and not running start container  (split out for already running)
if ( (docker ps -a -f name=${CONTAINER_NAME} | Select-String -CaseSensitive ${CONTAINER_NAME}) ) {
  Write-Output 'Container already exists. Starting now...'
  docker start ${CONTAINER_NAME}
  Start-sleep 1
} else {
  # Else container does not exist start container
  Write-Output 'Container does not exsist! Creating now...'
  docker run -d --name ${CONTAINER_NAME} -p ${PORT}:8888 ${CONTAINER}
  Start-sleep 1
}

# Open firefox to jupyter Notebook
$token = [regex]::Match((docker exec -ti Lab sh -c 'jupyter notebook list' 2>&1) , 'token=([0-9a-f]+)').captures.groups[1].value
& 'C:\Program Files\Mozilla Firefox\firefox.exe' -new-window http://127.0.0.1:${PORT}/?token=${token}


#bring in Stop functionality from Stop-BasicJupyterContainer.ps1
