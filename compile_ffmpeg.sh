#!/bin/bash

# Taken from https://trac.ffmpeg.org/wiki/UbuntuCompilationGuide

echo "Getting dependencies."
#sudo apt-get update
sudo apt-get -y install autoconf automake build-essential git libass-dev libgpac-dev \
    libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libx11-dev \
    libxext-dev libxfixes-dev pkg-config texi2html zlib1g-dev
mkdir -p ~/ffmpeg_sources

echo "Installing yasm"
wget http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz
tar xzvf yasm-1.2.0.tar.gz
cd yasm-1.2.0
./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin"
make
make install
make distclean
. ~/.profile

echo "Install x264"
cd ~/ffmpeg_sources
git clone --depth 1 git://git.videolan.org/x264.git
cd x264
./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --enable-static
make
make install
make distclean

echo "Install fdk-aac"
cd ~/ffmpeg_sources
git clone --depth 1 git://github.com/mstorsjo/fdk-aac.git
cd fdk-aac
autoreconf -fiv
./configure --prefix="$HOME/ffmpeg_build" --disable-shared
make
make install
make distclean

echo "Install ffmpeg"
cd ~/ffmpeg_sources
git clone --depth 1 git://source.ffmpeg.org/ffmpeg
cd ffmpeg
PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig"
./configure --prefix="$HOME/ffmpeg_build" \
    --extra-cflags="-I$HOME/ffmpeg_build/include" --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
    --bindir="$HOME/bin" --extra-libs="-ldl" --enable-gpl --enable-libass --enable-libfdk-aac \
    --enable-libx264 --enable-nonfree
#    --enable-libmp3lame --enable-libopus --enable-libtheora --enable-libvorbis --enable-libvpx \
make
make install
make distclean
hash -r

