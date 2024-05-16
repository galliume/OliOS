#!/bin/bash

oli_i686_gcc="/home/lugh/opt/cross/bin/i686-elf-gcc"
oli_i686_gpp="/home/lugh/opt/cross/bin/i686-elf-g++"
oli_i686_gdb="/home/lugh/opt/cross/bin/i686-elf-gdb"
oli_i686_elf_as="/home/lugh/opt/cross/bin/i686-elf-as"

$oli_i686_gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
$oli_i686_gcc -T linker.ld -o myos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc
cp myos.bin isodir/boot/myos.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub2-mkrescue -o myos.iso isodir
