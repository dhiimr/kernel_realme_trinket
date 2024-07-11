COMMON_PATH="$(cd "$(dirname "$0")/../" >/dev/null 2>&1 && pwd)"
KERNEL_PATH="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd)"

make -o out ARCH=arm64 vendor/RMX1911_defconfig
PATH="$COMMON_PATH/proton-clang/bin:$PATH"
make -o out \
	ARCH=arm64
	CC=clang
	CROSS_COMPILE=aarch64-linux-gnu- \
	CROSS_COMPILE_ARM32=arm-linux-gnueabi- \
	-j4
