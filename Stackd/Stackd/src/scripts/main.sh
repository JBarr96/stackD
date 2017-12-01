#!/bin/bash
# Software Engineering Principles Project Script

pwd
cd ..
pwd
chmod -R 755 /scripts
cp -r ./src $1
cd $1
#./src/scripts/installVirtualBox.sh
./src/scripts/installVagrant.sh
echo DONE
