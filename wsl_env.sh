wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.11.0-Linux-x86_64.sh
bash Miniconda3-py39_4.11.0-Linux-x86_64.sh
source ~/.bashrc
conda config --set env_prompt '({name}) '

bash ./vscode_extensions.sh

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc

nvm install 16.14.1

source ~/.bashrc
npm install -g azure-functions-core-tools@3 --unsafe-perm true
