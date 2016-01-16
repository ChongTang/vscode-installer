# Visual Studio Code Installer
This bash script will install Visual Studio Code for you. In Linux, Visual Studio Code is released as a zip file. This installer will download the latest package, unzip to the installation path, and create a desktop entry for you.

# Install script
To install or update Visual Studio Code, you can use the install script using cURL:
```
curl -o- https://raw.githubusercontent.com/ChongTang/vscode-installer/master/installer.sh | bash
```
or Wget:
```
wget -qO- https://raw.githubusercontent.com/ChongTang/vscode-installer/master/installer.sh | bash
```
