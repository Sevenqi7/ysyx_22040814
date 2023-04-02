#include <am.h>
#include <klib.h>
#include <klib-macros.h>
#include <stdarg.h>

#define PRINTFBUF_SIZE 4096

#if !defined(__ISA_NATIVE__) || defined(__NATIVE_USE_KLIB__)

//移植了XV6里的printf
struct sprintbuf {
	char *buf;
	char *ebuf;
	int cnt;
};

struct printfbuf {
	char buf[PRINTFBUF_SIZE];
	char *buf_p;
	int cnt;
};

static struct printfbuf printfb = {
	.buf_p = printfb.buf
};

void vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap);

static void
printfputch(int ch, struct printfbuf *b)
{
	b->cnt++;
	*b->buf_p++ = (char)ch;
	if (ch == '\n' || b->buf_p == b->buf + PRINTFBUF_SIZE) {
        for(int i=0;i<b->buf_p - b->buf;i++)
            putch(b->buf[i]);
		// write(STDOUT, b->buf, b->buf_p - b->buf);
		b->buf_p = b->buf;
	}
}

static void
sprintputch(int ch, struct sprintbuf *b)
{
	b->cnt++;
	if (b->buf < b->ebuf)
		*b->buf++ = ch;
}

int
vprintf(const char *fmt, va_list ap)
{
	struct printfbuf *b = &printfb;
	b->cnt = 0;
	vprintfmt((void *)printfputch, b, fmt, ap);	
	int rc = b->cnt;
	return rc;
}


int printf(const char *fmt, ...) {
	va_list ap;
	int rc;

	va_start(ap, fmt);
	rc = vprintf(fmt, ap);
	va_end(ap);

	return rc;
}

int vsprintf(char *out, const char *fmt, va_list ap) {
    return 0;
}

int sprintf(char *out, const char *fmt, ...) {
    return 0;
}

int vsnprintf(char *out, size_t n, const char *fmt, va_list ap) {
	struct sprintbuf b = {out, out+n-1, 0};

	if (out == NULL || n < 1)
		return -1;

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);

	// null terminate the buffer
	*b.buf = '\0';

	return b.cnt;
}

int snprintf(char *out, size_t n, const char *fmt, ...) {
	va_list ap;
	int rc;

	va_start(ap, fmt);
	rc = vsnprintf(out, n, fmt, ap);
	va_end(ap);

	return rc;
}

#endif