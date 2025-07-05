POSH_PATH=~/tool/oh-my-posh

get_goos() {
    case "$(uname -s)" in
        FreeBSD) echo "freebsd" ;;
        Darwin)  echo "darwin" ;;
        Linux)   echo "linux" ;;
        *)       echo "unknown" ;;
    esac
}

get_goarch() {
    case "$(uname -m)" in
        x86_64|amd64)   echo "amd64" ;;
        i386|i686)      echo "386" ;;
        armv7l|armv6l)  echo "arm" ;;
        aarch64|arm64)  echo "arm64" ;;
        *)              echo "unknown" ;;
    esac
}

download_font() {
    TARBALL=/tmp/FiraCode.tar.xz
    TMPDIR=/tmp/nerd-fonts-firacode
    INSTALL_DIR=~/.local/share/fonts
    curl -L -o "$TARBALL" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.tar.xz
    mkdir -p "$TMPDIR" "$INSTALL_DIR"
    tar -xf "$TARBALL" -C "$TMPDIR"
    cp "$TMPDIR/FiraCodeNerdFont-SemiBold.ttf" "$INSTALL_DIR"
}

config_font() {
    fc-cache -fv
    gnome_font=$(gsettings get org.gnome.desktop.interface monospace-font-name 2>/dev/null)
    if [[ -n "$gnome_font" && "$gnome_font" != "''" ]]; then
        echo "current font: $gnome_font"
        gsettings set "org.gnome.desktop.interface" monospace-font-name 'FiraCode Nerd Font Semi-Bold 10'
    fi
}

download_omp() {
    GOOS=$(get_goos)
    GOARCH=$(get_goarch)
    omp_url=$(curl -L -fsS https://api.github.com/repos/JanDeDobbeleer/oh-my-posh/releases/latest | grep browser_download_url | grep posh-$GOOS-$GOARCH | cut -d '"' -f 4)
    curl -L -o $POSH_PATH/bin/oh-my-posh "$omp_url"
}

config_omp() {
    chmod +x $POSH_PATH/bin/oh-my-posh
}

download_xposh() {
    rm -rf /tmp/xposh*
    curl -L -o /tmp/xposh.zip https://codeload.github.com/xcanwin/xposh/zip/refs/heads/main
    unzip /tmp/xposh.zip -d /tmp/
    cp -r /tmp/xposh-*/{bin,themes} $POSH_PATH
}

config_xposh() {
    start='# >>> xposh init >>>'
    end='# <<< xposh init <<<'
    block="$start
. $POSH_PATH/bin/xposh.bashrc.sh
$end"
    rcs=(~/.bashrc ~/.zshrc)
    for rc in "${rcs[@]}"; do
    [ -f "$rc" ] || continue
    sed -i.bak "/$start/,/$end/d" "$rc"
    printf "\n$block\n" >> "$rc"
    done
}

mkdir -p $POSH_PATH/{bin,themes}
download_font
download_omp
download_xposh
config_font
config_omp
config_xposh
printf "\n[+] OK\n"
