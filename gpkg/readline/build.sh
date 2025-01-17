TERMUX_PKG_HOMEPAGE="https://tiswww.case.edu/php/chet/readline/rltop.html"
TERMUX_PKG_DESCRIPTION="Library that allow users to edit command lines as they are typed in"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux-pacman"
TERMUX_PKG_DEPENDS="ncurses-glibc"
_MAIN_VERSION=8.2
_PATCH_VERSION=1
TERMUX_PKG_VERSION=$_MAIN_VERSION.$_PATCH_VERSION
TERMUX_PKG_SRCURL=https://mirrors.kernel.org/gnu/readline/readline-${_MAIN_VERSION}.tar.gz
TERMUX_PKG_SHA256=3feb7171f16a84ee82ca18a36d7b9be109a52c04f492a053331d7d1095007c35
TERMUX_PKG_CONFFILES="glibc/etc/inputrc"

termux_step_pre_configure() {
	declare -A PATCH_CHECKSUMS

	PATCH_CHECKSUMS[001]=bbf97f1ec40a929edab5aa81998c1e2ef435436c597754916e6a5868f273aff7

	for PATCH_NUM in $(seq -f '%03g' ${_PATCH_VERSION}); do
		PATCHFILE=$TERMUX_PKG_CACHEDIR/readline_patch_${PATCH_NUM}.patch
		termux_download \
			"http://mirrors.kernel.org/gnu/readline/readline-$_MAIN_VERSION-patches/readline${_MAIN_VERSION/./}-$PATCH_NUM" \
			$PATCHFILE \
			${PATCH_CHECKSUMS[$PATCH_NUM]}
		patch -p0 -i $PATCHFILE
	done
}

termux_step_post_make_install() {
	mkdir -p $TERMUX_PREFIX/lib/pkgconfig
	cp readline.pc $TERMUX_PREFIX/lib/pkgconfig/

	mkdir -p $TERMUX_PREFIX/etc
	cp $TERMUX_PKG_BUILDER_DIR/inputrc $TERMUX_PREFIX/etc/
}
