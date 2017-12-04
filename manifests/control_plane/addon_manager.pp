# == Class: hyperkube::control_plane::addon_manager
#
# Sets up a Kubernetes manifest for running an addon manager,
# required for using cluster addons.
#
# === Examples
#
# @example
#    class { 'hyperkube::control_plane::addon_manager': }
#
# === Authors
#
# Alexander Olofsson <alexander.olofsson@liu.se>
#
# === Copyright
#
# Copyright 2017 Linköping University
#
class hyperkube::control_plane::addon_manager {
  file { '/etc/kubernetes/manifests/kube-addon-manager.yaml':
    ensure  => file,
    content => epp('hyperkube/control_plane/kube-addon-manager.yaml.epp'),
  }

  file { '/etc/kubernetes/addons':
    ensure => directory,
  }
}
