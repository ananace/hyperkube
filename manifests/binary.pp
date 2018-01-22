define hyperkube::binary(
  String $version = $title,
  Stdlib::HTTPUrl $native_url = sprintf($native_url_template, $version),

  Enum['present','absent'] $ensure = 'present',

  Optional[Stdlib::HTTPUrl] $native_url_template = $hyperkube::native_url_template,
) {
  file { "/opt/hyperkube/${version}":
    ensure => directory,
  }
  file { "/opt/hyperkube/${version}/hyperkube":
    ensure => $ensure,
    mode   => '0755',
    source => [
      "/opt/hyperkube/${version}/hyperkube",
      $native_url,
    ],
  }
}
