sudo su -
yum -y install httpd
echo "<p> Coded by QQmelo </p>" >> /var/www/html/index.html
sudo systemctl enable httpd --now
