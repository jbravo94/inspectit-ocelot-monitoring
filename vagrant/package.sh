#!/bin/bash -e
vagrant package --base inspectit-ocelot
vagrant box add jhheinzl/inspectit-ocelot package.json
