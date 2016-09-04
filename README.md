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

This creates a SHITLOAD of zombie processes, however caputring SIGCHLD in the script fails miserably.
Using system() just makes the script stupidly slow if you have oever 80 highlights pending.

    terminal-notifier -message fdfa -title fdafs  0.04s user 0.02s system 28% cpu 0.215 total

tl;dr I don't care anymore, it's OS X.
If someone knows any decent perl modules that works with OS X notification center, I'll use that instead of some stupid, slow, binary intended for shell use.

Other
-----

I know that the weird "\\". in front of the messages and title strings is confusing but apparently terminal-notifier has this weird issue where if you don't prepend a forward slash for some strings, it will cause it to error out which will break irssi by printing out this error into your window.
