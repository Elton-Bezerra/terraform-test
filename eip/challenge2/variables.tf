
variable "security_group_rules" {
  type    = list(number)
  default = [80, 443]
}
