# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PVCUT=$(ver_cut 1-3)
inherit kde.org

DESCRIPTION="Breeze theme for GRUB"

LICENSE="GPL-3+"
SLOT="5"
KEYWORDS=""
IUSE=""

src_prepare() { default; }
src_configure() { :; }
src_compile() { :; }

src_install() {
	insinto /usr/share/grub/themes
	doins -r breeze
}
