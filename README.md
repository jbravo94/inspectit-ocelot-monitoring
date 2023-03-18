# inspectIT Ocelot Monitoring

## Preamble

Production-Ready preinstalled Virtual Machine with a Zero Configuration Java Agent.
Tested with a Spring Boot Application with MySQL.

## Advantages

* The inspectIT Ocelot agent uses Java byte-code manipulation to set up the OpenCensus instrumentation library with zero-configuration and requires no source-code changes
* OpenAPM Landscape Tools Used

## Setup

* Install Virtualbox 6.1.38 and Vagrant 2.3.4
* Run `vagrant up`
* Instrument your Spring Boot with the contents of `inspectit-ocelot/agent` directory as below:
`java -javaagent:/agent/inspectit-ocelot-agent.jar -Dinspectit.config.file-based.path=/agent/config -jar app.jar`

## Architecture

![Architecture](misc/Architecture.png?raw=true "Architecture")

This architecture excludes the visualization of the inspectIT Ocelot EUM capabilities.

## Open TODOs:

* Fix influxdb auto bootstrap
* Autosetup Kibana and Chronograf dashboards
