#!/bin/bash
gawk -F, '
BEGIN {
    FPAT = "\"[^\"]*\"|[^,]+"  # This defines the pattern for splitting fields
    count = 0
    age=0
}
{
    # Get the last column value
    value = $NF

    # Print the row if conditions are met
    if (($3 == 2) && (value ~ /S/)) {
        if ($5!= "male" && $5!= "female") {
            if ($6 == "male") {
                $6 = "M"
            } else if ($6 == "female") {
                $6 = "F"
            }
            count++
            age=age+$7
            print $0
        }
        else {
            if ($5 == "male") {
                $5 = "M"
            } else if ($5 == "female") {
                $5 = "F"
            }
            count++
            age = age+$6
            print $0
        }        
    }
}
END {
    if (count > 0) {
        average = age / count
        print "Average Age of Filtered Passengers:" average
    } else {
        print "No passengers"
    }
}' OFS=, titanic.csv  







