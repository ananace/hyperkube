class hyperkube::control_plane(
) {
  include ::hyperkube

  include ::hyperkube::control_plane::addon_manager
  include ::hyperkube::control_plane::apiserver
  include ::hyperkube::control_plane::controller_manager
  include ::hyperkube::control_plane::scheduler
}
