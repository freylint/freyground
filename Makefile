.PHONY: all
all: ci cd

install:
	ansible-galaxy collection install -r requirements.yml

ci:
	ansible-playbook ci.yml -i hosts

cd:
	ansible-playbook cd.yml -i hosts