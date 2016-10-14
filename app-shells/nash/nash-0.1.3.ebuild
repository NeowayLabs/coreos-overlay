# Copyright (c) 2015 CoreOS, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI=5
CROS_WORKON_PROJECT="NeowayLabs/nash"
CROS_WORKON_REPO="git://github.com"
CROS_WORKON_LOCALNAME="nash"
COREOS_GO_PACKAGE="github.com/NeowayLabs/nash"
inherit coreos-go cros-workon

if [[ "${PV}" == 9999 ]]; then
    KEYWORDS="~amd64 ~arm64"
else
    CROS_WORKON_COMMIT="1f890f926c508228e04ac0b4cb6c3750fdfdcdf5" # v0.1.3
    KEYWORDS="amd64 arm64"
fi

DESCRIPTION="Nash shell"
HOMEPAGE="https://github.com/NeowayLabs/nash"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

src_compile() {
	go_build "${COREOS_GO_PACKAGE}/cmd/nash"
}

src_install() {
	dobin "${WORKDIR}/gopath/bin/nash"
}
