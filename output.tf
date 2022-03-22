output "epam_aws_region" {
  value = data.aws_vpcs.epam_vpcs.id
}
output "epam_vpc" {
    value = data.aws_vpc.epam_vpc[0].id
}

output "epam_subnets" {
  value = [for s in data.aws_subnet.epam_subnet : s.id]
}

output "epam_sgroups" {
    value = [for s in data.aws_security_groups.epam_sgroups.ids : s] 
}