#!/bin/bash
set -e

if [ -z "$1" ]; then
	echo "Usage: $0 [GPIO Pin Number]"
	echo
	echo 'Returns the GPIO pin value as a 0 or 1.'
	echo
	echo '0 = off (low  0v)'
	echo '1 = on  (high 3.3v)'
	exit 1
fi

PIN="/sys/class/gpio/gpio$1"

if [ ! -d "$PIN" ]; then
	echo "$1" > '/sys/class/gpio/export'
fi

echo $(cat "$PIN/value")
