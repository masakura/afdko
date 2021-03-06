#! /bin/sh
set -e
set -x

target=sfntedit

if [ -z "$1" ] || [ "$1" == "release" ]
then
	xcodebuild -target $target -project $target.xcodeproj -configuration Release
	cp ../../../exe/osx/release/$target ../../../../../osx/
elif [ "$1" == "debug" ]
then
	xcodebuild -target $target -project $target.xcodeproj -configuration Debug
	cp ../../../exe/osx/debug/$target ../../../../../osx/
elif [ "$1" == "clean" ]
then
	xcodebuild -target $target -project $target.xcodeproj -configuration Debug $1
	xcodebuild -target $target -project $target.xcodeproj -configuration Release $1
else
   echo "Build target must be 'release', 'debug', 'clean', or simply omitted (same as 'release')"
fi
