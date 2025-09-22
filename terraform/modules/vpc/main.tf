variable "name" { type = string }
variable "azs" { type = list(string) }
variable "public_subnet_cidrs" { type = list(string) }

resource "aws_vpc" "this" {
  cidr_block = "10.10.0.0/16"
  tags = { Name = var.name }
}

resource "aws_subnet" "public" {
  for_each = { for idx, cidr in var.public_subnet_cidrs : idx => cidr }
  vpc_id = aws_vpc.this.id
  cidr_block = each.value
  availability_zone = var.azs[tonumber(each.key)]
  tags = { Name = "${var.name}-public-${each.key}" }
}

output "vpc_id" { value = aws_vpc.this.id }
output "public_subnet_ids" { value = values(aws_subnet.public)[*].id }
