# References
https://inspectit.github.io/inspectit-ocelot/docs/getting-started/docker-examples
https://github.com/p404/jaeger-elasticsearch-compose/blob/master/docker-compose.yml
https://gist.github.com/bocharovf/e19fa80f7b5f6b65db17249c91e79416

# Elasticsearch Fix
```
sudo sysctl -w vm.max_map_count=262144
sudo systemctl restart docker
```

# Kibana Setup
Setup Kibana:
Index Pattern: jaeger-*
Time: startTimeMillis

# EUM Example Site
```
<html>
    <head>
    <script src="http://localhost:8085/boomerang/boomerang.js"></script>
    <script src="http://localhost:8085/boomerang/plugins/rt.js"></script>
    <!-- any other plugins you want to include -->
    <script>
    BOOMR.init({
        beacon_url: "http://localhost:8085/beacon/"
    });
    </script>
</head>
<body>
    <h1>EUM Server</h1>
    <p>Test Beacon</p>
</body>
</html>
```