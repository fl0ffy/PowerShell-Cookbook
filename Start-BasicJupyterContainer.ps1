<# Script to start jupyter container and open jupyter in browser

Use this command in Stream Deck with System:Open button
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -windowstyle hidden -file "this_script.ps1"

#>

$PORT = '8888'
$CONTAINER_NAME = 'Lab'
$CONTAINER = 'jupyter/minimal-notebook:latest'
$VOL_MOUNT_DIR = "C:\Users\$($env:UserName)\Desktop\jupyter-container-vol"
$VOL_MOUNT = '/home/jovyan'


Write-Output $VOL_MOUNT_DIR

#verify Docker is installed and running
if ( -not (docker -v) ) {
  Write-Output 'Docker is not running'
  exit
}

# If mount folder does not exist, create it
if ( !(test-path -PathType container $VOL_MOUNT_DIR) ) {
  New-Item -ItemType Directory -Path $VOL_MOUNT_DIR
  Write-Host "Folder Created successfully"
}


# pull the latest imageC:\Users\${env:UserName}\Desktop\jupyter-container-vol
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
  docker run -dit --name ${CONTAINER_NAME} -p ${PORT}:8888 --volume ${VOL_MOUNT_DIR}:${VOL_MOUNT}  ${CONTAINER}
  Start-sleep 1
}

Start-Sleep 10

# Open firefox to jupyter Notebook
$token = [regex]::Match((docker logs Lab) , 'token=([0-9a-f]+)').captures.groups[1].value
Write-Output "TOKEN = $($token)"


& Start-Process http://127.0.0.1:$($PORT)/?token=$($token)
#& 'C:\Program Files\Mozilla Firefox\firefox.exe' -new-window http://127.0.0.1:${PORT}/?token=${token}


#bring in Stop functionality from Stop-BasicJupyterContainer.ps1
