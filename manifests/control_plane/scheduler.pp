# == Class: hyperkube::control_plane::scheduler
#
# Sets up a Kubernetes manifest for running an scheduler
#
# === Parameters
#
#
# === Examples
#
# @example
#    class { 'hyperkube::control_plane::scheduler':
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
class hyperkube::control_plane::scheduler(
  Enum['present','absent'] $ensure = present,

  String $docker_registry = $hyperkube::docker_registry,
  String $docker_image = $hyperkube::docker_image,
  String $docker_image_tag = $hyperkube::docker_image_tag,

  Optional[Integer[1,65535]] $port = undef,

  Optional[Variant[String,Array[String]]] $extra_parameters = undef,
) {
  if $extra_parameters != undef {
    if $extra_parameters =~ String {
      $_extra_parameters = [$extra_parameters]
    } else {
      $_extra_parameters = $extra_parameters
    }
  } else {
    $_extra_parameters = []
  }

  $parameters = {
  }

  file { '/etc/kubernetes/scheduler.conf':
    ensure  => file,
    content => epp('hyperkube/kubeconfig.epp', {
    }),
  }

  file { '/etc/kubernetes/manifests/kube-scheduler.yaml':
    ensure  => file,
    content => epp('hyperkube/control_plane/kube-scheduler.yaml.epp', {
        arguments  => $parameters.filter |$k,$v| { $v != undef }.map |$k,$v| {
          if $v =~ Array {
            "--${k}=${join($v, ',')}"
          } elsif $v =~ Hash {
            $reduced = $v.map |$mk, $mv| { "${mk}=${mv}" }
            "--${k}=${reduced}"
          } else {
            "--${k}=${v}"
          }
        } + $_extra_parameters,
        full_image => "${docker_registry}/${docker_image}:${docker_image_tag}",
        port       => pick($port, 10251),
    }),
  }
}
