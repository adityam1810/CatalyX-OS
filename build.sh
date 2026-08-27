#!/bin/bash
set -e

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOTFS="$PROJECT_DIR/build/rootfs"
ISO_DIR="$PROJECT_DIR/build/iso"
OUTPUT_DIR="$PROJECT_DIR/build/output"

CONFIG="$PROJECT_DIR/config/catalyx.conf"
PACKAGES="$PROJECT_DIR/config/packages"

echo "=========================================="
echo "        CatalyX OS ISO Builder"
echo "=========================================="
echo

source "$CONFIG"

echo "CatalyX OS $VERSION"
echo "Codename: $CODENAME"
echo "Base: $BASE"
echo

echo "[1/5] Preparing build directories..."

sudo mkdir -p "$ROOTFS" "$ISO_DIR/live" "$ISO_DIR/boot/grub" "$OUTPUT_DIR"

echo
echo "[2/5] Checking Debian root filesystem..."

if [ ! -f "$ROOTFS/etc/debian_version" ]; then
    echo "ERROR: Debian rootfs not found."
    echo "Run the debootstrap stage first."
    exit 1
fi

echo "Debian rootfs found:"
sudo cat "$ROOTFS/etc/debian_version"

echo
echo "[3/5] Installing CatalyX files..."

sudo mkdir -p \
    "$ROOTFS/etc/distro" \
    "$ROOTFS/usr/local/bin" \
    "$ROOTFS/usr/local/lib/distro/modules"

sudo cp "$CONFIG" "$ROOTFS/etc/distro/config"
sudo cp "$PROJECT_DIR/scripts/distro" "$ROOTFS/usr/local/bin/distro"
sudo cp "$PROJECT_DIR/modules/"* \
    "$ROOTFS/usr/local/lib/distro/modules/"

sudo chmod +x "$ROOTFS/usr/local/bin/distro"
sudo chmod +x "$ROOTFS/usr/local/lib/distro/modules/"*

echo
echo "[4/5] Configuring CatalyX..."

echo "$OS_NAME" | sudo tee "$ROOTFS/etc/hostname" >/dev/null

sudo tee "$ROOTFS/etc/issue" >/dev/null <<'BANNER'
+------------------------------------------------------------------------------+
|                                                                              |
|       CCCCC    AAA   TTTTT  AAA   L      Y   Y  X   X                     |
|      C        A   A    T   A   A  L       Y Y    X X                      |
|      C        AAAAA    T   AAAAA  L        Y      X                       |
|      C        A   A    T   A   A  L        Y     X X                      |
|       CCCCC   A   A    T   A   A  LLLLL    Y    X   X                     |
|                                                                              |
|                              CATALYX OS                                     |
|                           [ CODENAME: MODI ]                                |
|                                                                              |
|                       VERSION 0.1 | DEBIAN-BASED                            |
|                       CLOUD * SECURITY * DEVOPS                             |
|                                                                              |
|    [ CLOUD ] [ SECURITY ] [ DEVOPS ] [ NETWORK ] [ STORAGE ]                |
|    [ USERS ] [ PACKAGES ] [ SERVICES ]                                      |
|                                                                              |
|                 Welcome to CatalyX OS                                       |
|                                                                              |
+------------------------------------------------------------------------------+
BANNER

echo
echo "[5/5] Configuring Live user..."

sudo chroot "$ROOTFS" /bin/bash -c '
    if ! id catalyx >/dev/null 2>&1; then
        useradd -m -s /bin/bash catalyx
    fi

    usermod -aG sudo catalyx
'

sudo mkdir -p "$ROOTFS/etc/systemd/system/getty@tty1.service.d"

sudo tee "$ROOTFS/etc/systemd/system/getty@tty1.service.d/autologin.conf" >/dev/null <<'EOF'
[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin catalyx --noclear %I $TERM
EOF
echo
echo "[5/5] Preparing kernel and Live filesystem..."

KERNEL=$(sudo find "$ROOTFS/boot" -maxdepth 1 -name 'vmlinuz-*' -type f | head -n 1)
INITRD=$(sudo find "$ROOTFS/boot" -maxdepth 1 -name 'initrd.img-*' -type f | head -n 1)

if [ -z "$KERNEL" ] || [ -z "$INITRD" ]; then
    echo "ERROR: Kernel or initrd not found."
    exit 1
fi

sudo cp "$KERNEL" "$ISO_DIR/live/vmlinuz"
sudo cp "$INITRD" "$ISO_DIR/live/initrd"

echo
echo "Creating SquashFS..."

sudo rm -f "$ISO_DIR/live/filesystem.squashfs"

sudo mksquashfs "$ROOTFS" \
    "$ISO_DIR/live/filesystem.squashfs" \
    -comp xz \
    -e boot

echo
echo "Creating GRUB configuration..."

sudo tee "$ISO_DIR/boot/grub/grub.cfg" >/dev/null <<'GRUB'
set timeout=5
set default=0

menuentry "CatalyX OS 0.1 - MODI" {
    linux /live/vmlinuz boot=live
    initrd /live/initrd
}
GRUB

echo
echo "Building ISO..."

sudo grub-mkrescue \
    -o "$OUTPUT_DIR/CatalyX-OS-0.1-MODI.iso" \
    "$ISO_DIR"

echo
echo "=========================================="
echo "        BUILD COMPLETE"
echo "=========================================="
echo
echo "ISO:"
echo "$OUTPUT_DIR/CatalyX-OS-0.1-MODI.iso"
echo
