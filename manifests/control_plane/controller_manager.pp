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

  String $docker_registry = $hyperkube::docker_registry,
  String $docker_image = $hyperkube::docker_image,
  String $docker_image_tag = pick($hyperkube::docker_image_tag, "v${hyperkube::version}"),

  Optional[Stdlib::Compat::Ip_address] $address = undef,
  Optional[Boolean] $allocate_node_cidrs = undef,
  Optional[Boolean] $allow_verification_with_non_compliant_keys = undef,
  Optional[Boolean] $alsologtostderr = undef,
  Optional[Integer[0]] $application_metrics_count_limit = undef,
  Optional[Hyperkube::Duration] $attach_detach_reconcile_sync_period = undef,
  Optional[Stdlib::Unixpath] $azure_container_registry_config = undef,
  Optional[Array[Stdlib::Unixpath]] $boot_id_file = undef,
  Optional[Variant[Enum['RangeAllocator'],String]] $cidr_allocator_type = undef,
  Optional[Stdlib::Unixpath] $cloud_config = undef,
  Optional[String] $cloud_provider = undef,
  Optional[Array[Hyperkube::CIDR]] $cloud_provider_gce_lb_src_cidrs = undef,
  Optional[Hyperkube::CIDR] $cluster_cidr = undef,
  Optional[String] $cluster_name = undef,
  Optional[Stdlib::Unixpath] $cluster_signing_cert_file = undef,
  Optional[Stdlib::Unixpath] $cluster_signing_key_file = undef,
  Optional[Integer[1]] $concurrent_deployment_syncs = undef,
  Optional[Integer[1]] $concurrent_endpoint_syncs = undef,
  Optional[Integer[1]] $concurrent_gc_syncs = undef,
  Optional[Integer[1]] $concurrent_namespace_syncs = undef,
  Optional[Integer[1]] $concurrent_rc_syncs = undef,
  Optional[Integer[1]] $concurrent_replicaset_syncs = undef,
  Optional[Integer[1]] $concurrent_resource_quota_syncs = undef,
  Optional[Integer[1]] $concurrent_service_syncs = undef,
  Optional[Integer[1]] $concurrent_serviceaccount_token_syncs = undef,
  Optional[Boolean] $configure_cloud_routes = undef,
  Optional[Stdlib::Unixpath] $container_hints = undef,
  Optional[Boolean] $contention_profiling = undef,
  Optional[Hyperkube::Duration] $controller_start_interval = undef,
  Optional[Array[Variant[Enum['*', 'attachdetach', 'bootstrapsigner', 'cronjob', 'csrapproving', 'csrsigning', 'daemonset', 'deployment', 'disruption', 'endpoint', 'garbagecollector', 'horizontalpodautoscaling', 'job', 'namespace', 'node', 'persistentvolume-binder', 'persistentvolume-expander', 'podgc', 'replicaset', 'replicationcontroller', 'resourcequota', 'route', 'service', 'serviceaccount', 'serviceaccount-token', 'statefulset', 'tokencleaner', 'ttl'],String]]] $controllers = undef, # lint:ignore:140chars
  Optional[Integer[1]] $default_not_ready_toleration_seconds = undef,
  Optional[Integer[1]] $default_unreachable_toleration_seconds = undef,
  Optional[Hyperkube::Duration] $deployment_controller_sync_period = undef,
  Optional[Boolean] $disable_attach_detach_reconcile_sync = undef,
  Optional[Hyperkube::URI] $docker = undef,
  Optional[Array[String]] $docker_env_metadata_whitelist = undef,
  Optional[Boolean] $docker_only = undef,
  Optional[Stdlib::Unixpath] $docker_root = undef,
  Optional[Boolean] $docker_tls = undef,
  Optional[Stdlib::Unixpath] $docker_tls_ca = undef,
  Optional[Stdlib::Unixpath] $docker_tls_cert = undef,
  Optional[Stdlib::Unixpath] $docker_tls_key = undef,
  Optional[Boolean] $enable_dynamic_provisioning = undef,
  Optional[Boolean] $enable_garbage_collector = undef,
  Optional[Boolean] $enable_hostpath_provisioner = undef,
  Optional[Boolean] $enable_load_reader = undef,
  Optional[Boolean] $enable_taint_manager = undef,
  Optional[Hash[String,Integer[0]]] $event_storage_age_limit = undef,
  Optional[Hash[String,Integer[0]]] $event_storage_event_limit = undef,
  Optional[Hyperkube::Duration] $experimental_cluster_signing_duration = undef,
  Optional[Hash[String,Boolean]] $feature_gates = undef,
  Optional[Stdlib::Unixpath] $flex_volume_plugin_dir = undef,
  Optional[Hyperkube::Duration] $global_housekeeping_interval = undef,
  Optional[String] $google_json_key = undef,
  Optional[Hyperkube::Duration] $horizontal_pod_autoscaler_downscale_delay = undef,
  Optional[Hyperkube::Duration] $horizontal_pod_autoscaler_sync_period = undef,
  Optional[Hyperkube::Duration] $horizontal_pod_autoscaler_upscale_delay = undef,
  Optional[Boolean] $horizontal_pod_autoscaler_use_rest_clients = undef,
  Optional[Hyperkube::Duration] $housekeeping_interval = undef,
  Optional[String] $insecure_experimental_approve_all_kubelet_csrs_for_group = undef,
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
  Stdlib::Unixpath $kubeconfig = '/etc/kubernetes/controller-manager.conf',
  Optional[Integer[0]] $large_cluster_size_threshold = undef,
  Optional[Boolean] $leader_elect = undef,
  Optional[Hyperkube::Duration] $leader_elect_lease_duration = undef,
  Optional[Hyperkube::Duration] $leader_elect_renew_deadline = undef,
  Optional[Enum['endpoints','configmap']] $leader_elect_resource_lock = undef,
  Optional[Hyperkube::Duration] $leader_elect_retry_period = undef,
  Optional[String] $log_backtrace_at = undef,
  Optional[Boolean] $log_cadvisor_usage = undef,
  Optional[Stdlib::Unixpath] $log_dir = undef,
  Optional[Hyperkube::Duration] $log_flush_frequency = undef,
  Optional[Integer[0,5]] $log_level = undef,
  Optional[Boolean] $logtostderr = undef,
  Optional[Array[Stdlib::Unixpath]] $machine_id_file = undef,
  Hyperkube::URI $master = 'http://localhost:8080',
  Optional[Hyperkube::Duration] $min_resync_period = undef,
  Optional[Hyperkube::Duration] $namespace_sync_period = undef,
  Optional[Integer[1]] $node_cidr_mask_size = undef,
  Optional[Float[0]] $node_eviction_rate = undef,
  Optional[Hyperkube::Duration] $node_monitor_grace_period = undef,
  Optional[Hyperkube::Duration] $node_monitor_period = undef,
  Optional[Hyperkube::Duration] $node_startup_grace_period = undef,
  Optional[Hyperkube::Duration] $pod_eviction_timeout = undef,
  Optional[Integer[1,65535]] $port = 10252,
  Optional[Boolean] $profiling = undef,
  Optional[Integer[0]] $pv_recycler_increment_timeout_nfs = undef,
  Optional[Integer[0]] $pv_recycler_minimum_timeout_hostpath = undef,
  Optional[Integer[0]] $pv_recycler_minimum_timeout_nfs = undef,
  Optional[Stdlib::Unixpath] $pv_recycler_pod_template_filepath_hostpath = undef,
  Optional[Stdlib::Unixpath] $pv_recycler_pod_template_filepath_nfs = undef,
  Optional[Integer[0]] $pv_recycler_timeout_increment_hostpath = undef,
  Optional[Hyperkube::Duration] $pvclaimbinder_sync_period = undef,
  Optional[Hyperkube::Duration] $resource_quota_sync_period = undef,
  Optional[Stdlib::Unixpath] $root_ca_file = undef,
  Optional[Hyperkube::Duration] $route_reconciliation_period = undef,
  Optional[Float[0]] $secondary_node_eviction_rate = undef,
  Optional[Stdlib::Unixpath] $service_account_private_key_file = undef,
  Optional[Hyperkube::CIDR] $service_cluster_ip_range = undef,
  Optional[Hyperkube::Duration] $service_sync_period = undef,
  Optional[Integer[0,5]] $stderrthreshold = undef,
  Optional[Hyperkube::Duration] $storage_driver_buffer_duration = undef,
  Optional[String] $storage_driver_db = undef,
  Optional[String] $storage_driver_host = undef,
  Optional[String] $storage_driver_password = undef,
  Optional[Boolean] $storage_driver_secure = undef,
  Optional[String] $storage_driver_table = undef,
  Optional[String] $storage_driver_user = undef,
  Optional[Integer] $terminated_pod_gc_threshold = undef,
  Optional[Float[0,1]] $unhealthy_zone_threshold = undef,
  Optional[Boolean] $use_service_account_credentials = undef,
  Optional[Integer[0,10]] $v = undef,
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
    'address'                                                  => $address,
    'allocate-node-cidrs'                                      => $allocate_node_cidrs,
    'allow-verification-with-non-compliant-keys'               => $allow_verification_with_non_compliant_keys,
    'alsologtostderr'                                          => $alsologtostderr,
    'application-metrics-count-limit'                          => $application_metrics_count_limit,
    'attach-detach-reconcile-sync-period'                      => $attach_detach_reconcile_sync_period,
    'azure-container-registry-config'                          => $azure_container_registry_config,
    'boot-id-file'                                             => $boot_id_file,
    'cidr-allocator-type'                                      => $cidr_allocator_type,
    'cloud-config'                                             => $cloud_config,
    'cloud-provider'                                           => $cloud_provider,
    'cloud-provider-gce-lb-src-cidrs'                          => $cloud_provider_gce_lb_src_cidrs,
    'cluster-cidr'                                             => $cluster_cidr,
    'cluster-name'                                             => $cluster_name,
    'cluster-signing-cert-file'                                => $cluster_signing_cert_file,
    'cluster-signing-key-file'                                 => $cluster_signing_key_file,
    'concurrent-deployment-syncs'                              => $concurrent_deployment_syncs,
    'concurrent-endpoint-syncs'                                => $concurrent_endpoint_syncs,
    'concurrent-gc-syncs'                                      => $concurrent_gc_syncs,
    'concurrent-namespace-syncs'                               => $concurrent_namespace_syncs,
    'concurrent-rc-syncs'                                      => $concurrent_rc_syncs,
    'concurrent-replicaset-syncs'                              => $concurrent_replicaset_syncs,
    'concurrent-resource-quota-syncs'                          => $concurrent_resource_quota_syncs,
    'concurrent-service-syncs'                                 => $concurrent_service_syncs,
    'concurrent-serviceaccount-token-syncs'                    => $concurrent_serviceaccount_token_syncs,
    'configure-cloud-routes'                                   => $configure_cloud_routes,
    'container-hints'                                          => $container_hints,
    'contention-profiling'                                     => $contention_profiling,
    'controller-start-interval'                                => $controller_start_interval,
    'controllers'                                              => $controllers,
    'default-not-ready-toleration-seconds'                     => $default_not_ready_toleration_seconds,
    'default-unreachable-toleration-seconds'                   => $default_unreachable_toleration_seconds,
    'deployment-controller-sync-period'                        => $deployment_controller_sync_period,
    'disable-attach-detach-reconcile-sync'                     => $disable_attach_detach_reconcile_sync,
    'docker'                                                   => $docker,
    'docker-env-metadata-whitelist'                            => $docker_env_metadata_whitelist,
    'docker-only'                                              => $docker_only,
    'docker-root'                                              => $docker_root,
    'docker-tls'                                               => $docker_tls,
    'docker-tls-ca'                                            => $docker_tls_ca,
    'docker-tls-cert'                                          => $docker_tls_cert,
    'docker-tls-key'                                           => $docker_tls_key,
    'enable-dynamic-provisioning'                              => $enable_dynamic_provisioning,
    'enable-garbage-collector'                                 => $enable_garbage_collector,
    'enable-hostpath-provisioner'                              => $enable_hostpath_provisioner,
    'enable-load-reader'                                       => $enable_load_reader,
    'enable-taint-manager'                                     => $enable_taint_manager,
    'event-storage-age-limit'                                  => $event_storage_age_limit,
    'event-storage-event-limit'                                => $event_storage_event_limit,
    'experimental-cluster-signing-duration'                    => $experimental_cluster_signing_duration,
    'feature-gates'                                            => $feature_gates,
    'flex-volume-plugin-dir'                                   => $flex_volume_plugin_dir,
    'global-housekeeping-interval'                             => $global_housekeeping_interval,
    'google-json-key'                                          => $google_json_key,
    'horizontal-pod-autoscaler-downscale-delay'                => $horizontal_pod_autoscaler_downscale_delay,
    'horizontal-pod-autoscaler-sync-period'                    => $horizontal_pod_autoscaler_sync_period,
    'horizontal-pod-autoscaler-upscale-delay'                  => $horizontal_pod_autoscaler_upscale_delay,
    'horizontal-pod-autoscaler-use-rest-clients'               => $horizontal_pod_autoscaler_use_rest_clients,
    'housekeeping-interval'                                    => $housekeeping_interval,
    'insecure-experimental-approve-all-kubelet-csrs-for-group' => $insecure_experimental_approve_all_kubelet_csrs_for_group,
    'ir-data-source'                                           => $ir_data_source,
    'ir-dbname'                                                => $ir_dbname,
    'ir-hawkular'                                              => $ir_hawkular,
    'ir-influxdb-host'                                         => $ir_influxdb_host,
    'ir-namespace-only'                                        => $ir_namespace_only,
    'ir-password'                                              => $ir_password,
    'ir-percentile'                                            => $ir_percentile,
    'ir-user'                                                  => $ir_user,
    'kube-api-burst'                                           => $kube_api_burst,
    'kube-api-content-type'                                    => $kube_api_content_type,
    'kube-api-qps'                                             => $kube_api_qps,
    'kubeconfig'                                               => $kubeconfig,
    'large-cluster-size-threshold'                             => $large_cluster_size_threshold,
    'leader-elect'                                             => $leader_elect,
    'leader-elect-lease-duration'                              => $leader_elect_lease_duration,
    'leader-elect-renew-deadline'                              => $leader_elect_renew_deadline,
    'leader-elect-resource-lock'                               => $leader_elect_resource_lock,
    'leader-elect-retry-period'                                => $leader_elect_retry_period,
    'log-backtrace-at'                                         => $log_backtrace_at,
    'log-cadvisor-usage'                                       => $log_cadvisor_usage,
    'log-dir'                                                  => $log_dir,
    'log-flush-frequency'                                      => $log_flush_frequency,
    'loglevel'                                                 => $log_level,
    'logtostderr'                                              => $logtostderr,
    'machine-id-file'                                          => $machine_id_file,
    'min-resync-period'                                        => $min_resync_period,
    'namespace-sync-period'                                    => $namespace_sync_period,
    'node-cidr-mask-size'                                      => $node_cidr_mask_size,
    'node-eviction-rate'                                       => $node_eviction_rate,
    'node-monitor-grace-period'                                => $node_monitor_grace_period,
    'node-monitor-period'                                      => $node_monitor_period,
    'node-startup-grace-period'                                => $node_startup_grace_period,
    'pod-eviction-timeout'                                     => $pod_eviction_timeout,
    'port'                                                     => $port,
    'profiling'                                                => $profiling,
    'pv-recycler-increment-timeout-nfs'                        => $pv_recycler_increment_timeout_nfs,
    'pv-recycler-minimum-timeout-hostpath'                     => $pv_recycler_minimum_timeout_hostpath,
    'pv-recycler-minimum-timeout-nfs'                          => $pv_recycler_minimum_timeout_nfs,
    'pv-recycler-pod-template-filepath-hostpath'               => $pv_recycler_pod_template_filepath_hostpath,
    'pv-recycler-pod-template-filepath-nfs'                    => $pv_recycler_pod_template_filepath_nfs,
    'pv-recycler-timeout-increment-hostpath'                   => $pv_recycler_timeout_increment_hostpath,
    'pvclaimbinder-sync-period'                                => $pvclaimbinder_sync_period,
    'resource-quota-sync-period'                               => $resource_quota_sync_period,
    'root-ca-file'                                             => $root_ca_file,
    'route-reconciliation-period'                              => $route_reconciliation_period,
    'secondary-node-eviction-rate'                             => $secondary_node_eviction_rate,
    'service-account-private-key-file'                         => $service_account_private_key_file,
    'service-cluster-ip-range'                                 => $service_cluster_ip_range,
    'service-sync-period'                                      => $service_sync_period,
    'stderrthreshold'                                          => $stderrthreshold,
    'storage-driver-buffer-duration'                           => $storage_driver_buffer_duration,
    'storage-driver-db'                                        => $storage_driver_db,
    'storage-driver-host'                                      => $storage_driver_host,
    'storage-driver-password'                                  => $storage_driver_password,
    'storage-driver-secure'                                    => $storage_driver_secure,
    'storage-driver-table'                                     => $storage_driver_table,
    'storage-driver-user'                                      => $storage_driver_user,
    'terminated-pod-gc-threshold'                              => $terminated_pod_gc_threshold,
    'unhealthy-zone-threshold'                                 => $unhealthy_zone_threshold,
    'use-service-account-credentials'                          => $use_service_account_credentials,
    'vmodule'                                                  => $vmodule,
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
    file { '/etc/kubernetes/manifests/kube-controller-manager.yaml':
      ensure  => file,
      content => epp('hyperkube/control_plane/kube-controller-manager.yaml.epp', {
          arguments  => $parameter_result,
          full_image => "${docker_registry}/${docker_image}:${docker_image_tag}",
          port       => pick($port, 10252),
      }),
    }
  } else {
    hyperkube::kubeconfig { $kubeconfig:
      server => $master,
    }
    file { '/etc/kubernetes/controller-manager':
      ensure  => file,
      content => epp('hyperkube/sysconfig.epp', {
          comment               => 'Kubernetes Controller Manager Configuration',
          environment_variables => {
            'KUBE_CONTROLLER_MANAGER_ARGS' => join($parameter_result, ' '),
          },
      }),
    }

    file { '/opt/hyperkube/bin/kube-controller-manager':
      ensure => link,
      target => "/opt/hyperkube/bin/hyperkube-${hyperkube::version}",
    }
    systemd::unit_file { 'kube-controller-manager.service':
      content => epp('hyperkube/control_plane/kube-controller-manager.service.epp'),
    }
    ~> service { 'kube-controller-manager':
      ensure    => running,
      enable    => true,
      subscribe => [
        File['/opt/hyperkube/bin/kube-controller-manager'],
        File['/etc/kubernetes/controller-manager'],
      ],
    }

    Exec['systemctl-daemon-reload'] -> Service['kube-controller-manager']
  }
}
