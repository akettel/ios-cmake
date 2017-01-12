#!/bin/tcsh

set CMAKE=`which cmake`
set XCODEBUILD=`which xcodebuild`
set CURRENT_DIR='/Users/andrew/Projects/Parthenon/Vernier/ios-cmake'

rm -rf $CURRENT_DIR/cmake/binary/*

$CMAKE \
-B$CURRENT_DIR/cmake/binary \
-H$CURRENT_DIR/grpc \
-GXcode \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_CXX_FLAGS=\ -frtti\ -fexceptions\ -stdlib=libc++\ -std=c++11 \
-DCMAKE_SHARED_LINKER_FLAGS=" -arch armv7s -miphoneos-version-min=10.2" \
-DCMAKE_C_FLAGS=\ -Doff64_t=u_int64_t\ -DNDEBUG\ -g\ -O0\ -pipe\ -fPIC \
-DPROJECT_SOURCE_DIR=$CURRENT_DIR/grpc \
-DCMAKE_TOOLCHAIN_FILE=${CURRENT_DIR}/toolchain/iOS.cmake \
# -DCMAKE_OSX_ARCHITECTURES="armv7s" \
# -DCMAKE_INSTALL_PREFIX=../../../../install \
# -DCMAKE_MAKE_PROGRAM=${XCODEBUILD} \
# -DCMAKE_IOS_DEVELOPER_ROOT='/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer' \
-DPERL_EXECUTABLE='/usr/bin/perl' \
-DGO_EXECUTABLE='/usr/local/go/bin/go' \
-DBUILD_SHARED_LIBS=1 \
# -DCMAKE_SYSTEM_PROCESSOR='armv7'

cd cmake/binary
# $XCODEBUILD
echo ========== FINISHED ===============

ls -ltr $CURRENT_DIR/cmake/binary
