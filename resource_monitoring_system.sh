#!/bin/bash

# Create file to save the result
LOG_FILE="./monitoring.log"

# Get RAM usage
ram_usage() {
    free -m | grep Mem | awk '{print $3/$2 * 100}' | cut -d. -f1
}

monitoring_system() {
    local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    local val=$1

    echo "$timestamp - Memory: $val%" >> "$LOG_FILE"
}

echo "Monitoring started... (Press Ctrl+C to stop)"

while true; do

    usage=$(ram_usage)
                    # variable val
    monitoring_system "$usage"

    if [ "$usage" -gt 80 ]; then
        echo "Low RAM! Current usage: $usage%"
    fi

    sleep 5

done
