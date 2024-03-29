
<!-- TABLE OF CONTENTS -->

## About the Project
This project is to aggregate PowerShell scripts that I create to help run my daily workflows on Windows computers.

</br>

## About the Scripts
</br>  

### **Start-BasicJupyterContainer.ps1**  
  
This script uses Docker to start a container named `Lab` using the latest `jupyter/minimal-notebook` image from DockerHub. Once the container is started the notebook will open in the default browser. This script can be run multiple times regardless of the status of the `Lab` container and will not clobber a container if it already exists in any condition. To enable persistenct, a volume will be mounted to the container from a folder on the users desktop named `jupyter-container-vol`. (Note: if the folder does not exist, this script will create it)

</br>  

### **Stop-BasicJupyterContainer.ps1**  
  
This script will stop and delete containers named `Lab` as the complement to the `Start-BasicJupyterContainer.ps1` mentioned above.

</br>  

### **Volume mount**

This script currently creates a folder on the users Desktop and mounts for persistence of notebooks and files and mounts it to the home directory of the container.

## Todo
- [ ] combine Start-BasicJupyterContainer.ps1 and Stop-BasicJupyterContainer.ps1
- [X] Add persistent storage for notebooks
- [ ] Add Setup instructions for StreamDeck
- [ ] Maybe add some working indicator

</br>

---
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch ( `git checkout -b feature/AmazingFeature` )
3. Commit your Changes ( `git commit -m 'Add some AmazingFeature'` )
4. Push to the Branch ( `git push origin feature/AmazingFeature` )
5. Open a Pull Request
