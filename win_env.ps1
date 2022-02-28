#install chocolately
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-WebRequest https://community.chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
refreshenv


# add git
choco install git --yes --params '/GitAndUnixToolsOnPath'
refreshenv

git config --global core.editor "code --wait"
git config --global init.defaultBranch main

choco install gitkraken --yes

#intellij
choco install intellijidea-community --yes

#SQL
choco install sql-server-express --yes --params '/SECURITYMODE=SQL /SAPWD=Changethispasswordwhenyourefinished123!'
choco install sql-server-management-studio --yes
refreshenv


#node 
choco install nvm --yes
refreshenv

nvm install 16
nvm use 16

#yarn
npm i -g corepack

#python 
choco install miniconda3 --yes --params '/AddToPath:1'
refreshenv

conda config --set env_prompt '({name}) '


refreshenv

#
# VS Code
choco install visualstudiocode --yes # includes dotnet
refreshenv

#vs code extenstions
bash.exe vscode_extensions.sh

#azure stuff
choco install azure-functions-core-tools --yes
refreshenv
choco install azure-cli --yes
refreshenv


# Windows Terminal
choco install microsoft-windows-terminal --yes

# File Management
choco install 7zip --yes
choco install vlc --yes

# Browsers
choco install googlechrome --yes
refreshenv

choco install slack --yes
choco install spotify --yes



choco install 



# Windows Subsystem for Linux
wsl --install
wsl --install -d Ubuntu-18.04
wsl --set-default-version 2
refreshenv

choco install docker-desktop --yes

Write-Output "Finished! Run `choco upgrade all` to get the latest software"
Write-Output "Generating rsa"
ssh-keygen -t rsa
