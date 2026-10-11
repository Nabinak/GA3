#!/bin/bash
set -euo pipefail

input_filepath="$1"
line_number="$2"

#print the line
head -n "$line_number" "$input_filepath" | tail -n 1