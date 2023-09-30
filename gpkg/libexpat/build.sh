TERMUX_PKG_HOMEPAGE=https://libexpat.github.io/
TERMUX_PKG_DESCRIPTION="An XML parser library"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux-pacman"
TERMUX_PKG_VERSION=2.5.0
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/libexpat/libexpat/releases/download/R_${TERMUX_PKG_VERSION//./_}/expat-${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=6f0e6e01f7b30025fa05c85fdad1e5d0ec7fd35d9f61b22f34998de11969ff67
TERMUX_PKG_DEPENDS="glibc, gcc-libs-glibc"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--without-docbook"