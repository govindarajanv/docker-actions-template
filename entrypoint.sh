#!/bin/bash

set -u

if [ "$GITHUB_EVENT_NAME" != "milestone" ]; then
    echo "::debug::The event name was'$GITHUB_EVENT_NAME'"
    exit 0
fi 

event_type=$(jq --raw-output .action $GITHUB_EVENT_PATH)

if [ $event_type != "closed" ]; then
    echo "::debug::The event type was $event_type"
    exit 0
fi 

milestone_name=$(jq --raw-output .milestone.title $GITHUB_EVENT_PATH)


#logging commands
echo "::set-output name-release-url::http://example.com"

exit 0
