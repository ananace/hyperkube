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
  Enum['docker','native'] $packaging = 'native',
  String $version = '1.8.4',

  String $docker_registry = 'gcr.io/google_containers',
  String $docker_image = 'hyperkube',

  String $native_url_template = 'http://storage.googleapis.com/kubernetes-release/release/v%s/bin/linux/amd64/hyperkube',

  Boolean $docker_manage_image = true,

  Boolean $manage_docker = true,

  Optional[String] $api_server = undef,
  Optional[String] $docker_image_tag = undef,
  Optional[String] $native_url = undef,
  Optional[String] $native_sha = undef,

  Optional[Enum['node','control_plane']] $role = undef,
) {
  if $manage_docker {
    include ::docker
  }

  if $packaging == 'docker' {
    if $docker_manage_image {
      docker::image { 'hyperkube':
        ensure    => present,
        image     => "${docker_registry}/${docker_image}",
        image_tag => pick($docker_image_tag, "v${version}"),
      }
    }
  } else {
    group { 'kube':
      ensure => present,
      system => true,
    }
    user { 'kube':
      ensure     => present,
      comment    => 'Kubernetes user',
      gid        => 'kube',
      home       => '/',
      managehome => false,
      shell      => '/sbin/nologin',
      system     => true,
    }

    file {
      default:
        ensure  => directory,
        purge   => true,
        recurse => true;

      '/opt/hyperkube': ;
      '/opt/hyperkube/bin': ;
    }
    file { '/var/run/kubernetes':
      ensure => directory,
      owner  => 'kube',
      group  => 'kube',
    }

    file { '/etc/kubernetes/common':
      ensure  => file,
      content => epp('hyperkube/sysconfig.epp', {
          comment               => 'General Kubernetes Configuration',
          environment_variables => {
            'KUBE_LOGTOSTDERR' => '--alsologtostderr',
            'KUBE_LOG_LEVEL'   => '',
          },
      }),
    }

    file { "/opt/hyperkube/bin/hyperkube-${version}":
      ensure => file,
      mode   => '0755',
      source => [
        "/opt/hyperkube/bin/hyperkube-${version}",
        pick($native_url, sprintf($native_url_template, $version)),
      ],
    }
    file { '/opt/hyperkube/bin/kubectl':
      ensure => link,
      target => "/opt/hyperkube/bin/hyperkube-${hyperkube::version}",
    }
  }

  file {
    default:
      ensure => directory;

    '/etc/cni': ;
    '/etc/cni/net.d': ;
    '/etc/kubernetes':
      purge   => true,
      recurse => true;
    '/etc/kubernetes/manifests':
      purge   => true,
      recurse => true;
    '/opt/cni': ;
    '/opt/cni/bin': ;
    '/srv/kubernetes': ;
  }

  if $role != undef {
    if $role == 'control_plane' {
      include ::hyperkube::control_plane
    }

    include ::hyperkube::node
  }
}
