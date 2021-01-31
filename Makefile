# Makefile for src/mod/wire.mod/
# $Id: Makefile,v 1.1.1.1 2010/07/26 21:11:06 simple Exp $

srcdir = .


doofus:
	@echo ""
	@echo "Let's try this from the right directory..."
	@echo ""
	@cd ../../../ && make

static: ../wire.o

modules: ../../../wire.$(MOD_EXT)

../wire.o:
	$(CC) $(CFLAGS) $(CPPFLAGS) -DMAKING_MODS -c $(srcdir)/wire.c
	@rm -f ../wire.o
	mv wire.o ../

../../../wire.$(MOD_EXT): ../wire.o
	$(LD) -o ../../../wire.$(MOD_EXT) ../wire.o $(XLIBS) $(MODULE_XLIBS)
	$(STRIP) ../../../wire.$(MOD_EXT)

depend:
	$(CC) $(CFLAGS) -MM $(srcdir)/wire.c -MT ../wire.o > .depend

clean:
	@rm -f .depend *.o *.$(MOD_EXT) *~

distclean: clean

#safety hash
../wire.o: .././wire.mod/wire.c ../../../src/mod/module.h \
 ../../../src/main.h ../../../config.h ../../../eggint.h ../../../lush.h \
 ../../../src/lang.h ../../../src/eggdrop.h ../../../src/compat/in6.h \
 ../../../src/flags.h ../../../src/cmdt.h ../../../src/tclegg.h \
 ../../../src/tclhash.h ../../../src/chan.h ../../../src/users.h \
 ../../../src/compat/compat.h ../../../src/compat/base64.h \
 ../../../src/compat/inet_aton.h ../../../src/compat/snprintf.h \
 ../../../src/compat/gethostbyname2.h \
 ../../../src/compat/explicit_bzero.h ../../../src/compat/strlcpy.h \
 ../../../src/mod/modvals.h ../../../src/tandem.h ../../../src/users.h \
 ../../../src/chan.h .././wire.mod/wire.h
