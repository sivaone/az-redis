variable "rg_name" {
  type        = string
  description = "Resource Group Name"
}

variable "location" {
  type        = string
  description = "Resource location"
  default     = "eastus2"
}

variable "node_vm_size" {
  type        = string
  description = "Node pool vm size"
  default     = "Standard_D2_v2"
}