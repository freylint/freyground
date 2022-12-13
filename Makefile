BUILD_DIR := build
DIST_DIR := $(BUILD_DIR)/dist
PROJ_DIR := projects

RS_GEN_DIR := $(BUILD_DIR)/gen
GF_GEN_DIR := $(BUILD_DIR)/gf
PROJ_SMI_DIR := $(PROJ_DIR)/fg-smi
PROJ_GF_DIR := $(PROJ_DIR)/gridfinity

WASM_TRGT := wasm32-unknown-unknown
WASI_TRGT := wasm32-wasi

all: docs acceptance

test: test-docs acceptance

acceptance: smi.md
	npx jest

test-docs:
	npx textlint docs/**.md

docs: docs/**
	node scripts/docbuild.js

smi.md: $(PROJ_SMI_DIR)/fg-smi/Cargo.toml

# Gridfinity Targets
gf: $(PROJ_GF_DIR)/*.scad
	mkdir -p $(GF_GEN_DIR)
	openscad -o $(GF_GEN_DIR)/$@.stl $<