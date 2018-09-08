# get the pre made salt master image
data "digitalocean_image" "salt" {
  name = "salt"
}

# get the pre made salt minion image
data "digitalocean_image" "salt-minion" {
  name = "salt-minion"
}

# generate a short random string
resource "random_string" "first" {
  length  = 8
  special = false
  upper   = false
}

# generate a short random string
resource "random_string" "second" {
  length  = 8
  special = false
  upper   = false
}

# generate a short random string
resource "random_string" "third" {
  length  = 8
  special = false
  upper   = false
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

# create salt minion with a unique hostname
module "salt-minion-1" {
  source             = "./modules/digitalocean/droplet"
  image              = "${data.digitalocean_image.salt-minion.image}"
  name               = "salt-minion-${random_string.first.result}"
  region             = "lon1"
  size               = "512mb"
  backups            = "false"
  monitoring         = "true"
  ssh_keys           = ["${module.my_ssh_key.ssh_fingerprint}"]
  private_networking = "true"

  # add the master IP address and the minions host name to a salt config file
  content     = "master: ${module.salt.droplet_ipv4_private}\nid: salt-minion-${random_string.first.result}"
  destination = "/etc/salt/minion"

  # restart salt-minion on the host to take in the config file change
  remote_exec_command = "sudo service salt-minion restart"
}

# create salt minion with a unique hostname
module "salt-minion-2" {
  source             = "./modules/digitalocean/droplet"
  image              = "${data.digitalocean_image.salt-minion.image}"
  name               = "salt-minion-${random_string.second.result}"
  region             = "lon1"
  size               = "512mb"
  backups            = "false"
  monitoring         = "true"
  ssh_keys           = ["${module.my_ssh_key.ssh_fingerprint}"]
  private_networking = "true"

  # add the master IP address and the minions host name to a salt config file
  content     = "master: ${module.salt.droplet_ipv4_private}\nid: salt-minion-${random_string.second.result}"
  destination = "/etc/salt/minion"

  # restart salt-minion on the host to take in the config file change
  remote_exec_command = "sudo service salt-minion restart"
}

# create salt minion with a unique hostname
module "salt-minion-3" {
  source             = "./modules/digitalocean/droplet"
  image              = "${data.digitalocean_image.salt-minion.image}"
  name               = "salt-minion-${random_string.third.result}"
  region             = "lon1"
  size               = "512mb"
  backups            = "false"
  monitoring         = "true"
  ssh_keys           = ["${module.my_ssh_key.ssh_fingerprint}"]
  private_networking = "true"

  # add the master IP address and the minions host name to a salt config file
  content     = "master: ${module.salt.droplet_ipv4_private}\nid: salt-minion-${random_string.third.result}"
  destination = "/etc/salt/minion"

  # restart salt-minion on the host to take in the config file change
  remote_exec_command = "sudo service salt-minion restart"
}
