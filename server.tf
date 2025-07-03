
resource "aws_transfer_server" "default" {
  endpoint_type = var.endpoint_type
  logging_role  = var.logging_role_arn
  protocols     = var.protocols
  identity_provider_type = var.identity_provider_type
  domain = var.domain
  certificate = var.certificate_arn
  security_policy_name = var.security_policy_name
  function = var.function_arn
  dynamic "endpoint_details" {
    for_each = var.endpoint_details != null && var.endpoint_type != "PUBLIC" ? [var.endpoint_details] : []
    content {
      address_allocation_ids = endpoint_details.value.address_allocation_ids
      vpc_id          = endpoint_details.value.vpc_id
      subnet_ids      = endpoint_details.value.subnet_ids
    }
  }

  tags          = var.tags
}
