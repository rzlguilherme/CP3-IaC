# SECURITY GROUPS
output "vpc10_sg_pub_id" {
  value = aws_security_group.vpc10_sg_pub.id
}

output "vpc10_sg_priv_id" {
  value = aws_security_group.vpc10_sg_priv.id
}