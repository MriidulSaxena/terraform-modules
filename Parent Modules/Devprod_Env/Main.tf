module "resource_group" {
  source = "../../Child Modules/azurerm_resource_group"
  resource_group_name     = "radherglb"
  resource_group_location = "West US"
}
module "storage_account" {
  source = "../../Child Modules/azurerm_storage_account"
  depends_on = [ module.resource_group ]
  resource_group_name            = "radherglb"
  resource_group_location        = "West US"
  storage_account_name           = "radhestoragelb"
  storage_account_tier           = "Standard"
  storage_account_replication_type = "GRS"
}
module "virtual_network" {
  source = "../../Child Modules/azurerm_virtual_network"
  depends_on = [ module.resource_group ]
  virtual_network_name     = "radhevnetlb"
  virtual_network_location = "West US"
  resource_group_name      = "radherglb"
  address_space            = ["10.0.0.0/16"]
}

module "frontendsubnet" {
  source = "../../Child Modules/azurerm_subnet"
    depends_on = [ module.virtual_network ]

  subnet_name           = "frontendsubnet"
  resource_group_name   = "radherglb"
  virtual_network_name  = "radhevnetlb"
  address_prefixes      = ["10.0.1.0/24"]
}
  

module "chinkuvm" {
  source = "../../Child Modules/azurerm_linuxvirtual_machine"
  depends_on = [ module.virtual_network, module.frontendsubnet ]
  resource_group_name = "radherglb"
  location            = "West US"
  vm_name         = "chinkuvm-lb"
  vm_size             = "Standard_B1s"
  admin_username      = "radheadmin"
  admin_password      = "Radhe@12345"
  image_publisher    = "Canonical"
  image_offer        = "UbuntuServer"
  image_sku          = "18.04-LTS"
  image_version      = "latest"
  nic_name   = "nic-chinku-vm"
  virtual_network_name         = "radhevnetlb"
  subnet_id         = "frontendsubnet"
  nsg_name       = "chinku-vm-nsg"

}

module "tinkuvm" {
  source = "../../Child Modules/azurerm_linuxvirtual_machine"
  depends_on = [ module.virtual_network,module.frontendsubnet ]
  resource_group_name = "radherglb"
  location            = "West US"
  vm_name         = "tinkuvm-lb"
  vm_size             = "Standard_B1s"
  admin_username      = "radheadmin"
  admin_password      = "Radhe@12345"
  image_publisher    = "Canonical"
  image_offer        = "UbuntuServer"
  image_sku          = "18.04-LTS"
  image_version      = "latest"
  nic_name   = "nic-tinku-vm"
  virtual_network_name = "radhevnetlb"
  subnet_id          = "frontendsubnet"
  nsg_name       = "tinku-vm-nsg"
}

module "public_ip_lb" {
 source = "../../Child Modules/azurerm_public_ip"
  public_ip_name       = "lb-public-ip"
  resource_group_name  = "radherglb"
  location             = "West US"
  allocation_method    = "static"
}

module "load_balancer" {
  source = "../../Child Modules/azurerm_loadbalancer"
  depends_on = [ module.public_ip_lb ]
  
}



module "chinku-lb-added" {
source = "../../Child Modules/azurerm_NIC_lb-Association"
nic_name                     = "nic-chinku-vm"
resource_group_name          = "radherglb"
lb_name                      = "radheloadbalancer"
lb_backend_address_pool_name = "lb_BackEndAddressPool"
nic_ip_configuration_name   =  "internal"
}
module "tinku-lb-added" {
source = "../../Child Modules/azurerm_NIC_lb-Association"
nic_name                     = "nic-tinku-vm"
resource_group_name          = "radherglb"
lb_name                      = "radheloadbalancer"
lb_backend_address_pool_name = "lb_BackEndAddressPool"
nic_ip_configuration_name   =  "internal"
}




module "bastion_subnet" {
  source = "../../Child Modules/azurerm_subnet"
    depends_on = [ module.virtual_network ]

  subnet_name           = "AzureBastionSubnet"
  resource_group_name   = "radherglb"
  virtual_network_name  = "radhevnetlb"
  address_prefixes      = ["10.0.2.0/24"]
}

module "public_ip_bastion" {
 source = "../../Child Modules/azurerm_public_ip"

  public_ip_name       = "bastion-public-ip"
  resource_group_name  = "radherglb"
  location             = "West US"
  allocation_method    = "static"
  sku                  = "standard"   
}

module "bastion" {
  source = "../../Child Modules/azurerm_bastion"
  depends_on = [ module.bastion_subnet, module.public_ip_bastion ]
  subnet_name     = "AzureBastionSubnet"
  vnet_name       = "radhevnetlb"
  pip_name         = "bastion-public-ip"
  rg_name          = "radherglb"
  bastion_name    = "radhebastionlb"
  location        = "West US"
}
  
























# # #module "sql_server" {
# #  # source                      = "../../Child Modules/azurerm_sql_server"
# #  # sql_server_name             = "radhesqlserver"
# #  # resource_group_name         = "radherg"
# #  # location                    = "West US"
# #  # administrator_login         = "radheadmin"
# #  # administrator_login_password = "Radhe@12345"
# # #}

# # #module "sql_database" {
# #  # source         = "../../Child Modules/azurerm_sql_database"
# #  # depends_on     = [module.sql_server]

# #  # sql_database_name = "radhesqldb"
# #  # sql_server_id     = module.sql_server.sql_server_id
# # #}
# # #module "azurerm_keyvault_and_keyvault_secret" {
# #  # source              = "../../Child Modules/azurerm_keyvault and keyvault secret"
  
# #  # key_vault_name      = "radhe-keyvault-12345"
# #  # resource_group_name = "radherg"
# #  # location            = "West US"
#  # sku_name            = "standard"
#  # tenant_id           = "2e333137-3307-4678-a744-a2d37508c632"
#  # secret_name         = "sqladminpassword"
# #secret_value        =  "keyvault_123456"
#  # }
