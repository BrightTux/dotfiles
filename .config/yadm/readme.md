## BrightTux Dotfiles repo

Welcome to my personal dotfiles repo.
Here's my current config, typically I would be running linux via Manjaro.

This repo contains dotfiles for:
1. nvim
2. starship
3. dwm
4. tmux
5. zsh
6. qtile (whenever i feel like switching back to)

Setup:
1. Install XFCE Manjaro.
2. git clone Dotfiles repo.
3. Install other supporting applications.

Tips:
Start tmate -F automatically as a service

```
# sudo nvim /etc/systemd/system/tmate.service 
# Add the appropriate API key and authorized SSH key into ~/.tmate.conf
[Unit]
Description=Autoboot tmate -F service
After=network.target
StartLimitIntervalSec=0

[Service]
Restart=always
RestartSec=1
User=tux
Exec=/usr/bin/tmate -F

[Install]
WantedBy=multi-user.target
```
