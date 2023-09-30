#ifndef _CLIB_H
#define _CLIB_H

#include <stddef.h>

size_t strlen(const char *str);

void *memset(void *ptr, int value, size_t num);

void *memcpy(void *dest, const void *src, size_t n);

#endif



