# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils subversion

MY_PN="GChartWrapper"
DESCRIPTION="Python Google Chart Wrapper."
HOMEPAGE="http://code.google.com/p/google-chartwrapper/"
LICENSE="LGPL"

ESVN_REPO_URI="http://google-chartwrapper.googlecode.com/svn/trunk/"
ESVN_PROJECT="google-chartwrapper-read-only"

SLOT="0"
KEYWORDS="~x86"
IUSE="doc examples"

S="${WORKDIR}/${MY_PN}-${PV}"

src_install() {
	distutils_src_install

	if use doc; then
		dodoc doc/* || die "Failed to install docs"
	fi

	if use examples; then
		insinto /usr/share/doc/${PF}/examples/demo
		doins demo/* || die "Failed to install examples"
		insinto /usr/share/doc/${PF}/examples/templating
		doins -r templating/* || die "Failed to install examples"
	fi
}
