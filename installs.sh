
#Homebrew, mas-cli, brew cask: everything you need to install software on a mac
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && \
brew install mas && && \
brew tap caskroom/cask && \

#Oh-My-Zsh - Install first so that we can add plugins as we install other software
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \

#Activate any plugins you want for Oh-My-Zsh
#See https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins for available plugins
sed "s/plugins=.*/plugins=(git mvn brew sbt docker vagrant)/g" ~/.zshrc && \

#Various command line tools:
brew install ssh-copy-id && \
brew install tomcat7 && \
brew install tree && \
brew install liquibase && \

#TODO: Set liquibase home to whatever it says after the brew installation
#See: https://github.com/nvbn/thefuck
brew install thefuck && \
echo 'eval "$(thefuck --alias)"' >> ~/.zshrc && \

#Java
brew cask install java && \

#Install maven and set the JVM memory settings for it
brew tap homebrew/versions && \
brew install maven32 && \
touch ~/.mavenrc && \
echo 'export MAVEN_DEBUG_OPTS="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8000"' >> ~/.mavenrc && \
echo 'export MAVEN_OPTS="-Xms1024m -Xmx2048m -noverify -XX:MaxMetaspaceSize=760m"' >> ~/.mavenrc && \

#Scala
brew install scala && \
brew install sbt && \

#Various desktop apps
brew cask install slack && \
brew cask install caffeine && \
brew cask install vagrant && \
brew cask install vagrant-manager && \
brew cask install iterm2 && \
brew cask install macvim && \
brew cask install visual-studio-code && \
brew cask install sublime-text && \
brew cask install google-chrome && \
brew cask install google-drive && \
brew cask install google-hangouts && \
brew cask install thunderbird && \
brew cask install visualvm && \
brew cask install postman && \

#Docker toolbox: (docker, docker-machine, virtualbox, kitematic)
#Ensure that the docker VM runs when you run your terminal
brew cask install dockertoolbox && \
docker-machine create --driver "virtualbox" --virtualbox-memory "8192" --virtualbox-cpu-count "8" --virtualbox-disk-size "60000" default && \
docker-machine env default && \
echo 'eval $(docker-machine env default)' >> ~/.zshrc && \

#IDE
brew cask install intellij-idea && \

#Ansible
brew install python && \
pip install ansible && \

#NodeJS stuff
brew install node && \
npm install gulp -g && \
npm -g install eslint && \

#MySql driver
brew tap gbeine/homebrew-java && \
brew install mysql-connector-java && \

#MySQL Client
brew cask install sequel-pro
