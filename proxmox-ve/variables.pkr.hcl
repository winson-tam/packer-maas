variable "debian_series" {
  type    = string
  default = "bullseye"
}

variable "debian_version" {
  type    = string
  default = "11"
}

variable "architecture" {
  type    = string
  default = "amd64"
}

variable "headless" {
  type    = bool
  default = true
}

variable "http_directory" {
  type    = string
  default = "http"
}

variable "ssh_username" {
  type    = string
  default = "debian"
}

variable "ssh_password" {
  type    = string
  default = "password123!"
}

variable "timeout" {
  type    = string
  default = "1h"
}

variable "boot_mode" {
  type    = string
  default = "uefi"
}

variable "customize_script" {
  type    = string
  default = ""
}

variable "filename" {
  type    = string
  default = "proxmox-ve-cloudimg.tar.gz"
}

variable "http_proxy" {
  type    = string
  default = ""
}

variable "https_proxy" {
  type    = string
  default = ""
}

variable "no_proxy" {
  type    = string
  default = ""
}
