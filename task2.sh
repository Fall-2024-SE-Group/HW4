#!/bin/bash
grep -rl 'sample' . | sort | uniq | xargs -I {} sh -c '
    count=$(grep -o "CSC510" "{}" | wc -l);
    if [ "$count" -ge 3 ]; then
        size=$(stat -c%s "{}");
        echo "$count $size {}";
    fi' | gawk '{print $1, $2, $3}' | sort -k1,1nr -k2,2nr | awk '{sub(/file_/, "filtered_", $3); print $3}'