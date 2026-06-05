#!/bin/bash
# Script: scan_logs.sh
# Purpose: Scan all .log files in current directory for "ERROR"
#          Count occurrences and mark files with FOUND / CLEAN

for file in *.log; do
    count=$(grep -c "ERROR" "$file")
    if [ "$count" -gt 0 ]; then
        echo "[FOUND] $file : $count errors"
    else
        echo "[CLEAN] $file : $count errors"
    fi
done