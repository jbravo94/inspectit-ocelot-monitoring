#!/bin/bash -e
(cd .. && sudo git clean -Xdf)
vagrant destroy
vboxmanage controlvm inspectit-ocelot poweroff || true
vboxmanage unregistervm inspectit-ocelot --delete || true
vagrant up
vagrant snapshot push
echo "Setup Finished"
