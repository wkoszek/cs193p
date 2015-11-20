# Stanford's CS193p Class Source Code

[![Build Status](https://travis-ci.org/wkoszek/cs193p.svg?branch=master)](https://travis-ci.org/wkoszek/cs193p)

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

# Copyright

It's unclear to me how to handle the copyright of this code. I suspect
it's a "public domain" code, since most of the stuff here came from the
Stanford lecture available via YouTube and iTunes. In case it's not true,
I indend to license it as BSD 2-clause code (see `COPYRIGHT.md`).

# Author

- Wojciech Adam Koszek, [wojciech@koszek.com](mailto:wojciech@koszek.com)
- [http://www.koszek.com](http://www.koszek.com)
