printf "Start of Script File \n" > DotfilesLog.txt

printf 'PWD= '$PWD \n >> DotfilesLog.txt

printf 'DOGVAR= '$DOGVAR \n>> DotfilesLog.txt

printf 'Local Workspace = ' $localWorkspaceFolder \n >> DotfilesLog.txt
printf 'Container Workspace = ' $containerWorkspaceFolder \n >> DotfilesLog.txt 


## copy git files to Codespace Project Home directory
##  cp ~/dotfiles/.gitignore $PWD
##  cp ~/dotfiles/.gitconfig $PWD


## Update to the latest PowerShell
curl -sSL https://raw.githubusercontent.com/PowerShell/PowerShell/master/tools/install-powershell.sh | bash

pwsh cmdprmt.ps1

mkdir -p /root/.config/powershell/ && cp ~/dotfiles/myprofile.ps1 /root/.config/powershell/Microsoft.PowerShell_profile.ps1

printf "Start of bash powerline \n" >> DotfilesLog.txt 

cd ~
wget https://golang.org/dl/go1.15.2.linux-amd64.tar.gz
tar xvf go1.15.2.linux-amd64.tar.gz
mv go /usr/local
mkdir go

rm go1.15.2.linux-amd64.tar.gz

printf "wget, tar, etc  complete \n" >> DotfilesLog.txt 
	
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH 

printf 'GOROOT = ' $GOROOT \n" >> DotfilesLog.txt 
printf 'GOPATH = ' $GOPATH \n" >> DotfilesLog.txt 
printf 'PATH = ' $PATH \n" >> DotfilesLog.txt 

printf "export complete  \n" >> DotfilesLog.txt 

cd ~
go get -u github.com/justjanne/powerline-go

printf "powerline complete  \n" >> DotfilesLog.txt 

echo 'function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -error $?)"
}
if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi' >>/root/.bashrc


printf "bashrc complete  \n" >> DotfilesLog.txt 

printf "End of Script File \n" >> DotfilesLog.txt
