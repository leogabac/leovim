# LEOVIM
This is my personal Neovim configuration. This would have typically lived inside my dotfiles repository, but after being too optimistic about all the fancy stuff I wanted to implement, I had to make it its own repo.

If you came across this, chances are you know me in person and wanted to try my configuration. In the spirit of easily sharing this, I made this repo public.

## Features

* Simplicity
* Full LaTeX support
* Full Markdown support (WIP to be an Obsidian replacement)

## Installation

Clone the repo
```bash
git clone https://github.com/leogabac/leovim.git ~/.config/nvim
```
and launch
```bash
nvim
```

### Multiple configurations

Neovim lets you lauch it with a different configuration file by using the [NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME) environmental variable when launching it with the command.

```bash
NVIM_APPNAME="leovim" nvim
```
This will look for a configuration file under `~/.config/leovim` . Using this, you can clone
```bash
git clone https://github.com/leogabac/leovim.git ~/.config/leovim
```
and make the alias 
```bash
alias leovim='NVIM_APPNAME="leovim" nvim'
```
Then `leovim` will launch this confguration while `nvim` will keep your default.


