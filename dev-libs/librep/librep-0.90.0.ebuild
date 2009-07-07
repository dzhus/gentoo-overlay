# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/librep/librep-0.17.3.ebuild,v 1.1 2009/03/08 20:06:34 truedfx Exp $

inherit eutils multilib elisp-common

DESCRIPTION="Shared library implementing a Lisp dialect"
HOMEPAGE="http://librep.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~ppc ~ia64"
IUSE="emacs readline"

RDEPEND=">=sys-libs/gdbm-1.8.0
	dev-libs/gmp
	virtual/libffi
	emacs? ( virtual/emacs )
	readline? ( sys-libs/readline )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	sys-apps/texinfo"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-disable-elisp.patch
	eautoreconf
	elibtoolize || die "elibtoolize failed"
	epunt_cxx
}

src_compile() {
	local myconf="$(use_with readline)"
	use ppc && myconf="${myconf} --with-stack-direction=1"

	# It seems that stack-direction=-1 for gcc-3.x and 1 for gcc-4.x on ia64
	if use ia64 && [[ $(gcc-major-version) -ge 4 ]]; then
		myconf="${myconf} --with-stack-direction=1"
	fi

	econf \
		--libexecdir=/usr/$(get_libdir) \
		--with-ffi \
		--with-ffi-prefix=/usr/$(get_libdir)/libffi-$(pkg-config libffi --modversion)/ \
		$(use_with readline)

	emake || die "make failed"

	if use emacs; then
		elisp-compile rep-debugger.el || die "elisp-compile failed"
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS BUGS ChangeLog NEWS README THANKS TODO TREE
	docinto doc
	dodoc doc/*

	if use emacs; then
		elisp-install ${PN} rep-debugger.{el,elc} || die "elisp-install failed"
		elisp-site-file-install "${FILESDIR}/50${PN}-gentoo.el" \
			|| die "elisp-site-file-install failed"
	fi
}

pkg_postinst() {
	use emacs && elisp-site-regen
}

pkg_postrm() {
	use emacs && elisp-site-regen
}
