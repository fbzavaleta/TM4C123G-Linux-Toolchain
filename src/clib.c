#include <stddef.h>

size_t strlen(const char *str) {
    size_t length = 0;

    while (str[length] != '\0') {
        length++;
    }

    return length;
}

void *memset(void *ptr, int value, size_t num) {
    unsigned char *p = ptr;
    unsigned char val = (unsigned char)value;

    for (size_t i = 0; i < num; i++) {
        p[i] = val;
    }

    return ptr;
}

void *memcpy(void *dest, const void *src, size_t n) {
    char *d = dest;
    const char *s = src;

    while (n--) {
        *d++ = *s++;
    }

    return dest;
}