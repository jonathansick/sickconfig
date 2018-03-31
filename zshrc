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

# Setup virtualenvwrapper
# Running this after all the python paths have been set up
# http://virtualenvwrapper.readthedocs.org/en/latest/index.html
if (( $+commands[virtualenvwrapper.sh] )) ; then
    # virtualenvwrapper exists
    
    # Use python3 with virtualenvwrapper if available
    if which python3 > /dev/null 2>&1; then
        export VIRTUALENVWRAPPER_PYTHON=`which python3`
    fi

    # Set up directory to store environments/settings
    export WORKON_HOME=$HOME/.virtualenvs
    mkdir -p $WORKON_HOME

    source virtualenvwrapper.sh

    # Sync up virtualenv with virtualenvwrapper
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
    # pip always installs in the active virtualenv
    export PIP_RESPECT_VIRTUALENV=true
fi

# pipsi for isolated Python scripts
# https://github.com/mitsuhiko/pipsi
export PATH=$HOME/.local/bin:$PATH

# Setup rbenv for managing Ruby environments
# for shims and automcompletion
# Default directory is ~/.rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Enable Travis Gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# Platform-specific settings (from tagged architectures)
if [[ -s $HOME/.zshrc_arch ]] ; then source $HOME/.zshrc_arch ; fi

# Local settings (from secret-dotfiles)
if [[ -s $HOME/.zshrc_local ]] ; then source $HOME/.zshrc_local ; fi
