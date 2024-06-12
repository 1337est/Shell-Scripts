#!/bin/bash

read -p "Date to count to (yyyy-mm-dd): " target_date

# Convert input date to timestamp

target_timestamp=$(date -d "$target_date" +%s)

# Get current timestamp
current_timestamp=$(date +%s)

# Calculate the difference in seconds'
time_diff=$((target_timestamp - current_timestamp))

# Convert seconds to days
days_diff=$((time_diff / 86400))

echo "Days until $target_date: $days_diff"
