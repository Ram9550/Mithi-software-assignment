resource "null_resource" "nginx_log_report" {
  provisioner "local-exec" {
    command = "scp -i ${var.private_key_path} ${path.module}/nginx_log_report.py ${var.ssh_username}@${aws_instance.wordpress.public_ip}:~/"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y python3-pip",
      "sudo pip3 install csv",
      "python3 nginx_log_report.py",
    ]
  }

  depends_on = [aws_instance.wordpress]
}
