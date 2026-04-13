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

cpu_usage() {
    ps -eo pid,comm,%mem --sort=-%mem | head -n 10
}

echo "Monitoring started... (Press Ctrl+C to stop)"

while true; do

    usage=$(ram_usage)
                    # variable val
    monitoring_system "$usage"

    if [ "$usage" -gt 80 ]; then
        echo "--- ALERT: Low RAM! Current usage: $usage% ---"
        echo "Top memory consuming processes:"
        cpu_usage
        echo "----------------------------------------------"
    fi

    sleep 5

done
