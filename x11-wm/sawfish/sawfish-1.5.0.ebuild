# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils autotools

DESCRIPTION="Extensible window manager using a Lisp-based scripting language"
HOMEPAGE="http://sawmill.sourceforge.net/"
SRC_URI="mirror://sourceforge/sawmill/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="audiofile esd gnome nls"

RDEPEND=">=dev-libs/librep-0.90.0
	>=x11-libs/gtk+-2.6.0
	>=x11-libs/pango-1.8.0
	>=x11-libs/rep-gtk-0.18.4
	audiofile? ( >=media-libs/audiofile-0.2.3 )
	esd? ( >=media-sound/esound-0.2.23 )
	nls? ( sys-devel/gettext )"
DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.12.0"

src_unpack() {
	unpack ${A}
	cd "${S}"
	# Add CFLAGS in Makefile.in
	epatch "${FILESDIR}"/${P}-cflags.patch

	eautoreconf
}

src_compile() {
	# Make sure we include freetype2 headers before freetype1 headers,
	# else Xft2 borks, <azarah@gentoo.org> (13 Dec 2002)
	export C_INCLUDE_PATH="${C_INCLUDE_PATH}:/usr/include/freetype2"
	export CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}:/usr/include/freetype2"

	local gnomeconf

	if use gnome; then
		gnomeconf="--with-gnome-prefix=/usr"
	fi

	if ! use nls; then
		# Use a space because configure script reads --enable-linguas="" as
		# "install everything"
		# Don't use --disable-linguas, because that means --enable-linguas="no",
		# which means "install Norwegian translations"
		set -- "$@" --enable-linguas=" "
	elif [[ "${LINGUAS+set}" == "set" ]]; then
		strip-linguas -i po
		set -- "$@" --enable-linguas=" ${LINGUAS} "
	else
		set -- "$@" --enable-linguas=""
	fi

	econf ${gnomeconf} \
		"$@"
		--with-gdk-pixbuf \
		$(use_with audiofile) \
		$(use_with esd)

	# The following two lines allow sawfish to compile with gcc 2.95
	# (see bug 18294)
	sed -i -e 's:REP_CFLAGS=:REP_CFLAGS=-I/usr/include/freetype2 :' Makedefs

	emake || die "make failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS BUGS ChangeLog NEWS TODO THANKS
	dodoc FAQ DOC USERDOC README README.IMPORTANT KEYBINDINGS OPTIONS
	newdoc src/ChangeLog ChangeLog.src
}
