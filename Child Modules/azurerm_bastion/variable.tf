variable "pip_name" {
  description = "The name of the Public IP to use for the Bastion Host."
  type        = string
}

variable "rg_name" {
  description = "The name of the Resource Group."
  type        = string
}

variable "bastion_name" {
  description = "The name of the Bastion Host."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet for the Bastion Host."
  type        = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network."
  type        = string
}

