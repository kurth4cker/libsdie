.POSIX:
CC = cc
AR = ar
RANLIB = ranlib

CFLAGS = -std=c99 -pedantic -Wall -Wextra -Werror -g

PREFIX = /usr/local
LIBDIR = $(PREFIX)/lib
INCLUDEDIR = $(PREFIX)/include
MANDIR = $(PREFIX)/share/man

LIB = libsdie.a
OBJ = sdie.o

HDR = sdie.h
MAN3 = sdie.3

all: $(LIB)
$(OBJ): $(HDR)

$(LIB): $(OBJ)
	$(AR) -rc $@ $?
	$(RANLIB) $@

clean:
	rm -f $(LIB) *.o

install: $(LIB) $(HDR) $(MAN3)
	mkdir -p -- \
		$(DESTDIR)$(LIBDIR) \
		$(DESTDIR)$(INCLUDEDIR) \
		$(DESTDIR)$(MANDIR)/man3
	cp -f $(LIB) $(DESTDIR)$(LIBDIR)
	cp -f $(HDR) $(DESTDIR)$(INCLUDEDIR)
	cp -f $(MAN3) $(DESTDIR)$(MANDIR)/man3

uninstall:
	rm -f -- \
		$(DESTDIR)$(LIBDIR)/$(LIB) \
		$(DESTDIR)$(INCLUDEDIR)/$(HDR) \
		$(DESTDIR)$(MANDIR)/man3/$(MAN3)

.PHONY: all clean install uninstall

.SUFFIXES: .c .o
.c.o:
	$(CC) $(CFLAGS) -c $<
