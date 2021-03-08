
## Instalation

### Pre-requesites
1. Install (zsh)[https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH].
2. Install (oh-my-zsh)[https://ohmyz.sh/].
7. Create a personal config file: `touch ~/.personalrc`.
3. Install (base16 shell)[https://github.com/chriskempson/base16-shell].
4. Build and install (nvim from source)[https://github.com/neovim/neovim/wiki/Building-Neovim]
   (required for nvim-lsp).
5. Install (vim-plug)[https://github.com/junegunn/vim-plug] and be sure install
   the neovim version.
6. Create additional folders: `mkdir -p ~/.config/nvim/plugins`.
7. Install (tmux)[https://github.com/tmux/tmux/wiki]
8. Install (tmux themepack)[https://github.com/jimeh/tmux-themepack] (pretty
   tmux).
8. Install other stuff that I use:
   - (exa)[https://github.com/ogham/exa]

### Installing the dotfiles
Clone the repo (or fork it and then clone the fork, it's better that way).
```
git clone https://github.com/GabrielDertoni/dotfiles.git ~/dotfiles
```

Link files in the repo to files in your system
```
cd ~/dotfiles
ln -s $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/init.vim ~/.config/nvim/init.vim
ln -s $(pwd)/vim-plugins-config ~/.config/nvim/plugin
ln -s $(pwd)/.tmux.conf ~/.tmux.conf
```

### Setting-up nvim

Now you are able to use the dotfiles, however, when you try to enter nvim, a
bunch of errors should appear. That is beause you're using lots of pluggins that
haven't been installed yet. To fix that, open nvim with `nvim ~/.config/init.vim`
and when the errors appear, just scroll down to the end of them and press enter
to continue anyway. Then, do a `:PlugInstall` and all plugins should install.
Quit nvim and, when you open it again, hopefully everything will be ready to go!

### A couple of notes

Even though this setup should be enough to give you nice colors and so on, it
should be noted that some extensions still need to be install for everything to
work properly. In particular, all of the language servers used by nvim lsp.
Currently the main used one is (rust-analyzer)[https://rust-analyzer.github.io/]
which requires `cargo` and `rustc` and so on. If you really just want the
default configs, you can just not use the `plugins/` folder entirely. It would
certainly prevent lots of work and maybe some headaches as well.


