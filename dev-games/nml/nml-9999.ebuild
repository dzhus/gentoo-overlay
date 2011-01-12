# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

PYTHON_DEPEND="2:2.5:2.7"

inherit distutils mercurial

DESCRIPTION="NewGRF Meta Language compiler for OpenTTD."
HOMEPAGE="http://dev.openttdcoop.org/projects/nml"
EHG_REPO_URI="http://hg.openttdcoop.org/nml/"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
