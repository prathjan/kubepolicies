terraform {
  required_providers {
    intersight = {
      source = "ciscodevnet/intersight"
      version = "1.0.5"
    }
  }
}

provider "intersight" {
  apikey    = var.api_key_id
  secretkey = var.api_private_key
  endpoint = "https://intersight.com"
}

variable "cluster_name" {
  type        = string
  description = "Cluster name"
}

module "infra_config_policy" {
  source           = "terraform-cisco-modules/iks/intersight//modules/infra_config_policy"
  name             = "${var.cluster_name}-infra-config"
  device_name      = var.device_name
  vc_portgroup     = var.portgroup
  vc_datastore     = var.datastore
  vc_cluster       = var.cluster
  vc_resource_pool = var.resource_pool
  vc_password      = var.password
  org_name         = var.organization
#  tags             = var.tags
}

module "ip_pool_policy" {
  source           = "terraform-cisco-modules/iks/intersight//modules/ip_pool"
  name             = "${var.cluster_name}-ip-pool"
  starting_address = var.starting_address
  pool_size        = var.pool_size
  netmask          = var.netmask
  gateway          = var.gateway
  primary_dns      = var.primary_dns
#  secondary_dns    = var.ip_secondary_dns

  org_name = var.organization
#  tags     = var.tags
}

module "network" {
  source      = "terraform-cisco-modules/iks/intersight//modules/k8s_network"
  policy_name = var.cluster_name
  dns_servers = [var.primary_dns]
  ntp_servers = [var.primary_dns]
  timezone    = var.timezone
  domain_name = var.domain_name
  org_name    = var.organization
#  tags        = var.tags
}

module "k8s_version" {
  source           = "terraform-cisco-modules/iks/intersight//modules/version"
  k8s_version      = "1.19.5"
  k8s_version_name = "${var.cluster_name}-1.19.5"

  org_name = var.organization
#  tags     = var.tags
}

data "intersight_organization_organization" "organization" {
  name = var.org_name
}
resource "intersight_kubernetes_virtual_machine_instance_type" "masterinstance" {
  name      = "${var.cluster_name}-master-instance"
  cpu       = var.cpu
  disk_size = var.disk_size
  memory    = var.memory
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.organization.results.0.moid
  }
}
