#!/bin/bash
# Software Engineering Principles Project Script

#sudo installer -verbose -pkg ../dependencies/vagrant.pkg -target /
cd ..
vagrant up
vagrant ssh -c "/vagrant/scripts/installLampStack.sh"
vagrant ssh
