# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Russian-specific string utils."
HOMEPAGE="http://pyobject.ru/projects/pytils/"
SRC_URI="http://pypi.python.org/packages/source/p/${PN}/${P}.tar.gz"
LICENSE="BSD"

SLOT="0"
KEYWORDS="~x86"
IUSE="examples"

DEPEND=""
RDEPEND=""

DOCS="doc/README.rus.txt doc/WEBFRAMEWORKS.rus.txt"

src_install () {
	distutils_src_install

	if use examples; then
		for subdir in examples examples-django examples-turbogears; do
			insinto /usr/share/doc/${PF}/${subdir}
			doins doc/${subdir}/* || die "Failed to install examples"
		done
	fi
}
