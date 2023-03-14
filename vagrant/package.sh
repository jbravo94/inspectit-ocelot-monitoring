#!/bin/bash -e
vagrant package --base inspectit-ocelot
sha512sum package.box > package.crc
vagrant box add jhheinzl/inspectit-ocelot package.json
