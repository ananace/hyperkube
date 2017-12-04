# == Class: hyperkube
#
# Full description of class hyperkube here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array. Defaults
#   to []."
#
# === Examples
#
# @example
#    class { 'hyperkube':

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
class hyperkube(
  Enum['docker','native'] $packaging = 'docker',

  String $docker_registry = "gcr.io/google_containers",
  String $docker_image = "hyperkube",
  String $docker_image_tag = "v1.8.4",

  Boolean $docker_manage_docker = true,
  Boolean $docker_manage_image = true,

  Optional[String] $api_server = undef,
  Optional[String] $native_url = undef,
  Optional[String] $native_sha = undef,

  Optional[Enum['node','control_plane']] $role = undef,
) {
  if $packaging == 'docker' {
    if $docker_manage_docker {
      include ::docker
    }

    if $docker_manage_image {
      docker::image { 'hyperkube':
        ensure    => present,
        image_tag => $image_tag,
      }
    }
  }

  file {
    default:
      ensure => directory;

    '/etc/cni': ;
    '/etc/cni/net.d': ;
    '/etc/kubernetes': ;
    '/etc/kubernetes/manifests': ;
    '/opt/cni': ;
    '/opt/cni/bin': ;
    '/srv/kubernetes': ;
  }

  if $role == 'control_plane' {
    include ::hyperkube::control_plane
  }

  include ::hyperkube::node
}
