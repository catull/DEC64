
NASM_FLAGS = -Dunix=1 -fmacho64 -g --prefix _
YASM_FLAGS = -Dunix=1 -fmacho64 --prefix _

%.o:	%.nasm
	nasm $(NASM_FLAGS) -o $@ $<

%.o:	%.c
	$(CC) -O3 -I. -c $<

dec64_string_test: dec64.o dec64_string.o dec64_string_test.o
	$(CC) -O3 -o $@ $^

dec64_test: dec64.o dec64_test.o
	$(CC) -O3 -o $@ $^

clean:
	rm -f *.o dec64_string dec64_string_test dec64_test

