Terraform Salt DigitalOcean
---------------------------

A project to set up a small Salt cluster on DigitalOcean, using Terraform, with 1 Salt master and 1 or more Salt minions.

The images used to create the Droplets are premade using Packer.

You will need to add your DigitalOcean API key to the variables.tfvars file for Terraform and to the packer/variables.json file for Packer.

Terraform Plan - to see the planned changes

> terraform plan -var-file="variables.tfvars"

Terraform Apply - to apply the changes

> terraform apply -var-file="variables.tfvars"

Terraform show - to see the finished instances

> terraform apply -var-file="variables.tfvars"

Terraform Destroy - to remove all instances at the end

> terraform destroy -var-file="variables.tfvars"
