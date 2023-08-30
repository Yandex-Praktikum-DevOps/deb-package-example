.ONESHELL:
SHELL = /bin/bash

default: build

.PHONY: deps
deps:
	@sudo apt install $(cat bindep.txt) -y

.PHONY: build
build: compile dpkg-deb

.PHONY: compile
compile:
	@gcc -o pkg/usr/bin/program src/program.c

.PHONY: dpkg-deb
dpkg-deb:
	@dpkg-deb --build pkg
