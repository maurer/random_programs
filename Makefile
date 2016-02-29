all: main

main.c:
	csmith -s $(seed) > $@

install:
	cp main $(out)/main
