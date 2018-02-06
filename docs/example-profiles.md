Example Profile manifests
=========================

You can find some example manifests for a PuppetDB based installation using the Puppet certs on;
https://gist.github.com/ananace/362b10f56a644d3ec4189500231c4c4c

Currently this requires manually adding node certnames as users into the clusterrolebindings of `system:node` and `system:node-proxier`, once [SERVER-2109](https://tickets.puppetlabs.com/browse/SERVER-2109) is finished this should hopefully not be needed.
Note that this is **only** an issue if using the Puppet CA for Kubernetes certificates.

Information about the generation of a working K8s API cert with the Puppet CA can be found at; (Due to [SERVER-1596](https://tickets.puppetlabs.com/browse/SERVER-1596))
https://gist.github.com/ananace/2b25e204ed4ccfb60bf1f43910cc8fec
