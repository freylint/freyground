BUILD_DIR := build
DIST_DIR := $(BUILD_DIR)/dist
PROJ_DIR := projects

RS_GEN_DIR := $(BUILD_DIR)/gen
PROJ_SMI_DIR := $(PROJ_DIR)/fg-smi

WASM_TRGT := wasm32-unknown-unknown
WASI_TRGT := wasm32-wasi

all: docs acceptance

# Acceptance testing routine
acceptance: smi.md
	npx jest

test-docs:
	npx textlint docs/**.md

docs: docs/**
	node scripts/docbuild.js

smi.md: $(PROJ_SMI_DIR)/fg-smi/Cargo.toml

