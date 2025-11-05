variable "public_ip_name" {
  description = "the name of the public IP address"
  type        = string
}

variable "resource_group_name" {
  description = "the name of the resource group where the public IP will be created"
  type        = string
}

variable "location" {
  description = "the Azure region where the public IP will be created"
  type        = string
}

variable "allocation_method" {
  description = "the allocation method for the public IP address can be (Static or Dynamic)"
  type        = string
  default     = "Static"
}
variable "sku" {
  description = "the SKU of the public IP address can be (Basic or Standard)"
  type        = string
  default     = "Standard"
}