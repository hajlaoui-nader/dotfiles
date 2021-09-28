I forked https://github.com/holman/dotfiles excellent dotfiles. 


## Installation

### Dependencies

First, make sure you have all those things installed:

- `git`: to clone the repo
- `curl`: to download some stuff
- `tar`: to extract downloaded stuff
- `zsh`: to actually run the dotfiles
- `sudo`: some configs may need that
- `iterm2`
- `pyenv`: `brew install pyenv` | `pip3 install virtualenv` | `pip3 install virtualenvwrapper`
- `bitwarden` 
- `flycut`
- `sdkman` 


### Install

Then, run these steps:

```console
$ git clone https://github.com/hajlaoui-nader/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./script/bootstrap
$ zshreload # or just close and open your terminal again.
```

[![Sanity Test CI](https://github.com/hajlaoui-nader/dotfiles/actions/workflows/sanity.yml/badge.svg?branch=main)](https://github.com/hajlaoui-nader/dotfiles/actions/workflows/sanity.yml)