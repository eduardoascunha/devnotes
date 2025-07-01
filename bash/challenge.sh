#!/bin/bash

# filename - app.log
# line example - [2025-07-01 12:34:56] LEVEL: message

FILENAME="$1"
LEVEL="$2"

line_filter() {
    local file="$1"
    local level="$2"
    
    local lines
    lines=$(grep -i "\] $level:" "$file")
    
    local count
    count=$(echo "$lines" | wc -l)

    if [ "$count" -eq 0 ]; then
        echo "None"
    else
        echo "$lines"
        echo "Total: $count lines."
    fi
}

line_filter "$FILENAME" "$LEVEL"

