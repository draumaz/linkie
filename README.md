# linkie
- linkie is a tool that helps you implement a symlink-based ```~/.config``` dotfile management system.

## prepare
```
[~/remote-repos/plasma] $ export CONFIG_DOTS_REPO="/the/path/to/your/config/files"
[~/remote-repos/plasma] $ ls ${CONFIG_DOTS_REPO}
akregatorrc                konsolerc         plasma-org.kde.plasma.desktop-appletsrc
baloofilerc                konsolesshconfig  plasmarc
dconf                      krunnerrc         plasmashellrc
...
[~/remote-repos/plasma] $
```

## install
- replace ```/opt/local/bin``` with anything you want, as long as it's present in $PATH.
```
curl -sL \
  https://github.com/draumaz/linkie/archive/refs/heads/main.tar.gz | \
    tar -xpvzf - \
      --strip-components=1 \
      -C "/opt/local/bin" \
      linkie-main/linkie
```

## usage
```
[~] $ linkie
[linkie] relinking... done
[~] $ for i in `find ~/.config`; do test -L $i && echo $i; done
.config/dconf
.config/konsolesshconfig
.config/kactivitymanagerdrc # these now point to your repo!
.config/README.md
.config/ksmserverrc
.config/ktimezonedrc
...
[~] $
```
