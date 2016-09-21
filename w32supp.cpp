#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <sys\stat.h>

int asprintf(char **ret, const char *format, ...)
{
	va_list ap;

	*ret = NULL;  /* Ensure value can be passed to free() */

	va_start(ap, format);
	int count = vsnprintf(NULL, 0, format, ap);
	va_end(ap);

	if (count >= 0)
	{
		char* buffer = (char*)malloc(count + 1);
		if (buffer == NULL)
			return -1;

		va_start(ap, format);
		count = vsnprintf(buffer, count + 1, format, ap);
		va_end(ap);

		if (count < 0)
		{
			free(buffer);
			return count;
		}
		*ret = buffer;
	}

	return count;
}

int open(char const* filename, int mode)
{
	return (int)CreateFileA(filename, GENERIC_READ|GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, 0);
}

void close(int f)
{
	CloseHandle((HANDLE)f);
}

int fstatx(int fd, struct stat *buf)
{
	DWORD dwSize = GetFileSize((HANDLE)fd, NULL);
	if (INVALID_FILE_SIZE == dwSize)
		return -1;

	buf->st_size = dwSize;
	return 0;
}

void *mmap(void *addr, size_t length, int prot, int flags, int fd, long offset)
{
	HANDLE h = (HANDLE)fd;
	//HANDLE h = (HANDLE)_get_osfhandle(_fileno((FILE*)fd));
	HANDLE hMap = CreateFileMapping(h, 0, PAGE_READWRITE, 0, 0, 0);
	if (!hMap)
		return 0;

	return MapViewOfFile(hMap, FILE_MAP_READ|FILE_MAP_WRITE, 0, offset, 0);
	// hMap handle leaks here
}

int munmap(void *addr, size_t length)
{
	return UnmapViewOfFile(addr) ? 0 : -1;	
}

int msync(void *addr, size_t length, int flags)
{
	return FlushViewOfFile(addr, length) ? 0 : -1;
}
