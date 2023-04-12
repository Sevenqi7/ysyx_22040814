#include <klib.h>
#include <klib-macros.h>
#include <stdint.h>

#if !defined(__ISA_NATIVE__) || defined(__NATIVE_USE_KLIB__)

size_t strlen(const char *s) {
	int n;

	for (n = 0; *s != '\0'; s++)
		n++;
	return n;
}

size_t strnlen(const char *s, size_t n){
	int len = strlen(s);
	return len > n ? n : len;
}

char *strcpy(char *dst, const char *src) {
	char *ret;

	ret = dst;
	while ((*dst++ = *src++) != '\0')
		/* do nothing */;
	return ret;
}

char *strncpy(char *dst, const char *src, size_t n) {
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < n; i++) {
		*dst++ = *src;
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
}

char *strcat(char *dst, const char *src) {
	int len = strlen(dst);
	strcpy(dst + len, src);
	return dst;
}

int strcmp(const char *s1, const char *s2) {
	// int l1 = strlen(s1);
	// int l2 = strlen(s2);

	// if (l1 != l2) {
	// 	return l1 > l2 ? 1 : -1;
	// }

	// while (*s1 && *s2) {
	// 	int d = *s1++ - *s2++;
	// 	if (d != 0) {
	// 		return d > 0 ? 1 : -1;
	// 	}
	// }

	// return 0;
	

	while (*s1 && *s1 == *s2)
		s1++, s2++;
	return (int) ((unsigned char) *s1 - (unsigned char) *s2);
}

int strncmp(const char *s1, const char *s2, size_t n) {
	while (n > 0 && *s1 && *s1 == *s2)
		n--, s1++, s2++;
	if (n == 0)
		return 0;
	else
		return (int) ((unsigned char) *s1 - (unsigned char) *s2);
}

void *memset(void *s, int c, size_t n) {
	char *p;
	int m;

	p = s;
	m = n;
	while (--m >= 0)
		*p++ = c;

	return s;
}

void *memmove(void *dst, const void *src, size_t n) {
  panic("Not implemented");
}

void *memcpy(void *out, const void *in, size_t n) {
	const char *s;
	char *d;

	s = in;
	d = out;

	if (s < d && s + n > d) {
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else {
		while (n-- > 0)
			*d++ = *s++;
	}

	return out;
}

int memcmp(const void *s1, const void *s2, size_t n) {
    const unsigned char *p = s1, *q = s2;
    size_t i;

    for (i = 0; i < n; i++) {
        if (p[i] != q[i]) {
            return (p[i] < q[i]) ? -1 : 1;
        }
    }
    return 0;
}

#endif
