For
---

macOS (OS X) - Irssi

Irssi is pretty much the only good irc client I know of for macOS

Depends
-------

The Following binaries should be findable in your \$PATH.

    terminal-notifier

Get with homebrew.
    
    brew install terminal-notifier

Other
-----

I know that the weird "\\". in front of the messages and title strings is confusing but apparently terminal-notifier has this weird issue where if you don't prepend a forward slash for some strings, it will cause it to error out which will break irssi by printing out this error into your window.
