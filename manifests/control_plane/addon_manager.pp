# == Class: hyperkube::control_plane::addon_manager
#
# Sets up a Kubernetes manifest for running an addon manager,
# required for using cluster addons.
#
# NB: This control plane piece will always run as a kubelet
#     manifest, never as a native binary.
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
