#!/bin/bash -e

# Unlock Elasticsearch on low disk space
curl -k -u "admin:demo" -X PUT https://localhost:9200/_all/_settings \
-H "Content-Type: application/json" -d '{"index.blocks.read_only_allow_delete": null}'

# Set default index pattern
curl -k -u "admin:demo" -X POST "https://localhost:5601/api/saved_objects/index-pattern" \
-H "Content-Type: application/json" -H "kbn-xsrf: true" -d '{"attributes": {"title" : "jaeger-*", "timeFieldName": "startTimeMillis"}}'
