# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils subversion

DESCRIPTION="A generic tagging application for Django projects"
HOMEPAGE="http://code.google.com/p/django-tagging/"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~x86"
IUSE=""

ESVN_REPO_URI="http://django-tagging.googlecode.com/svn/trunk/"
ESVN_PROJECT="django-tagging-read-only"

DEPEND=""
RDEPEND=">=dev-python/django-1.0"

DOCS="docs/overview.txt"
