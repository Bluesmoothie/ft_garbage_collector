# ft_garbage_collector
Smart garbage collector used for c projects of 42 school

Stop worrying about your leaks with ft_garbage_collector !

# Exit management

Simply tell garbage_collector wich function to call on error with

```gset_exit(void *param, void (*exit_func)(void *param, char *message));```

where exit_func is your exit function param will be passed to exit_func when called

```gcall_exit(char *message)```

calls your previously selected exit_func pssing it the message

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

```gfree_double(void **ptr)```

for freeing

# Tuning

Modify garbage_collector settings by editing garbage.h
GARBAGE_SIZE is the maximum amount of pointer garbage collector can keep in memory
GARBAGE_SPLIT_SIZE is the maximum amount of double pointer garbage collector can keep in memory

Set GARBAGE_WARN_NF if you wan't garbage collector to warn you when a call to gfree can't find the pointer in the garbage collector memory
In all cases garbage collector will free it anyway
