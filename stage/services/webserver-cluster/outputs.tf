output "cluster_dns_name" {
  description = ""
  value = module.webserver_cluster.lb_dns_name
}

output "cluster_asg_name" {
  description = ""
  value = module.webserver_cluster.asg_name
}