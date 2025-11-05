variable "nic_name" {
  description = "The name of the Network Interface to associate with the Load Balancer Backend Address Pool."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the Resource Group where the Network Interface and Load Balancer are located."
  type        = string
}
variable "lb_name" {
  description = "The name of the Load Balancer."
  type        = string
}
variable "lb_backend_address_pool_name" {
  description = "The name of the Load Balancer Backend Address Pool to associate with the Network Interface."
  type        = string
}
variable "nic_ip_configuration_name" {
  description = "The name of the IP configuration on the Network Interface to associate with the Load Balancer Backend Address Pool."
  type        = string
}