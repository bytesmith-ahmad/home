#!/bin/bash

# Check for github changes and pull them
~/bin/check_github_changes.sh

# Run screenfetch for system information
# screenfetch

# Function to print decorations
print_decoration() {
    local decoration="$1"
    local length="$2"
    printf "%*s\n" "$length" "" | tr " " "$decoration"
}

# Function to print text with color
print_color() {
    local text="$1"
    local color="$2"
    printf "\033[${color}m%s\033[0m\n" "$text"
}

# Display date and time with decoration
echo ""
print_decoration "*" 50
print_color "Current date and time: $(date)" "1;36"
print_decoration "*" 50

# Display tasks with decoration
echo ""
task get

# Display guidance message with decoration
echo ""
print_decoration "-" 50
print_color "For guidance: enter 'guide'" "1;33"
#print_color "To view list of commands: 'ls -1 bin'" "1;33"
print_decoration "-" 50
echo ""
