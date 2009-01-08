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
IUSE="test"

DEPEND="dev-python/setuptools
	test? ( dev-python/PyQrcodec dev-python/nose )"
RDEPEND=""

src_install () {
	distutils_src_install
	dodoc examples/*
}

src_test () {
	einfo "Running nosetests"
	nosetests -v || die "tests failed"
}