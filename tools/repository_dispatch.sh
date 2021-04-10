#!/bin/bash

if [ ! "$GITHUB_EVENT_NAME" == "repository_dispatch" ]; then
    echo "Wrong event '$GITHUB_EVENT_NAME'!"
    exit 1
fi

EVENT_JSON=`cat "$GITHUB_EVENT_PATH"`
action=`echo "$EVENT_JSON" | jq -r '.action'`
payload=`echo "$EVENT_JSON" | jq -r '.client_payload'`
branch=`echo "$payload" | jq -r '.branch'`
commit=`echo "$payload" | jq -r '.commit'`
builder=`echo "$payload" | jq -r '.builder'`
arduino=`echo "$payload" | jq -r '.arduino'`

echo "Action: $action, Branch: $branch, Commit: $commit, Builder: $builder"

if [ ! "$action" == "deploy" ] && [ ! "$action" == "build" ]; then
    echo "Bad Action $action"
    exit 1
fi

export GITHUB_EVENT_ACTION="$action"

if [ ! "$commit" == "" ] && [ ! "$commit" == "null" ]; then
    export IDF_COMMIT="$commit"
else
    commit=""
    if [ ! "$branch" == "" ] && [ ! "$branch" == "null" ]; then
        export IDF_BRANCH="$branch"
    fi
fi

if [ ! "$builder" == "" ] && [ ! "$builder" == "null" ]; then
    git checkout "$builder"
fi

if [ ! "$arduino" == "" ] && [ ! "$arduino" == "null" ]; then
    export AR_BRANCH="$arduino"
fi

source ./build.sh

if [ "$action" == "deploy" ]; then
    bash ./tools/push-to-arduino.sh
fi
