# sickconfig

Jonathan Sick's [rcm](http://thoughtbot.github.io/rcm/)-managed dotfiles.
These dotfiles are part of a trio of rcm configuration repositories:

- [sickvim](https://github.com/jonathansick/sickvim) — Vim editor configuration.
- [sickconfig](https://github.com/jonathansick/sickconfig) (this repo) — Shell and general system configuration.
- `secret-dotfiles` — Private and computer-specific configurations that extend sickconfig.

## Installation

To set up a new Mac, first install rcm:

```bash
brew tap thoughtbot/formulae
brew install rcm
```

Then clone and link the cascade of configuration repos:

```bash
git clone https://github.com/jonathansick/sickvim.git ~/sickvim
git clone https://github.com/jonathansick/sickconfig.git ~/sickconfig
export rcrc="~/secret-dotfiles/rcrc"  # first time only
rcup -t mac -d ~/secret-dotfiles -d ~/sickvim -d ~/sickconfig
```

When new dotfiles are added, the `rcup` command may be repeated.

### Installation Notes

An initial `rcup` run may require some dependencies (see below).
Post-install hooks in the sickvim and sickconfig repos will install Vim ([vim-plug](https://github.com/junegunn/vim-plug)) and tmux ([tpm](https://github.com/tmux-plugins/tpm)) plugins.

## Appendix: Mac set up notes

- Download Xcode from the Mac App Store, install, then install the command line tools:

  ```bash
  xcode-select --install
  ```

- Install [Homebrew](http://brew.sh).

- Install the basics:

  ```bash
  brew install python python3 zsh git hub tmux reattach-to-user-namespace ctags ack z ruby node
  ```

- Enable zsh as the default shell:

  ```bash
  chsh -s $(which zsh)
  ```

- Install Python virtualenv:

  ```bash
  pip install -U pip
  pip install virtualenv virtualenvwrapper
  ```

- Install [pipsi](https://github.com/mitsuhiko/pipsi) and command line python apps:

  ```bash
  curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python
  pipsi install flake8
  pipsi install Pygments
  pipsi install httpie
  ```

- Install rcm:

  ```bash
  brew tap thoughtbot/formulae
  brew install rcm
  ```

- Install the GPG Keychain:

  ```
  brew tap Caskroom/cask
  brew install gpgtools
  ```

  Then import existing keypairs into GPG Keychain.
