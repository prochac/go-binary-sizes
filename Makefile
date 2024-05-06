.PHONY: print-size

GO := go
TINYGO := tinygo
UPX := upx

OUT_DIR := out
GO_BUILD := go build -o

TARGETS := print fmtprint hellohttp

GO_TARGETS := $(addprefix $(OUT_DIR)/go-,$(TARGETS))
TINYGO_TARGETS := $(addprefix $(OUT_DIR)/tinygo-,$(TARGETS))
GO_UPX_TARGETS := $(addsuffix -upx, $(GO_TARGETS))
TINYGO_UPX_TARGETS := $(addsuffix -upx, $(TINYGO_TARGETS))

print-size: all
	 ls -lh ./out | awk '{print $$8, $$5}' | column -s ' ' -t

all: $(GO_TARGETS) $(TINYGO_TARGETS) $(GO_UPX_TARGETS) $(TINYGO_UPX_TARGETS)

$(GO_TARGETS): $(OUT_DIR)/go-%: %
	$(GO) build -o $@ ./$<

$(TINYGO_TARGETS): $(OUT_DIR)/tinygo-%: %
	$(TINYGO) build -o $@ ./$<

$(GO_UPX_TARGETS): $(OUT_DIR)/go-%-upx: $(OUT_DIR)/go-%
	$(UPX) -o $@ $<

$(TINYGO_UPX_TARGETS): $(OUT_DIR)/tinygo-%-upx: $(OUT_DIR)/tinygo-%
	$(UPX) -o $@ $<

clean:
	rm $(OUT_DIR)/*
