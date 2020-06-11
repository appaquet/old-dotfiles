#!/bin/bash

if [ "${1}" == "pre" ]; then
  sudo systemctl stop docker
  echo "we are suspending at $(date)..." > /tmp/systemd_suspend_test

elif [ "${1}" == "post" ]; then
  echo "...and we are back from $(date)" >> /tmp/systemd_suspend_test
fi

