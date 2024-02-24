/* See LICENSE file for copyright and license details. */
#include <errno.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "sdie.h"

static const char *argv0;

void
die(const char *fmt, ...)
{
	va_list ap;

	if (argv0)
		fprintf(stderr, "%s: ", argv0);

	va_start(ap, fmt);
	vfprintf(stderr, fmt, ap);
	va_end(ap);

	if (fmt[0] && fmt[strlen(fmt)-1] == ':') {
		fputc(' ', stderr);
		fputs(strerror(errno), stderr);
	}
	fputc('\n', stderr);

	exit(EXIT_FAILURE);
}

void
die_set_progname(const char *str)
{
	argv0 = str;
}
