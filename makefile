all: CardTest

CardTest:
	clang *.m -o Card -framework Foundation

clean:
	rm -rf CardTest .DS_Store
