.POSIX:
VERSION = 0.1.0a

CC = cc
AR = ar
RANLIB = ranlib

PREFIX = /usr/local
LIBDIR = $(PREFIX)/lib
INCLUDEDIR = $(PREFIX)/include
MANDIR = $(PREFIX)/share/man

LIB = libsdie.a
OBJ = die.o

SRC = die.c
HDR = sdie.h
MAN3 = sdie.3

DISTFILES = LICENSE README.md Makefile $(SRC) $(HDR) $(MAN3)
DISTNAME = libsdie-$(VERSION)

all: $(LIB)
$(OBJ): $(HDR)

$(LIB): $(OBJ)
	$(AR) -rc $@ $?
	$(RANLIB) $@

clean:
	rm -f $(LIB) *.o

dist: $(DISTFILES)
	mkdir -p $(DISTNAME)
	cp -f $(DISTFILES) $(DISTNAME)
	tar -cf $(DISTNAME).tar $(DISTNAME)
	rm -rf $(DISTNAME)

install: $(LIB) $(HDR) $(MAN3)
	mkdir -p $(DESTDIR)$(LIBDIR)
	mkdir -p $(DESTDIR)$(INCLUDEDIR)
	mkdir -p $(DESTDIR)$(MANDIR)/man3
	cp -f $(LIB) $(DESTDIR)$(LIBDIR)
	cp -f $(HDR) $(DESTDIR)$(INCLUDEDIR)
	cp -f $(MAN3) $(DESTDIR)$(MANDIR)/man3

uninstall:
	rm -f $(DESTDIR)$(LIBDIR)/$(LIB)
	rm -f $(DESTDIR)$(INCLUDEDIR)/$(HDR)
	rm -f $(DESTDIR)$(MANDIR)/man3/$(MAN3)

.SUFFIXES: .c .o
.c.o:
	$(CC) $(CFLAGS) -c $<
