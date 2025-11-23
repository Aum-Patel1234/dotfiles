# Dotfiles Setup Instructions

my Dotfiles setup

---

## 1. Install Git

```bash
sudo apt update
sudo apt install -y git
```

## 2. Clone the Dotfiles Repository

```bash
git clone https://github.com/Aum-Patel1234/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

## 3. Make the Installer Executable

```bash
chmod +x install.sh
```

## 4. Run the Installer

```bash
./install.sh
```


## 5. Reload Shell

```bash
source ~/.bashrc
```

## 6. Install neovim and lazyVim

```bash
https://github.com/neovim/neovim/blob/master/INSTALL.md

https://www.lazyvim.org/installation
```


## 7. My Own Neovim Config

After installing Neovim and LazyVim, replace the default LazyVim starter config with my personal Neovim configuration.

```bash
rm -rf ~/.config/nvim

git clone https://github.com/Aum-Patel1234/nvim.git ~/.config/nvim
```
