resource "proxmox_vm_qemu" "virtual_machines" {
  for_each = var.virtual_machines

  name        = each.value.hostname
  target_node = each.value.target_node
  clone       = each.value.vm_template
  agent       = 1
  os_type     = "cloud-init"
  cores       = each.value.cpu_cores
  sockets     = each.value.cpu_sockets
  cpu         = "host"
  memory      = each.value.memory
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"

  disk {
    slot    = 0
    size    = each.value.hdd_size
    type    = "scsi"
    storage = "local-lvm"
    discard = "on"
    #iothread = 1
  }

  network {
    model  = "virtio"
    bridge = each.value.vm_bridge
  }

  # Not sure exactly what this is for. something about 
  # ignoring network changes during the life of the VM.
  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  # Cloud-init config
  ipconfig0 = "ip=${each.value.ip_address},gw=${each.value.gateway}"
  ciuser    = "root"
  sshkeys   = var.ssh_key
}

output "vm_ipv4_addresses" {
  value = {
    for instance in proxmox_vm_qemu.virtual_machines :
    instance.name => instance.default_ipv4_address
  }
}