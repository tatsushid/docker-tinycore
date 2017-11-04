SUBDIRS := 6.0 6.1 6.2 6.3 6.4 7.0 7.1 7.2 8.0

.PHONY: all clean $(SUBDIRS)

all: $(SUBDIRS)

clean: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)
