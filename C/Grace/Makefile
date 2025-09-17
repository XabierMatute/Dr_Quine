# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: xmatute- <xmatute-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/17 13:39:12 by xmatute-          #+#    #+#              #
#    Updated: 2025/09/17 13:42:03 by xmatute-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

define ASCIIART

endef
export ASCIIART

NAME := Grace

SRC :=	Grace.c

KID := Grace_kid.c

CC := clang

# CFLAGS := -Wall -Wextra -Werror

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

$(NAME): $(SRC)
	$(CC) $(CFLAGS) -o $(NAME) $(SRC)
	@echo "$(GREEN)$(NAME) compiled...$(WHITE)"

$(KID): run
	@echo "$(GREEN)$(KID) created...$(WHITE)"
	
clean : 
	$(RM) $(KID)
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