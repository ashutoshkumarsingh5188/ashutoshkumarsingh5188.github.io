module "resource_group" {
  source          = "../../modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}

module "virtual_networks" {
  depends_on       = [module.resource_group]
  source           = "../../modules/azurerm_virtual_network"
  virtual_networks = var.virtual_networks

}

module "subnets" {
  depends_on = [module.virtual_networks]
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets

}

module "public_ips" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
}

 module "virtual_machines" {
   depends_on = [module.subnets, module.public_ips]
   source     = "../../modules/azurerm_virtual_machine"
   vms        = var.vms
 }