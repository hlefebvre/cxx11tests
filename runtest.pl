#!/usr/bin/env perl

my $LINEWIDTH = 80;
my $COLORIZED = 1;

my $testname = shift @ARGV;
my $logfile = shift @ARGV;
my @cmds = @ARGV;

open F, '> '.$logfile or die 'open $logfile: $!';
my $cmd = join(' ', @cmds)." 2>&1 ";
print F "# Command executed: ";
print F $cmd;
print F "\n";
print F `$cmd`;
my $returncode = $?;
close F;

my $status, $statustext;

if ($returncode eq 0)
{
  $status = 1;
  $statustext = 'PASS';
}
else
{
  $status = 0;
  $statustext = 'FAIL';
}

print "$testname".("."x($LINEWIDTH-length($testname)-6)).$statustext."\n";
