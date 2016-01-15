echo 'Thank you for using this installer!'
home_path=`echo $HOME`
default_path="$home_path/.local/share/visual-studio-code"
input_path=""
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

# download the package to installation folder
wget 'https://github.com/ChongTang/vscode-installer/raw/master/package/VSCode-linux64.zip' -O VSCode.zip
unzip VSCode.zip -d $input_path
# create a desktop file
