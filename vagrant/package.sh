#!/bin/bash -e
vagrant package --base inspectit-ocelot
sha512sum package.box
vagrant box add jhheinzl/inspectit-ocelot package.json
