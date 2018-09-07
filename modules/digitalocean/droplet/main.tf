resource "digitalocean_droplet" "default" {
  image              = "${var.image}"
  name               = "${var.name}"
  region             = "${var.region}"
  size               = "${var.size}"
  backups            = "${var.backups}"
  monitoring         = "${var.monitoring}"
  ssh_keys           = ["${var.ssh_keys}"]
  private_networking = "${var.private_networking}"

  provisioner "file" {
    content     = "${var.content}"
    destination = "${var.destination}"
  }

  provisioner "remote-exec" {
    inline = [
      "${var.remote_exec_command}",
    ]
  }
}

# Send outputs from this resource back out
output "droplet_ipv4" {
  value = "${digitalocean_droplet.default.ipv4_address}"
}

# Send outputs from this resource back out
output "droplet_ipv4_private" {
  value = "${digitalocean_droplet.default.ipv4_address_private}"
}
