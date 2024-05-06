.PHONY: print-size

GO_BUILD := go build
GO_TRIM_BUILD := go build -trimpath -ldflags="-s -w"
TINYGO_BUILD := tinygo build
UPX := upx
UPX_MAX := upx -9 --ultra-brute

OUT_DIR := out

TARGETS := print fmtprint hellohttp
GO_TARGETS := $(addprefix $(OUT_DIR)/,$(addsuffix -go,$(TARGETS)))
GO_TRIM_TARGETS := $(addprefix $(OUT_DIR)/,$(addsuffix -go-trim,$(TARGETS)))
TINYGO_TARGETS := $(addprefix $(OUT_DIR)/,$(addsuffix -tinygo,$(TARGETS)))
UPX_TARGETS := $(addsuffix -upx, $(GO_TARGETS) $(GO_TRIM_TARGETS) $(TINYGO_TARGETS))
UPX_MAX_TARGETS := $(addsuffix -upx-max, $(GO_TARGETS) $(GO_TRIM_TARGETS) $(TINYGO_TARGETS))

print-size: all
	 ls -lh ./out | awk '{print $$8, $$5}' | column -s ' ' -t

all: $(GO_TARGETS) $(TINYGO_TARGETS) $(UPX_TARGETS) $(UPX_MAX_TARGETS)

$(GO_TARGETS): $(OUT_DIR)/%-go: %
	$(GO_BUILD) -o $@ ./$<

$(GO_TRIM_TARGETS): $(OUT_DIR)/%-go-trim: %
	$(GO_TRIM_BUILD) -o $@ ./$<

$(TINYGO_TARGETS): $(OUT_DIR)/%-tinygo: %
	$(TINYGO_BUILD) -o $@ ./$<

$(UPX_TARGETS): $(OUT_DIR)/%-upx: $(OUT_DIR)/%
	$(UPX) -o $@ $<

$(UPX_MAX_TARGETS): $(OUT_DIR)/%-upx-max: $(OUT_DIR)/%
	$(UPX_MAX) -o $@ $<

clean:
	rm $(OUT_DIR)/*