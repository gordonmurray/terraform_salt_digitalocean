Terraform Salt DigitalOcean
---------------------------

A project to set up a small Salt cluster on DigitalOcean, using Terraform.

The images used to create the Droplets are premade using Packer.

You will need to add your DigitalOcean API key to the variables.tfvars file for Terraform and to the packer/variables.json file for Packer.

Terraform Plan

> terraform plan -var-file="variables.tfvars"

Terraform Apply

> terraform apply -var-file="variables.tfvars"

Terraform Destroy

> terraform destroy -var-file="variables.tfvars"
