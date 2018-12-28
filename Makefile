# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsprigga <bsprigga@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/22 13:16:43 by bsprigga          #+#    #+#              #
#    Updated: 2018/12/28 12:45:46 by bsprigga         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.PHONY: all clean fclean re

NAME = libft.a
SRCS_MEM =	ft_memalloc.c \
			ft_memchr.c \
			ft_memcmp.c \
			ft_memdel.c \
			ft_memset.c \
			ft_bzero.c \
			ft_memcpy.c \
			ft_memccpy.c \
			ft_memmove.c

SRCS_STR =	ft_strcat.c \
			ft_strchr.c \
			ft_strclr.c \
			ft_strcpy.c \
			ft_strdel.c \
			ft_strdup.c \
			ft_strlen.c \
			ft_striter.c \
			ft_striteri.c \
			ft_strmap.c \
			ft_strncpy.c \
			ft_strnew.c \
			ft_strrchr.c \
			ft_strncmp.c \
			ft_strcmp.c \
			ft_strstr.c \
			ft_strnstr.c \
			ft_strncat.c \
			ft_strlcat.c \
			ft_strmapi.c \
			ft_strequ.c \
			ft_strnequ.c \
			ft_strsub.c \
			ft_strsplit.c \
			ft_strjoin.c \
			ft_strtrim.c \
			ft_isin.c

SRCS_OTHER = ft_atoi.c \
			ft_itoa.c \
			ft_isalpha.c \
			ft_isdigit.c \
			ft_isalnum.c \
			ft_isascii.c \
			ft_isprint.c \
			ft_toupper.c \
			ft_tolower.c \
			ft_putchar.c \
			ft_putstr.c \
			ft_putendl.c \
			ft_putnbr.c \
			ft_putchar_fd.c \
			ft_putstr_fd.c \
			ft_putendl_fd.c \
			ft_putnbr_fd.c \
			ft_natural_pow.c \
			ft_sqrt.c \
			ft_sqrt_rational.c \
			ft_range.c \
			get_next_line.c

SRCS_LST =	ft_lstnew.c \
			ft_lstdelone.c \
			ft_lstdel.c \
			ft_lstadd.c \
			ft_lstiter.c \
			ft_lstmap.c \
			ft_lstreverse.c

CC = clang

#CFLAGS = -Wall -Wextra -Werror -g

FLAGS = -Wall -Wextra -Werror -g

VPATH = SRCS_MEM SRCS_LST SRCS_STR SRCS_OTHER

OBJECTS = $(SRCS_MEM:.c=.o) $(SRCS_STR:.c=.o) $(SRCS_LST:.c=.o) $(SRCS_OTHER:.c=.o)

all: $(NAME)

# если в зависимость попадают .о файлы и при отсутствии строки компиляции, а также при отсутствии .с файлов,
# то выполняется неявное правило вида `$(CC) -c $(CPPFLAGS) $(CFLAGS)'
# $(CC) и $(CFLAGS) необходимо переопределить вручную (опционально)

$(NAME) : $(OBJECTS)
	ar rc $(NAME) $(OBJECTS)
	ranlib $(NAME)

$(OBJECTS): %.o: %.c
	gcc -c $(FLAGS) $< -o $@ -Iincludes
# $@ Имя цели обрабатываемого правила
# $< Имя первой зависимости обрабатываемого правила
# $^ Список всех зависимостей обрабатываемого правила

test:
	@echo $(OBJECTS)

clean:
	/bin/rm -f $(OBJECTS)

fclean: clean
	/bin/rm -f $(NAME)

re: fclean all
