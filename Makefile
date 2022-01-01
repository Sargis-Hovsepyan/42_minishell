NAME = minishell
SRCS =  $(wildcard srcs/*.c) $(wildcard srcs/parse/*.c) \
		$(wildcard srcs/env/*.c) $(wildcard utils/*.c) \
		$(wildcard srcs/builtins/*.c)
OBJS = ${SRCS:.c=.o}

CC = gcc
CFLAGS = -Wall -Wextra -Werror

Include = -lreadline

RM = rm -rf



all: ${NAME}
${NAME}:${OBJS}
	@echo "\n"
	@echo "\033[0;32mCompiling minishell..."
	@${MAKE} -C ./libft/
	@${CC} ${CFLAGS} ${OBJS} ${Include} ./libft/libft.a -o ${NAME} 	
	@echo "\n\033[0;32mDone !"

clean:
	@echo "\033[0;31mCleaning libft..."
	@${MAKE} clean -C ./libft/
	@echo "\nRemoving binaries..."
	@${RM} ${OBJS}
	@echo "\033[0m"

fclean:
	@echo "\033[0;31mCleaning libft..."
	@make fclean -C ./libft/
	@echo "\nDeleting objects..."
	@${RM} ${OBJS}
	@echo "\nDeleting executable..."
	@${RM} ${NAME}
	@echo "\033[0m"

re: fclean all

.PHONY: all clean fclean re
