all: ln-pandoc ln-csl

ln-pandoc:
	@ echo "Linking .pandoc/" && \
	ln -s $(CURDIR)/pandoc ~/.pandoc

ln-csl:
	@ echo "Linking .csl/" && \
	ln -s $(CURDIR)/csl ~/.csl

rm-ln: 
	@ echo "Deleting relevant files from home dir" && \
	rm -rf ~/.csl ~/.pandoc