#!/usr/bin/env bash
void

# Config
MAINTAINER="Jeff Niu"
VERSION=3.4.0

# Adapted from http://www.pyimagesearch.com/2016/10/24/ubuntu-16-04-how-to-install-opencv/
apt-get install --yes libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev libavcodec-dev libavformat-dev \
			libswscale-dev libxvidcore-dev libx264-dev libv4l-dev liblapacke-dev libgtk-3-dev \
			libopenblas-dev libhdf5-dev libtesseract-dev libleptonica-dev \
			python3-numpy python3-dev checkinstall cmake gfortran curl
			
# Make a new directory
rm -rf ~/opencv-build
mkdir ~/opencv-build
cd ~/opencv-build

# Download OpenCV
curl -L https://github.com/opencv/opencv/archive/${VERSION}.tar.gz | tar xz
curl -L https://github.com/opencv/opencv_contrib/archive/${VERSION}.tar.gz | tar xz

cd opencv-${VERSION}
# Make build directory.
mkdir build
# Change to 
cd build 
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D BUILD_SHARED_LIBS=ON \
    -D INSTALL_PYTHON_EXAMPLES=OFF \
    -D INSTALL_C_EXAMPLES=OFF \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv-build/opencv_contrib-${VERSION}/modules \
    -D PYTHON_DEFAULT_EXECUTABLE=$(which python3) \
    -D PYTHON_EXECUTABLE=$(which python3) \
    -D ENABLE_FAST_MATH=ON \
    -D CUDA_FAST_MATH=ON \
    -D WITH_CUDA=ON \
    -D WITH_CUBLAS=ON \
    -D WITH_NVCUVID=ON \
    -D BUILD_EXAMPLES=OFF \
    -D WITH_QT=ON \
    -D WITH_XINE=ON \
    -D WITH_OPENGL=ON ..

make -j8
make

checkinstall --default \
--type debian --install=no \
--pkgname opencv3 \
--pkgversion "${VERSION}" \
--pkglicense BSD \
--deldoc --deldesc --delspec \
--requires "libtesseract3,ffmpeg,libjasper1" \
--pakdir ~ --maintainer "${MAINTAINER}" --provides opevcv3 \
--addso --autodoinst \
make install
