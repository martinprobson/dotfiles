# dotfiles

-  vim            > Vim config and plugins.
-  bash           > bashrc/dircolors
-  fonts          > Nice monospaced fonts for terminal and vim.
-  terminator     > [terminator](https://gnometerminator.blogspot.co.uk/p/introduction.html) configuration.
-  IntelliJ       > IntelliJ settings file and ideavimrc for vim plugin
-  installed_software_DD-MM-YYYY > Manually installed software (via apt-get).

## Usage
These dotfiles can be managed using [gnu stow](http://www.gnu.org/software/stow/), a free, portable, lightweight symlink farm manager.
For example, the `vim` directory in this repo contains my `.vimrc` file. Assuming this repo is located in the root of your home directory `~/dotfiles`, executing the following stow command in that directory: -
```bash
 ~/dotfiles:> stow vim
``` 
will create a symlink `~/.vimrc -> ~/dotfiles/vim/.vimrc`.
 this allows me to keep a versioned directory of all my config files that are virtually linked into place via a single command. this makes sharing these files among many users (root) and computers super simple. and does not clutter your home directory with version control files.

**note:** stow can only create a symlink if a config file does not already exist. if a default file was created upon program installation you must delete it first before you can install a new one with stow. this does not apply to directories, only files.

## Manually Installed Software List

```bash
comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u) > /tmp/installed_software_08-03-2018.txt
```

## Thanks
Thanks to [xero](https://github.com/xero/dotfiles).
