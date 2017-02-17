pandoc=pandoc \
	--filter pandoc-citeproc \
	--bibliography="bibliography.bib" \
	--csl="chicago-author-date.csl" \
	--smart \

all: docx odt

docx:
	@ $(pandoc) \
	-o reference_output.docx \
	markdown-input.md

odt:
	@ $(pandoc) \
	-o reference_output.odt \
	markdown-input.md