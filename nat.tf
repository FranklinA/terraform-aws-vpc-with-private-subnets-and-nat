# Nat #1
resource "aws_eip" "nat_1" {}
resource "aws_nat_gateway" "nat_1" {
  allocation_id = "${aws_eip.nat_1.id}"
  subnet_id = "${aws_subnet.public_nat_1.id}"
}

# Nat #2
resource "aws_eip" "nat_2" {
  count = "${var.multi_az ? 1 : 0}"
}
resource "aws_nat_gateway" "nat_2" {
  count = "${var.multi_az ? 1 : 0}"

  allocation_id = "${aws_eip.nat_2.id}"
  subnet_id = "${aws_subnet.public_nat_2.id}"
}