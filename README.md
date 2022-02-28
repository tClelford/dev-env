# dev-env
Quickstart a windows dev environment using powershell.

## User guide
1. If you've got a vscode install on an existing machine, use the following powershell command to print them in the format needed for the installation script:
```powershell 
code --list-extensions | % { "code --install-extension $_" }
```
2. Paste your vscode extensions into `vscode_extensions.sh`. 
3. Check that `win_env.ps1` contains things you want. Remove things you don't want, add things you do.
4. Open an admin powershell terminal on the new machine.
5. You might need to bypass powershell's execution policy. The following will do so for the script
```powershell 
Unblock-File .\win_env.ps1
```
6. Run `win_env.ps1`
7. Put the kettle on
8. do the tidy-up. Things like:
    - Setting the SQL sa password to something sensible
    - Setting up your WSL user
    - add your newly-generated ssh key to your github account. This command will copy your newly-created public key to the clipboard
```powershell 
Get-Content $HOME\.ssh\id_rsa.pub | Set-Clipboard
```

 
