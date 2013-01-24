# /etc/puppetlabs/puppet/modules/paramclassexample/manifests/init.pp
class paramclassexample ($value1, $value2 = "Default value") {
  notify {"Value 1 is ${value1}.":}
  notify {"Value 2 is ${value2}.":}
}

