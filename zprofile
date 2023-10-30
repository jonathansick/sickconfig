if [ -d "/opt/homebrew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ##############################
# pyenv from Homebrew
# https://github.com/pyenv/pyenv
# pyenv uses both zprofile and zshrc
# ##############################
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi


# ##############################
# nvm installed via their script (not homebrew)
# https://github.com/nvm-sh/nvm
#
# Configured in zprofile for compatibility with Panic Nova
# https://library.panic.com/nova/environment-variables/
# ##############################
# Enable the node version manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Google Cloud SDK via Homebrew
if [[ -f "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc" ]] ; then
    source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
fi
if [[ -f "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc" ]] ; then
    source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
fi
