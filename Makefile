.DEFAULT_GOAL := all

BUILD_DIR      := build
HTML_OUT       := $(BUILD_DIR)/smart-home-board-lab.html
STANDALONE_OUT := $(BUILD_DIR)/smart-home-board-lab-standalone.html
PDF_OUT        := $(BUILD_DIR)/smart-home-board-lab.pdf
ORG_OUT        := $(BUILD_DIR)/smart-home-board-lab.org
TITLE_LOGOS    := img/eoc-logo.png img/toradex-logo.png
EXTRA_CSS      := talk-extras.css
INFRA_DIR      := infra
PDF_PORT       := 8766
PDF_FILE       := $(notdir $(HTML_OUT))
include $(INFRA_DIR)/Makefile.include

all: standalone

.PHONY: standalone
standalone: reveal
	$(PANDOC) $(COMBINED_MD) \
	  -t revealjs \
	  -s \
	  --embed-resources \
	  --resource-path=.:$(BUILD_DIR) \
	  --template $(REVEAL_TEMPLATE) \
	  --syntax-highlighting=$(HIGHLIGHT_STYLE) \
	  -c custom.css \
	  $(EXTRA_CSS_FLAG) \
	  -V theme=white \
	  -V center=false \
	  -V revealjs-url=$(REVEALJS_URL) \
	  -V slide-level=2 \
	  -V width=$(REVEAL_WIDTH) \
	  -V height=$(REVEAL_HEIGHT) \
	  -V margin=$(REVEAL_MARGIN) \
	  -V minScale=$(REVEAL_MIN) \
	  -V maxScale=$(REVEAL_MAX) \
	  -V transition=$(REVEAL_TRANSITION) \
	  -V "title-logos=$(TITLE_LOGOS_HTML)" \
	  -o $(STANDALONE_OUT)

.PHONY: pdf
pdf: reveal
	@bash -c '\
	  python3 -m http.server $(PDF_PORT) --bind 127.0.0.1 --directory $(BUILD_DIR) &\
	  SERVER_PID=$$!; sleep 1;\
	  npx --yes decktape --size 1920x1080 reveal "http://127.0.0.1:$(PDF_PORT)/$(PDF_FILE)" $(abspath $(PDF_OUT));\
	  kill $$SERVER_PID 2>/dev/null; true'
