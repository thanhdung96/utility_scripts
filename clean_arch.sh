sudo pacman -Sc
sudo pacman -Qdt
sudo pacman -Rns $(pacman -Qtdq)
sudo journalctl --vacuum-size=50M
