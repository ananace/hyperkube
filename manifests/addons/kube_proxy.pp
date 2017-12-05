# == Class: hyperkube::addons::kube_proxy
#
# Installs kube-proxy as a cluster addon.
#
# === Parameters
#
# [*ensure*]
#    Can be 'present' or 'absent', defaults to 'present'.
#
# [*cluster_cidr*]
#    The cluster pod CIDR
#
# === Examples
#
# @example
#    class { 'hyperkube::addons::kube_proxy':
#      cluster_cidr => '10.1.0.0/32',
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
class hyperkube::addons::kube_proxy(
  Enum['present','absent'] $ensure = 'present',
  Hyperkube::CIDR $cluster_cidr,
) {
  file { "/etc/kubernetes/addons/kube_proxy.yaml":
    ensure  => $ensure,
    content => epp("hyperkube/addons/kube_proxy.yaml.epp", {
      cluster_cidr => $cluster_cidr,
    }),
  }
}
