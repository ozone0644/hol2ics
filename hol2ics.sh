#!/bin/bash

# Check if input file is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input.hol output.ics"
    exit 1
fi

INPUT_FILE="$1"
OUTPUT_FILE="$2"

# Start the ICS file
echo "BEGIN:VCALENDAR" > "$OUTPUT_FILE"
echo "VERSION:2.0" >> "$OUTPUT_FILE"
echo "PRODID:-//Holiday Converter//EN" >> "$OUTPUT_FILE"
echo "CALSCALE:GREGORIAN" >> "$OUTPUT_FILE"

# Read the HOL file and process lines
while IFS=',' read -r event date; do
    # Skip header lines and empty lines
    if [[ "$event" =~ "[" ]] || [[ -z "$event" ]]; then
        continue
    fi
    
    # Format date (YYYY/MM/DD to YYYYMMDD)
    ics_date=$(echo "$date" | tr -d '/')
    
    # Write event to ICS file
    echo "BEGIN:VEVENT" >> "$OUTPUT_FILE"
    echo "SUMMARY:$event" >> "$OUTPUT_FILE"
    echo "DTSTART;VALUE=DATE:$ics_date" >> "$OUTPUT_FILE"
    echo "END:VEVENT" >> "$OUTPUT_FILE"
done < "$INPUT_FILE"

# End the ICS file
echo "END:VCALENDAR" >> "$OUTPUT_FILE"

echo "Conversion complete: $OUTPUT_FILE"
