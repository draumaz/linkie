# linkie
```
[~] $ linkie
[linkie] pushing changes... nothing to push
[linkie] relinking... done
[~] $
```
- linkie is a tool that helps you implement a symlink-based ```~/.config``` dotfile management system.

## function
- linkie takes all top-level files and directories in a chosen repo and cleanly symlinks them into ```~/.config```.
- it's particularly useful for quickly bootstrapping a DE with lots of disparate dotfiles, like KDE or GNOME.

## prerequisites
- ```$HOME/.config``` populated with dotfiles
- ```${CONFIG_DOTS_REPO}``` exported to a repo containing the above dotfiles

## prepare
```
[~/remote-repos/plasma] $ export CONFIG_DOTS_REPO="/the/path/to/your/config/repo"
[~/remote-repos/plasma] $ ls ${CONFIG_DOTS_REPO}
akregatorrc                konsolerc         plasma-org.kde.plasma.desktop-appletsrc
baloofilerc                konsolesshconfig  plasmarc
dconf                      krunnerrc         plasmashellrc
...
[~/remote-repos/plasma] $
```

## install
- replace ```$BIN``` with any path you'd  like, as long as it's present in ```$PATH```.
```
curl -sL \
  https://github.com/draumaz/linkie/archive/refs/heads/main.tar.gz | \
    tar -xpvzf - \
      --strip-components=1 \
      -C $BIN \
      linkie-main/linkie
```
