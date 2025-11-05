variable "nic_name" {
  type        = string
  description = "The name of the VM and NIC"
}
variable "vm_name" {
  type        = string
  description = "The name of the VM"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "The Azure region/location"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet for the NIC"
}

variable "vm_size" {
  type        = string
  description = "The size of the virtual machine"
}

variable "admin_username" {
  type        = string
  description = "The admin username for the VM"
}

variable "admin_password" {
  type        = string
  description = "The admin password for the VM"
}

variable "image_publisher" {
  type        = string
  description = "The image publisher for the VM"
}

variable "image_offer" {
  type        = string
  description = "The image offer"
}

variable "image_sku" {
  type        = string
  description = "The image SKU"
}

variable "image_version" {
  type        = string
  description = "The image version"
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network"
}

variable "nsg_name" {
  type        = string
  description = "The name of the Network Security Group"
}