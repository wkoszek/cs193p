#!/bin/sh
# Copyright 2015 by Wojciech A. Koszek <wojciech@koszek.com>

BUILDOPTS="-project cs193p.xcodeproj -scheme cs193p -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO"

if [ "$BUILDTOOL" = "" ]; then
	echo "BUILDTOOL variable must be set, but isn't!"
	exit 1
fi

(
	cd cs193p/

	if [ "$BUILDTOOL" = "xcodebuild" ]; then
		xcodebuild $BUILDOPTS
	elif [ "$BUILDTOOL" = "xctool" ]; then
		xctool $BUILDOPTS
	else
		echo "Tool '$BUILDTOOL' unsupported!"
		exit 1
	fi
)