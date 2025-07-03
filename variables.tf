variable "tags" {
  type = object({
        Name = string
        Author      = string
        Environment = string
        Provisioner = string
        Region      = string
    })
  description = "transfer family tags"
}

variable "endpoint_type"{
  type = string
  description = "SERVER endpoint type, can be PUBLIC, VPC or VPC_ENDPOINT"
  validation {
    condition     = contains(["PUBLIC", "VPC", "VPC_ENDPOINT"], var.endpoint_type)
    error_message = "endpoint_type must be either PUBLIC, VPC VPC_ENDPOINT"
  }
}

variable "domain" {
  type = string
  description = "domain for transfer family server"
  validation {
    condition     = contains(["S3", "EFS"], var.domain)
    error_message = "domain must be either S3 or EFS"
  }
}

variable "logging_role_arn" {
  type = string
  default = null
  description = "logging role arn for transfer family server"
}

variable "protocols" {
  type = list(string)
  validation {
    condition     = alltrue([for protocol in var.protocols : contains(["SFTP", "FTPS", "FTP"], protocol)])
    error_message = "protocols must be a list of SFTP, FTPS, FTP"
  }
  description = "protocols for transfer family server"
}

variable "identity_provider_type" {
  type = string
  default = "SERVICE_MANAGED"
  description = "identity provider type for transfer family server"
  validation {
    condition     = contains(["SERVICE_MANAGED", "API_GATEWAY", "AWS_DIRECTORY_SERVICE", "AWS_LAMBDA"], var.identity_provider_type)
    error_message = "identity_provider_type must be either SERVICE_MANAGED, API_GATEWAY, AWS_DIRECTORY_SERVICE or AWS_LAMBDA"
  }
  
}

variable "certificate_arn" {
  type = string
  default = null
  description = "certificate arn for transfer family server"
}

variable "function_arn" {
  type = string
  default = null
  description = "lambda function arn for transfer family server"
}

variable "endpoint_details" {
  type = object({
    vpc_endpoint_id = string
    vpc_id          = string
    subnet_ids      = list(string)
  })
  default = null
  description = "endpoint details for transfer family server, required if endpoint_type is VPC or VPC_ENDPOINT"
  
}

variable "security_policy_name" {
  type = string
  default = "TransferSecurityPolicy-2020-06"
  description = "security policy name for transfer family server"
}
