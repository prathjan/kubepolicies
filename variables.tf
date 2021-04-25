
variable "organization" {
  type        = string
  description = "Org"
}
variable "api_private_key" {
  type        = string
  description = "Secret Key"
}
variable "api_key_id" {
  type        = string
  description = "API Key"
}
variable "org_name" {
  type        = string
  description = "Intersight Organization name"
}
variable "device_name" {
  type        = string
  description = "Name of the Virtual Machine Provider you wish to add.  i.e vCenter"
}
variable "description" {
  type        = string
  default     = ""
  description = "Description to be used to describe the infrastructure configuration policy"
}
variable "cluster" {
  type        = string
  description = "Name of the cluster you wish to make part of this provider within vCenter."
}
variable "portgroup" {
  type        = list(string)
  description = "Name of the portgroup(s) to be used in this provider"
}
variable "datastore" {
  type        = string
  description = "Name of the datastore to be used with this provider."
}
variable "password" {
  sensitive   = true
  type        = string
  description = "Password of the account to be used with vCenter.  This should be the password for the account used to register vCenter with Intersight."
}
variable "resource_pool" {
  type        = string
  description = "Name of the resource pool to be used with this provider."
  default     = ""
}
# variable "instance_type_moid" {
#   type        = string
#   description = "MOID of the Instance type mapped to this provider"
#   default     = ""
# }
variable "tags" {
  type        = list(map(string))
  default     = []
  description = "Tags to be associated with this object in Intersight."
}



variable "starting_address" {
  type        = string
  description = "Starting IP Address you want for this pool."
}
variable "pool_size" {
  type        = string
  description = "Number of IPs you want this pool to contain."
}
variable "netmask" {
  type        = string
  description = "Subnet Mask for this pool."
}
variable "gateway" {
  type        = string
  description = "Default gateway for this pool."
}
variable "primary_dns" {
  type        = string
  description = "Primary DNS Server for this pool."
}
variable "secondary_dns" {
  type        = string
  description = "Secondary DNS Server for this pool."
  default     = ""
}


variable "pod_cidr" {
  type        = string
  description = "Pod CIDR Block to be used to assign POD IP Addresses."
  default     = "100.65.0.0/16"
}
variable "service_cidr" {
  type        = string
  description = "Service CIDR Block used to assign cluster service IP addresses."
  default     = "100.64.0.0/24"
}
variable "cni" {
  type        = string
  description = "Supported CNI type. Currently we only support Calico.* Calico - Calico CNI plugin as described in https://github.com/projectcalico/cni-plugin."
  default     = "Calico"
}
variable "timezone" {
  type        = string
  description = "The timezone of the node's system clock."
}
variable "domain_name" {
  type        = string
  description = "Domain Name information for DNS search."
}
variable "cpu" {
  type        = string
  description = "CPU of the master node"
}
variable "memory" {
  type        = string
  description = "Memory of the master node"
}
variable "disk_size" {
  type        = string
  description = "Disk Size of the master node"
}






