# GUIDE TO MY FIRST INSTALLATION

## Setelah Install dan Repo
**Update menggunakan** 
``` bash
sudo dnf upgrade --refresh -y
```

**Pasang `rpm fusion` buat codec** 
``` bash
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```
**Pasang `Nix`**
``` bash
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

## Atur DNS 
**Ubah `resolved` dengan cara** 
``` bash
sudo nano /etc/systemd/resolved.conf 
```

**dan diisi**

``` conf
[Resolve]
DNS=1.1.1.1 9.9.9.9
DNSOverTLS=yes
DNSSEC=no
``` 
l**alu atur dengan**

``` bash
sudo systemctl enable --now systemd-resolved
```

## Atur Firewall
**Atur firewall dengan konfigurasi seperti ini:**
``` bash
sudo firewall-cmd --runtime-to-permanent
sudo firewall-cmd --add-rich-rule='rule family=ipv4 port port="53" protocol="udp" drop'
sudo firewall-cmd --add-rich-rule='rule family=ipv4 port port="53" protocol="tcp" drop'
sudo firewall-cmd --remove-port=8080/tcp --permanent
sudo firewall-cmd --remove-port=8081-65535/tcp --permanent
sudo firewall-cmd --remove-port=1025-8079/tcp --permanent
sudo firewall-cmd --remove-port=1025-65535/udp --permanent
sudo firewall-cmd --add-port=1714-1764/tcp --permanent 
sudo firewall-cmd --add-port=1714-1764/udp --permanent 
sudo firewall-cmd --reload
```

## Install Aplikasi

**Dengan `dnf`**
``` bash
sudo dnf install zsh vim neovim vlc mpv alacritty
```
**Dengan `flatpak`**
``` bash
flatpak install flathub app.zen_browser.zen com.brave.Browser com.mattjakeman.ExtensionManager com.vscodium.codium md.obsidian.Obsidian org.ferdium.Ferdium org.onlyoffice.desktopeditors
```

## Restore Backup 

**Restore backup dari SSD**
``` bash
rsynch -a --numeric-ids --relative /run/media/tenka/Techbyte/FILE-IRWAN/Lokasi_Backup/ /home/tenka/
```
**Restore backup dari GitHub**
``` bash
git clone git@github.com:tenkaasikinn/mydotfiles.git
```
## Konfigurasi `Nix`

Buka Repo ***mydotfiles*** yang udah di clone **nix_configuration_file** dan temukan `flake.nix`
kemudian jalankan perintah ini 
```zsh
mkdir -p ~/.config/home-manager
cp flake.nix ~/.config/home-manager
cd ~/.config/home-manager
```
cek dulu isinya pakai `nano` atau `vim` lalu jalankan 

``` bash
nix run home-manager/master -- switch --flake .#tenka
```

**Untuk update Nix** 
gunakan
```zsh
nix flake update
```
ingat di lokasi flake.nix berada

## Ricing

**Ubah shell dari** `bash` ke `zsh`

``` bash
chsh -s /bin/zsh 
```

Download beberapa stuff diluar Github
- [Oh My Posh](https://ohmyposh.dev/)
- [Lazyvim](https://www.lazyvim.org/)


## Setup Browser

### List Browser
1. **Zen Browser Browser** browser default
2. **Brave** Browser nonton Youtube

### List Extension
1. **Proton Pass** *[Zen](https://addons.mozilla.org/en-US/firefox/addon/proton-pass/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search)*, *[Brave](https://chromewebstore.google.com/detail/proton-pass-free-password/ghmbeldphafepmbegfdlkpapadhbakde?hl=en-US)* 
2. **uBlock Origin** *[Zen](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)*  
3. **Multi Account Container** *[Zen](https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search)* 
4. **Block Youtube Shorts** *[Zen](https://addons.mozilla.org/en-US/firefox/addon/block-utube-shorts/)*
5. **Clear Urls** *[Zen](https://addons.mozilla.org/en-US/firefox/addon/clearurls/)*

### List Web wajib di pin
**Essential**
- [Notion](notion.so)
- [GitHub](github.com)
- [Spotify](https://open.spotify.com/)

**Pin di profil personal**
- [ChatGPT](chatgpt.com)
- [Claude](claude.ai)

**Pin di profil coding**
- [W3Schools](w3shcools.com)
- [Docker Tutorial](https://docker-curriculum.com/)
- [Rust Tutorial](https://doc.rust-lang.org/stable/book/title-page.html)

### Setting Wajib di Browser
- Only HTTPS
- DoH Cloudflare
- Buat Container untuk setiap akun sosmed menggunakan *multi account container*