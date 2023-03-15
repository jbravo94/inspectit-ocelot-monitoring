# inspectIT Ocelot Monitoring

Preinstalled Virtual Machine tested with a Spring Boot Application with MySQL

* Install Virtualbox 6.1.38 and Vagrant 2.3.4
* Run `vagrant up`
* Instrument your Spring Boot with following environment variables like this:

`java -javaagent:/agent/inspectit-ocelot-agent.jar -jar app.jar`

```
INSPECTIT_CONFIG_HTTP_URL: http://localhost:8090/api/v1/agent/configuration
INSPECTIT_SERVICE_NAME: demo-service
INSPECTIT_EXPORTERS_TRACING_SERVICE_NAME: demo-service
INSPECTIT_EXPORTERS_TRACING_JAEGER_ENABLED: ENABLED
INSPECTIT_EXPORTERS_TRACING_JAEGER_PROTOCOL: http/thrift
INSPECTIT_EXPORTERS_TRACING_JAEGER_ENDPOINT: http://localhost:14268/api/traces
INSPECTIT_EXPORTERS_METRICS_INFLUX_ENABLED: ENABLED
INSPECTIT_EXPORTERS_METRICS_INFLUX_ENDPOINT: http://localhost:8086
```

# TODOs:

* Fix influxdb autostart (rebooting after first launch works for now)
* Autosetup Kibana
