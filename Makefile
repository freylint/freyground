NODERUNNER=npm
CARGO=cargo
DIST=dist
BACKEND=backend
BACKEND_TARGET=$(BACKEND)/target/release
BACKEND_TARGET_DBG=$(BACKEND)/target/debug


all: build

build: frontend backend-dbg
rbuild: frontend backend

drun: dbuild
	docker run -P freyground-runner:latest
dbuild:
	docker build . -t freyground-runner:latest

run: frontend backend-dbg run-internal
rrun: frontend backend run-internal
run-internal:
	cd $(DIST) && ./freyground-backend

mk_build_dir:
	if ! [ -d "$(DIST)" ]; then \
		mkdir $(DIST) ; \
	fi

install:
	cd frontend && $(NODERUNNER) install --force

frontend: mk_build_dir install
	cd frontend && $(NODERUNNER) run build
	cp -r frontend/build/ $(DIST)

backend: mk_build_dir
	cd backend && $(CARGO) b -r
	cp -r $(BACKEND_TARGET)/freyground-backend $(DIST)
	cp -r $(BACKEND)/Rocket.toml $(DIST)

backend-dbg: mk_build_dir
	cd backend && $(CARGO) b
	cp -r $(BACKEND_TARGET_DBG)/freyground-backend $(DIST)
	cp -r $(BACKEND)/Rocket.toml $(DIST)

cleanbuild: clean build
cleanrun: cleanbuild run

clean: clean-frontend clean-backend clean-dist
clean-dist:
	rm -rf $(DIST)
clean-frontend:
	rm -rf frontend/node_modules/
clean-backend:
	rm -rf backend/target/

