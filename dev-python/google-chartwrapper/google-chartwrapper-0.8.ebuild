# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

MY_PN="GChartWrapper"
DESCRIPTION="Python Google Chart Wrapper."
HOMEPAGE="http://code.google.com/p/google-chartwrapper/"
LICENSE="LGPL"

ESVN_REPO_URI="http://google-chartwrapper.googlecode.com/svn/trunk/"
ESVN_PROJECT="google-chartwrapper-read-only"

SLOT="0"
KEYWORDS="~x86"
IUSE=""

S="${WORKDIR}/${MY_PN}-${PV}"