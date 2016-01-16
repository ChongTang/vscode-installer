#!/bin/bash
echo "Thank you for using this installer to install Visual Studio Code!"

home_path=`echo $HOME`
# default install path
default_path="$home_path/.local/share/visual-studio-code"
input_path=""
# ask the user to input path
read -p "Install path [$default_path]: " input_path
if [ -z "input_path" ]
then
  input_path=$default_path
fi
echo "Install to $input_path"
mkdir -p $input_path

echo "Download the installation package now..."
# download the package to installation folder
wget https://github.com/ChongTang/vscode-installer/raw/master/package/VSCode-linux64.zip -O VSCode.zip
unzip VSCode.zip -d $input_path

# create a desktop file
desktop_entry=$'[Desktop Entry]\nType=Application\nEncoding=UTF-8\nName=Visual Studio Code\nComment=Visual Studio Code IDE\nExec=$desktop_entry$input_path/VSCode-linux-x64/Code\nIcon=$desktop_entry$input_path/VSCode-linux-x64/resources/app/resources/linux/vscode.png\nTerminal=false'

# store desktop file in to local applications folder
echo "$desktop_entry" > ~/.local/share/applications/VSCode.desktop
echo "Installation finished. Enjoy!'
