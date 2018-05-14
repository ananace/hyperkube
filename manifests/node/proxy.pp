class hyperkube::node::proxy(
  Hyperkube::URI $master,

  Optional[Stdlib::Unixpath] $ca_cert = undef,
  Optional[Stdlib::Unixpath] $tls_cert_file = undef,
  Optional[Stdlib::Unixpath] $tls_private_key_file = undef,

  # Proxy arguments
  Optional[Boolean] $allow_verification_with_non_compliant_keys = undef,
  Optional[Boolean] $alsologtostderr = undef,
  Optional[Integer[0]] $application_metrics_count_limit = undef,
  Optional[Stdlib::Unixpath] $azure_container_registry_config = undef,
  Optional[String] $bind_address = undef,
  Optional[Array[Stdlib::Unixpath]] $boot_id_file = undef,
  Optional[Boolean] $cleanup_iptables = undef,
  Optional[Array[Hyperkube::CIDR]] $cloud_provider_gce_lb_src_cidrs = undef,
  Optional[Hyperkube::CIDR] $cluster_cidr = undef,
  Optional[Stdlib::Unixpath] $config = undef,
  Optional[Hyperkube::Duration] $config_sync_period = undef,
  Optional[Integer[0]] $conntrack_max_per_core = undef,
  Optional[Integer[0]] $conntrack_min = undef,
  Optional[Hyperkube::Duration] $conntrack_tcp_timeout_close_wait = undef,
  Optional[Hyperkube::Duration] $conntrack_tcp_timeout_established = undef,
  Optional[Stdlib::Unixpath] $container_hints = undef,
  Optional[Integer[0]] $default_not_ready_toleration_seconds = undef,
  Optional[Integer[0]] $default_unreachable_toleration_seconds = undef,
  Optional[Hyperkube::URI] $docker = undef,
  Optional[Array[String]] $docker_env_metadata_whitelist = undef,
  Optional[Boolean] $docker_only = undef,
  Optional[Stdlib::Unixpath] $docker_root = undef,
  Optional[Boolean] $enable_load_reader = undef,
  Optional[Hash[String,Hyperkube::Duration]] $event_storage_age_limit = undef,
  Optional[Hash[String,Integer[0]]] $event_storage_event_limit = undef,
  Optional[Hash[String,Boolean]] $feature_gates = undef,
  Optional[Hyperkube::Duration] $global_housekeeping_interval = undef,
  Optional[String] $google_json_key = undef,
  Optional[String] $healthz_bind_address = undef,
  Optional[Integer[1,65535]] $healthz_port = undef,
  Optional[String] $hostname_override = undef,
  Optional[Hyperkube::Duration] $housekeeping_interval = undef,
  Optional[Integer[0,31]] $iptables_masquerade_bit = undef,
  Optional[Hyperkube::Duration] $iptables_min_sync_period = undef,
  Optional[Hyperkube::Duration] $iptables_sync_period = undef,
  Optional[Enum['influxdb','gcm']] $ir_data_source = undef,
  Optional[String] $ir_dbname = undef,
  Optional[Hyperkube::URI] $ir_hawkular = undef,
  Optional[String] $ir_influxdb_host = undef,
  Optional[Boolean] $ir_namespace_only = undef,
  Optional[String] $ir_password = undef,
  Optional[Integer[0]] $ir_percentile = undef,
  Optional[String] $ir_user = undef,
  Optional[Integer[0]] $kube_api_burst = undef,
  Optional[String] $kube_api_content_type = undef,
  Optional[Integer[0]] $kube_api_qps = undef,
  Stdlib::Unixpath $kubeconfig = '/etc/kubernetes/kube-proxy.conf',
  Optional[String] $log_backtrace_at = undef,
  Optional[Boolean] $log_cadvisor_usage = undef,
  Optional[Stdlib::Unixpath] $log_dir = undef,
  Optional[Hyperkube::Duration] $log_flush_frequency = undef,
  Optional[Integer[0,5]] $log_level = undef,
  Optional[Boolean] $logtostderr = undef,
  Optional[Array[Stdlib::Unixpath]] $machine_id_file = undef,
  Optional[Boolean] $masquerade_all = undef,
  Optional[String] $metrics_bind_address = undef,
  Optional[Integer[-1000,1000]] $oom_score_adj = undef,
  Optional[Boolean] $profiling = undef,
  Optional[Enum['iptables','userspace']] $proxy_mode = undef,
  Optional[String] $proxy_port_range = undef,
  Optional[Integer[0,10]] $stderrthreshold = undef,
  Optional[Hyperkube::Duration] $storage_driver_buffer_duration = undef,
  Optional[String] $storage_driver_db = undef,
  Optional[String] $storage_driver_host = undef,
  Optional[String] $storage_driver_password = undef,
  Optional[Boolean] $storage_driver_secure = undef,
  Optional[String] $storage_driver_table = undef,
  Optional[String] $storage_driver_user = undef,
  Optional[Hyperkube::Duration] $udp_timeout = undef,
  Optional[Integer[0,10]] $v = undef,
  Optional[Hash[String,Integer[0,10]]] $vmodule = undef,

  Optional[Variant[String,Array[String]]] $_extra_parameters = undef,
) {
  $parameters = {
    'allow-verification-with-non-compliant-keys' => $allow_verification_with_non_compliant_keys,
    'alsologtostderr'                            => $alsologtostderr,
    'application-metrics-count-limit'            => $application_metrics_count_limit,
    'azure-container-registry-config'            => $azure_container_registry_config,
    'bind-address'                               => $bind_address,
    'boot-id-file'                               => $boot_id_file,
    'cleanup-iptables'                           => $cleanup_iptables,
    'cloud-provider-gce-lb-src-cidrs'            => $cloud_provider_gce_lb_src_cidrs,
    'cluster-cidr'                               => $cluster_cidr,
    'config'                                     => $config,
    'config-sync-period'                         => $config_sync_period,
    'conntrack-max-per-core'                     => $conntrack_max_per_core,
    'conntrack-min'                              => $conntrack_min,
    'conntrack-tcp-timeout-close-wait'           => $conntrack_tcp_timeout_close_wait,
    'conntrack-tcp-timeout-established'          => $conntrack_tcp_timeout_established,
    'container-hints'                            => $container_hints,
    'default-not-ready-toleration-seconds'       => $default_not_ready_toleration_seconds,
    'default-unreachable-toleration-seconds'     => $default_unreachable_toleration_seconds,
    'docker'                                     => $docker,
    'docker-env-metadata-whitelist'              => $docker_env_metadata_whitelist,
    'docker-only'                                => $docker_only,
    'docker-root'                                => $docker_root,
    'enable-load-reader'                         => $enable_load_reader,
    'event-storage-age-limit'                    => $event_storage_age_limit,
    'event-storage-event-limit'                  => $event_storage_event_limit,
    'feature-gates'                              => $feature_gates,
    'global-housekeeping-interval'               => $global_housekeeping_interval,
    'google-json-key'                            => $google_json_key,
    'healthz-bind-address'                       => $healthz_bind_address,
    'healthz-port'                               => $healthz_port,
    'hostname-override'                          => $hostname_override,
    'housekeeping-interval'                      => $housekeeping_interval,
    'iptables-masquerade-bit'                    => $iptables_masquerade_bit,
    'iptables-min-sync-period'                   => $iptables_min_sync_period,
    'iptables-sync-period'                       => $iptables_sync_period,
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
    'log-backtrace-at'                           => $log_backtrace_at,
    'log-cadvisor-usage'                         => $log_cadvisor_usage,
    'log-dir'                                    => $log_dir,
    'log-flush-frequency'                        => $log_flush_frequency,
    'loglevel'                                   => $log_level,
    'logtostderr'                                => $logtostderr,
    'machine-id-file'                            => $machine_id_file,
    'master'                                     => $master,
    'masquerade-all'                             => $masquerade_all,
    'metrics-bind-address'                       => $metrics_bind_address,
    'oom-score-adj'                              => $oom_score_adj,
    'profiling'                                  => $profiling,
    'proxy-mode'                                 => $proxy_mode,
    'proxy-port-range'                           => $proxy_port_range,
    'stderrthreshold'                            => $stderrthreshold,
    'storage-driver-buffer-duration'             => $storage_driver_buffer_duration,
    'storage-driver-db'                          => $storage_driver_db,
    'storage-driver-host'                        => $storage_driver_host,
    'storage-driver-password'                    => $storage_driver_password,
    'storage-driver-secure'                      => $storage_driver_secure,
    'storage-driver-table'                       => $storage_driver_table,
    'storage-driver-user'                        => $storage_driver_user,
    'udp-timeout'                                => $udp_timeout,
    'v'                                          => $v,
    'vmodule'                                    => $vmodule,
  }

  $parameter_result = ($parameters.filter |$k,$v| { $v != undef }.map |$k,$v| {
      if $v =~ Array {
        "--${k}=${join($v, ',')}"
      } elsif $v =~ Hash {
        $reduced = $v.map |$mk, $mv| { "${mk}=${mv}" }
        "--${k}=${join($reduced, ',')}"
      } else {
        "--${k}=${v}"
      }
  } + $_extra_parameters).filter |$k| { $k != undef }

  if $hyperkube::packaging == 'docker' {
    warn('Applying hyperkube::node::proxy on a docker hosted cluster, this is not supported.')
    warn('Use the addon hyperkube::addons::kube_proxy instead.')
  } else {
    hyperkube::kubeconfig { $kubeconfig:
      server             => $master,
      ca_cert            => $ca_cert,
      client_certificate => $tls_cert_file,
      client_key         => $tls_private_key_file,
    }
    file { '/etc/kubernetes/kube-proxy':
      ensure  => file,
      content => epp('hyperkube/sysconfig.epp', {
          comment               => 'Kubernetes Proxy Configuration',
          environment_variables => {
            'KUBE_PROXY_ARGS' => join($parameter_result, ' '),
          }
      }),
    }

    file { '/opt/hyperkube/bin/kube-proxy':
      ensure => link,
      target => "/opt/hyperkube/bin/hyperkube-${hyperkube::version}",
    }
    systemd::unit_file { 'kube-proxy.service':
      content => epp('hyperkube/node/kube-proxy.service.epp'),
    }
    ~> service { 'kube-proxy':
      ensure    => running,
      enable    => true,
      subscribe => [
        File['/opt/hyperkube/bin/kube-proxy'],
        File['/etc/kubernetes/kube-proxy'],
      ],
    }

    Exec['systemctl-daemon-reload'] -> Service['kube-proxy']
  }
}
