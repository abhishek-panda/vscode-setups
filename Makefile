TARGET = main

SRC = source
INC = headers
BIN = build

SOURCE = $(wildcard $(SRC)/*.c)
OBJECT = $(patsubst %, $(BIN)/%,  $(notdir $(SOURCE:.c=.o)))

CC = clang
CFLAGS = -Wall -std=gnu99 -I$(INC)

$(BIN)/$(TARGET) : $(OBJECT)
	$(CC) -o $@ $^

$(BIN)/%.o : $(SRC)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY :  help run clean

run : $(BIN)/$(TARGET)
	$(BIN)/$(TARGET)

clean :
	rm -f $(OBJECT) $(BIN)/$(TARGET)

help :
	@echo "src: $(SOURCE)"
	@echo "obj: $(OBJECT)"