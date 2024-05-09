## Dot Files
Contains configuration files - for zsh, neovim, and tmux.

### Installation and Setup
#### Initial Setup

* Clone the repository [[dot-files]](https://github.com/dev-gsm/dot-files.git) in `$HOME` directory.
```console
git clone https://github.com/gs-bitbyter/dot-files.git $HOME
```

#### ZSH Setup

* Create symbolic link for `.zshrc`.
```console
ln -sf $HOME/dot-files/.zshrc $HOME/.zshrc
```

#### Neovim Setup
* Install Neovim.
```console
sudo pacman -S neovim
```
* Install required packages/libararies for autocompletion using lsp.
    - For gopls, tsserver and pyright (go, javascript, typescript, and python)
    - Install `go`,`nodejs`, and `npm`
        ```console
        sudo pacman -S go nodejs npm
        ```
    - Install `tailwindcss-language-server`, `typescript-language-server`
        ```console
        sudo npm install -g tailwindcss-language-server typescript-language-server
        ```
* Create symbolic link for Neovim config directory.
```console
ln -sf $HOME/dot-files/nvim/ $HOME/.config/nvim
```
Finally, launch Neovim using `nvim` command, this will download and configure all the required plugins.


#### Tmux Setup

* Install Tmux Plugin Manager (TPM)
```console
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
* Create symbolic link for tmux configuration file.
```console
ln -sf $HOME/dot-files/tmux.conf $HOME/.tmux.conf
```
* Inside tmux session run follwing command.
```console
tmux source $HOME/.tmux.conf
```
* Press `prefix + I` to install tmux plugins.
## Credits
* Neovim Configurations [[https://github.com/cpow/cpow-dotfiles.git]](https://github.com/cpow/cpow-dotfiles.git)
