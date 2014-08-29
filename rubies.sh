#!/usr/bin/env bash

set -e

rubies=("ree" "ruby-1.9.3" "ruby-2.0.0" "ruby-2.1.2")
for i in "${rubies[@]}"
do
  echo "====================================================="
  echo "$i: Start Test"
  echo "====================================================="
  rvm $i exec bundle >> /dev/null
  rvm $i exec bundle exec ruby ben.rb
  echo "====================================================="
  echo "$i: End Test"
  echo "====================================================="
done
