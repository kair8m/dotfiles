# Basic setup

## Install sdkman
```
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
```

## Install basic tools, setup zsh...
```
sh -c "$(curl  https://raw.githubusercontent.com/kair8m/dotfiles/main/setup_linux.sh)"
```

# dotfiles

configuration files for different tools

# required tools
```
https://github.com/Yggdroot/indentLine
https://github.com/zsh-users/zsh-syntax-highlighting
https://github.com/tpope/vim-commentary
https://github.com/airblade/vim-gitgutter
https://github.com/romkatv/powerlevel10k
https://sdkman.io/
https://github.com/prompt-toolkit/ptpython # Cool python interpreter
https://github.com/dandavison/delta # Makes git diff fancy
```

# Keyboard shortcuts

## vim

`gq` - format selection

`gcc` - comment line

`gc` - uncomment line

`Ctrl + n` - toggle nerd tree

`Ctrl + p` find file in project

`Ctrl + f` find using content in project

`gd` go to declaration

`gd` go to implementation

`gy` go to type declaration

`gr` show references

`Ctrl+r` refactor

`Ctrl+o` previous buffer

`Ctrl+i` next buffer

`Ctrl+t` toggle terminal

`Alt+<Left/Right>Arrow` - navigate beetween tabs

## NERD TREE guides

`m` - open dialogue

in dialogue

`a` - create file or directory

`d` - delete file or directory

# Useful shell aliases
```
fd - shows git diff in fancy IDE-like way (just try it and see:))
md-preview - preview markdown files
```
