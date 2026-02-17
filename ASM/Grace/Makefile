# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: xmatute- <xmatute-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/17 13:39:12 by xmatute-          #+#    #+#              #
#    Updated: 2025/09/17 14:07:41 by xmatute-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

define ASCIIART

endef
export ASCIIART

NAME := Grace

SRC :=	Grace.s

OBJ := $(SRC:.s=.o)

KID := Grace_kid.s

CC := gcc

CFLAGS := -no-pie

ASMC := nasm

ASMFLAGS := -f elf64

RM 		:= rm -rf

WHITE = \033[0;37m
RED = \033[0;31m
CYAN = \033[0;36m
GREEN = \033[0;32m
MAGENTA = \033[0;35m

all : $(NAME)

run : $(NAME)
	@echo "$(CYAN)Running $(NAME)...$(WHITE)"
	./$(NAME)
	@echo "$(GREEN)$(NAME) executed...$(WHITE)"

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o $(NAME)
	@echo "$(GREEN)$(NAME) compiled...$(WHITE)"

$(OBJ): $(SRC)
	$(ASMC) $(ASMFLAGS) $< -o $@
	@echo "$(GREEN)$< assembled...$(WHITE)"


$(KID): run
	@echo "$(GREEN)$(KID) created...$(WHITE)"

clean : 
	$(RM) $(KID)
	$(RM) $(OBJ)
	@echo "$(RED)clean done...$(WHITE)"

fclean : clean
	$(RM) $(NAME)
	@echo "$(RED)fclean done...$(WHITE)"

re : fclean all

test: $(SRC) $(KID)
	@echo "$(CYAN)Testing $(NAME)...$(WHITE)"
	diff $(SRC) $(KID)

commit:
	git add $(SRC) Makefile
	git commit -m "Colleen"
	git push origin main
	@echo "$(MAGENTA)Pushed to repo...$(WHITE)"

.PHONY : all clean fclean re commit test run