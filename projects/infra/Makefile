
OCI_RUNNER:=podman
RELEASE:=centos-9-stream

IPA_IP:=10.88.0.2
IPA_DATA_DIR:= /etc/freyground/ipa-data
IPA_PORT_FLAGS:= -p 80:80 -p 443:443 -p 389:389 -p 636:636 -p 88:88 -p 464:464 \
		 -p 53:53/udp -p 53:53 -p 88:88/udp -p 464:464/udp -p 123:123/udp

all:

# Projects

# Hosts
gdw: base
homelab: base podman freeipa-server nfs-server

# Packages
base:
	dnf install -y vim epel-release
	dnf upgrade -y --refresh

fuse:
	dnf install -y fuse
	usermod -aG fuse ${USER}

podman:
	dnf install -y podman podman-tui
	systemctl enable --now podman.socket
	sudo setsebool -P container_manage_cgroup 1

nfs-server:
	dnf -y install nfs-utils
	systemctl enable --now rpcbind
	systemctl enable --now nfs-server

	mkdir -p /srv/share

	echo "/srv/share gdw.freyground.com(rw,sync,no_root_squash)" > /etc/exports

	exportfs -r

	firewall-cmd --permanent --add-service mountd
	firewall-cmd --permanent --add-service rpc-bind
	firewall-cmd --permanent --add-service nfs
	firewall-cmd --reload

freeipa-server :
	mkdir -p ${IPA_DATA_DIR}
	${OCI_RUNNER} run -d --replace --name freeipa \
		--ip ${IPA_IP} \
		${IPA_PORT_FLAGS} \
		-h ipa.freyground.com \
		-v ${IPA_DATA_DIR}:/data:Z \
		freeipa/freeipa-server:${RELEASE}

freeipa-client:
	dnf install -y freeipa-client
	ipa-client-install --mkhomedir

