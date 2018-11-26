#!/bin/bash

if [ "${1}" == "post" ]; then
  if (systemctl is-active i8kmon.service > /dev/null); then
    systemctl restart i8kmon.service
  else
    exit 0
  fi
fi
