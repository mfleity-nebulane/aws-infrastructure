output "public_a_subnet_id" {
  description = "ID of the first public subnet"
  value       = aws_subnet.public_a.id
}

output "public_b_subnet_id" {
  description = "ID of the second public subnet"
  value       = aws_subnet.public_b.id
}
