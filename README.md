## WORK IN PROGRESS

# ft_garbage_collector
Smart garbage collector used for c projects of 42 School

Stop worrying about your leaks with **ft_garbage_collector** !

# Exit management

Simply tell garbage_collector wich function to call on error with

```gset_exit(void *param, void (*exit_func)(void *param, char *message))```

where exit_func is your exit function, param will be passed to exit_func when called

```gcall_exit(char *message)```

calls your previously selected exit_func passing it the message

# Memory and error management

After that simply use

```ptr = gmalloc(size_t size)```

it will return the new allocated memory
and if an error occurs it will automaticly free all previousy allocated memory with gmalloc and call the exit_func previously selected

then use
```gfree(void *ptr)```
instead of free

```gclean(void)```

free all memory previsously allocated with garbage_collector

# Double pointer management (like ones produced with ft_split)
```gmalloc_doule(void)```

```gfree_double(void **ptr)```

for freeing the pointer and all subpointers of the array updating alls list so a pointer can registered with gmalloc, assigned to a array of pointers and freed with gfree_double without errors

# Protection for external functions

If you need to add a pointer that an other function as malloced itself use

```gman_add(void *ptr)```

or

```gman_add_double(void **ptr)```

for double pointer, the array need to be terminated by NULL (like ft_split)

these functions have the same protection as gmalloc so they call exit_func on error

these functions return the pointer so you can save space by using theme like this :

```str = gman_add(ft_strdup(str2))```

instead of

```
str = ft_strdup(str2)
if (str == NULL)
  exit_func()
```

# Tuning

Modify garbage_collector settings by editing garbage.h
GARBAGE_SIZE is the maximum amount of pointer garbage collector can keep in memory
GARBAGE_SPLIT_SIZE is the maximum amount of double pointer garbage collector can keep in memory
