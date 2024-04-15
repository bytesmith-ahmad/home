#!/usr/bin/perl

use strict;
use warnings;

# ANSI color escape codes
my $G = "\e[48;5;236m"; # Dark gray color
my $R = "\e[0m";        # Reset color
my $Y = "\e[1;33m";     # Yellow color for the header

# Read the table from stdin
my @table;
while (<STDIN>) {
    chomp;
    push @table, $_;
}

# Print only the header (first row) of the table with color
print $Y . $table[0] . $R . "\n";
print $table[1]."\n";

# Print the rest of the table
for (my $i = 2; $i < @table; $i++) {
    # Print the row with color
    if ($i % 2 == 0) {
        print $table[$i] . "\n";
    } else {
        print $G . $table[$i] . $R . "\n";
    }
}
