#!/usr/bin/env perl
use Dancer;
use linstat;

my $pid_file_name="/tmp/linstat.pid";

sub got_sig {
  unlink $pid_file_name;
  exit(0);
}

open my $pid_file , ">" , $pid_file_name;
print $pid_file "$$\n";
close $pid_file;
warn "Pid is $$\n";

$SIG{QUIT} = \&got_sig;
$SIG{INT} = \&got_sig;

dance;
