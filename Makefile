
all: readme

readme:
		cat docs/TOC.md projects/infra/README.md projects/website/README.md > README.md
