#!/usr/bin/env bash

trap "echo \"Terminating client at pid '\$PID'.\" ; kill -KILL \$PID ; exit 0" SIGTERM
trap "echo \"Interupting client at pid '\$PID'.\" ; kill -KILL \$PID ; exit 0" SIGINT

PID=$BASHPID

while sleep 1 ; do
    :
done