variable "virtual_machines" {
  default = {
    "k8s-controller-1" = {
      hostname    = "k8s-controller-1"
      ip_address  = "192.168.1.1/24"
      gateway     = "192.168.1.254",
      target_node = "node1-cilab",
      cpu_cores   = 1,
      cpu_sockets = 2,
      memory      = "2048",
      hdd_size    = "32G",
      vm_template = "ubuntu-2204-cloudinit-template",
      vm_bridge   = "vmbr101",
    }
    "k8s-controller-2" = {
      hostname    = "k8s-controller-2"
      ip_address  = "192.168.1.2/24"
      gateway     = "192.168.1.254",
      target_node = "node1-cilab",
      cpu_cores   = 1,
      cpu_sockets = 2,
      memory      = "2048",
      hdd_size    = "32G",
      vm_template = "ubuntu-2204-cloudinit-template",
      vm_bridge   = "vmbr101",
    }
    "worker-k8s-1" = {
      hostname    = "k8s-worker-1"
      ip_address  = "192.168.1.101/24"
      gateway     = "192.168.1.254",
      target_node = "node1-cilab",
      cpu_cores   = 1,
      cpu_sockets = 2,
      memory      = "2048",
      hdd_size    = "32G",
      vm_template = "ubuntu-2204-cloudinit-template",
      vm_bridge   = "vmbr101",
    }
    "worker-k8s-2" = {
      hostname    = "k8s-worker-2"
      ip_address  = "192.168.1.102/24"
      gateway     = "192.168.1.254",
      target_node = "node1-cilab",
      cpu_cores   = 1,
      cpu_sockets = 2,
      memory      = "2048",
      hdd_size    = "32G",
      vm_template = "ubuntu-2204-cloudinit-template",
      vm_bridge   = "vmbr101",
    }
    "worker-k8s-3" = {
      hostname    = "k8s-worker-3"
      ip_address  = "192.168.1.103/24"
      gateway     = "192.168.1.254",
      target_node = "node1-cilab",
      cpu_cores   = 1,
      cpu_sockets = 2,
      memory      = "2048",
      hdd_size    = "32G",
      vm_template = "ubuntu-2204-cloudinit-template",
      vm_bridge   = "vmbr101",
    }
    "worker-k8s-4" = {
      hostname    = "k8s-worker-4"
      ip_address  = "192.168.1.104/24"
      gateway     = "192.168.1.254",
      target_node = "node1-cilab",
      cpu_cores   = 1,
      cpu_sockets = 2,
      memory      = "2048",
      hdd_size    = "32G",
      vm_template = "ubuntu-2204-cloudinit-template",
      vm_bridge   = "vmbr101",
    }
    "k8s-vpn" = {
      hostname    = "k8s-vpn"
      ip_address  = "192.168.1.254/24"
      gateway     = "192.168.1.254",
      target_node = "node1-cilab",
      cpu_cores   = 1,
      cpu_sockets = 2,
      memory      = "2048",
      hdd_size    = "16G",
      vm_template = "ubuntu-2204-cloudinit-template",
      vm_bridge   = "vmbr101",
    }
  }
}