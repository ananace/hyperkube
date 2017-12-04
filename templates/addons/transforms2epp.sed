s/__PILLAR__DNS__SERVER__/<%= $dns_server %>/g
s/__PILLAR__DNS__DOMAIN__/<%= $dns_domain %>/g
s/__PILLAR__CLUSTER_CIDR__/<%= $service_cluster_ip_range %>/g
s/__MACHINE_GENERATED_WARNING__/Warning: This is a Puppet-managed file generated from the base underscore template file: __SOURCE_FILENAME__/g
1 i\<%- |\n  Stdlib::Compat::Ip_address $dns_server,\n  Optional[Hyperkube::CIDR] $service_cluster_ip_range = undef,\n  String $dns_domain = 'cluster.local'\n| -%>
