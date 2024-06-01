module "vpc" {
    source = "./VPC"
}
module "ec2"{
    source = "./web"
    sn = module.vpc.pb-sn
    sg = module.vpc.sg
}
module "lambda" {
    source = "./lambda"
}