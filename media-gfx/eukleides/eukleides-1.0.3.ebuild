# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Eukleides is a Euclidean geometry drawing language with
	output to LaTeX, EPS and other vector formats."
HOMEPAGE="http://www.eukleides.org/"
SRC_URI="http://www.eukleides.org/download/${PN}.${PV}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="media-gfx/pstoedit
	dev-texlive/texlive-pstricks"

inherit eutils toolchain-funcs
S="${WORKDIR}/${PN}.${PV}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	sed -i -e "s:gcc:$(tc-getCC):" -e "s:-O2:${CFLAGS}:" Makefile \
		|| die "Failed to fix compiler in Makefile"
	echo "geometry.o drawing.o: parser.tab.c" >> Makefile \
		|| die "Failed to fix Makefile dependencies"
}

src_compile() {
	emake || die "emake failed"
	emake info || die "emake failed on docs"
}

src_install() {
	dobin eukleides
	doman eukleides.1
	doinfo eukleides.info
	dobin euk2eps
	dobin euk2edit
}