BUILD_DIR := build
DIST_DIR := $(BUILD_DIR)/dist
PROJ_DIR := projects

RS_GEN_DIR := $(BUILD_DIR)/gen
GF_GEN_DIR := $(BUILD_DIR)/gf
PROJ_SMI_DIR := $(PROJ_DIR)/fg-smi
PROJ_GF_DIR := $(PROJ_DIR)/gridfinity

WASM_TRGT := wasm32-unknown-unknown
WASI_TRGT := wasm32-wasi
GF_MODULES := $(GF_GEN_DIR)/hairtie_holder.3mf $(GF_GEN_DIR)/quad_bin.3mf

all: gridfinity docs acceptance

test: test-docs acceptance

acceptance: smi.md
	npx jest

test-docs:
	npx textlint docs/**.md

docs: docs/**
	node scripts/docbuild.js

smi.md: $(PROJ_SMI_DIR)/Cargo.toml

# Gridfinity
gf: gridfinity
gridfinity:
	mkdir -p $(GF_GEN_DIR)
	node scripts/gridfinity-build.js
