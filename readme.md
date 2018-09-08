Terraform Salt DigitalOcean
---------------------------

A project to set up a small Salt cluster on DigitalOcean using Terraform, with 1 Salt master and 1 or more Salt minions.

The images used to create the Droplets are premade using Packer.

### Requirements

* Terraform https://www.terraform.io/
* Packer https://www.packer.io/
* A DigitalOcean account and an API key https://www.digitalocean.com/?refcode=2c62404bb57

### Installation

* Clone this repository
* Add your DigitalOcean API key to packer/variables.json file for Packer
* Add your DigitalOcean API key to variables.tfvars file for Terraform
* Create 2 Images using Packer:

    * cd packer && packer build -var-file=variables.json salt_master_do_image.json
    * cd packer && packer build -var-file=variables.json salt_minion_do_image.json

* terraform apply -var-file="variables.tfvars" -auto-approve

You will not have 1 Salt master and 1  or more Salt minions runing in your DigitalOcean account.

To change the number of Droplets or to change the size of the droplets, edit droplets.tf.

If you'd like to remove the Droplets afterwards, use

* terraform destroy -var-file="variables.tfvars" -auto-approve
