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
    x86_64)    echo "amd64" ;;
    i386|i686) echo "386" ;;
    armv7l|armv6l) echo "arm" ;;
    aarch64|arm64) echo "arm64" ;;
    *)         echo "unknown" ;;
  esac
}
GOOS=$(get_goos)
GOARCH=$(get_goarch)

mkdir -p $POSH_PATH/bin/ $POSH_PATH/themes/
wget -O $POSH_PATH/bin/oh-my-posh "$(curl -s https://api.github.com/repos/JanDeDobbeleer/oh-my-posh/releases/latest | grep browser_download_url | grep posh-$GOOS-$GOARCH | cut -d '"' -f 4)"
chmod +x $POSH_PATH/bin/oh-my-posh

wget -O $POSH_PATH/bin/xposh.bashrc.sh https://github.com/xcanwin/xposh/raw/refs/heads/main/bin/xposh.bashrc.sh
wget -O $POSH_PATH/themes/xposh.omp.json https://github.com/xcanwin/xposh/raw/refs/heads/main/themes/xposh.omp.json
wget -O $POSH_PATH/themes/xposh.minimal.omp.json https://github.com/xcanwin/xposh/raw/refs/heads/main/themes/xposh.minimal.omp.json

start='# >>> xposh init >>>'
end='# <<< xposh init <<<'
block="$start
. $POSH_PATH/bin/xposh.bashrc.sh
$end"
rcs=(~/.bashrc ~/.zshrc)
for rc in "${rcs[@]}"; do
  [ -f "$rc" ] || continue
  sed -i.bak "/$start/,/$end/d" "$rc"
  echo -e "\n$block" >> "$rc"
done
