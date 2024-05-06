output "Myulc_App" {
  value = "${aws_security_group.Myulc_App.id}"
}

output "Public_ELB" {
  value = "${aws_security_group.Public_ELB.id}"
}

output "Public_Myulc_ELB" {
  value = "${aws_security_group.Public_Myulc_ELB.id}"
}
