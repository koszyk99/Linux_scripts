#!/bin/bash

# Get RAM usage
ram_usage() {
    free -m | grep Mem | awk '{print $3/$2 * 100}' | cut -d. -f1
}

echo "Current RAM usage $(ram_usage)%"

while true; do

    usage=$(ram_usage)

    if [ "$usage" -gt 80 ]; then
        echo "Low RAM! Current usage: $usage%"
    fi

    sleep 5

done
