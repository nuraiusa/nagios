resource "null_resource"  "commands" {
    depends_on = ["aws_instance.web"]
    triggers = {
        always_run = "${timestamp()}"
    }
    provisioner "remote-exec" {
        connection {
        host = "${aws_instance.web.public_ip}"
        type = "ssh"
        user = "centos"
        private_key = "${file("~/.ssh/id_rsa")}"
    }
    inline = [
        "sudo yum install unzip  curl -y",
        "sudo curl https://assets.nagios.com/downloads/nagiosxi/install.sh | sudo sh",
        # "sudo rpm -Uvh http://repo.nagios.com/nagios/7/nagios-repo-7-4.el7.noarch.rpm",
        # "sudo yum install ncpa -y",
        # "sudo sed -i 's/community_string = .*/community_string = Str0ngT0k3n/g' /usr/local/ncpa/etc/ncpa.cfg",
        # "systemctl restart ncpa_listener.service",
        ]
    }
}