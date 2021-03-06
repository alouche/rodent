#!/usr/bin/env bash

cd "$(dirname "$0")"

RODENT_GOROOT_TOP="$(mktemp -d 2>/dev/null || mktemp -d -t 'rodent')"
export RODENT_GOROOT_TOP

#versions=($(./rodent install -l |grep "go"))
#RODENT_GOLANG_VERSION=${versions[$RANDOM % ${#RANDOM[*]}]}
RODENT_GOLANG_VERSION="go1.4rc2"
export RODENT_GOLANG_VERSION

export RODENT_DISABLE_RC_SECURITY=true

bash ./tests/bin/roundup tests/*.def
