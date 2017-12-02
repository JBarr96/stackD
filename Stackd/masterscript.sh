#!/bin/bash
# Software Engineering Principles Project Script

# Set initial path
PATH="/usr/local/bin:$PATH"

# Install virtualbox and vagrant using Homebrew package manager
brew cask install virtualbox
brew cask install vagrant

# Navigate to the location indicated by the first command line parameter
# In this case, $1 will be populated with the location the user wants to install to / have a handle on their stack
cd $1

# Creates a virtual linux machine (ubuntu), version trusty64
vagrant box add ubuntu/trusty64

# Initialize the virtual machine
vagrant init ubuntu/trusty64

# Launch the virtual machine
vagrant up

# Update linux APT (Advanced Package Tool) package lists
vagrant ssh -c "sudo apt-get -y update"

# Install the LAMP stack from the lamp-server repository
vagrant ssh -c "sudo apt-get install -y lamp-server^"

# Open a terminal window, navigate to the location the virtual box was installed at, and ssh into the box
osascript -e "tell application \"Terminal\" to do script \"cd $1; vagrant ssh\""

