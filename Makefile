RST2HTML   = /usr/local/share/python/rst2html.py

SOURCES    := $(wildcard *.rst)
OUTPUTS    := $(SOURCES:%.rst=output/%.html)

all: $(OUTPUTS) notes
	@echo Done
notes: $(SOURCES) output
	cat $(SOURCES) | $(RST2HTML) > output/notes.html
output/%.html: %.rst output
	$(RST2HTML) $< > $@
output:
	mkdir output
clean:
	rm -rf output
