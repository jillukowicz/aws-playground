#!/bin/bash

# Filter all ECS task state change events STOPPED which are not scaling activity...

aws events test-event-pattern \
--event-pattern "{\"source\": [\"aws.ecs\"],\"detail-type\": [\"ECS Task State Change\"],\"detail\": {\"lastStatus\": [\"STOPPED\"],\"stoppedReason\": [{\"anything-but\": {\"prefix\": \"Scaling activity initiated\"}}]}}"  \
--event "{ \"version\":\"0\",\"id\":\"f1ac5bea-411c-12c0-7b4c-86c1751286fa\",\"detail-type\":\"ECS Task State Change\",\"source\":\"aws.ecs\",\"account\":\"482650546777\",\"time\":\"2020-11-24T09:23:19Z\",\"region\":\"us-east-1\", \"detail\": { \"lastStatus\": \"STOPPED\", \"stoppedReason\": \"Exit\"}}"
