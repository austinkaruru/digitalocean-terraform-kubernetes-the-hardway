terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

resource "digitalocean_ssh_key" "ssh_key" {
  name       = "kthw-ssh-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# The Jumpbox Droplet
resource "digitalocean_droplet" "jumpbox" {
  name       = "jumpbox"
  region     = var.region
  image      = var.image
  size       = var.droplet_sizes["jumpbox"]
  ssh_keys   = [digitalocean_ssh_key.ssh_key.id]
  depends_on = [digitalocean_ssh_key.ssh_key]
}

# The Control Plane (Server) Droplet
resource "digitalocean_droplet" "server" {
  name       = "server"
  region     = var.region
  image      = var.image
  size       = var.droplet_sizes["server"]
  ssh_keys   = [digitalocean_ssh_key.ssh_key.id]
  depends_on = [digitalocean_ssh_key.ssh_key]


}

# The Worker Nodes (Using count to spin up 2)
resource "digitalocean_droplet" "node" {
  count      = 2
  name       = "node-${count.index}"
  region     = var.region
  image      = var.image
  size       = var.droplet_sizes["node"]
  ssh_keys   = [digitalocean_ssh_key.ssh_key.id]
  depends_on = [digitalocean_ssh_key.ssh_key]


}