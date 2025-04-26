.PHONY: all
all: ci cd

ci:
	ansible-playbook ci.yml -i hosts

cd:
	ansible-playbook cd.yml -i hosts