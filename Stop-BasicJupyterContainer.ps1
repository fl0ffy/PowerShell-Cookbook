# Script to stop jupyter container and open jupyter in browser


# Add in 'are you sure prompt' before continuing with script
# also, note that if no the toggle will have changed on stream deck
#   if no how do i go back and change the toggle switch on stream deck?

$CONTAINER_NAME = 'Lab'

# Stop container
docker stop ${CONTAINER_NAME}
Start-sleep 1

# Delete container
docker rm ${CONTAINER_NAME}

# get rid of dead/stopped containers
#docker container prune --force

# Find and kill firefox tab associated  (maybe save pid in temp file in start script)
# taskkill PID xxxxx /F
