#!/usr/bin/env bash

set -e -x

{ # this ensures the entire script is downloaded #

git clone https://github.com/galderz/init ~/.init
pushd ~/.init
make
popd

} # this ensures the entire script is downloaded #
