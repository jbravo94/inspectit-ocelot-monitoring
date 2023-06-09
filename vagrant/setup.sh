#!/bin/bash -e
sudo git clean -Xdf
vagrant destroy
vboxmanage controlvm inspectit-ocelot poweroff || true
vboxmanage unregistervm inspectit-ocelot --delete
vagrant up
vagrant snapshot push
echo "Setup Finished"
