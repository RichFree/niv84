PREFIX = /usr/local

niv: niv.sh niv.awk niv.tsv
	cat niv.sh > $@
	echo 'exit 0' >> $@
	echo '#EOF' >> $@
	tar cz niv.awk niv.tsv >> $@
	chmod +x $@

test: niv.sh
	shellcheck -s sh niv.sh

clean:
	rm -f niv

install: niv
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f niv $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/niv

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/niv

.PHONY: test clean install uninstall
