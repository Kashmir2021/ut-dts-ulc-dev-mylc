variable "privateSubnetA" {
  type    = string
  default = "subnet-07d14999e4e3dbbb1"
}

variable "privateSubnetB" {
  type    = string
  default = "subnet-015f4e6915d62c7a0"
}

variable "publicSubnetA" {
  type    = string
  default = "subnet-01175bb4264cddaea"
}

variable "publicSubnetB" {
  type    = string
  default = "subnet-0b667614dd5f3e61a"
}

variable "vpcId" {
  type    = string
  default = "vpc-025ec0eb426cdcb60"
}

variable "env" {
  type    = string
  default = "at"
}

variable "at_utah_gov_cert" {
  type    = string
  default = "arn:aws:acm:us-west-2:031317089679:certificate/6a762b6d-7771-4407-bf31-31f92f16f358"
}



#variable "github_env_variables" {
#  type        = list(map(string))
#  description = "list of objects"
#  default = [
#    {
#      "name": "RUNNER_SCOPE",
#      "value": "org"
#    },
#    {
#      "name": "ORG_NAME",
#      "value": "utahdts"
#    },
#    {
#      "name": "LABELS",
#      "value": "csd"
#    },
#    {
#      "name": "RUNNER_GROUP",
#      "value": "doc"
#    },
#    {
#      "name": "DISABLE_AUTO_UPDATE",
#      "value": "1"
#    },
#    {
#      "name": "EPHEMERAL",
#      "value": "1"
#    }
#  ]
#}
