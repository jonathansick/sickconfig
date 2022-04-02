# ##############################
# pyenv from Homebrew
# https://github.com/pyenv/pyenv
# pyenv uses both zprofile and zshrc
# ##############################
eval "$(pyenv init --path)"


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
