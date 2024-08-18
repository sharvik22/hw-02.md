####VM1

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "version OS"
}

#variable "vm_web_name" {
#  type        = string
#  default     = "netology-develop-platform-web"
#  description = "name"
# }

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "platform_id"
 }

 #variable "vm_web_cores" {
 # type        = number
 # default     = 2
 # description = "cores"
 #}

 #variable "vm_web_memory" {
 # type        = number
 # default     = 1
 # description = "memory"
 #}

 #variable "vm_web_core_fraction" {
 # type        = number
 # default     = 5
 # description = "core_fraction"
 #}

#####################################VM2

variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "version OS"
}

#variable "vm_db_name" {
#  type        = string
#  default     = "netology-develop-platform-db"
#  description = "name"
# }

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "platform_id"
 }

 #variable "vm_db_cores" {
 # type        = number
 # default     = 2
 # description = "cores"
 #}

 #variable "vm_db_memory" {
 # type        = number
 # default     = 2
 # description = "memory"
 #}

 #variable "vm_db_core_fraction" {
 # type        = number
 # default     = 20
 # description = "core_fraction"
 #}

##################################MAP
variable "vms_resources" {
  description = "Map of VM resources configurations"
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

############# metadata
variable "metadata_all" {
  type        = map(string)
  description = "ssh-keygen -t ed25519"
  default     = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGtGgCucF4rB9fJftdS3o6muoClGVjxpTDxhoY3AEkCI root@terraform"
  }
}