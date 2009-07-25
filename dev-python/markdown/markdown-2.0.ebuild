# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Python implementation of Markdown."
HOMEPAGE="http://www.freewisdom.org/projects/python-markdown/"
SRC_URI="http://pypi.python.org/packages/source/M/Markdown/Markdown-${PV}.tar.gz"
LICENSE="BSD"

SLOT="0"
KEYWORDS="~x86"
IUSE="doc"

S="${WORKDIR}/Markdown-${PV}"

DEPEND=""
RDEPEND=""

NEED_PYTHON=2.5
DOCS="docs/AUTHORS docs/CHANGE_LOG docs/README docs/README.html"

src_install () {
	distutils_src_install
	# Optional extra docs
	if use doc; then
		dodoc docs/*.txt || die "Failed to install docs"
		docinto extensions
		dodoc docs/extensions/*.txt || die "Failed to install extension docs"
	fi
}
