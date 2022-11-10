NODERUNNER = npm
CARGO = cargo
CARGO_RELEASE_FLAGS = --release

all: frontend backend
run:
	cd dist && ./freyground-backend
cleanrun: cleanbuild run

mk_build_dir:
	if ! [ -d "dist" ]; then \
		mkdir dist; \
	fi

install:
	cd frontend && $(NODERUNNER) install

frontend: mk_build_dir install
	cd frontend && $(NODERUNNER) run build
	cp -r frontend/build/* dist/

backend: mk_build_dir
	cd backend && $(CARGO) b $(CARGO_RELEASE_FLAGS)
	cp backend/target/release/freyground-backend dist/

cleanbuild: clean all

clean: clean-frontend clean-backend
clean-frontend:
	rm -rf frontend/node_modules/
clean-backend:
	rm -rf backend/target/
