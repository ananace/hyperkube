all: transform

%.base:
	wget https://github.com/kubernetes/kubernetes/raw/master/cluster/addons/dns/$@

%.epp: %.base
	sed -f transforms2epp.sed $< | sed s/__SOURCE_FILENAME__/$</g > $@
	if [ "$@" = "coredns.yaml.epp" ]; then \
	  sed -e 's/Optional\[Hyperkube::CIDR\].*/Hyperkube::CIDR $$service_cluster_ip_range,/' -i "$@";\
	fi

transform: kube-dns.yaml.epp coredns.yaml.epp

.PHONY: transform
