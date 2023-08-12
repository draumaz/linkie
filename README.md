# linkie
```
[~] $ linkie
[linkie] pushing changes... nothing to push
[linkie] relinking... done
[~] $
```
- symlink everything from $LINKIE_REPO to $LINKIE_PATH.

## function
- linkie takes all top-level files and directories in a chosen repo and cleanly symlinks them into a chosen directory.
- it's particularly useful for quickly bootstrapping a DE with lots of disparate dotfiles, like KDE or GNOME.

## prerequisites
- ```${LINKIE_PATH}``` as a destination config folder, like ```~/.config```
- ```${LINKIE_REPO}``` exported to a repo containing the above dotfiles

## prepare
- create a git repository containing the ```~/.config``` files you want symlinked.
```
[~/remote-repos/plasma] $ export LINKIE_REPO="/the/path/to/your/config/repo"
[~/remote-repos/plasma] $ ls ${LINKIE_REPO}
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
