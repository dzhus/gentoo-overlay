# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Python implementation of the Google Chart API."
HOMEPAGE="http://pygooglechart.slowchop.com/"
SRC_URI="http://pygooglechart.slowchop.com/files/download/${P}.tar.gz"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~x86"
IUSE="test examples"

DEPEND="dev-python/setuptools
	test? ( dev-python/nose dev-python/PyQrcodec )"
RDEPEND=""

src_install () {
	distutils_src_install
	if use examples ; then
		insinto /usr/share/doc/${PF}/examples
		doins examples/* || die "Failed to install examples"
	fi
}

src_test () {
	einfo "Running nosetests"
	PYTHONPATH=. "${python}" setup.py nosetests -v || die "Tests failed"
}
