NAME = game
DIR_SRC = src
DIR_BUILD = build
CONFIG = nes.cfg
OBJ = $(DIR_BUILD)/$(NAME).o
TARGET = $(DIR_BUILD)/$(NAME).nes

# Default target.
all: $(TARGET)

# Assemble .asm files to .o
$(OBJ): $(shell find $(DIR_SRC) -type f -name '*.asm')
	mkdir -p $(DIR_BUILD)
	ca65 $(DIR_SRC)/main.asm -o $(OBJ)

# Link .o to .nes.
$(TARGET): $(OBJ) $(CONFIG)
	mkdir -p $(DIR_BUILD)
	ld65 $(OBJ) -C $(CONFIG) -o $(TARGET)

# Clean up build files.
clean:
	rm -fr $(DIR_BUILD)

# Build and run immediately.
run: $(TARGET)
	fceux $(TARGET)

.PHONY: all clean run
