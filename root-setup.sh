#!/bin/bash

set -e          # Exit on error
set -o pipefail # Exit on pipe error
set -x          # Enable verbosity

ROOT_VERSION="root_v6.10.00"
ROOT_SOURCETAR="root_v6.10.00.source.tar.gz"

cd

wget "https://root.cern.ch/download/$ROOT_SOURCETAR"

# Prerrequisites
# sudo dnf install -y git
# sudo dnf install -y make
# sudo dnf install -y cmake
# sudo dnf install -y gcc-c++
# sudo dnf install -y gcc
# sudo dnf install -y binutils
# sudo dnf install -y libX11-devel
# sudo dnf install -y libXpm-devel
# sudo dnf install -y libXft-devel
# sudo dnf install -y libXext-devel
# sudo dnf install -y python
# sudo dnf install -y redhat-lsb-core

# sudo dnf install -y gcc-gfortran
# sudo dnf install -y openssl-devel
# sudo dnf install -y pcre-devel
# sudo dnf install -y mesa-libGL-devel
# sudo dnf install -y mesa-libGLU-devel
# sudo dnf install -y glew-devel
# sudo dnf install -y ftgl-devel
# sudo dnf install -y mysql-devel
# sudo dnf install -y fftw-devel
# sudo dnf install -y cfitsio-devel
# sudo dnf install -y graphviz-devel
# sudo dnf install -y avahi-compat-libdns_sd-devel
# # sudo dnf install -y libldap-dev
# sudo dnf install -y python-devel
# # sudo dnf install -y python-numpy-devel
# sudo dnf install -y libxml2-devel
# # sudo dnf install -y gsl-static
# sudo dnf install -y R

mkdir $ROOT_VERSION
tar -xf $ROOT_SOURCETAR --strip-components=1 -C $ROOT_VERSION

mkdir ".root-build"
cd ".root-build"
cmake "../$ROOT_VERSION"
cmake --build . -- "-j$(nproc --all)"

cd ..

mv ".root-build" .root

rm $ROOT_SOURCETAR
rm -rf $ROOT_VERSION

echo 'source "$HOME/.root/bin/thisroot.sh"' >> ~/.bashrc
echo 'source "$HOME/.root/bin/thisroot.sh"' >> ~/.zshrc

mkdir -p ~/.local/share/jupyter/kernels
cp -r $ROOTSYS/etc/notebook/kernels/root ~/.local/share/jupyter/kernels
