# linkie
- linkie is a tool that helps you implement a symlink-based dotfile management system.

## prepare
- export a variable called CONFIG_DOTS_REPO, and point it to a repo containing your .config dotfiles.
- ```export CONFIG_DOTS_REPO="$HOME/repos/plasma-configs"```

## install
- replace ```/opt/local/bin``` with anything you want, as long as it's present in $PATH.
```
curl -sL \
  https://github.com/draumaz/linkie/archive/refs/heads/main.tar.gz | \
    tar -xpzf - \
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
