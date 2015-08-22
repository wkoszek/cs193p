# Stanford's CS193p Class Source Code

Source code is in the current directory.

XCode project, which are more volatile than the `.h`
and `.m` files themselves are in `cs193/` directory.

# How to build

There's a convenience script `build.sh` for building this project. Just run:

	./build xcodebuild

It will use `xcodebuild` to build the project. The Facebook's `xctool` is
also supported as a build tool, in which case use:

	./build.sh xctool

# TODO

- TODO: Add tags to indicate which commit is which lesson.
