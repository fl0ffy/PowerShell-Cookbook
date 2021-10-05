
<!-- TABLE OF CONTENTS -->

## About the Project
This project is to aggregate PowerShell scripts that I create to help run my daily workflows on Windows computers.

</br>

## About the Scripts
</br>  

### **Start-BasicJupyterContainer.ps1**  
  
This script uses Docker to start a container named `Lab` using the latest `jupyter/minimal-notebook` image from DockerHub. Once the container is started a new firefox window will open the notebook. This script can be run multiple times regardless of the status of the `Lab` container and will not clobber a container if it already exists in any condition.

</br>  

### **Stop-BasicJupyterContainer.ps1**  
  
This script will stop and delete containers named `Lab` as the complement to the `Start-BasicJupyterContainer.ps1` mentioned above.

</br>  

## Todo
- [ ] combine Start-BasicJupyterContainer.ps1 and Stop-BasicJupyterContainer.ps1
- [ ] Add persistent storage for notebooks
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
