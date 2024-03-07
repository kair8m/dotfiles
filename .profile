if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ]; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/.gems/bin" ]; then
    PATH="$HOME/.gems/bin:$PATH"
fi

if [ -d "$HOME/anaconda3/bin/" ]; then
    PATH="$HOME/anaconda3/bin:$PATH"
fi

if [ -d "$HOME/.local/share/bob/nvim-bin" ]; then
    PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
fi

