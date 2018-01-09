# == Class: hyperkube::control_plane::controller_manager
#
# Sets up a Kubernetes manifest for running an controller_manager
#
# === Parameters
#
#
# === Examples
#
# @example
#    class { 'hyperkube::control_plane::controller_manager':
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
class hyperkube::control_plane::controller_manager(
  Enum['present','absent'] $ensure = present,

  String $version = $hyperkube::version,

  String $docker_registry = $hyperkube::docker_registry,
  String $docker_image = $hyperkube::docker_image,
  String $docker_image_tag = pick($hyperkube::docker_image_tag, "v${version}"),

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

  $parameter_result = $parameters.filter |$k,$v| { $v != undef }.map |$k,$v| {
    if $v =~ Array {
      "--${k}=${join($v, ',')}"
    } elsif $v =~ Hash {
      $reduced = $v.map |$mk, $mv| { "${mk}=${mv}" }
      "--${k}=${reduced}"
    } else {
      "--${k}=${v}"
    }
  } + $_extra_parameters

  file { '/etc/kubernetes/controller-manager.conf':
    ensure  => file,
    content => epp('hyperkube/kubeconfig.epp', {
    }),
  }

  if $hyperkube::packaging == 'docker' {
    file { '/etc/kubernetes/manifests/kube-controller-manager.yaml':
      ensure  => file,
      content => epp('hyperkube/control_plane/kube-controller-manager.yaml.epp', {
          arguments  => $parameter_result,
          full_image => "${docker_registry}/${docker_image}:${docker_image_tag}",
          port       => pick($port, 10252),
      }),
    }
  } else {
    file { '/etc/kubernetes/controller-manager':
      ensure  => file,
      content => epp('hyperkube/sysconfig.epp', {
          comment               => 'Kubernetes Controller Manager Configuration',
          environment_variables => {
            'KUBE_CONTROLLER_MANAGER_ARGS' => join($parameter_result, ' '),
          },
      }),
    }

    systemd::unit_file { 'kube-controller-manager.service':
      content => epp('hyperkube/control_plane/kube-controller-manager.service.epp', {
          $version => $version,
      }),
    }
    ~> service { 'kube-controller-manager':
      ensure => running,
      enable => true,
    }
  }
}
