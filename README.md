# inspectIT Ocelot Monitoring

## Preamble

Production-Ready preinstalled Virtual Machine with a Zero Configuration Java Agent.
Tested with a Spring Boot Application with MySQL.

## Advantages

* The inspectIT Ocelot agent uses Java byte-code manipulation to set up the OpenCensus instrumentation library with zero-configuration and requires no source-code changes
* Using mature OpenAPM and CNCF components

## Setup

* Install Virtualbox 6.1.38 and Vagrant 2.3.4
* Run `vagrant up`
* Instrument your Spring Boot with the contents of `inspectit-ocelot/agent` directory as below:
`java -javaagent:/agent/inspectit-ocelot-agent.jar -Dinspectit.config.file-based.path=/agent/config -jar app.jar`

## Architecture

![Architecture](misc/Architecture.png?raw=true "Architecture")

This architecture excludes the visualization of the inspectIT Ocelot EUM capabilities.

## Self-Signed Certificate Generation

* Following command generates a certificate which is valid for 25 years with default parameters:\
```openssl req -x509 -nodes -days 9125 -newkey rsa:4096 -keyout key.pem -out cert.pem -subj "/C=/ST=/L=/O=/CN=inspectit-ocelot" -addext "subjectAltName = DNS:inspectit-ocelot"```

* Add certificate to cacerts in application jre where agent is used:\
```keytool -delete -keystore cacerts -alias "inspectit-ocelot" -storepass changeit -noprompt```
```keytool -import -file cert.pem -keystore cacerts -alias "inspectit-ocelot" -storepass changeit -noprompt```

## Packaging

* Run `cd vagrant && ./setup.sh`
* Package with `./package.sh`

## Agent logging

`/tmp/inspectit-ocelot/agent.log`

## Open TODOs:

* Fix influxdb auto bootstrap
* Autosetup Kibana and Chronograf dashboards
