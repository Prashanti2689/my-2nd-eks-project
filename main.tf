module "vpc" {
    source = "./vpc"
}
module "ec2"{
    source = "./web"
    sn = module.vpc.pb-sn
    sg = module.vpc.sg
}