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

use strict;
use Irssi;

our $VERSION = '1.0.0';
our %IRSSI = (
	authors     => 'prussian',
	contact     => 'genunrest@gmail.com',
	name        => 'mac-notify',
	description => 'Sends notifications using macOS|OS X specific terminal-notifier command. Due to invokation of system(), it may be dangerous',
	license     => 'Apache 2.0',
);

sub priv_msg {
	my ($server, $msg, $nick, $address) = @_;

    my $pid = fork();
    if ($pid == 0) {
        exec("terminal-notifier", "-message", "'".$msg."'", "-title","'".$nick."'");
    }
}

sub hilight {
	my ($dest, $text, $msg) = @_;
	my $server = $dest->{server};

	# Check if we should notify user of message:
	# if message is notice or highligh type
	# if the channel belongs to the current server
	if (!($server &&
		  $dest->{level} & (MSGLEVEL_HILIGHT | MSGLEVEL_NOTICES) &&
		  $server->ischannel($dest->{target}))) {
		return;
	}

    my $pid = fork();
    if ($pid == 0) {
        exec("terminal-notifier", "-message", "'".$msg."'", "-title", "'".$dest->{target}."'");
    }
}

Irssi::signal_add_last('message private' => \&priv_msg);
Irssi::signal_add_last('print text' => \&hilight);
