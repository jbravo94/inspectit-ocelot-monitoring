#!/bin/bash
vagrant package --base inspectit-ocelot
vagrant box add jhheinzl/inspectit-ocelot package.json
