# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Find dependencies for a LaTeX file"
HOMEPAGE="http://www.ctan.org/tex-archive/support/texdepend/"
LICENSE="LPPL-1.2"

SRC_URI="http://www.ctan.org/get/support/${PN}.zip"

SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-lang/perl"
RDEPEND="${DEPEND}"

inherit eutils

S="${WORKDIR}/${PN}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/10-more-symbols.patch
}

src_compile() {
	perl Makefile.PL
	emake || die "emake failed"
}

src_install() {
	emake install DESTDIR="${D}"
}