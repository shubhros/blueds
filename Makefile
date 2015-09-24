TOP=$(PWD)
VPATH=$(TOP)/src:$(TOP)include
SRCDIR=$(TOP)/src
INCDIR=$(TOP)/include

#Defines for Linux build
OUT=$(TOP)/out
OUT32=$(TOP)/out_32
SONAME=libbds.so
CCFLAGS=-D_LINUX_ -D_x86_64_ -DUSE_OS_INFO -fPIC -Wall -Wextra -I$(INCDIR)  
CCFLAGS32=-m32 $(CCFLAGS) 
LIBFLAGS=-shared -lpthread -lc -Wl,-soname
LIBFLAGS32=-m32 -shared -lc -Wl,-soname
WINFLAGS:= -D_WINDOWS_
#Defines for Windows build
WIN_COMPILE=amd64-mingw32msvc
WIN_COMPILE32=i586-mingw32msvc
OUTWIN=$(TOP)/out_win

OBJS=$(LOCAL_SRCS:.c=.o)
LOCAL_SRCS=bds_slab.c bds_sys.c 


.PHONY: all

all: libs 
#windows 

dirs:
	@echo "Making directories.."
	@mkdir -p $(TOP)/out $(TOP)/out_32 

libs: dirs $(OBJS)
	$(CC) $(LIBFLAGS),$(SONAME) -o $(OUT)/$(SONAME) $(OUT)/*.o
#	$(CC) $(LIBFLAGS32),$(SONAME) -o $(OUT32)/$(SONAME) $(OUT32)/*.o

%.o: %.c
	$(CC) $(CCFLAGS) -c $< -o $(OUT)/$@
#	$(CC) $(CCFLAGS32) -c $< -o $(OUT32)/$@

.PHONY: clean

clean:
	@echo "Cleaning.."
	@rm -rf $(OUT) $(OUT32) 
