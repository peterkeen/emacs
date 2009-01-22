#!/usr/local/bin/perl58 -w

use strict;

my @processes = `ps u | grep emacs-23.0.60 | grep pak | grep -v grep`;

system('screen -d -m') unless scalar(@processes) > 0;
