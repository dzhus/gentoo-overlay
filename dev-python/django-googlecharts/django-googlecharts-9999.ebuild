# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit python git

DESCRIPTION="Google Chart API for Django"
HOMEPAGE="http://github.com/jacobian/django-googlecharts"
LICENSE="BSD"

EGIT_REPO_URI="git://github.com/jacobian/django-googlecharts.git"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND=""
RDEPEND="dev-python/django"

src_install() {
	INSTO="$(python_get_sitedir)/${PN}"
	insinto "${INSTO}"
	doins -r googlecharts/*

	if use examples; then
		insinto /usr/share/doc/${PF}/
		doins docs/examples.html
		dodoc docs/examples.txt
	fi
}

pkg_postinst() {
	INSTO="$(python_get_sitedir)/${PN}"
	python_mod_optimize "${INSTO}"

	elog "Add 'django-googlecharts' to INSTALLED_APPS in"
	elog "settings.py of your Django project to use this package."
}
