# PETUNJUK PENGGUNAAN

> *This script was writed in Bahasa Indonesia, if you're coming from International please read the [README.md](README.md)* 

## 1. Setelah Install dan Repo
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
**Pasang `Nix` dan aktifkan flake**
``` bash
sh <(curl -L https://nixos.org/nix/install) --no-daemon
export NIX_CONFIG="experimental-features = nix-command flakes"
```

## 2. Restore Backup 

**Restore backup dari SSD**
``` bash
rsynch -a --numeric-ids --relative /run/media/tenka/Techbyte/FILE-IRWAN/Lokasi_Backup/ /home/tenka/
```
**Restore backup dari GitHub**
``` bash
git clone git@github.com:tenkaasikinn/mydotfiles.git
```

## 3. Atur DNS dan Firewall
**Ubah `resolved` dengan cara** 
Masuk ke Repo ***mydotfiles*** yang udah di clone dengan menggunakan perintah ini:
``` bash
cd ~/mydotfiles/config_dns_&_firewall
```
lalu jalankan perintah ini
``` bash
sudo ./dns-config.sh
```

**Atur firewall**
Masih di directory ***mydotfiles/config_dns_&_firewall*** jalankan perintah ini:
``` bash
sudo ./firewall-config.sh
```

## 4. Install Aplikasi yang diperlukan

Masuk ke Repo ***mydotfiles*** yang udah di clone dengan menggunakan perintah ini
``` bash
cd ~/mydotfiles/install_aplikasi
```
cek dulu isinya pakai `nano` atau `vim` lalu jalankan
``` bash
sudo ./install-aplikasi.sh
```

## 5. Konfigurasi `Nix`

Masuk ke Repo ***mydotfiles*** yang udah di clone dengan menggunakan perintah ini 
```zsh
cd ~/mydotfiles/nix_configuration_files
```
cek dulu isinya pakai `nano` atau `vim` lalu jalankan 

``` bash
nix run home-manager/master -- switch --flake .#tenka
```

**Untuk update Nix** 
gunakan
```zsh
nix flake update
nix run home-manager/master -- switch --flake .#tenka
```
ingat di lokasi flake.nix berada

## 6. Ricing

**Ubah shell dari** `bash` ke `zsh`

``` bash
chsh -s /bin/zsh 
```
masuk ke repo ***mydotfiles*** dan copy beberapa file berikut
- **zsh/.zshrc** ke home
- **oh-my-posh/jandedobbeleer.omp.json** ke home **Install oh my posh terlebih dahulu sebelum ricing**
- **alacritty/`*`** ke home bagian *.config* kalau belum ada folder alacritty tolong buat dulu
- **fastfetch/`*`** ke home bagian *.config* kalau belum ada folder fastfetch tolong buat dulu

Download beberapa stuff diluar Github
- [Oh My Posh](https://ohmyposh.dev/)
- [Lazyvim](https://www.lazyvim.org/)
- [Tela Circle Icon](https://www.gnome-look.org/p/1359276)
- [Bibata Ice Cursor](https://www.gnome-look.org/p/1197198)


## 7. Setup Browser

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