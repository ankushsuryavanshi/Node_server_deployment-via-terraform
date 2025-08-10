#!/bin/bash
# ------------------------------------------------------------
# Script Name: analysis.sh
# Description: Checks disk usage for all mounted filesystems
#              and reports any usage above a specified threshold.
# Usage: ./analysis.sh [THRESHOLD]
# Example: ./analysis.sh 80  -> warns if usage above 80%
# ------------------------------------------------------------

# default threshold to 80% 
THRESHOLD=${1:-80}

echo "Checking disk usage... (Threshold: ${THRESHOLD}%)"
echo "-----------------------------------------------"

# Loop through each filesystem and check usage
df -h --output=pcent,target | tail -n +2 | while read usage mount; do
    # Remove % sign from usage
    usage_num=${usage%%%}

    # Compare with threshold
    if [ "$usage_num" -ge "$THRESHOLD" ]; then
        echo "WARNING: $mount is at ${usage_num}% usage!"
    else
        echo "OK: $mount is at ${usage_num}% usage."
    fi
done

echo "-----------------------------------------------"
echo "Disk usage check completed."
