variable "do_token" {
  description = "DigitalOcean Personal Access Token"
  type        = string
  sensitive   = true
}
variable "image" {
  default = "ubuntu-25-10-x64"
}
variable "region" {
  default = "nyc3"
}

variable "droplet_sizes" {
  description = "Map of instance roles to DigitalOcean droplet size slugs"
  type        = map(string)
  default = {
    jumpbox = "s-1vcpu-512mb-10gb"
    server  = "s-1vcpu-2gb"
    node    = "s-1vcpu-2gb"
  }
}