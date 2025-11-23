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


## 2. Reload Shell

```bash
source ~/.bashrc
```