# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus/Build"

# Include any dependencies generated for this target.
include CMakeFiles/calc.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/calc.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/calc.dir/flags.make

lexer.cpp: ../calc.l
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus/Build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "[FLEX][Lexer] Building scanner with flex 2.6.4"
	cd "/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus" && /usr/bin/flex "-o/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus/Build/lexer.cpp" calc.l

parser.cpp: ../calc.y
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus/Build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "[BISON][Parser] Building parser with bison 3.0.4"
	cd "/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus" && /usr/bin/bison "--defines=/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus/Build/parser.h" -o "/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus/Build/parser.cpp" calc.y

parser.h: parser.cpp
	@$(CMAKE_COMMAND) -E touch_nocreate parser.h

CMakeFiles/calc.dir/lexer.cpp.o: CMakeFiles/calc.dir/flags.make
CMakeFiles/calc.dir/lexer.cpp.o: lexer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus/Build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/calc.dir/lexer.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/calc.dir/lexer.cpp.o -c "/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus/Build/lexer.cpp"

CMakeFiles/calc.dir/lexer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/calc.dir/lexer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus/Build/lexer.cpp" > CMakeFiles/calc.dir/lexer.cpp.i

CMakeFiles/calc.dir/lexer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/calc.dir/lexer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus/Build/lexer.cpp" -o CMakeFiles/calc.dir/lexer.cpp.s

CMakeFiles/calc.dir/lexer.cpp.o.requires:

.PHONY : CMakeFiles/calc.dir/lexer.cpp.o.requires

CMakeFiles/calc.dir/lexer.cpp.o.provides: CMakeFiles/calc.dir/lexer.cpp.o.requires
	$(MAKE) -f CMakeFiles/calc.dir/build.make CMakeFiles/calc.dir/lexer.cpp.o.provides.build
.PHONY : CMakeFiles/calc.dir/lexer.cpp.o.provides

CMakeFiles/calc.dir/lexer.cpp.o.provides.build: CMakeFiles/calc.dir/lexer.cpp.o


CMakeFiles/calc.dir/parser.cpp.o: CMakeFiles/calc.dir/flags.make
CMakeFiles/calc.dir/parser.cpp.o: parser.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus/Build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/calc.dir/parser.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/calc.dir/parser.cpp.o -c "/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus/Build/parser.cpp"

CMakeFiles/calc.dir/parser.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/calc.dir/parser.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus/Build/parser.cpp" > CMakeFiles/calc.dir/parser.cpp.i

CMakeFiles/calc.dir/parser.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/calc.dir/parser.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus/Build/parser.cpp" -o CMakeFiles/calc.dir/parser.cpp.s

CMakeFiles/calc.dir/parser.cpp.o.requires:

.PHONY : CMakeFiles/calc.dir/parser.cpp.o.requires

CMakeFiles/calc.dir/parser.cpp.o.provides: CMakeFiles/calc.dir/parser.cpp.o.requires
	$(MAKE) -f CMakeFiles/calc.dir/build.make CMakeFiles/calc.dir/parser.cpp.o.provides.build
.PHONY : CMakeFiles/calc.dir/parser.cpp.o.provides

CMakeFiles/calc.dir/parser.cpp.o.provides.build: CMakeFiles/calc.dir/parser.cpp.o


# Object files for target calc
calc_OBJECTS = \
"CMakeFiles/calc.dir/lexer.cpp.o" \
"CMakeFiles/calc.dir/parser.cpp.o"

# External object files for target calc
calc_EXTERNAL_OBJECTS =

calc: CMakeFiles/calc.dir/lexer.cpp.o
calc: CMakeFiles/calc.dir/parser.cpp.o
calc: CMakeFiles/calc.dir/build.make
calc: CMakeFiles/calc.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus/Build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable calc"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/calc.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/calc.dir/build: calc

.PHONY : CMakeFiles/calc.dir/build

CMakeFiles/calc.dir/requires: CMakeFiles/calc.dir/lexer.cpp.o.requires
CMakeFiles/calc.dir/requires: CMakeFiles/calc.dir/parser.cpp.o.requires

.PHONY : CMakeFiles/calc.dir/requires

CMakeFiles/calc.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/calc.dir/cmake_clean.cmake
.PHONY : CMakeFiles/calc.dir/clean

CMakeFiles/calc.dir/depend: lexer.cpp
CMakeFiles/calc.dir/depend: parser.cpp
CMakeFiles/calc.dir/depend: parser.h
	cd "/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus/Build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus" "/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus" "/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus/Build" "/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus/Build" "/media/zeca/Armazenamento/Compiladores/Unidade III/Trabalho III/CalcPlus/Build/CMakeFiles/calc.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/calc.dir/depend

