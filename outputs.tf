output "transfer_family_server_id" {
  value       = aws_transfer_server.default.id
  description = "The ID of the Transfer Family server."
}

output "transfer_family_server_arn" {
  value       = aws_transfer_server.default.arn
  description = "The ARN of the Transfer Family server."
}

output "transfer_family_server_endpoint" {
  value       = aws_transfer_server.default.endpoint
  description = "The endpoint of the Transfer Family server."
}
