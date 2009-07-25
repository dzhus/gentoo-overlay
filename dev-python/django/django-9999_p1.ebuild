# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# THIS IS WICKED. DON'T TRY THIS AT HOME.
source /usr/portage/dev-python/django/django-9999.ebuild

src_prepare() {
	epatch "${FILESDIR}/object-list-orphans-support.diff"
}