
ASSN = cgen
CLASS= dcc053
CLASSDIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))../..
AR= ar
ARCHIVE_NEW= -cr
RANLIB= ar -qs

SRC= cgen.cc cgen.h cgen_supp.cc cool-tree.h cool-tree.handcode.h emit.h example.cl README
CSRC= cgen-phase.cc utilities.cc stringtab.cc dumptype.cc tree.cc cool-tree.cc ast-lex.cc ast-parse.cc handle_flags.cc 
TSRC= spim mycoolc coolc
CGEN=
HGEN= 
LIBS= lexer parser semant
CFIL= cgen.cc cgen_supp.cc ${CSRC} ${CGEN}
LSRC= Makefile
OBJS= ${CFIL:.cc=.o}
OUTPUT= good.output bad.output


CPPINCLUDE= -I. -I${CLASSDIR}/include/${ASSN} -I${CLASSDIR}/src/${ASSN}


FFLAGS = -d8 -ocool-lex.cc
BFLAGS = -d -v -y -b cool --debug -p cool_yy

CC=g++
CFLAGS=-g -Wall -Wno-unused ${CPPINCLUDE} -DDEBUG
FLEX=flex ${FFLAGS}
BISON= bison ${BFLAGS}
DEPEND = ${CC} -MM ${CPPINCLUDE}

source: ${SRC} ${TSRC} ${LIBS} cgen lsource

lsource: ${LSRC}

#
# if make turnin says "turnin is up to date.", and you want to turnin
# anyway, you can delete the file 'turnin', and do make turnin again.
#
turnin : ${SRC} ${OUTPUT} turnin-clean
	cd ..; ${CLASSDIR}/bin/turnin ${CLASS} ${ASSN}

turnin-clean:
	@rm -f cgen ${OBJS} *.a *.o *~ *.d

${OUTPUT}:	cgen
	@rm -f ${OUTPUT}
	./mycoolc  example.cl >example.output 2>&1 

compile:	cgen change-prot

change-prot:
	@-chmod 660 ${SRC} ${OUTPUT}

cgen:	${OBJS} parser semant
	${CC} ${CFLAGS} ${OBJS} ${LIB} -o cgen

.cc.o:
	${CC} ${CFLAGS} -c $<

dotest:	cgen example.cl
	@echo "\nRunning code generator on example.cl\n"
	-./mycoolc example.cl

${LIBS}:
	${CLASSDIR}/etc/link-object ${ASSN} $@


# These dependencies allow you to get the starting files for
# the assignment.  They will not overwrite a file you already have.

${SRC} :								
	-${CLASSDIR}/etc/copy-skel ${ASSN} ${SRC}

${LSRC} :
	-${CLASSDIR}/etc/link-shared ${ASSN} ${LSRC}

${TSRC} ${CSRC}:
	-ln -s ${CLASSDIR}/src/${ASSN}/$@ $@

${HSRC}:
	-ln -s ${CLASSDIR}/include/${ASSN}/$@ $@

clean :
	-rm -f ${OUTPUT} *.s core ${OBJS} cgen parser semant lexer *~ *.a *.o

clean-compile:
	@-rm -f core ${OBJS} ${LSRC}

%.d: %.cc ${SRC}
	${SHELL} -ec '${DEPEND} $< | sed '\''s/\($*\.o\)[ :]*/\1 $@ : /g'\'' > $@'

-include ${CFIL:.cc=.d}


