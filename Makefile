SUBDIRS := 6.0 6.1 6.2 6.3 6.4 7.0 7.1 7.2 8.0 8.1 8.2 9.0 10.0 10.1 11.0 12.0

.PHONY: all clean $(SUBDIRS)

all: $(SUBDIRS)

clean: $(SUBDIRS)
	find . -type f -iname \*.tar.gz -delete

$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)
