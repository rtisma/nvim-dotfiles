# ROBS NVIM Config

# Table of Contents

- [ROBS NVIM Config](#robs-nvim-config)
- [Table of Contents](#table-of-contents)
    - [Instructions](#instructions)
        - [1. Prerequisites](#1-prerequisites)
        - [2. Optional Configuration](#2-optional-configuration)
        - [3. NVIM Plugin Installation](#3-nvim-plugin-installation)
    - [Help](#help)

## Instructions

### 1. Prerequisites
1. Install nvim (>= 0.3) and its dependencies
```bash
sudo apt install -y software-properties-common && sudo add-apt-repository ppa:neovim-ppa/stable -y && sudo apt update && sudo apt install -y neovim git curl exuberant-ctags
```

### 2. Optional Configuration
Optionally create alternatives
```bash
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
```

### 3. NVIM Plugin Installation
2. Run the one-time initial installation of dependencies. Open the [script](https://github.com/rtisma/nvim-dotfiles/blob/master/init.vim) for more details:
```bash
sh <(curl  http://bit.ly/2Gthnpi -L)
```

## Help
use `:checkhealth` to see what is missing in nvim

