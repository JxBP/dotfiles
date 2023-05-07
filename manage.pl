#!/usr/bin/perl -w
# manage.pl - A Perl script for managing my dotfiles.
#
# For adding more dotfiles see the [ CONFIGURATION ] section below.
# For usage see the POD documentation at the end of the script.
#
# I know this script is kind of hacky but I didn't like the directory structure
# GNU stow enforced on me and didn't have a need for complex dotfile managers.
#
# I'm also not much of a Perl Guru so forgive me if I could have reduced this
# entire script into a one-liner! ;)
#
# Author: JxBP
# Date: 2023-05-07
use strict;

# ======[ CONFIGURATION ]======
my $CONFIG     = glob("~/.config");
my $CONFIG_ZSH = $CONFIG . "/zsh";

my %PACKAGES = (
    zsh             => "$CONFIG/zsh",
    tmux            => "$CONFIG/tmux",
    nvim            => "$CONFIG/nvim",
    git             => "$CONFIG/git",
    "alacritty.yml" => "$CONFIG/alacritty.yml",
    "xinitrc"       => glob("~/.xinitrc")
);

# ======[ Program ]======
use Cwd qw(cwd);
use File::Basename;

sub usage() {
    die "Usage: $0 <LINK | UNLINK | STATUS> [PACKAGE...]\n";
}

my $action = shift @ARGV;
usage unless defined $action and $action =~ /^(link|unlink|status)$/i;

# I know this if/elsif construct will run everytime but even then this runs
# fast enough. If this was performance critical down to the millisecond I
# wouldn't use Perl anyway.
#
# tl;dr I don't care if this is slow
foreach my $key ( @ARGV ? @ARGV : keys %PACKAGES ) {
    my $target   = $PACKAGES{$key} or die "Unknown package: $key\n";
    my $package  = cwd . "/$key";
    my $existing = readlink($target) || "";

    if ( $action =~ /^link$/i ) {
        mkdir dirname $target;
        if ( 0 eq symlink( $package, $target ) ) {
            print STDERR "[!] Could not link $package to $target: $!\n";
        }
        else { print "[+] $package -> $target\n"; }
    }
    elsif ( $action =~ /^unlink$/i ) {
        if ( $package eq $existing ) {
            unlink $target;
            print "[-] $target\n";
        }
        else {
            print STDERR
"[!] Did not unlink $target as it is not a symlink pointing to $package\n";
        }
    }
    elsif ( $action =~ /^status$/i ) {
        unless ( $existing eq "" ) {
            print "[x] $package -> $target\n";
        }
        else {
            print "[ ] $package\n";
        }
    }
}
__END__

=head1

manage.pl - A Perl script for managing my dotfiles.

=head1 SYNOPSIS

manage.pl <LINK | UNLINK | STATUS> [PACKAGE...]

=head1 DESCRIPTION

This Perl script is a "symlink farm manager" similar to GNU stow but instead of
basing the symlink targets on the directory structure they are configured inside
the script.

=head1 SUBCOMMANDS

=over 8

=item B<LINK>

Create the symlinks for the given packages or all if no packages are passed.

=item B<UNLINK>

Delete the symlinks for the given packages or all if no packages are passed.

=item B<STATUS>

Print whether or not symlinks for the given packages (or all if none are passed) exist

=back
