# ROBS NVIM Config

# Table of Contents

- [ROBS NVIM Config](#robs-nvim-config)
- [Table of Contents](#table-of-contents)
    - [Instructions](#instructions)

nvim 0.3+ is required
use `:checkhealth` to see what is missing in nvim

## Instructions
1. Install nvim
```bash
sudo apt install software-properties-common 
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

Optionally create alternatives
```bash
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
```

3. Run the one-time initial installation of dependencies. Open the [script](https://github.com/rtisma/nvim-dotfiles/blob/master/init.vim) for more details:
```bash
sh <(curl  http://bit.ly/2Gthnpi -L)
```

