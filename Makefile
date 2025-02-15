.PHONY			:	clean fclean re all norme

NAME			=   garbage_col.a

#			GCC

CC				=	cc
CFLAGS			=	-Wall -Wextra -Werror
CFLAGS			+=	-MMD -MP
CFLAGS			+=	$(INCLUDE)

#			COMMON

BUILD_DIR		=	.build/
SRC_DIR			=	src/
INCLUDE 		=	-Iinclude/

#			SRC

SRC_FILES		=	core		\
					double_core	\
					double		\
					exit		\
					interface	\

SRC 			= 	$(addprefix $(SRC_DIR), $(addsuffix .c, $(SRC_FILES)))
OBJ 			= 	$(addprefix $(BUILD_DIR), $(addsuffix .o, $(SRC_FILES)))
DEPS 			= 	$(addprefix $(BUILD_DIR), $(addsuffix .d, $(SRC_FILES)))

#			RULES

all				:	$(NAME)

$(NAME)			:	$(BUILD_DIR) $(OBJ)
				ar -rcs $(NAME) $(BUILD_DIR)*.o

$(BUILD_DIR)	:
				mkdir -p $(BUILD_DIR)

$(BUILD_DIR)%.o	: 	$(SRC_DIR)%.c
				$(CC) $(CFLAGS) -c $< -o $@

-include $(DEPS)

norme			:
				norminette $(SRC_DIR) include

clean			:
				rm -rf $(BUILD_DIR)

fclean			:	clean
				rm -f $(NAME)

re				:	fclean all