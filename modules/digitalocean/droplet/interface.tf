variable image {
  type = "string"
}

variable name {
  type = "string"
}

variable region {
  type    = "string"
  default = "lon1"
}

variable size {
  type    = "string"
  default = "512mb"
}

variable backups {
  type    = "string"
  default = "false"
}

variable monitoring {
  type    = "string"
  default = "false"
}

variable ssh_keys {
  type = "list"
}

variable private_networking {
  type    = "string"
  default = "false"
}
