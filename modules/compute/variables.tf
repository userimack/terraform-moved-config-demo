variable "subnet_id" {
  description = "Subnet ID to provision compute instance"
  type        = string
}

variable "tags" {
  description = "Tags for adding to the resource"
  type        = map(string)
}
