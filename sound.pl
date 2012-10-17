use strict;
use vars qw($VERSION %IRSSI);

use Irssi;
$VERSION = '1.0';
%IRSSI = (
        authors     => 'Storm Dragon',
        contact     => 'blah@blah.blah',
        name        => 'alert',
        description => 'Play sounds for different events in IRSSI.',
        url         => 'http://stormdragon.us',
        license     => 'GNU General Public License',
        changed     => '$Date: 2007-02-07 12:00:00 +0100 (Thu, 7 Feb 2008) $'
);

#--------------------------------------------------------------------
# Original script created by Chrelad
# Feb 7, 2008
#Heavily modified by Storm Dragon
#Added private message sound.
#Sounds now play as a background process.
#sounds are generated using sox.
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# The sound playing function for public message
#--------------------------------------------------------------------

sub pub_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
        system("play -qn -V0 synth 0.09 tri E3:B3 &");
}

#--------------------------------------------------------------------
# The sound playing function for private message
#--------------------------------------------------------------------

sub pri_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
        system("play -qn synth pl G2 pl B2 pl D3 pl G3 pl D4 pl G4 delay 0 0.02 0.04 0.06 0.08 0.1 remix - phaser fade p 0 0.5 0.3 &");
}

#--------------------------------------------------------------------
# The sound playing function for nick mensioning message
#--------------------------------------------------------------------

sub nick_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
        system("play -qn -V0 synth 0.5 tri A3:D3 tri D3:A3 remix - &");
}

#--------------------------------------------------------------------
# Irssi::signal_add_last / Irssi::command_bind
#--------------------------------------------------------------------

Irssi::signal_add_last("message nick", "nick_msg");
Irssi::signal_add_last("message public", "pub_msg");
Irssi::signal_add_last("message private", "pri_msg");
#- end
