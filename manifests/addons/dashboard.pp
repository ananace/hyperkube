# == Class: hyperkube::addons::dashboard
#
# Installs the dashboard addon for your cluster
#
# === Parameters
#
# [*ensure*]
#    Can be 'present' or 'absent', defaults to 'present'.
#
# [*rbac*]
#    Should the RBAC rules be added, defaults to true.
#
# === Examples
#
# @example
#    class { 'hyperkube::addons::dashboard': }
#
# === Authors
#
# Alexander Olofsson <alexander.olofsson@liu.se>
#
# === Copyright
#
# Copyright 2017 Linköping University
#
class hyperkube::addons::dashboard(
  Enum['present','absent'] $ensure = 'present',
  Boolean $rbac = true,
) {
  file { '/etc/kubernetes/addons/dashboard.yaml':
    ensure  => $ensure,
    content => epp('hyperkube/addons/dashboard.yaml.epp', {
        rbac => $rbac,
    }),
  }
}
