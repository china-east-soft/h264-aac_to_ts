SHELL = /bin/sh

CC = gcc

BINDIR = bin

LIBDIR = lib

OBJDIR = obj

LIB = $(LIBDIR)/libtstools.a

PROGS = $(BINDIR)/esmerge 

OBJS = \
 accessunit.o \
 avs.o \
 ac3.o \
 adts.o \
 bitdata.o \
 es.o \
 filter.o \
 fmtx.o \
 h222.o \
 h262.o \
 audio.o \
 l2audio.o \
 misc.o \
 nalunit.o \
 ps.o \
 pes.o \
 pidint.o \
 reverse.o \
 ts.o \
 tswrite.o \
 pcap.o \
 ethernet.o \
 ipv4.o

LDFLAGS = -g -lm $(PROFILE_FLAGS) $(ARCH_FLAGS)
LIBOPTS = -L$(LIBDIR) -ltstools $(ARCH_FLAGS)

all:	$(BINDIR) $(LIBDIR) $(OBJDIR) $(PROGS)

$(OBJDIR):
	mkdir $(OBJDIR)

$(LIBDIR):
	mkdir $(LIBDIR)

$(BINDIR):
	mkdir $(BINDIR)

$(BINDIR)/esmerge:$(OBJDIR)/esmerge.o $(LIB)
	$(CC) $< -o $(BINDIR)/esmerge $(LDFLAGS) $(LIBOPTS)

$(OBJDIR)/esmerge.o:     esmerge.c misc_fns.h $(ACCESSUNIT_H) $(AUDIO_H) $(TSWRITE_H) version.h
	$(CC) -c $< -o $@ $(CFLAGS)

$(LIB): $(LIB)($(OBJS))

.PHONY: objclean
objclean:
	-rm -f $(OBJS)
	-rm -f $(TEST_OBJS)
	-rm -f $(TEST_PROGS)
	-rm -f $(TS2PS_OBJS) $(TS2PS_PROG)
	-rm -f $(TEST_PES_OBJS) $(TEST_PES_PROG)
	-rm -f ES_test3.ts  es_test3.ts
	-rm -f ES_test2.264 es_test3.264
	-rm -f es_test_a.ts es_test_a.264
	-rm -f es_test_b.ts es_test_b.264

.PHONY: clean
clean: objclean
	-rm -f $(PROGS)
	-rm -f $(LIB)
	-rm -f $(PROG_OBJS)

