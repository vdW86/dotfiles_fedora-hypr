# Dependencies
sudo dnf install meson ninja-build gcc gcc-c++ pkg-config cairo-devel pango-devel \
wayland-protocols-devel libxkbcommon-devel libevdev-devel systemd-devel git

# Clone de repo
git clone https://github.com/mortie/swaylock-effects.git ~/dotfiles/build/swaylock-effects
cd ~/dotfiles/build/swaylock-effects

# Build & install
meson build --prefix=/usr
ninja -C build
sudo ninja -C build install
