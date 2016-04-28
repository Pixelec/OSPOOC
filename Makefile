CC		= gcc
IFLAGS	= -Iinclude
CFLAGS	= -std=c99 -fPIC -pedantic -Wall -Wextra -c # -march=native -ggdb3
LFLAGS	= -shared -lX11 # -march=native -ggdb3
DFLAGS	= -L./lib -lOSPOOC

TARGET	= lib/libOSPOOC.so
SOURCES	= $(shell echo src/*.c)
HEADERS	= $(shell echo include/*.h)
OBJECTS	= $(SOURCES:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(LFLAGS) -o $(TARGET) $(OBJECTS)

*.o: *.c
	$(CC) $(IFLAGS) $(CFLAGS) -o $@ $<

demo: $(TARGET) demo/windows.c
	# Make sure 
	$(CC) $(IFLAGS) -o bin/windows demo/windows.c $(DFLAGS)

clean:
	rm -r */*.o */*.so bin/*
