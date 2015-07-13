# (c) 2015 Wojciech A. Koszek <wojciech@koszek.com>
NAME=$(shell basename `pwd`)
RELNAME=$(NAME)-$(CC)
TMPDIR=/tmp
SRCS_ALL:=$(wildcard *.m)
SRCS_EXCLUDED=
SRCS=$(filter-out $(SRCS_EXCLUDED),$(SRCS_ALL))
CFLAGS+=-Wall -pedantic

all:	Card
check:	$(MEMCHECKS)
suppression: $(SUPPRESSIONS)

Card:	$(SRCS)
	$(CC) $(CFLAGS) -framework Foundation $^ -o $@

relfilename:
	@echo $(TMPDIR)/$(RELNAME).tar.bz2

pack:
	rm -rf $(TMPDIR)/$(RELNAME)
	mkdir $(TMPDIR)/$(RELNAME)
	cp -rf * $(TMPDIR)/$(RELNAME)/
	cd $(TMPDIR) && tar cjf $(RELNAME).tar.bz2 $(RELNAME)

clean:
	rm -rf \
		*.prog		\
		*.memcheck	\
		*.dSYM		\
		$(TMPDIR)/$(RELNAME)		\
		$(TMPDIR)/$(RELNAME).tar.bz2

PHONY: %.memcheck
