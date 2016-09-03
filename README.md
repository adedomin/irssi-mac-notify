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

Warnings
--------

Due to invocation of an external binary via exec(), it may be vulnerable to command execution?

I tested it and I can't seem to trigger any arbitrary code execution, but I may not have tried hard enough.

If you know of a safer way of doing this, send a pull request or drop an issue.

Other
-----

I know that the weird "\\". in front of the messages and title strings is confusing but apparently terminal-notifier has this weird issue where if you don't prepend a forward slash for some strings, it will cause it to error out which will break irssi by printing out this error into your window.
