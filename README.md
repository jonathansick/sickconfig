# sickconfig

Jonathan Sick's [rcm](http://thoughtbot.github.io/rcm/)-managed dotfiles.
These dotfiles are part of a trio of rcm configuration repositories:

- [sickvim](https://github.com/jonathansick/sickvim) — Vim editor configuration.
- [sickconfig](https://github.com/jonathansick/sickconfig) (this repo) — Shell and general system configuration.
- `secret-dotfiles` — Private and computer-specific configurations that extend sickconfig.

## Installation

To setup a new Mac, first install rcm:

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
