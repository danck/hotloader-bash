#!/bin/bash

trap 'kill $PID; kill $$' SIGINT

while :
do
    $@ &
    PID=$!
    inotifywait -r $1
    kill $PID
done
