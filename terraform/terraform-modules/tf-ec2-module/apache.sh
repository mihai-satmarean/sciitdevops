#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "Mi-am facut tema pentru cursul DevOps din data de 02.12.2024" | sudo tee /var/www/html/index.html 
