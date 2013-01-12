RST2HTML   = /usr/local/share/python/rst2html.py

SOURCES    := $(wildcard *.rst)
OUTPUTS    := $(SOURCES:%.rst=output/%.html)

all: $(OUTPUTS)
	@echo Done
notes: $(OUTPUTS)
	cat $(OUTPUTS) | $(RST2HTML) > output/notes.html
output/%.html: %.rst output
	$(RST2HTML) $< > $@
output:
	mkdir output
clean:
	rm -rf output
