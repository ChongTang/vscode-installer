#!/bin/bash
echo 'Thank you for using this installer to install Visual Studio Code!'

home_path=`echo $HOME`
# default install path
default_path="$home_path/.local/share/visual-studio-code"
input_path=""
# ask the user to input path
while true
do
  read -p "Install path [$default_path]: " input_path
  if [[ ${#input_path} == 0 ]]
  then
    input_path=$default_path
  fi
  mkdir -p $input_path
  # get the return code of mkdir command
  rc=$?
  if [[ $rc == 0 ]]
  then
    break
  fi
  echo 'Error: The input path is not a valid path...'
done
echo $'Install to $input_path.\nDownload the installation package now...'
# download the package to installation folder
wget 'https://github.com/ChongTang/vscode-installer/raw/master/package/VSCode-linux64.zip' -O VSCode.zip
unzip VSCode.zip -d $input_path

# create a desktop file
desktop_entry=$'[Desktop Entry]\nType=Application\nEncoding=UTF-8\nName=Visual Studio Code\nComment=Visual Studio Code IDE\nExec=$desktop_entry$input_path/VSCode-linux-x64/Code\nIcon=$desktop_entry$input_path/VSCode-linux-x64/resources/app/resources/linux/vscode.png\nTerminal=false'

# store desktop file in to local applications folder
echo "$desktop_entry" > ~/.local/share/applications/VSCode.desktop
echo "Installation finished. Enjoy!'
