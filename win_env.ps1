function Update-Environment-Path {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}

function Push-User-Path($userPath) {
    $path = [Environment]::GetEnvironmentVariable('Path', 'User')
    $newpath = "$userPath;$path"
    [Environment]::SetEnvironmentVariable("Path", $newpath, 'User')
    Update-Environment-Path
}

#install chocolately
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-WebRequest https://community.chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
Update-Environment-Path


# add git
choco install git --yes --params '/GitAndUnixToolsOnPath'
Update-Environment-Path

git config --global core.editor "code --wait"
git config --global init.defaultBranch main

choco install gitkraken --yes

#intellij
choco install intellijidea-community --yes

#SQL
choco install mssqlexpress2014sp1wt --yes --params '/SECURITYMODE=SQL /SAPWD=Changethispasswordwhenyourefinished123!'
choco install sql-server-management-studio --yes
Update-Environment-Path


#node 
choco install nvm --yes
Update-Environment-Path

nvm install 17.6.0

nvm use 17.6.0
Update-Environment-Path

npm install -g yarn

#python 
choco install miniconda3 --yes --params '/AddToPath:1'
Update-Environment-Path

conda config --set env_prompt '({name}) '


Update-Environment-Path

#
# VS Code
choco install visualstudiocode --yes # includes dotnet
Update-Environment-Path

#vs code extenstions
bash.exe vscode_extensions.sh

# Windows Terminal
choco install microsoft-windows-terminal --yes

# File Management
choco install 7zip --yes
choco install vlc --yes

# Browsers
choco install googlechrome --yes

Update-Environment-Path

# Windows Subsystem for Linux
wsl --install
wsl --install -d Ubuntu-18.04
wsl --set-default-version 2
Update-Environment-Path

choco install docker-desktop --yes

Write-Output "Finished! Run `choco upgrade all` to get the latest software"
Write-Output "Generating rsa"
ssh-keygen -t rsa
