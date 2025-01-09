module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.0.0"

  # insert the required variables here
  name          = "${local.name}-BastionHost"
  ami           = "ami-0453ec754f44f9a4a"
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  #monitoring             = true
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
  tags                   = local.common_tags
}
