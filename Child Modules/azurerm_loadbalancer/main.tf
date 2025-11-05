data "azurerm_public_ip" "ip" {
  name                = "lb-public-ip"
  resource_group_name = "radherglb"
}

resource "azurerm_lb" "lb" {
  name                = "radheloadbalancer"
  location            = "West US"
  resource_group_name = "radherglb"
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "internal"
    public_ip_address_id = data.azurerm_public_ip.ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "lb_BackEndAddressPool"
}

resource "azurerm_lb_probe" "probe" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "lb-probe"
  port            = 80
}
resource "azurerm_lb_rule" "rule" {
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "internal"
  backend_address_pool_ids      =  [azurerm_lb_backend_address_pool.pool.id]
  probe_id                      = azurerm_lb_probe.probe.id
}

