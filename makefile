all: dot-pandoc dot-csl

dot-pandoc:
	@ echo "Linking .pandoc/" && \
	rm -rf ~/.pandoc && \
	ln -s $(CURDIR)/pandoc ~/.pandoc

dot-csl:
	@ echo "Cloning .csl/" && \
	git clone git@github.com:jackweinbender/csl.git ~/.csl

rm-ln: 
	@ echo "Deleting relevant files from home dir" && \
	rm -rf ~/.csl ~/.pandoc