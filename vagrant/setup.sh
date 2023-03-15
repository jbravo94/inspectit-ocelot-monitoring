#!/bin/bash -e
vagrant up
vagrant snapshot push
echo "Setup Finished"
