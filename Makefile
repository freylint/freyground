BUILD_DIR := build
DIST_DIR := $(BUILD_DIR)/dist
PROJ_DIR := projects

RS_GEN_DIR := $(BUILD_DIR)/gen
PROJ_SMI_DIR := $(PROJ_DIR)/fg-smi

WASM_TRGT := wasm32-unknown-unknown
WASI_TRGT := wasm32-wasi

all: acceptance

# Acceptance testing routine
acceptance: smi.md
	npx jest

docs: docs/**
	node scripts/docbuild.js

smi.md: $(PROJ_SMI_DIR)/smi.wit 
	wit-bindgen markdown $< --out-dir $(RS_GEN_DIR)

