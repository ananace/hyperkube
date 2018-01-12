class hyperkube::node::kubelet(
) {
  docker::run { 'kubelet':
    command         => join([
        '/kubelet',
        '--address=0.0.0.0',
        '--kubeconfig=',
        '--pod-manifest-path=/etc/kubernetes/manifests',
        '--cluster-dns=',
        '--cluster-domain=',
        '--v=2',
    ], ' '),
    image           => "${hyperkube::registry}/${hyperkube::image}:${hyperkube::image_tag}",
    pull_on_start   => false,
    restart_service => true,
    volumes         => [ '/etc/cni', '/etc/kubernetes', '/opt/cni' ],
  }
}
