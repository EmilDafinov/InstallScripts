
#Homebrew, mas-cli, brew cask: everything you need to install software on a mac
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install mas
brew tap caskroom/cask

#Oh-My-Zsh - Install first so that we can add plugins as we install other software
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#TODO: Install oh-my-zsh plugin for brew

#Various command line tools:
brew install ssh-copy-id

#Install and activate thefuck
brew install thefuck
echo 'eval "$(thefuck --alias)"' >> ~/.zshrc

#Java
brew cask install java

#Install maven and set the JVM memory settings for it
brew install homebrew/versions/maven32
touch ~/.mavenrc
echo 'export MAVEN_DEBUG_OPTS="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8000"' >> ~/.mavenrc
echo 'export MAVEN_OPTS="-Xms1024m -Xmx2048m -noverify -XX:MaxMetaspaceSize=760m"' >> ~/.mavenrc
#TODO: Install plugin mvn: setup in .zshrc

#Scala
brew install scala
brew install sbt

brew cask install slack
brew cask install caffeine
brew cask install vagrant
brew cask install iterm2
brew cask install macvim

#Text editors
brew cask install visual-studio-code
brew cask install sublime-text

#Docker toolbox: (docker, docker-machine, virtualbox, kitematic)
brew cask install dockertoolbox
echo 'eval $(docker-machine env default)' >> ~/.zshrc
#TODO: Zsh plugin 'docker'

#Google stuff
brew cask install google-chrome
brew cask install google-drive

#IDE
brew cask install intellij-idea

#Ansible
brew install python
pip install ansible

brew install node
npm install gulp -g
npm -g install eslint
