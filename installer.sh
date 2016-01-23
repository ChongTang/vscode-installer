#!/bin/bash

echo "Thank you for using this installer to install Visual Studio Code!"

home_path=$HOME
# default install path
input_path="$home_path/.local/share/visual-studio-code"
mkdir -p "$input_path"
rm -rf "$input_path/VSCode-linux-x64"

printf "Download the installation package now...\n"
# download the package to installation folder
wget https://github.com/ChongTang/vscode-installer/raw/master/package/VSCode-linux64.zip -O VSCode.zip
unzip -qq VSCode.zip -d "$input_path"

# create a desktop file
desktop_entry="[Desktop Entry]\nName=Visual Studio Code\nComment=Visual Studio focused on modern web and cloud\nType=Application\nCategories=Development;\nEncoding=UTF-8\nExec=$desktop_entry$input_path/VSCode-linux-x64/Code\nIcon=$desktop_entry$input_path/VSCode-linux-x64/resources/app/resources/linux/vscode.png\nTerminal=false"

# create applications folder in case there is no one
mkdir -p ~/.local/share/applications
# store desktop file in to local applications folder
echo -e "$desktop_entry" > ~/.local/share/applications/visual-studio-code.desktop
# add executable bit
chmod +x ~/.local/share/applications/visual-studio-code.desktop
# delete downloaded file
rm -rf VSCode.zip
echo "Installation finished. Enjoy!"
