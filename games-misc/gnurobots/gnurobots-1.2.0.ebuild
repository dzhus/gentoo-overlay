# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="Construct a program for a little robot, then set him loose to explore the world on his own"
HOMEPAGE="http://www.gnu.org/software/gnurobots/"
SRC_URI="mirror://gnu/gnurobots/${P}.tar.gz"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=">=dev-libs/glib-2.4
	>=dev-scheme/guile-1.8
	>=x11-libs/gtk+-2.4
	x11-libs/vte"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc doc/Robots-HOWTO
}