pandoc=pandoc --filter pandoc-citeproc --bibliography="bibliography.bib" --smart commentary.md

all: build

build:
	@ pandoc \
	--filter pandoc-citeproc \
	--bibliography="bibliography.bib" \
	--csl=sbl.csl \
	--smart \
	-o reference.docx \
	markdown.md
