NAME          = passifox

TOP           = $(shell pwd)
MANGLE       := $(shell date '+%s' | awk '{ printf "%x", $$1 }')

DIRS          = teledactyl pentadactyl melodactyl
MAKE_JAR      = sh $(TOP)/make_jar.sh
TARGETS       = xpi

JAR_BASES     = $(TOP) $(BASE)
JAR_FILES     = config.json
JAR_DIRS      = content skin locale modules
JAR_TEXTS     = js jsm css dtd xml xul html xhtml xsl properties json
JAR_BINS      = png

CHROME        = $(MANGLE)/
JAR           = $(CHROME)$(NAME).jar

XPI_BASES     = $(JAR_BASES)
XPI_FILES     = README install.rdf chrome.manifest
XPI_DIRS      = components chrome modules
XPI_TEXTS     = js jsm $(JAR_TEXTS)
XPI_BINS      = $(JAR_BINS)

XPI           = $(NAME).xpi

xpi:
	$(MAKE_JAR) -r "$(XPI)" "$(XPI_BASES)" "$(XPI_DIRS)" "$(XPI_TEXTS)" "$(XPI_BINS)" "$(XPI_FILES)"
