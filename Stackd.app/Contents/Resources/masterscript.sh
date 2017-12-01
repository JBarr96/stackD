#!/bin/bash
# Software Engineering Principles Project Script

PATH="/usr/local/bin:$PATH"
brew cask install virtualbox
brew cask install vagrant
cd $1
vagrant box add ubuntu/trusty64
vagrant init ubuntu/trusty64
vagrant up
vagrant ssh -c "sudo apt-get -y update"
vagrant ssh -c "sudo apt-get install -y lamp-server^"
osascript -e "tell application \"Terminal\" to do script \"cd $1; vagrant ssh\""
