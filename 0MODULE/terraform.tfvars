# Resource Group Line (1-3)
rg  = "Resoure_Group"
jgh = "eastus2"
# =========================
# Virtual Network Line (6-26)
vn = {
  VN1 = {
    vname = "Virtual_Network"
    add   = ["10.2.0.0/16"]
  }
}
# Subnet Line (13-25)
sn = {
  SN1 = {
    name = "FrontEnd_SUBNET"
    ad   = "10.2.4.0/24"
  },
  SN2 = {
    name = "BackEnd_SUBNET"
    ad   = "10.2.6.0/24"
  },
  SN3 = {
    name = "AzureBastionSubnet"
    ad   = "10.2.5.0/26"
  }
}
# =========================
# Public IP Line (29)
ip = ["BASTION_IP", "LB_IP"]
# =========================
# Network Interface Line (32-45)
ni = {
  NI1 = {
    name  = "FNIC1"
    sname = "FrontEnd_SUBNET"
  },
  NI2 = {
    name  = "FNIC2"
    sname = "FrontEnd_SUBNET"
  },
  NI3 = {
    name  = "BNIC1"
    sname = "BackEnd_SUBNET"
  }
}
# =========================
# Virtual Machine Line (48-67)
vms = {
  VMS1 = {
    name = "FrontEnd-VM1"
    user = "adminuser"
    ni   = "FNIC1"
  },
  VMS2 = {
    name = "FrontEnd-VM2"
    user = "adminuser"
    ni   = "FNIC2"
  },
  VMS3 = {
    name = "BackEnd-VM1"
    user = "adminuser"
    ni   = "BNIC1"
  }
}
# =========================
# DataBase & Server Line (70-77)
db = {
  DB1 = {
    srver = "aaaserversqlaa"
    user  = "adminuser"
    db    = "azfncznj"
  }
}
# =========================
# Bastion Host Line (80)
bh = "Bastion_Host"
# =========================
# Load Balancer Line (82-93)
lb  = "Load_Balancer"
blb = "BackEnd_Pool"
blip = {
  BLIP1 = {
    name = "Virtual_Machine-1"
    vm   = "FrontEnd-VM1"
  },
  BLIP2 = {
    name = "Virtual_Machine-2"
    vm   = "FrontEnd-VM2"
  }
}
# =========================
# Network Security Group Line (97)
nsg = "Security_Gaurd"
# =========================
# NSG Associan With NIC Line (100-109)
assign = {
  ASSIGN1 = {
    ni = "FNIC1"
    nsg = "Security_Gaurd"
  },
  ASSIGN2 = {
    ni = "FNIC2"
    nsg = "Security_Gaurd"
  },
  ASSIGN3 = {
    ni = "BNIC1"
    nsg = "Security_Gaurd"
  }
}
# =========================
# Key Vault Line (113-117)
kv = {
  KV1 = {
    name = "azureekeyyvaultt"
    pwd = "password"
    password = "CENAne$&yW4m3x"
  }
}