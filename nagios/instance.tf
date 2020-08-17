resource "aws_instance" "web" {
  ami                    = "${data.aws_ami.centos.id}"
  instance_type          = "t2.large"
  key_name               = "${aws_key_pair.class.key_name}"
  # user_data     = "${file("userdata.sh")}"
  vpc_security_group_ids = ["${aws_security_group.provisioner.id}"]
}