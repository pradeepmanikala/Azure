variable "clientname" {
  type        = string
  description = "The name of the client:"
  default     = "pradeep"
}

variable "location" {
  type        = string
  description = "Location of client"
  default     = "eastasia"
}

#This will give resource group purpose
variable "rgnames" {
  type = list(string)
  default = ["compute", "network", "backup"]
}

variable "subscription" {
    type = string
    description = "Enter the subscription ID:"
    default = "8f7d862b-5995-401f-a514-7f9f1f9ebae5"
  
}
variable "vnetname" {
  type        = string
  description = "The name of the vnet"
  default     = "prod-vnet1"
}

variable "vnet_address_space" {
  type        = list(any)
  description = "the address space of the VNet"
  default     = ["10.10.0.0/16"]
}

#This is map with list of object having key value pair.
variable "subnets" {
  type = map(any)
  default = {
    subnet_1 = {
      name             = "10.10.1.0_24"
      address_prefixes = ["10.10.1.0/24"]
    }
  }
}
