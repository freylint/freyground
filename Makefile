
all: readme

readme:
		cat docs/TOC.md projects/infra/README.md projects/web/README.md > README.md

web-%:
		cd projects/web && make $<

