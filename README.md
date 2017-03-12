For
---

  * macOS (OS X) using terminal-notifier.
  * Generic System which implements GNOME Desktop Notifications and has notify-send binary.
  * Other system which implements notify-send binary/script.

Config
------

Below are ways to configure when or if this plugin should notify.

    /set notify_priv <level>
    /set notify_chan <level>

    where notify_priv are private messages
    where notify_chan are highlight messages in a channel
    where <level> is one of:
        never  - never notify for these events
        active - never notify for these events if the channel/user is the active window
        always - anytime highlighed or private message, active window or not

Depends
-------

### macOS

The Following binaries should be findable in your \$PATH.

    terminal-notifier

Get with homebrew.
    
    brew install terminal-notifier

### other

The Following binaries should be findable in your \$PATH.

    notify-send

Get with your package manager, likely under some libnotify, notify-osd, package.
