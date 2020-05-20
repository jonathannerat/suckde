# SuckDE: Suckless Desktop Environment
# inspired in this post by Llebach (https://redd.it/fizghi)
.POSIX:

define makeall
	for f in rocks/*; do \
		cd $$f ; \
		make $1; \
		cd "$$OLDPWD" ; \
	done
endef

all: suckde

clean:
	$(call makeall, clean)

theme.h:
	cp theme.def.h theme.h

suckde: theme.h
	scripts/copy-theme.sh rocks/*
	$(call makeall)

install: suckde
	$(call makeall, install)

uninstall:
	$(call makeall, uninstall)

.PHONY: all suckde install uninstall
