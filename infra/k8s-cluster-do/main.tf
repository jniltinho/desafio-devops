## export DIGITALOCEAN_ACCESS_TOKEN=dop_v1_3XXXX
## terraform init; terraform plan; terraform apply --auto-approve

## Save config
## doctl kubernetes cluster list; doctl kubernetes cluster kubeconfig save cluster01

terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "region" {
  # doctl kubernetes options regions
  default = "nyc1"
}

data "digitalocean_kubernetes_versions" "do_k8s_versions" {}

output "k8s-versions" {
  value = data.digitalocean_kubernetes_versions.do_k8s_versions.latest_version
}

resource "digitalocean_kubernetes_cluster" "cluster01" {
  name   = "cluster01"
  region = var.region
  # doctl kubernetes options versions
  version = data.digitalocean_kubernetes_versions.do_k8s_versions.latest_version

  node_pool {
    name       = "autoscale-worker-pool"
    size       = "s-2vcpu-2gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 5
  }
}
