data "digitalocean_image" "salt" {
  name = "salt"
}

data "digitalocean_image" "salt-minion" {
  name = "salt-minion"
}

# create salt master
module "salt" {
  source             = "./modules/digitalocean/droplet"
  image              = "${data.digitalocean_image.salt.image}"
  name               = "salt"
  region             = "lon1"
  size               = "512mb"
  backups            = "false"
  monitoring         = "true"
  ssh_keys           = ["${module.my_ssh_key.ssh_fingerprint}"]
  private_networking = "true"

  content     = "#interface: 0.0.0.0"
  destination = "/etc/salt/master"

  remote_exec_command = "salt-key -A -y"
}

# create salt minion
module "salt-minion-1" {
  source             = "./modules/digitalocean/droplet"
  image              = "${data.digitalocean_image.salt-minion.image}"
  name               = "salt-minion"
  region             = "lon1"
  size               = "512mb"
  backups            = "false"
  monitoring         = "true"
  ssh_keys           = ["${module.my_ssh_key.ssh_fingerprint}"]
  private_networking = "true"

  content     = "master: ${module.salt.droplet_ipv4_private}"
  destination = "/etc/salt/minion"

  remote_exec_command = "sudo service salt-minion restart"
}
