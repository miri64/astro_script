CC=pdflatex
INKSCAPE=inkscape

IMG=$(patsubst %.svg,%.pdf,$(wildcard img/*.svg))

ifeq (,$(shell which $(CC)))
$(error "You need $(CC)")
endif

ifeq (,$(shell which $(INKSCAPE)))
$(error "You need $(INKSCAPE)")
endif

.PHONY : all clean

all : script.pdf

script.pdf : script.tex *.tex $(IMG)
	echo "$(IMG)"
	@$(CC) --shell-escape "$<"

img/%.pdf : img/%.svg
	@$(INKSCAPE) --without-gui --export-pdf="$@" "$<"

clean :
	@rm -f script.pdf img/*.pdf *.aux *.log *.toc
