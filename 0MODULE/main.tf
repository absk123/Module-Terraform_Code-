module "singhrg" {
  source = "../1RG"
  rg     = var.rg
  jgh    = var.jgh
}

module "singhvn" {
  source     = "../2VNET"
  vn         = var.vn
  sn         = var.sn
  depends_on = [module.singhrg]
}

module "singhip" {
  source     = "../3PIP"
  ip         = var.ip
  depends_on = [module.singhrg]
}

module "singhnic" {
  source     = "../4NIC"
  ni         = var.ni
  depends_on = [module.singhrg, module.singhvn]
}

module "singhvm" {
  source     = "../5VM"
  vms        = var.vms
  depends_on = [module.singhrg, module.singhnic, module.singhkv]
}
module "singhdb" {
  source     = "../6DB"
  db         = var.db
  depends_on = [module.singhrg, module.singhkv]
}

module "singhbh" {
  source     = "../7BASTION"
  bh         = var.bh
  depends_on = [module.singhrg, module.singhip, module.singhvn]
}

module "singhlb" {
  source = "../8LB"
  lb     = var.lb
  blb    = var.blb
  blip   = var.blip
  depends_on = [ module.singhrg, module.singhvm ]
}

module "singhnsg" {
  source = "../9NSG"
  nsg = var.nsg
  depends_on = [ module.singhrg, module.singhnic]
}

module "assign" {
  source = "../10NSGonNIC"
  assign = var.assign
  depends_on = [ module.singhrg, module.singhnic, module.singhnsg ]
}

module "singhkv" {
  source = "../11KV"
  kv = var.kv
  depends_on = [ module.singhrg ]
}