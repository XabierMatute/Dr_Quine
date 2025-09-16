# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: xmatute- <xmatute-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/16 13:51:28 by xmatute-          #+#    #+#              #
#    Updated: 2025/09/16 13:53:05 by xmatute-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

define ASCIIART

endef
export ASCIIART

NAME := Grace_kid.py

SRC :=	Grace.py

PYTHON := python3

RM 		:= rm -rf

WHITE = \033[0;37m
RED = \033[0;31m
CYAN = \033[0;36m
GREEN = \033[0;32m
MAGENTA = \033[0;35m

all : $(NAME)

run : $(SRC)
	@echo "$(CYAN)Running $(NAME)...$(WHITE)"
	$(PYTHON) $(SRC)
	@echo "$(GREEN)$(NAME) executed...$(WHITE)"

$(NAME): run
	@echo "$(GREEN)$(NAME) quined...$(WHITE)"
	
clean : 
	$(RM) $(NAME)
	@echo "$(RED)clean done...$(WHITE)"

fclean : clean
	$(RM) $(NAME)
	@echo "$(RED)fclean done...$(WHITE)"

re : fclean all

test: all
	@echo "$(CYAN)Testing $(NAME)...$(WHITE)"
	diff $(SRC) $(NAME)

commit:
	git add $(SRC) Makefile
	git commit -m "Colleen"
	git push origin main
	@echo "$(MAGENTA)Pushed to repo...$(WHITE)"

.PHONY : all clean fclean re commit test run