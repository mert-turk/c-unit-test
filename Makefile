CC = gcc
CXX = g++

SRC_DIR =./src
TEST_DIR =./tests
BUILD_DIR =.
NAME =app.elf

CFLAGS +=-I$(SRC_DIR)/average

CSOURCES = $(SRC_DIR)/main.c
CSOURCES +=$(wildcard $(SRC_DIR)/average/*.c)

CFLAGS += -Wall

LDFLAGS +=

COBJECTS =$(patsubst %.c, %.o, $(CSOURCES))

.PHONY: all
all: $(NAME)

$(COBJECTS) : %.o : %.c
%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@  

.PHONY: $(NAME)
$(NAME): $(COBJECTS)
	$(CC) $(COBJECTS) -o $(BUILD_DIR)/$(NAME) $(LDFLAGS)

clean:
	rm -f $(COBJECTS)

.PHONY: test
test:
	make -C $(TEST_DIR)

.PHONY: test_clean
test_clean:
	make -C $(TEST_DIR) clean
