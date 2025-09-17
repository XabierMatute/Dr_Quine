define ASCIIART

endef
export ASCIIART

NAME := Sully

SRC :=	Sully.c

CC := clang

# CFLAGS := -Wall -Wextra -Werror

RM 		:= rm -rf

WHITE = \033[0;37m
RED = \033[0;31m
CYAN = \033[0;36m
GREEN = \033[0;32m
MAGENTA = \033[0;35m

all : run

run : $(NAME)
	@echo "$(CYAN)Running $(NAME)...$(WHITE)"
	./$(NAME)
	@echo "$(GREEN)$(NAME) executed...$(WHITE)"

$(NAME): $(SRC)
	$(CC) $(CFLAGS) -o $(NAME) $(SRC)
	@echo "$(GREEN)$(NAME) compiled...$(WHITE)"

Sully_0.c: run
	@echo "$(GREEN)Sully_0.c created...$(WHITE)"
	
clean :
	$(RM) Sully_*
	$(RM) Sully_*.c
	@echo "$(RED)clean done...$(WHITE)"

fclean : clean
	$(RM) $(NAME)
	@echo "$(RED)fclean done...$(WHITE)"

re : fclean all

test: all
	@echo "$(CYAN)Testing $(NAME)...$(WHITE)"
	@echo "$(CYAN)1. Checking if all files were created...$(WHITE)"
	@ls -1 Sully_*.py | wc -l | grep -q "6" && echo "$(GREEN)✓ All 6 files created$(WHITE)" || echo "$(RED)✗ Wrong number of files$(WHITE)"
	@echo "$(CYAN)2. Testing counter decrementation...$(WHITE)"
	@grep "i = 4" Sully_4.py > /dev/null && echo "$(GREEN)✓ Sully_4.py has i=4$(WHITE)" || echo "$(RED)✗ Wrong counter in Sully_4.py$(WHITE)"
	@grep "i = 0" Sully_0.py > /dev/null && echo "$(GREEN)✓ Sully_0.py has i=0$(WHITE)" || echo "$(RED)✗ Wrong counter in Sully_0.py$(WHITE)"
	@echo "$(CYAN)3. Testing syntax of generated files...$(WHITE)"
	@python3 -m py_compile Sully_0.py && echo "$(GREEN)✓ Sully_0.py compiles$(WHITE)" || echo "$(RED)✗ Sully_0.py syntax error$(WHITE)"
	@python3 -m py_compile Sully_3.py && echo "$(GREEN)✓ Sully_3.py compiles$(WHITE)" || echo "$(RED)✗ Sully_3.py syntax error$(WHITE)"
	@echo "$(CYAN)4. Testing structure similarity...$(WHITE)"
	@diff -u $(SRC) Sully.py | grep -E "^[-+]" | grep -v "i = " | wc -l | grep -q "0" && echo "$(GREEN)✓ Structure preserved$(WHITE)" || echo "$(RED)✗ Structure changed$(WHITE)"

test-full: clean all
	@echo "$(CYAN)Full integration test...$(WHITE)"
	@echo "$(CYAN)Running manual execution test...$(WHITE)"
	@python3 Sully_3.py
	@echo "$(GREEN)Manual test completed$(WHITE)"

test-count: all
	@echo "$(CYAN)Counting generated files...$(WHITE)"
	@echo "Files created: $$(ls -1 Sully_*.py | wc -l)"
	@ls -1 Sully_*.py

test-diffs: all
	@echo "$(CYAN)Showing differences between consecutive files...$(WHITE)"
	@diff Sully.py Sully_4.py || true
	@echo "---"
	@diff Sully_3.py Sully_2.py || true


commit:
	git add $(SRC) Makefile
	git commit -m "Sully"
	git push origin main
	@echo "$(MAGENTA)Pushed to repo...$(WHITE)"

.PHONY : all clean fclean re commit test run test-full test-count test-diffs
