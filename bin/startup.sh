#!/bin/bash

# Run screenfetch for system information
screenfetch

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
print_decoration "=" 50
print_color "Tasks:" "1;35"
echo ""
#todo
print_decoration "=" 50

# Display guidance message with decoration
echo ""
print_decoration "-" 50
print_color "For guidance: enter 'guide'" "1;33"
print_decoration "-" 50

# Add any other metadata or commands you want to display
echo ""
print_decoration "=" 50
print_color "Hostname: $(hostname)" "1;34"
print_color "User: $USER" "1;34"
print_decoration "=" 50
