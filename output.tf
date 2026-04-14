output "jumpbox_ip" {
    value = digitalocean_droplet.jumpbox.ipv4_address
}

output "server_ip" {
    value = digitalocean_droplet.server.ipv4_address
}

output "node_ips" {
    value = digitalocean_droplet.node[*].ipv4_address
}