resource "digitalocean_ssh_key" "default" {
  name       = "${var.name}"
  public_key = "${var.public_key}"
}

# Send outputs from this resource back out
output "ssh_fingerprint" {
  value = "${digitalocean_ssh_key.default.fingerprint}"
}
