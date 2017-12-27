# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Console tool to split and merge PDF files."
HOMEPAGE="http://sejda.org/"
SRC_URI="https://github.com/torakiki/sejda/releases/download/v${PV}/sejda-console-${PV}-bin.zip"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	virtual/jdk:1.8
"

S="${WORKDIR}/sejda-console-${PV}"

src_install() {
	insinto "/opt/sejda-console-${PV}"
	doins -r "lib"
	doins -r "etc"
	
	exeinto "/opt/sejda-console-${PV}/bin"
	doexe "bin/sejda-console"

	dosym "/opt/sejda-console-${PV}/bin/sejda-console" "/opt/bin/sejda-console"
}
