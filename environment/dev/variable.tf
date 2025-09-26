variable "rg_details" {
  type = map(object({
    resource_group_name = string
    location            = string
  }))
}

variable "vnets" {
  type = map(object({
    vnet_name           = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
}


variable "mysubnets" {
  type = map(object({
    subnet_name          = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "pip" {
  type = map(object({
    pip_name            = string
    location            = string
    resource_group_name = string
  }))
}

# variable "bastion_subnet" {
#   type = map(object({
#     subnet_name          = string
#     resource_group_name  = string
#     virtual_network_name = string
#     address_prefixes     = list(string)
#   }))
# }

variable "bastion_name" {

}
variable "ip_configuration_name" {

}

variable "vm" {
  type = map(object({
    vm_name               = string
    resource_group_name   = string
    location              = string
    nic_name              = string
    ip_configuration_name = string
    publisher             = string
    offer                 = string
    sku                   = string
    subnet_id             = string
  }))
}

variable "nsg_details" {
  type = map(object({
    nsg_name            = string
    location            = string
    resource_group_name = string
  }))
}

variable "nsga_details" {
  type = map(object({
    network_interface_id      = string
    network_security_group_id = string
  }))
}

variable "sql_servers" {
  type = map(object({
    server_name                  = string
    resource_group_name          = string
    location                     = string
    database_name                = string
  }))

}




variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  sensitive   = true
}
