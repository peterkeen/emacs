#!/usr/local/bin/perl -w

use strict;
use File::Temp qw/ tempfile /;

my $alternate_pager = $ENV{EMACSPAGER_ALTERNATE} || "less";

unless($ENV{INSIDE_EMACS}) {
    exec($alternate_pager);
}

my ($fh, $filename) = tempfile();

my $linecount = 0;

my $max_lines_before_opening_buffer = $ENV{EMACSPAGER_MIN_LINES} || 40;

while(<>) {
    print $fh $_;
    $linecount++;
}

if ($linecount > $max_lines_before_opening_buffer) {
    system(qq{~/opt/emacs/bin/emacsclient -ne '(pak-pager "$filename")'});
} else {
    system("cat $filename");
}

close $fh;
