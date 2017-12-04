# == Class: hyperkube::addons::dns
#
# Installs a cluster DNS addon for your cluster, currently supports both
# CoreDNS as well as kube-dns.
#
# === Parameters
#
# [*ensure*]
#    Can be 'present' or 'absent', defaults to 'present'.
#
# [*provider*]
#    Can be one of 'kube-dns' or 'coredns' for the DNS provider to use,
#    defaults to kube-dns.
#
# [*dns_domain*]
#    The domain of the cluster, defaults to 'cluster.local'.
#
# [*dns_ip*]
#    The cluster IP for the DNS service, this needs to be the same as in your
#    control plane configuration.
#
# [*service_cidr*]
#    The CIDR for your services, only required for the CoreDNS provider.
#
# === Examples
#
# @example
#    class { 'hyperkube::addons::dns':
#      ensure       => present,
#      dns_domain   => 'cluster.local',
#      dns_ip       => '10.2.0.2',
#      service_cidr => '10.2.0.0/24',
#      provider     => 'coredns',
#    }
#
# === Authors
#
# Alexander Olofsson <alexander.olofsson@liu.se>
#
# === Copyright
#
# Copyright 2017 Linköping University
#
class hyperkube::addons::dns(
  Enum['present','absent'] $ensure = 'present',
  Enum['coredns','kube-dns'] $provider = 'kube-dns',
  String $dns_domain = 'cluster.local',
  Stdlib::Compat::Ip_address $dns_ip,
  Optional[Hyperkube::CIDR] $service_cidr = undef,
) {
  if $provider == 'coredns' and $service_cidr == undef {
    fail('When using the CoreDNS provider, you need to provide a service CIDR')
  }
  if !defined(Hyperkube::Control_plane::Addon_manager) {
    fail('Addons can only be applied on the same node as the addon manager')
  }

  file { "/etc/kubernetes/addons/${provider}.yaml":
    ensure  => $ensure,
    content => epp("hyperkube/addons/${provider}.yaml.epp", {
      dns_domain               => $dns_domain,
      dns_server               => $dns_ip,
      service_cluster_ip_range => $service_cidr
    }),
  }
}
