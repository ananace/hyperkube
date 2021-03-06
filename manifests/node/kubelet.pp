class hyperkube::node::kubelet(
  Optional[String] $ca_cert = undef,
  Optional[Boolean] $kubeconfig_embed = undef,

  # Meta parameters
  Enum['docker','native'] $packaging = $hyperkube::packaging,
  String $version = $hyperkube::version,

  String $docker_registry = $hyperkube::docker_registry,
  String $docker_image = $hyperkube::docker_image,
  String $docker_image_tag = pick($hyperkube::docker_image_tag, "v${version}"),

  Optional[String] $address = undef,
  Optional[Boolean] $allow_privileged = undef,
  Optional[Boolean] $allow_verification_with_non_compliant_keys = undef,
  Optional[Boolean] $alsologtostderr = undef,
  Optional[Boolean] $anonymous_auth = undef,
  Optional[Integer[0]] $application_metrics_count_limit = undef,
  Optional[Variant[Hyperkube::URI,Array[Hyperkube::URI]]] $api_servers = undef,
  Optional[Boolean] $authentication_token_webhook = undef,
  Optional[Hyperkube::Duration] $authentication_token_webhook_cache_ttl = undef,
  Optional[Array[Variant[Enum['AlwaysAllow','AlwaysDeny','ABAC','Webhook','RBAC','Node'],String]]] $authorization_mode = undef,
  Optional[Hyperkube::Duration] $authorization_webhook_cache_authorized_ttl = undef,
  Optional[Hyperkube::Duration] $authorization_webhook_cache_unauthorized_ttl = undef,
  Optional[Stdlib::Unixpath] $azure_container_registry_config = undef,
  Optional[Array[Stdlib::Unixpath]] $boot_id_file = undef,
  Optional[Stdlib::Unixpath] $bootstrap_kubeconfig = undef,
  Optional[Integer[1,65535]] $cadvisor_port = undef,
  Optional[Stdlib::Unixpath] $cert_dir = undef,
  Optional[Variant[Enum['systemd','cgroupfs'],String]] $cgroup_driver = undef,
  Optional[String] $cgroup_root = undef,
  Optional[Boolean] $cgroups_per_qos = undef,
  Optional[Stdlib::Unixpath] $client_ca_file = undef,
  Optional[Stdlib::Unixpath] $cloud_config = undef,
  Optional[String] $cloud_provider = undef,
  Optional[Array[Hyperkube::CIDR]] $cloud_provider_gce_lb_src_cidrs = undef,
  Optional[Variant[String,Array[String]]] $cluster_dns = undef,
  Optional[String] $cluster_domain = undef,
  Optional[Stdlib::Unixpath] $cni_bin_dir = undef,
  Optional[Stdlib::Unixpath] $cni_conf_dir = undef,
  Optional[Stdlib::Unixpath] $container_hints = undef,
  Optional[Variant[Enum['rkt','docker'],String]] $container_runtime = undef,
  Optional[Hyperkube::URI] $container_runtime_endpoint = undef,
  Optional[Boolean] $containerized = ($packaging == 'docker'),
  Optional[Boolean] $contention_profiling = undef,
  Optional[Boolean] $cpu_cfs_quota = undef,
  Optional[Integer[0]] $default_not_ready_toleration_seconds = undef,
  Optional[Integer[0]] $default_unreachable_toleration_seconds = undef,
  Optional[Hyperkube::URI] $docker = undef,
  Optional[Boolean] $docker_disable_shared_pid = undef,
  Optional[Hyperkube::URI] $docker_endpoint = undef,
  Optional[Array[String]] $docker_env_metadata_whitelist = undef,
  Optional[Boolean] $docker_only = undef,
  Optional[Stdlib::Unixpath] $docker_root = undef,
  Optional[Boolean] $enable_controller_attach_detach = undef,
  Optional[Boolean] $enable_custom_metrics = undef,
  Optional[Boolean] $enable_debugging_handlers = undef,
  Optional[Boolean] $enable_load_reader = undef,
  Optional[Boolean] $enable_server = undef,
  Optional[Boolean] $enforce_node_allocatable = undef,
  Optional[Integer[0]] $event_burst = undef,
  Optional[Integer[0]] $event_qps = undef,
  Optional[Hash[String,Hyperkube::Duration]] $event_storage_age_limit = undef,
  Optional[Hash[String,Integer[0]]] $event_storage_event_limit = undef,
  Optional[Variant[String,Array[String]]] $eviction_hard = undef,
  Optional[Integer] $eviction_max_pod_grace_period = undef,
  Optional[Variant[String,Array[String]]] $eviction_minimum_reclaim = undef,
  Optional[Hyperkube::Duration] $eviction_pressure_transition_period = undef,
  Optional[Variant[String,Array[String]]] $eviction_soft = undef,
  Optional[Hash[String,Hyperkube::Duration]] $eviction_soft_grace_period = undef,
  Optional[Boolean] $exit_on_lock_contention = undef,
  Optional[Boolean] $experimental_allocatable_ignore_eviction = undef,
  Optional[Array[String]] $experimental_allowed_unsafe_sysctls = undef,
  Optional[Stdlib::Unixpath] $experimental_bootstrap_kubeconfig = undef,
  Optional[Boolean] $experimental_check_node_capabilities_before_mount = undef,
  Optional[Boolean] $experimental_fail_swap_on = undef,
  Optional[Boolean] $experimental_kernel_memcg_notification = undef,
  Optional[Stdlib::Unixpath] $experimental_mounter_path = undef,
  Optional[Hash[String,String]] $experimental_qos_reserved = undef,
  Optional[Hash[String,Boolean]] $feature_gates = undef,
  Optional[Hyperkube::Duration] $file_check_frequency = undef,
  Optional[Hyperkube::Duration] $global_housekeeping_interval = undef,
  Optional[String] $google_json_key = undef,
  Optional[Variant[Enum['promiscuous-bridge','hairpin-veth','none'],String]] $hairpin_mode = undef,
  Optional[String] $healthz_bind_address = undef,
  Optional[Integer[1,65535]] $healthz_port = undef,
  Optional[Array[String]] $host_ipc_sources = undef,
  Optional[Array[String]] $host_network_sources = undef,
  Optional[Array[String]] $host_pid_sources = undef,
  Optional[String] $hostname_override = undef,
  Optional[Hyperkube::Duration] $housekeeping_interval = undef,
  Optional[Hyperkube::Duration] $http_check_frequency = undef,
  Optional[Integer[0,100]] $image_gc_high_threshold = undef,
  Optional[Integer[0,100]] $image_gc_low_threshold = undef,
  Optional[Hyperkube::Duration] $image_pull_progress_deadline = undef,
  Optional[Hyperkube::URI] $image_service_endpoint = undef,
  Optional[Integer[0,31]] $iptables_drop_bit = undef,
  Optional[Integer[0,31]] $iptables_masquerade_bit = undef,
  Optional[Enum['influxdb','gcm']] $ir_data_source = undef,
  Optional[String] $ir_dbname = undef,
  Optional[Hyperkube::URI] $ir_hawkular = undef,
  Optional[String] $ir_influxdb_host = undef,
  Optional[Boolean] $ir_namespace_only = undef,
  Optional[String] $ir_password = undef,
  Optional[Integer[0]] $ir_percentile = undef,
  Optional[String] $ir_user = undef,
  Optional[Boolean] $keep_terminated_pod_volumes = undef,
  Optional[Integer[0]] $kube_api_burst = undef,
  Optional[String] $kube_api_content_type = undef,
  Optional[Integer[0]] $kube_api_qps = undef,
  Optional[Hash[String,String]] $kube_reserved = undef,
  Optional[String] $kube_reserved_cgroup = undef,
  Stdlib::Unixpath $kubeconfig = '/etc/kubernetes/kubelet.conf',
  Optional[String] $kubelet_cgroups = undef,
  Optional[Stdlib::Unixpath] $lock_file = undef,
  Optional[String] $log_backtrace_at = undef,
  Optional[Boolean] $log_cadvisor_usage = undef,
  Optional[Stdlib::Unixpath] $log_dir = undef,
  Optional[Hyperkube::Duration] $log_flush_frequency = undef,
  Optional[Integer[0,5]] $log_level = undef,
  Optional[Boolean] $logtostderr = undef,
  Optional[Array[Stdlib::Unixpath]] $machine_id_file = undef,
  Optional[Boolean] $make_iptables_util_chains = undef,
  Optional[Hyperkube::URI] $manifest_url = undef,
  Optional[String] $manifest_url_header = undef,
  Optional[Integer[0]] $max_open_files = undef,
  Optional[Integer[0]] $max_pods = undef,
  Optional[Hyperkube::Duration] $minimum_image_ttl_duration = undef,
  Optional[String] $network_plugin = undef,
  Optional[Integer[0]] $network_plugin_mtu = undef,
  Optional[String] $node_ip = undef,
  Optional[Hash[String,String]] $node_labels = undef,
  Optional[Hyperkube::Duration] $node_status_update_frequency = undef,
  Optional[Integer[-1000,1000]] $oom_score_adj = undef,
  Optional[Hyperkube::CIDR] $pod_cidr = undef,
  Optional[String] $pod_infra_container_image = undef,
  Optional[Stdlib::Unixpath] $pod_manifest_path = '/etc/kubernetes/manifests',
  Optional[Integer[0]] $pods_per_core = undef,
  Optional[Integer[1,65535]] $port = undef,
  Optional[Boolean] $protect_kernel_defaults = undef,
  Optional[String] $provider_id = undef,
  Optional[Integer[1,65535]] $read_only_port = undef,
  Optional[Boolean] $register_node = undef,
  Optional[Hash[String,String]] $register_with_taints = undef,
  Optional[Integer[0]] $registry_burst = undef,
  Optional[Integer[0]] $registry_qps = undef,
  Optional[Boolean] $require_kubeconfig = undef,
  Optional[Stdlib::Unixpath] $resolv_conf = undef,
  Optional[String] $rkt_api_endpoint = undef,
  Optional[Stdlib::Unixpath] $rkt_path = undef,
  Optional[Stdlib::Unixpath] $root_dir = undef,
  Optional[String] $runtime_cgroups = undef,
  Optional[Hyperkube::Duration] $runtime_request_timeout = undef,
  Optional[Stdlib::Unixpath] $seccomp_profile_root = undef,
  Optional[Boolean] $serialize_image_pulls = undef,
  Optional[Integer[0,10]] $stderrthreshold = undef,
  Optional[Hyperkube::Duration] $storage_driver_buffer_duration = undef,
  Optional[String] $storage_driver_db = undef,
  Optional[String] $storage_driver_host = undef,
  Optional[String] $storage_driver_password = undef,
  Optional[Boolean] $storage_driver_secure = undef,
  Optional[String] $storage_driver_table = undef,
  Optional[String] $storage_driver_user = undef,
  Optional[Hyperkube::Duration] $streaming_connection_idle_timeout = undef,
  Optional[Hyperkube::Duration] $sync_frequency = undef,
  Optional[String] $system_cgroups = undef,
  Optional[Hash[String,String]] $system_reserved = undef,
  Optional[String] $system_reserved_cgroup = undef,
  Optional[Stdlib::Unixpath] $tls_cert_file = undef,
  Optional[Stdlib::Unixpath] $tls_private_key_file = undef,
  Optional[Integer[0,10]] $v = undef,
  Optional[Hash[String,Integer[0,10]]] $vmodule = undef,
  Optional[Stdlib::Unixpath] $volume_plugin_dir = undef,
  Optional[Hyperkube::Duration] $volume_stats_agg_period = undef,

  Optional[Variant[String,Array[String]]] $_extra_parameters = undef,
) {
  $parameters = {
    'address'                                           => $address,
    'allow-privileged'                                  => $allow_privileged,
    'allow-verification-with-non-compliant-keys'        => $allow_verification_with_non_compliant_keys,
    'alsologtostderr'                                   => $alsologtostderr,
    'anonymous-auth'                                    => $anonymous_auth,
    'api-servers'                                       => $api_servers,
    'application-metrics-count-limit'                   => $application_metrics_count_limit,
    'authentication-token-webhook'                      => $authentication_token_webhook,
    'authentication-token-webhook-cache-ttl'            => $authentication_token_webhook_cache_ttl,
    'authorization-mode'                                => $authorization_mode,
    'authorization-webhook-cache-authorized-ttl'        => $authorization_webhook_cache_authorized_ttl,
    'authorization-webhook-cache-unauthorized-ttl'      => $authorization_webhook_cache_unauthorized_ttl,
    'azure-container-registry-config'                   => $azure_container_registry_config,
    'boot-id-file'                                      => $boot_id_file,
    'bootstrap-kubeconfig'                              => $bootstrap_kubeconfig,
    'cadvisor-port'                                     => $cadvisor_port,
    'cert-dir'                                          => $cert_dir,
    'cgroup-driver'                                     => $cgroup_driver,
    'cgroup-root'                                       => $cgroup_root,
    'cgroups-per-qos'                                   => $cgroups_per_qos,
    'client-ca-file'                                    => $client_ca_file,
    'cloud-config'                                      => $cloud_config,
    'cloud-provider'                                    => $cloud_provider,
    'cloud-provider-gce-lb-src-cidrs'                   => $cloud_provider_gce_lb_src_cidrs,
    'cluster-dns'                                       => $cluster_dns,
    'cluster-domain'                                    => $cluster_domain,
    'cni-bin-dir'                                       => $cni_bin_dir,
    'cni-conf-dir'                                      => $cni_conf_dir,
    'container-hints'                                   => $container_hints,
    'container-runtime'                                 => $container_runtime,
    'container-runtime-endpoint'                        => $container_runtime_endpoint,
    'containerized'                                     => $containerized,
    'contention-profiling'                              => $contention_profiling,
    'cpu-cfs-quota'                                     => $cpu_cfs_quota,
    'default-not-ready-toleration-seconds'              => $default_not_ready_toleration_seconds,
    'default-unreachable-toleration-seconds'            => $default_unreachable_toleration_seconds,
    'docker'                                            => $docker,
    'docker-disable-shared-pid'                         => $docker_disable_shared_pid,
    'docker-endpoint'                                   => $docker_endpoint,
    'docker-env-metadata-whitelist'                     => $docker_env_metadata_whitelist,
    'docker-only'                                       => $docker_only,
    'docker-root'                                       => $docker_root,
    'enable-controller-attach-detach'                   => $enable_controller_attach_detach,
    'enable-custom-metrics'                             => $enable_custom_metrics,
    'enable-debugging-handlers'                         => $enable_debugging_handlers,
    'enable-load-reader'                                => $enable_load_reader,
    'enable-server'                                     => $enable_server,
    'enforce-node-allocatable'                          => $enforce_node_allocatable,
    'event-burst'                                       => $event_burst,
    'event-qps'                                         => $event_qps,
    'event-storage-age-limit'                           => $event_storage_age_limit,
    'event-storage-event-limit'                         => $event_storage_event_limit,
    'eviction-hard'                                     => $eviction_hard,
    'eviction-max-pod-grace-period'                     => $eviction_max_pod_grace_period,
    'eviction-minimum-reclaim'                          => $eviction_minimum_reclaim,
    'eviction-pressure-transition-period'               => $eviction_pressure_transition_period,
    'eviction-soft'                                     => $eviction_soft,
    'eviction-soft-grace-period'                        => $eviction_soft_grace_period,
    'exit-on-lock-contention'                           => $exit_on_lock_contention,
    'experimental-allocatable-ignore-eviction'          => $experimental_allocatable_ignore_eviction,
    'experimental-allowed-unsafe-sysctls'               => $experimental_allowed_unsafe_sysctls,
    'experimental-bootstrap-kubeconfig'                 => $experimental_bootstrap_kubeconfig,
    'experimental-check-node-capabilities-before-mount' => $experimental_check_node_capabilities_before_mount,
    'experimental-fail-swap-on'                         => $experimental_fail_swap_on,
    'experimental-kernel-memcg-notification'            => $experimental_kernel_memcg_notification,
    'experimental-mounter-path'                         => $experimental_mounter_path,
    'experimental-qos-reserved'                         => $experimental_qos_reserved,
    'feature-gates'                                     => $feature_gates,
    'file-check-frequency'                              => $file_check_frequency,
    'global-housekeeping-interval'                      => $global_housekeeping_interval,
    'google-json-key'                                   => $google_json_key,
    'hairpin-mode'                                      => $hairpin_mode,
    'healthz-bind-address'                              => $healthz_bind_address,
    'healthz-port'                                      => $healthz_port,
    'host-ipc-sources'                                  => $host_ipc_sources,
    'host-network-sources'                              => $host_network_sources,
    'host-pid-sources'                                  => $host_pid_sources,
    'hostname-override'                                 => $hostname_override,
    'housekeeping-interval'                             => $housekeeping_interval,
    'http-check-frequency'                              => $http_check_frequency,
    'image-gc-high-threshold'                           => $image_gc_high_threshold,
    'image-gc-low-threshold'                            => $image_gc_low_threshold,
    'image-pull-progress-deadline'                      => $image_pull_progress_deadline,
    'image-service-endpoint'                            => $image_service_endpoint,
    'iptables-drop-bit'                                 => $iptables_drop_bit,
    'iptables-masquerade-bit'                           => $iptables_masquerade_bit,
    'ir-data-source'                                    => $ir_data_source,
    'ir-dbname'                                         => $ir_dbname,
    'ir-hawkular'                                       => $ir_hawkular,
    'ir-influxdb-host'                                  => $ir_influxdb_host,
    'ir-namespace-only'                                 => $ir_namespace_only,
    'ir-password'                                       => $ir_password,
    'ir-percentile'                                     => $ir_percentile,
    'ir-user'                                           => $ir_user,
    'keep-terminated-pod-volumes'                       => $keep_terminated_pod_volumes,
    'kube-api-burst'                                    => $kube_api_burst,
    'kube-api-content-type'                             => $kube_api_content_type,
    'kube-api-qps'                                      => $kube_api_qps,
    'kube-reserved'                                     => $kube_reserved,
    'kube-reserved-cgroup'                              => $kube_reserved_cgroup,
    'kubeconfig'                                        => $kubeconfig,
    'kubelet-cgroups'                                   => $kubelet_cgroups,
    'lock-file'                                         => $lock_file,
    'log-backtrace-at'                                  => $log_backtrace_at,
    'log-cadvisor-usage'                                => $log_cadvisor_usage,
    'log-dir'                                           => $log_dir,
    'log-flush-frequency'                               => $log_flush_frequency,
    'loglevel'                                          => $log_level,
    'logtostderr'                                       => $logtostderr,
    'machine-id-file'                                   => $machine_id_file,
    'make-iptables-util-chains'                         => $make_iptables_util_chains,
    'manifest-url'                                      => $manifest_url,
    'manifest-url-header'                               => $manifest_url_header,
    'max-open-files'                                    => $max_open_files,
    'max-pods'                                          => $max_pods,
    'minimum-image-ttl-duration'                        => $minimum_image_ttl_duration,
    'network-plugin'                                    => $network_plugin,
    'network-plugin-mtu'                                => $network_plugin_mtu,
    'node-ip'                                           => $node_ip,
    'node-labels'                                       => $node_labels,
    'node-status-update-frequency'                      => $node_status_update_frequency,
    'oom-score-adj'                                     => $oom_score_adj,
    'pod-cidr'                                          => $pod_cidr,
    'pod-infra-container-image'                         => $pod_infra_container_image,
    'pod-manifest-path'                                 => $pod_manifest_path,
    'pods-per-core'                                     => $pods_per_core,
    'port'                                              => $port,
    'protect-kernel-defaults'                           => $protect_kernel_defaults,
    'provider-id'                                       => $provider_id,
    'read-only-port'                                    => $read_only_port,
    'register-node'                                     => $register_node,
    'register-with-taints'                              => $register_with_taints,
    'registry-burst'                                    => $registry_burst,
    'registry-qps'                                      => $registry_qps,
    'require-kubeconfig'                                => $require_kubeconfig,
    'resolv-conf'                                       => $resolv_conf,
    'rkt-api-endpoint'                                  => $rkt_api_endpoint,
    'rkt-path'                                          => $rkt_path,
    'root-dir'                                          => $root_dir,
    'runtime-cgroups'                                   => $runtime_cgroups,
    'runtime-request-timeout'                           => $runtime_request_timeout,
    'seccomp-profile-root'                              => $seccomp_profile_root,
    'serialize-image-pulls'                             => $serialize_image_pulls,
    'stderrthreshold'                                   => $stderrthreshold,
    'storage-driver-buffer-duration'                    => $storage_driver_buffer_duration,
    'storage-driver-db'                                 => $storage_driver_db,
    'storage-driver-host'                               => $storage_driver_host,
    'storage-driver-password'                           => $storage_driver_password,
    'storage-driver-secure'                             => $storage_driver_secure,
    'storage-driver-table'                              => $storage_driver_table,
    'storage-driver-user'                               => $storage_driver_user,
    'streaming-connection-idle-timeout'                 => $streaming_connection_idle_timeout,
    'sync-frequency'                                    => $sync_frequency,
    'system-cgroups'                                    => $system_cgroups,
    'system-reserved'                                   => $system_reserved,
    'system-reserved-cgroup'                            => $system_reserved_cgroup,
    'tls-cert-file'                                     => $tls_cert_file,
    'tls-private-key-file'                              => $tls_private_key_file,
    'v'                                                 => $v,
    'vmodule'                                           => $vmodule,
    'volume-plugin-dir'                                 => $volume_plugin_dir,
    'volume-stats-agg-period'                           => $volume_stats_agg_period,
  }

  $parameter_result = $parameters.filter |$k,$v| {
    $v != undef and (versioncmp($version, '1.8.0') < 0 or $k != 'api-servers')
  }.map |$k,$v| {
    if $v =~ Array {
      "--${k}=${join($v, ',')}"
    } elsif $v =~ Hash {
      $reduced = $v.map |$mk, $mv| { "${mk}=${mv}" }
      "--${k}=${join($reduced, ',')}"
    } else {
      "--${k}=${v}"
    }
  } + $_extra_parameters

  if $api_servers {
    if $api_servers =~ Array[String] {
      $_master = $api_servers[0]
    } else {
      $_master = $api_servers
    }
  } else {
    $_master = ($packaging ? { 'docker' => 'https://kubernetes.default.svc', default => undef })
  }

  if $packaging == 'docker' {
    hyperkube::kubeconfig { $kubeconfig:
      server      => $_master,
      embed_files => true,
      in_cluster  => true,
    }
    docker::run { 'kubelet':
      command         => join([
          '/kubelet',
      ] + $parameter_result, ' '),
      image           => "${docker_registry}/${docker_image}:${docker_image_tag}",
      pull_on_start   => false,
      restart_service => true,
      volumes         => [ '/etc/cni', '/etc/kubernetes', '/opt/cni' ],
    }
  } else {
    hyperkube::kubeconfig { $kubeconfig:
      server             => $_master,
      ca_cert            => $ca_cert,
      client_certificate => $tls_cert_file,
      client_key         => $tls_private_key_file,
      embed_files        => $kubeconfig_embed,
    }
    file { '/etc/kubernetes/kubelet':
      ensure  => file,
      content => epp('hyperkube/sysconfig.epp', {
          comment               => 'Kubernetes Kubelet Configuration',
          environment_variables => {
            'KUBE_KUBELET_ARGS' => join($parameter_result, ' '),
          }
      }),
    }
    file { '/var/lib/kubelet':
      ensure => directory,
      owner  => 'kube',
      group  => 'kube',
    }

    if !defined(Hyperkube::Binary[$version]) {
      hyperkube::binary { $version:
        ensure => present,
      }
    }
    file { "/opt/hyperkube/${version}/kubelet":
      ensure => link,
      target => "/opt/hyperkube/${version}/hyperkube",
    }
    systemd::unit_file { 'kubelet.service':
      content => epp('hyperkube/node/kubelet.service.epp', {
          version => $version,
      }),
    }
    ~> service { 'kubelet':
      ensure    => running,
      enable    => true,
      subscribe => [
        File["/opt/hyperkube/${version}/kubelet"],
        File['/etc/kubernetes/kubelet'],
      ],
    }

    Exec['systemctl-daemon-reload'] -> Service['kubelet']
  }
}
