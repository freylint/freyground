
CODE_DIR := ./roles/code/files
ANS_FLAGS := -i inventory.yml --vault-password-file .vault_pass.txt

all:
	@echo "This is a Makefile for the freyground project. Use 'make <target>' to build specific targets."

test:
	ansible-playbook ${ANS_FLAGS} playbooks/ci.yml --tags test

ci:
	ansible-playbook ${ANS_FLAGS} playbooks/ci.yml

cd:
	ansible-playbook ${ANS_FLAGS} playbooks/cd.yml

devenv:
	ansible-playbook ${ANS_FLAGS} playbooks/devenv.yml

clean:
	rm -rf roles/code/build

add-go-bin:
	cd $(CODE_DIR)

fg-lifecycle:
	# TODO update to run regenerator for automatic part of Makefile
	git fetch

fg-go-run:
	cd $(CODE_DIR) && go run $(GO_RUN_TARGET)

fgweb-container:
	make ci
	podman run -p 8080:8080 localhost/fgweb:indev
	