#!/usr/bin/env bash

#Homebrew, mas-cli, brew cask: everything you need to install software on a mac
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && \
# brew install mas && && \ #Not currently used in the script
brew tap caskroom/cask && \

#Oh-My-Zsh - Install first so that we can add plugins as we install other software
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
#Alternative: https://github.com/sorin-ionescu/prezto this script assumes oh-my-zsh though, you might want to create a pretzo version

#Activate any plugins you want for Oh-My-Zsh
#See https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins for available plugins
sed "s/plugins=.*/plugins=(git mvn brew sbt docker docker-compose vagrant)/g" ~/.zshrc && \

#Various command line tools:
brew install ssh-copy-id && \
brew install tomcat7 && \
brew install tree && \
brew install liquibase && \
#TODO: Set liquibase home to whatever it says after the brew installation

#See: https://github.com/nvbn/thefuck
brew install thefuck && \
echo 'eval "$(thefuck --alias)"' >> ~/.zshrc && \

#Java -> NB! this will install the latst version, while you might want to use 1.8.0_20 to build the main AppDirect repo
brew cask install java && \

#Install maven and set the JVM memory settings for it
# In case you need an older version of maven...Most likely not
# brew tap homebrew/versions && \
# brew install maven32 && \
brew install maven && \
touch ~/.mavenrc && \
echo 'export MAVEN_DEBUG_OPTS="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8000"' >> ~/.mavenrc && \
echo 'export MAVEN_OPTS="-Xms1024m -Xmx2048m -noverify -XX:MaxMetaspaceSize=760m"' >> ~/.mavenrc && \

#Scala
brew install scala && \
brew install sbt && \
brew install giter8 && \

#Various desktop apps
brew cask install slack && \
brew cask install caffeine && \
brew cask install vagrant && \
brew cask install vagrant-manager && \
brew cask install iterm2 && \
brew cask install visual-studio-code && \
brew cask install sublime-text && \
brew cask install google-chrome && \
brew cask install lastpass && \
brew cask install google-drive && \
brew cask install google-hangouts && \
brew cask install visualvm && \
brew cask install spectacle && \
brew cask install bettertouchtool && \
brew cask install archiver && \
brew cask install jing && \
brew cask install gitter &&\
brew cask install docker && \

#My alias for docker-compose, careful overrides some unix tool also named 'dc'
echo 'alias dc="docker-compose"' >> ~/.zshrc && \
echo 'alias docker_clean_images="docker rmi $(docker images -a --filter=dangling=true -q)"'
echo 'alias docker_clean_ps="docker rm $(docker ps --filter=status=exited --filter=status=created -q)"'
#alias dps='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}" -a'
#IDE
brew cask install intellij-idea && \

#Openconnect: Install only if using it
#brew install openconnect && \

#Example for creating an alias for a particular VPN, so you can quickly connect
#alias my_vpn_alias="sudo openconnect --authgroup=[authgroup-goes-here] --user=[username-goes-here] [VPN-to-connect to]"

#Install Python
brew install python && \
pip install --upgrade pip && \
pip install httplib2 && \
pip install requests && \
pip install requests_oauthlib && \

#Ansible
pip install ansible && \

#NodeJS stuff
brew install node && \
npm install gulp -g && \
npm -g install eslint && \

#MySql driver
brew tap gbeine/homebrew-java && \
brew install mysql-connector-java && \

#MySQL DB client
brew cask install sequel-pro && \

# GitHub goodies" https://hub.github.com/
brew install hub && \
echo 'eval "$(hub alias -s)"' >> ~/.zshrc


