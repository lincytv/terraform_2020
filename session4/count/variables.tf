
variable "usercount" {
  type = number
  default = 1
}

variable "elb_name" {
  type = list
  default = ["dev-loadbalancer", "stage-loadbalancer", "prod-loadbalancer"]
}
