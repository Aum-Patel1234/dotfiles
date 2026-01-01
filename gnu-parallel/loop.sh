#!/usr/bin/env bash

arg="$1"

if [[ "$arg" == "1" ]]; then
  while true; do
    echo "1"
  done

elif [[ "$arg" == "2" ]]; then
  while true; do
    echo "    2"
  done

elif [[ "$arg" == "3" ]]; then
  while true; do
    echo "       3"
  done
fi
