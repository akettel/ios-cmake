To initialize the submodules:

1. In the ios-cmake folder
	git submodule init
	git submodule update

2. In the ios-cmake/grpc folder
	git submodule init
	git submodule update


Small code change to grpc/third_party/protobuf/cmake/install.cmake
 Change line 18 from:

	RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT protoc)

 to:

	RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT protoc
	BUNDLE DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT protoc)


./build-ios.sh to run cmake
run xcodebuild in cmake/binary.

If you run into errors, try ./build-ios.sh again and build.

