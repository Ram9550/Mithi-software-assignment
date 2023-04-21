{

 Provider "aws" {
  region = "us-west-2"
}

 resource "aws_instance" "wordpress" {
  ami           = "ami-0c55b159cbfafe1f0" # replace with your desired AMI ID
  instance_type = "t2.micro"
  key_name      = "my-keypair"
  subnet_id     = "subnet-0123456789abcdef"
  vpc_security_group_ids = [
    "sg-0123456789abcdef",
  ]
  tags = {
    Name = "wordpress-server"
  

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx php-fpm",
      # additional commands to install and configure WordPress

     provisioner "remote-exec" {
      inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx php-fpm",
      "sudo mkdir /var/www/html/wordpress",
      "sudo chown -R www-data:www-data /var/www/html/wordpress",
      "wget https://wordpress.org/latest.tar.gz",
      "tar -xzf latest.tar.gz",
      "sudo mv wordpress/* /var/www/html/wordpress/",
      "sudo chown -R www-data:www-data /var/www/html/wordpress",
      "sudo rm -rf wordpress latest.tar.gz",
      "sudo cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php",
      "sudo sed -i 's/database_name_here/mydatabase/g' /var/www/html/wordpress/wp-config.php",
      "sudo sed -i 's/username_here/myusername/g' /var/www/html/wordpress/wp-config.php",
      "sudo sed -i 's/password_here/mypassword/g' /var/www/html/wordpress/wp-config.php",
      "sudo sed -i 's/localhost/mydatabasehostname/g' /var/www/html/wordpress/wp-config.php",
      # additional configuration commands
    ]
    ]
    
}

