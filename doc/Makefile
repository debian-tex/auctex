
prefix=/usr/local#
datadir=${prefix}/share#
packagedir=#
infodir=/usr/share/info/#
TEX=/usr/bin/tex
PDFTEX=/usr/bin/pdftex
MAKEINFO=/usr/bin/makeinfo 
INSTALL_INFO=/usr/sbin/install-info
INSTALL=/usr/bin/install -c
INSTALL_DATA=${INSTALL} -m 644
DESTDIR=
TEXI2HTML=/usr/bin/texi2html
TEXI2DVI=/usr/bin/texi2dvi
TEXI2PDF=/usr/bin/texi2pdf
MKINSTALLDIRS = ../mkinstalldirs
DVIPS=/usr/bin/dvips
TEXIFILES = auctex.texi install.texi wininstall.texi intro.texi \
	changes.texi todo.texi faq.texi macros.texi quickstart.texi

all: auctex.dvi tex-ref.dvi auctex.info

dist: auctex.info INSTALL INSTALL.windows README CHANGES TODO FAQ \
	html/auctex_toc.html auctex.ps auctex.pdf tex-ref.ps tex-ref.pdf

html/auctex_toc.html: auctex.texi
	rm -rf html
	mkdir html
	cd html; $(TEXI2HTML) -split_node ../auctex.texi && \
	if [ -d auctex ];then mv auctex/* .; rm -rf auctex; fi

tex-ref.dvi: tex-ref.tex
	$(TEX) tex-ref

tex-ref.ps: tex-ref.dvi
	$(DVIPS) tex-ref.dvi -Ppdf -o tex-ref.ps

tex-ref.pdf: tex-ref.tex
	$(PDFTEX) tex-ref.tex

auctex.dvi: $(TEXIFILES)
	MAKEINFO="$(MAKEINFO)" $(TEXI2DVI) auctex.texi

auctex.pdf: $(TEXIFILES)
	MAKEINFO="$(MAKEINFO)" $(TEXI2PDF) auctex.texi

# dvips spews two error lines.  I don't know why.
auctex.ps: auctex.dvi
	$(DVIPS) auctex.dvi -Ppdf -o auctex.ps

auctex.info: $(TEXIFILES)
	-$(MAKEINFO) auctex.texi

INSTALL: install.texi
	-$(MAKEINFO) -D rawfile --no-headers --no-validate \
		install.texi --output INSTALL

INSTALL.windows: wininstall.texi
	-$(MAKEINFO) -D rawfile --no-headers --no-validate \
		wininstall.texi --output INSTALL.windows

README: intro.texi
	-$(MAKEINFO) -D rawfile --no-headers --no-validate \
		intro.texi --output README

CHANGES: changes.texi
	-$(MAKEINFO) -D rawfile --no-headers --no-validate \
		changes.texi --output CHANGES

HISTORY: history.texi
	-$(MAKEINFO) -D rawfile --no-headers --no-validate \
		history.texi --output HISTORY

TODO: todo.texi macros.texi
	-$(MAKEINFO) -D rawfile --no-headers --no-validate \
		todo.texi --output TODO

FAQ: faq.texi macros.texi
	-$(MAKEINFO) -D rawfile --no-headers --no-validate \
		faq.texi --output FAQ

install: auctex.info
	-$(MKINSTALLDIRS) $(DESTDIR)$(infodir)
	rm -f $(DESTDIR)$(infodir)/auctex $(DESTDIR)$(infodir)/auctex-*
	$(INSTALL_DATA) auctex.info $(DESTDIR)$(infodir)
	for x in auctex.info-*; do \
	  if [ -r $$x ]; then \
	    $(INSTALL_DATA) $$x $(DESTDIR)$(infodir) ; \
	  fi; \
	done
	-$(INSTALL_INFO)  --info-dir=$(DESTDIR)$(infodir) auctex.info

clean:
	rm -f *.dvi *.ps *.pdf *.aux *.cp *.fn *.info *.ky *.log *~ \#*\# \
		*.tp *.vr *.pg *.toc *.tp *.bak *.cps *.kys *.tps \
		*.fns *.vrs *.pgs *.tmp auctex.info auctex.info-* *.html \
		INSTALL INSTALL.windows README CHANGES HISTORY TODO FAQ
	rm -rf html

distclean: clean
	rm -f Makefile
