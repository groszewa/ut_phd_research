#!/usr/bin/perl
use strict;
use warnings;

print("Hello!\n");
my $counter = 0;
for(my $v=0;$v<4;$v++) {
    for(my $w=0;$w<4;$w++) {
        for(my $x=0;$x<4;$x++) {
            for(my $y=0;$y<4;$y++) {
                for(my $z=0;$z<4;$z++) {
                    print("assign bs_data_out[$counter] = bs_data_in[0][$v] & bs_data_in[1][$w] & bs_data_in[2][$x] & bs_data_in[3][$y] & bs_data_in[4][$z]\n");
                    $counter++;
                }
            }
        }
    }
}

