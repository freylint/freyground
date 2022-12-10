
# Acceptance testing routine
acceptance:
	npx jest

docs: docs/**
	node scripts/docbuild.js