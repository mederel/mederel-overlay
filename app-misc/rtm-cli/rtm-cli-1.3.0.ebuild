# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Remember the Milk Command Line Interface"
HOMEPAGE="https://github.com/dwaring87/rtm-cli"
SRC_URI="https://github.com/dwaring87/rtm-cli/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-libs/nodejs-9.0[npm]"
RDEPEND="${DEPEND}"

src_compile() {
	npm install || die "error npm install"
}

src_install() {
	npm pack . || die "error npm pack"
	npm install -g --prefix "${D}/usr" ${P}.tgz || die "error npm install -g"
}

