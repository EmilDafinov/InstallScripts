# https://github.com/Eriner/zim
#fonts needed for zsh
# https://github.com/powerline/fonts

#Install zim
brew install zsh
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
##RESTART TERMINAL
exec zsh
git clone --recursive https://github.com/Eriner/zim.git ${ZDOTDIR:-${HOME}}/.zim

echo 'eval "$(hub alias -s)"' >> ~/.zshrc
echo 'alias dc="docker-compose"' >> ~/.zshrc
echo 'eval "$(thefuck --alias)"' >> ~/.zshrc

#Needed for zsh completions
echo 'fpath=(~/.zsh/completion $fpath)' >> ~/.zshrc
echo 'autoload -Uz compinit && compinit -i' >> ~/.zshrc
mkdir -p ~/.zsh/completion

#Zsh completion for docker
curl -fLo ~/.zsh/completion/_docker https://raw.githubusercontent.com/docker/docker/master/contrib/completion/zsh/_docker

#Zsh completion for docker-compose
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose

#Hides username/machine when you are logged as yourself
export DEFAULT_USER=`whoami`