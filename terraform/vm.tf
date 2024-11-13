# There are currently no configuration options for the provider itself.

resource "virtualbox_vm" "node" {
  count = 1
  name  = format("node-%02d", count.index + 1)
  #image     = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20180903.0.0/providers/virtualbox.box"
  image  = "/DevOps-ScoalaInformala/sciitdevops/terraform/bionic-server-cloudimg-amd64-vagrant.box"
  cpus   = 1
  memory = "512 mib"
  # user_data = file("${path.module}/user_data")

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet1"
  }
}
