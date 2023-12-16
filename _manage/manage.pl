#!/usr/bin/perl -w
# manage.pl - A Perl script for managing my dotfiles.
#
# For adding more dotfiles see the [ CONFIGURATION ] section below.
# For usage see the POD documentation at the end of the script.
#
#      Author: JxBP
# Last update: 2023-12-16
use strict;

# ======[ CONFIGURATION ]======
my $CONFIG = glob("~/.config");

my %PACKAGES = (
    foot            => "$CONFIG/foot",
    fuzzel          => "$CONFIG/fuzzel",
    git             => "$CONFIG/git",
    nvim            => "$CONFIG/nvim",
    tmux            => "$CONFIG/tmux",
    "wayland/river" => "$CONFIG/river",
    wezterm         => "$CONFIG/wezterm",
    zsh             => "$CONFIG/zsh",
);

# ======[ Program ]======
use File::Basename;

sub usage() {
    die "Usage: $0 <LINK | UNLINK | STATUS> [PACKAGE...]\n";
}

die "You must set \$DOTFILES to your dotfiles directory to use this script.\n"
  unless defined( $ENV{DOTFILES} );

my $action = shift @ARGV;
usage unless defined $action and $action =~ /^(link|unlink|status)$/i;

sub do_link {
    my ( $package, $target ) = @_;
    mkdir dirname $target;
    if ( 0 eq symlink( $package, $target ) ) {
        print STDERR "[!] Could not link $package to $target: $!\n";
    }
    else {
        print "[+] $package -> $target\n";
    }
}

sub do_unlink {
    my ( $package, $target, $existing ) = @_;
    if ( $package eq $existing ) {
        unlink $target;
        print "[-] $target\n";
    }
    else {
        print STDERR
"[!] Did not unlink $target as it is not a symlink pointing to $package\n";
    }
}

sub do_status {
    my ( $package, $target, $existing ) = @_;
    unless ( $existing eq "" ) {
        print "[x] $package -> $target\n";
    }
    else {
        print "[ ] $package\n";
    }
}

my @TARGETS = @ARGV ? @ARGV : keys %PACKAGES;
my $do = undef;

if    ( $action =~ /^link$/i   ) { $do = \&do_link;   }
elsif ( $action =~ /^unlink$/i ) { $do = \&do_unlink; }
elsif ( $action =~ /^status$/i ) { $do = \&do_status; }

foreach my $key (@TARGETS) {
    my $target   = $PACKAGES{$key} or die "Unknown package: $key\n";
    my $package  = $ENV{DOTFILES} . "/$key";
    my $existing = readlink($target) || "";
    $do->($package, $target, $existing);
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
