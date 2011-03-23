# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

PYTHON_DEPEND="2"
PYTHON_MODNAME="${PN//-/_}"

inherit distutils python

DESCRIPTION="python-openid support for Django"
HOMEPAGE="http://code.google.com/p/django-openid-consumer/"
LICENSE="BSD"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-python/django-1.0
	>=dev-python/python-openid-2.0"

pkg_postinst() {
	distutils_pkg_postinst

	elog "Add 'django_openid_consumer' to INSTALLED_APPS in"
	elog "settings.py of your Django project to use this package."
}
