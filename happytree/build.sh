#!/bin/bash
cd "$(dirname -- "$(readlink -fn -- "${0}")")"

clang -O3 -ffast-math -c GLee.c stb_image.c nativefiledialog/src/nfd_common.c nativefiledialog/src/nfd_gtk.c -Inativefiledialog/src/include $(pkg-config --cflags gtk+-3.0)
clang++ -O3 -ffast-math -std=c++11 -c ../proctree/proctree.cpp diskio.cpp glstuff.cpp imgui.cpp imgui_impl.cpp main.cpp presets.cpp shader.cpp toolkit.cpp -I/usr/include/SDL/ -Inativefiledialog/src/include -Wno-writable-strings
clang++ -o happytree GLee.o stb_image.o nfd_common.o nfd_gtk.o proctree.o diskio.o glstuff.o imgui.o imgui_impl.o main.o presets.o shader.o toolkit.o -lSDL -lGL -lm $(pkg-config --libs gtk+-3.0)
