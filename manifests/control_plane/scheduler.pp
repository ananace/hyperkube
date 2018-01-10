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
  String $docker_image_tag = pick($hyperkube::docker_image_tag, "v${hyperkube::version}"),

  Optional[Stdlib::Compat::Ip_address] $address = undef,
  Optional[String] $algorithm_provider = undef,
  Optional[Boolean] $allow_verification_with_non_compliant_keys = undef,
  Optional[Boolean] $alsologtostderr = undef,
  Optional[Integer[0]] $application_metrics_count_limit = undef,
  Optional[Stdlib::Unixpath] $azure_container_registry_config = undef,
  Optional[Array[Stdlib::Unixpath]] $boot_id_file = undef,
  Optional[Array[Hyperkube::CIDR]] $cloud_provider_gce_lb_src_cidrs = undef,
  Optional[Stdlib::Unixpath] $container_hints = undef,
  Optional[Boolean] $contention_profiling = undef,
  Optional[Integer[0]] $default_not_ready_toleration_seconds = undef,
  Optional[Integer[0]] $default_unreachable_toleration_seconds = undef,
  Optional[Hyperkube::URI] $docker = undef,
  Optional[Array[String]] $docker_env_metadata_whitelist = undef,
  Optional[Boolean] $docker_only = undef,
  Optional[Stdlib::Unixpath] $docker_root = undef,
  Optional[Boolean] $docker_tls = undef,
  Optional[Stdlib::Unixpath] $docker_tls_ca = undef,
  Optional[Stdlib::Unixpath] $docker_tls_cert = undef,
  Optional[Stdlib::Unixpath] $docker_tls_key = undef,
  Optional[Boolean] $enable_load_reader = undef,
  Optional[Hash[String,Integer[0]]] $event_storage_age_limit = undef,
  Optional[Hash[String,Integer[0]]] $event_storage_event_limit = undef,
  Optional[Hash[String,Boolean]] $feature_gates = undef,
  Optional[Hyperkube::Duration] $global_housekeeping_interval = undef,
  Optional[String] $google_json_key = undef,
  Optional[Hyperkube::Duration] $housekeeping_interval = undef,
  Optional[Enum['influxdb','gcm']] $ir_data_source = undef,
  Optional[String] $ir_dbname = undef,
  Optional[Hyperkube::URI] $ir_hawkular = undef,
  Optional[String] $ir_influxdb_host = undef,
  Optional[Boolean] $ir_namespace_only = undef,
  Optional[String] $ir_password = undef,
  Optional[Integer[0]] $ir_percentile = undef,
  Optional[String] $ir_user = undef,
  Optional[Integer[1]] $kube_api_burst = undef,
  Optional[String] $kube_api_content_type = undef,
  Optional[Integer[1]] $kube_api_qps = undef,
  Stdlib::Unixpath $kubeconfig = '/etc/kubernetes/scheduler.conf',
  Optional[Boolean] $leader_elect = undef,
  Optional[Hyperkube::Duration] $leader_elect_lease_duration = undef,
  Optional[Hyperkube::Duration] $leader_elect_renew_deadline = undef,
  Optional[Enum['endpoints','configmap']] $leader_elect_resource_lock = undef,
  Optional[Hyperkube::Duration] $leader_elect_retry_period = undef,
  Optional[String] $lock_object_name = undef,
  Optional[String] $lock_object_namespace = undef,
  Optional[String] $log_backtrace_at = undef,
  Optional[Boolean] $log_cadvisor_usage = undef,
  Optional[Stdlib::Unixpath] $log_dir = undef,
  Optional[Hyperkube::Duration] $log_flush_frequency = undef,
  Optional[Integer[0,5]] $loglevel = undef,
  Optional[Boolean] $logtostderr = undef,
  Optional[Array[Stdlib::Unixpath]] $machine_id_file = undef,
  String $master = 'http://localhost:8080',
  Optional[Stdlib::Unixpath] $policy_config_file = undef,
  Optional[String] $policy_configmap = undef,
  Optional[String] $policy_configmap_namespace = undef,
  Optional[Integer[1,65535]] $port = 10251,
  Optional[Boolean] $profiling = undef,
  Optional[String] $scheduler_name = undef,
  Optional[Integer[0,5]] $stderrthreshold = undef,
  Optional[Hyperkube::Duration] $storage_driver_buffer_duration = undef,
  Optional[String] $storage_driver_db = undef,
  Optional[String] $storage_driver_host = undef,
  Optional[String] $storage_driver_password = undef,
  Optional[Boolean] $storage_driver_secure = undef,
  Optional[String] $storage_driver_table = undef,
  Optional[String] $storage_driver_user = undef,
  Optional[String] $use_legacy_policy_config = undef,
  Optional[Integer[0,10]] $v= undef,
  Optional[Hash[String,Integer[0,10]]] $vmodule = undef,

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
    'address'                                    => $address,
    'algorithm-provider'                         => $algorithm_provider,
    'allow-verification-with-non-compliant-keys' => $allow_verification_with_non_compliant_keys,
    'alsologtostderr'                            => $alsologtostderr,
    'application-metrics-count-limit'            => $application_metrics_count_limit,
    'azure-container-registry-config'            => $azure_container_registry_config,
    'boot-id-file'                               => $boot_id_file,
    'cloud-provider-gce-lb-src-cidrs'            => $cloud_provider_gce_lb_src_cidrs,
    'container-hints'                            => $container_hints,
    'contention-profiling'                       => $contention_profiling,
    'default-not-ready-toleration-seconds'       => $default_not_ready_toleration_seconds,
    'default-unreachable-toleration-seconds'     => $default_unreachable_toleration_seconds,
    'docker'                                     => $docker,
    'docker-env-metadata-whitelist'              => $docker_env_metadata_whitelist,
    'docker-only'                                => $docker_only,
    'docker-root'                                => $docker_root,
    'docker-tls'                                 => $docker_tls,
    'docker-tls-ca'                              => $docker_tls_ca,
    'docker-tls-cert'                            => $docker_tls_cert,
    'docker-tls-key'                             => $docker_tls_key,
    'enable-load-reader'                         => $enable_load_reader,
    'event-storage-age-limit'                    => $event_storage_age_limit,
    'event-storage-event-limit'                  => $event_storage_event_limit,
    'feature-gates'                              => $feature_gates,
    'global-housekeeping-interval'               => $global_housekeeping_interval,
    'google-json-key'                            => $google_json_key,
    'housekeeping-interval'                      => $housekeeping_interval,
    'ir-data-source'                             => $ir_data_source,
    'ir-dbname'                                  => $ir_dbname,
    'ir-hawkular'                                => $ir_hawkular,
    'ir-influxdb-host'                           => $ir_influxdb_host,
    'ir-namespace-only'                          => $ir_namespace_only,
    'ir-password'                                => $ir_password,
    'ir-percentile'                              => $ir_percentile,
    'ir-user'                                    => $ir_user,
    'kube-api-burst'                             => $kube_api_burst,
    'kube-api-content-type'                      => $kube_api_content_type,
    'kube-api-qps'                               => $kube_api_qps,
    'kubeconfig'                                 => $kubeconfig,
    'leader-elect'                               => $leader_elect,
    'leader-elect-lease-duration'                => $leader_elect_lease_duration,
    'leader-elect-renew-deadline'                => $leader_elect_renew_deadline,
    'leader-elect-resource-lock'                 => $leader_elect_resource_lock,
    'leader-elect-retry-period'                  => $leader_elect_retry_period,
    'lock-object-name'                           => $lock_object_name,
    'lock-object-namespace'                      => $lock_object_namespace,
    'log-backtrace-at'                           => $log_backtrace_at,
    'log-cadvisor-usage'                         => $log_cadvisor_usage,
    'log-dir'                                    => $log_dir,
    'log-flush-frequency'                        => $log_flush_frequency,
    'loglevel'                                   => $loglevel,
    'logtostderr'                                => $logtostderr,
    'machine-id-file'                            => $machine_id_file,
    'master'                                     => $master,
    'policy-config-file'                         => $policy_config_file,
    'policy-configmap'                           => $policy_configmap,
    'policy-configmap-namespace'                 => $policy_configmap_namespace,
    'port'                                       => $port,
    'profiling'                                  => $profiling,
    'scheduler-name'                             => $scheduler_name,
    'stderrthreshold'                            => $stderrthreshold,
    'storage-driver-buffer-duration'             => $storage_driver_buffer_duration,
    'storage-driver-db'                          => $storage_driver_db,
    'storage-driver-host'                        => $storage_driver_host,
    'storage-driver-password'                    => $storage_driver_password,
    'storage-driver-secure'                      => $storage_driver_secure,
    'storage-driver-table'                       => $storage_driver_table,
    'storage-driver-user'                        => $storage_driver_user,
    'use-legacy-policy-config'                   => $use_legacy_policy_config,
    'v'                                          => $v,
    'vmodule'                                    => $vmodule,
  }

  $parameter_result = $parameters.filter |$k,$v| { $v != undef }.map |$k,$v| {
    if $v =~ Array {
      "--${k}=${join($v, ',')}"
    } elsif $v =~ Hash {
      $reduced = $v.map |$mk, $mv| { "${mk}=${mv}" }
      "--${k}=${join($reduced, ',')}"
    } else {
      "--${k}=${v}"
    }
  } + $_extra_parameters

  if $hyperkube::packaging == 'docker' {
    hyperkube::kubeconfig { $kubeconfig:
      embed_files => true,
      in_cluster  => true,
    }
    file { '/etc/kubernetes/scheduler.conf':
      ensure  => file,
      content => epp('hyperkube/kubeconfig.epp'),
    }
    file { '/etc/kubernetes/manifests/kube-scheduler.yaml':
      ensure  => file,
      content => epp('hyperkube/control_plane/kube-scheduler.yaml.epp', {
          arguments  => $parameter_result,
          full_image => "${docker_registry}/${docker_image}:${docker_image_tag}",
          port       => pick($port, 10251),
      }),
    }
  } else {
    hyperkube::kubeconfig { $kubeconfig:
      server => $master,
    }
    file { '/etc/kubernetes/scheduler':
      ensure  => file,
      content => epp('hyperkube/sysconfig.epp', {
          comment               => 'Kubernetes Scheduler Configuration',
          environment_variables => {
            'KUBE_SCHEDULER_ARGS' => join($parameter_result, ' '),
          },
      }),
    }

    file { '/opt/hyperkube/bin/kube-scheduler':
      ensure => link,
      target => "/opt/hyperkube/bin/hyperkube-${hyperkube::version}",
    }
    systemd::unit_file { 'kube-scheduler.service':
      content => epp('hyperkube/control_plane/kube-scheduler.service.epp'),
    }
    ~> service { 'kube-scheduler':
      ensure    => running,
      enable    => true,
      subscribe => [
        File['/opt/hyperkube/bin/kube-scheduler'],
        File['/etc/kubernetes/scheduler'],
      ],
    }
  }
}
