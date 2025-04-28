#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello from AWS EC2 instance - Auto Scaling Group</h1>" > /var/www/html/index.html
instance_id=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
echo "<p>Instance ID: $instance_id</p>" >> /var/www/html/index.html