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

nvm use 14.17.5
npm install -g yarn

#python 
choco install miniconda3 --yes --params '/AddToPath:1'
Update-Environment-Path

conda config --set env_prompt '({name}) '


## Hyper-V required for docker and other things
Enable-WindowsOptionalFeature -Online -FeatureName:Microsoft-Hyper-V -All -NoRestart
choco install docker-desktop --yes

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

Write-Output "Finished! Run `choco upgrade all` to get the latest software"
