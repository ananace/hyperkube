# hyperkube [![build status](https://gitlab.it.liu.se/pm-liuit/hyperkube/badges/production/build.svg)](https://gitlab.it.liu.se/pm-liuit/hyperkube/commits/production)

## Description

This module installs, configures, and manages a Kubernetes cluster through
the use of hyperkube packages.

The main focus is towards the current stable version of K8s (1.8.x), but it
should be able to handle both older and newer versions without issues.
Do note that bare-metal will require specifying URLs and hashes for the
exact version that you require.

## Usage

To set up a docker-ized Kubernetes node on the current machine, linked to
the K8s cluster running on server 10.0.0.2:
```
class { 'hyperkube':
  api_server => 'https://10.0.0.2:6443',
  role       => 'node',
}
```

To set up a control plane (apiserver, scheduler, controller manager) on
the current machine:
```
class { 'hyperkube':
  role => 'control_plane',
}
```

More specific configuration can be set up by manually applying the control-plan
and node classes.
