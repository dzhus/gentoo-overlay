# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit perl-app

DESCRIPTION="Biber is a BibTeX replacement for users of biblatex"
HOMEPAGE="http://biblatex-biber.sourceforge.net/"
SRC_URI="http://downloads.sourceforge.net/project/${PN}/${PN}/${PV}/${PN}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RESTRICT="mirror"

DEPEND=">=dev-lang/perl-5.14
	virtual/perl-Module-Build"
RDEPEND="dev-perl/config-general
	dev-perl/Data-Dump
	dev-perl/Data-Compare
	dev-perl/Date-Simple
	dev-perl/File-Slurp-Unicode
	dev-perl/File-Which
	dev-perl/IPC-Run3
	perl-core/IPC-Cmd
	dev-perl/List-AllUtils
	dev-perl/regexp-common
	dev-perl/Log-Log4perl
	dev-perl/Readonly
	dev-perl/Readonly-XS
	dev-perl/Unicode-String
	dev-perl/XML-LibXML-Simple
	dev-perl/XML-LibXSLT
	dev-perl/libwww-perl
	dev-perl/XML-Writer-String
	>=dev-perl/Text-BibTeX-0.62
	>=dev-perl/Unicode-Collate-0.89
	>=dev-tex/biblatex-1.7"

S="${WORKDIR}/${PN}-v${PV}"

SRC_TEST="do"
