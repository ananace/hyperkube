# This regexp matches CIDR values
type Hyperkube::CIDR = Pattern[/^([0-9]{1,3})(\.[0-9]{1,3}){3}\/[0-9]{1,2}$/]
