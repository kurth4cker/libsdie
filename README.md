# libsdie

Provides die(3) function and argv0 variable. With die() you can exit easily
with correct error messages. Optionally with perror compatible messages.

## Usage

For usage documentation and examples please see sdie(3) manpage.

## Building

Just run 'make'. You can use custom cc, ar or ranlib with corresponding
macros. For example:

	make CC=gcc

this sets compiler to gcc. You can also setup CFLAGS for
customizing build process.

## Installing

Run 'make install'. You can setup custom directories with PREFIX, LIBDIR and
INCLUDEDIR.

For uninstall libsdie, just run 'make uninstall' with same settings with
installation.

## Copying

libsdie is licensed under MIT/X Consortium License. See file LICENSE for
details.
