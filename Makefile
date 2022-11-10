NODERUNNER = npm
CARGO = cargo
CARGO_RELEASE_FLAGS = --release

all: frontend backend

mk_build_dir:
	if ! [ -d "dist" ]; then \
		mkdir dist; \
	fi

frontend: mk_build_dir
	cd frontend && $(NODERUNNER) run build
	cp -r frontend/build/ dist/

backend: mk_build_dir
	cd backend && $(CARGO) b $(CARGO_RELEASE_FLAGS)
	cp backend/target/release/freyground-backend dist/


