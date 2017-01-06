# Copyright 2016 prussian <genunrest@gmail.com>>
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#   http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# NOTE:
# This program requires terminal-notifier
# can be aquired via homebrew (brew install terminal-notifier)
# on linux, you need libnotify with a notifications server and notify-send

use strict;
use Irssi;

our $VERSION = '2.0.0';
our %IRSSI = (
    authors     => 'prussian',
    contact     => 'genunrest@gmail.com',
    name        => 'mac-notify',
    description => 'Sends notifications for macOS, see README.md',
    license     => 'Apache 2.0',
);

sub privmsg {
    my ($server, $msg, $nick, $address) = @_;
	my $window = Irssi::active_win();

    # we are looking at the query window of this user
	if ($window->{active}->{name} eq $nick) {
		return;
    }

    my $pid = fork();
    Irssi::pidwait_add($pid);
    if ($pid == 0) {
        if ($^O eq "darwin") {
            exec("terminal-notifier", "-message", "\\".$msg, "-title","\\".$nick);
        }
        else {
            exec("notify-send", $nick, $msg);
        }
    }
}

sub highlight {
    my ($dest, $text, $msg) = @_;
    my $server = $dest->{server};

    # Check if we should notify user of message
    # if message is notice or highligh type
    # if the channel belongs to the current server
    if (!($server &&
          $dest->{level} & (MSGLEVEL_HILIGHT | MSGLEVEL_NOTICES) &&
          $server->ischannel($dest->{target}))) {
        return;
    }

    my $pid = fork();
    Irssi::pidwait_add($pid);
    if ($pid == 0) {
        if ($^O eq "darwin") {
            exec("terminal-notifier", "-message", "\\".$msg, "-title", "\\".$dest->{target});
        }
        else {
            exec("notify-send", $dest->{target}, $msg);
        }
    }
}

Irssi::signal_add_last('message private' => \&privmsg);
Irssi::signal_add_last('print text' => \&highlight);
