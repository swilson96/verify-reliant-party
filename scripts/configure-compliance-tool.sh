#!/usr/bin/env bash

curl -X POST -H "content-type: application/json" --data @- https://compliance-tool-reference.ida.digital.cabinet-office.gov.uk/service-test-data < compliance-tool-post.json