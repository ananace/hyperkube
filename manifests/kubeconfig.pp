define hyperkube::kubeconfig(
  Stdlib::Unixpath $path = $title,
  Boolean $in_cluster = false,
  Boolean $embed_files = false,
  Optional[String] $server = undef,
  Optional[Stdlib::Unixpath] $ca_cert = undef,
  Optional[Stdlib::Unixpath] $client_certificate = undef,
  Optional[Stdlib::Unixpath] $client_key = undef,
  Optional[String] $token = undef,
  Optional[Stdlib::Unixpath] $token_file = undef,
  Optional[String] $username = undef,
  Optional[String] $password = undef,
) {
  if $in_cluster {
    $_ca_cert = pick($ca_cert, '/var/run/secrets/kubernetes.io/serviceaccount/ca.crt')
    $_server = pick($server, 'https://kubernetes.default.svc')
    $_token_file = pick($token_file, '/var/run/secrets/kubernetes.io/serviceaccount/token')
  } else {
    $_ca_cert = $ca_cert
    $_server = pick($server, 'http://localhost:8080')
    $_token_file = $token_file
  }

  if $token and $token_file {
    fail("You can't specify both a token and token file for a kubeconfig")
  } elsif ($username or $password) and not ($username and $password) {
    fail('You need to specify both a username and a password if using username + password auth')
  } elsif ($client_certificate or $client_key) and not ($client_certificate and $client_key) {
    fail('You need to specify both a certificate and key if using SSL auth')
  }

  if !$_server {
    fail('You need to specify a server for a kubeconfig outside of a cluster')
  }

  file { $path:
    content => epp('hyperkube/kubeconfig.epp', {
        in_cluster         => $in_cluster,
        server             => $_server,
        ca_cert            => $_ca_cert,
        client_certificate => $client_certificate,
        client_key         => $client_key,
        token              => pick($token, $_token_file),
        username           => $username,
        password           => $password,
    }),
    replace => false,
  }

  if $embed_files {
    if $_ca_cert {
      exec { "Embed CA Cert into ${path}":
        command   => "sed -e 's!${_ca_cert}!\$(cat \"${_ca_cert}\" | base64 -w0)!' -i \"${path}\"",
        onlyif    => "grep ${_ca_cert} \"${path}\"",
        path      => '/bin:/usr/bin',
        subscribe => File[$path],
      }
      File <| path == $_ca_cert |> ~> File[$path]
    }
    if $client_certificate {
      exec { "Embed CA Cert into ${path}":
        command   => "sed -e 's!${client_certificate}!\$(cat \"${client_certificate}\" | base64 -w0)!' -i \"${path}\"",
        onlyif    => "grep ${client_certificate} \"${path}\"",
        path      => '/bin:/usr/bin',
        subscribe => File[$path],
      }
      File <| path == $client_certificate |> ~> File[$path]
    }
    if $client_key {
      exec { "Embed CA Cert into ${path}":
        command   => "sed -e 's!${client_key}!\$(cat \"${client_key}\" | base64 -w0)!' -i \"${path}\"",
        onlyif    => "grep ${client_key} \"${path}\"",
        path      => '/bin:/usr/bin',
        subscribe => File[$path],
      }
      File <| path == $client_key |> ~> File[$path]
    }
  }
  if $_token_file {
    exec { "Embed Token File into ${path}":
      command   => "sed -e 's!${_token_file}!\$(cat \"${_token_file}\")!' -i \"${path}\"",
      onlyif    => "grep ${_token_file} \"${path}\"",
      path      => '/bin:/usr/bin',
      subscribe => File[$path],
    }
    File <| path == $_token_file |> ~> File[$path]
  }
}
