QUADLET_DIR:=/etc/containers/systemd
SRV_NAME:=fg-web
SRV_DIR:=/srv/${SRV_NAME}

all: local

status:
	systemctl status ${SRV_NAME}.service

quadlet-dbg: install-static
	/usr/lib/systemd/system-generators/podman-system-generator -dryrun

local:
		xdg-open ./static/index.html

install: remove install-deps install-static quadlet-dbg install-enable

install-deps:
		dnf install -y podman

install-static:
		mkdir -p ${SRV_DIR}
		cp -rf static/* ${SRV_DIR}
		cp -f ${SRV_NAME}.container ${QUADLET_DIR}/${SRV_NAME}.container

install-enable:
		systemctl daemon-reload
		systemctl start ${SRV_NAME}.service

remove:
		systemctl stop ${SRV_NAME}.service || true
		systemctl disable ${SRV_NAME}.service || true
		rm -rf ${SRV_DIR}
		rm -rf ${QUADLET_DIR}/${SRV_NAME}.container
		systemctl daemon-reload
