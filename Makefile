SVG := $(wildcard *.svg)
PNG := $(SVG:%.svg=%.png)
PREVIEW := preview.png

MONTAGE := $(shell which montage 2> /dev/null)
CONVERT := $(shell which convert 2> /dev/null)

$(PREVIEW): $(PNG)
ifndef MONTAGE
	$(error ImageMagick (montage) is not installed)
endif
	$(MONTAGE) -label %t $(PNG) -tile x1 $(PREVIEW)

%.png: %.svg
ifndef CONVERT
	$(error ImageMagick (convert) is not installed)
endif
	$(CONVERT) $< $@

.PHONY: clean
clean:
	rm -f $(PNG)
