# Based on https://github.com/dfm/dotfiles
fpath=("$HOME/.zsh/functions" $fpath)

autoload -U compinit
compinit -i

# Source all the config files.
for config_file ($HOME/.zsh/**/*.zsh) source $config_file

# Add rcm-managed ~/bin to path
export PATH=$HOME/bin:$PATH

# Cache PIP for speed (great for setting up virtual environments)
export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache

# pyenv
# https://github.com/pyenv/pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi

# Directories for vim and neovim configs
export VIMCONFIG=~/.vim
export VIMDATA=~/.vim
export NVIMCONFIG=~/.config/nvim
export NVIMDATA=~/.local/share/nvim

# Use nvim as the preferred editor
export VISUAL=nvim
# Use nvim full-time
alias vim=nvim
alias vi=nvim

# pipsi for isolated Python scripts
# https://github.com/mitsuhiko/pipsi
export PATH=$HOME/.local/bin:$PATH

# nvm bash completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Auto nvm use when in a directory with .nvmrc
# place this after nvm initialization!
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Platform-specific settings (from tagged architectures)
if [[ -s $HOME/.zshrc_arch ]] ; then source $HOME/.zshrc_arch ; fi

# Local settings (from secret-dotfiles)
if [[ -s $HOME/.zshrc_local ]] ; then source $HOME/.zshrc_local ; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jsick/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jsick/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jsick/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jsick/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
