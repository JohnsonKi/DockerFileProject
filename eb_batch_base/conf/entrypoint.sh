#!/bin/bash
if [[ -e /usr/src/myapp/skilipaca.jar ]]; then
  java -jar /usr/src/myapp/skilipaca.jar
else
  java -jar /skilipaca.jar
fi



