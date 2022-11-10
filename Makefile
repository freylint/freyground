NODERUNNER = npm
CARGO = cargo

all: frontend backend

run:
	cd dist && ./freyground-backend

docker-run: docker
	docker run freyground-runner:latest

drun: frontend backend-dbg run


docker:
	docker build . -t freyground-runner:latest



mk_build_dir:
	if ! [ -d "dist" ]; then \
		mkdir dist; \
	fi

install:
	cd frontend && $(NODERUNNER) install --force

frontend: mk_build_dir install
	cd frontend && $(NODERUNNER) run build
	cp -r frontend/build/ dist/

backend: mk_build_dir
	cd backend && $(CARGO) b -r
	cp -r backend/target/release/freyground-backend dist/

backend-dbg:
	cd backend && $(CARGO) b

cleanbuild: clean all
cleanrun: cleanbuild run

clean: clean-frontend clean-backend clean-dist
clean-dist:
	rm -rf dist/
clean-frontend:
	rm -rf frontend/node_modules/
clean-backend:
	rm -rf backend/target/
