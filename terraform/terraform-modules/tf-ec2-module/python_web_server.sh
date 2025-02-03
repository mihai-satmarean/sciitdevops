#!/bin/bash
yum update -y
yum install -y python3
echo 'import http.server' > /home/ec2-user/http_server.py
echo 'import socketserver' >> /home/ec2-user/http_server.py
echo 'PORT = 8000' >> /home/ec2-user/http_server.py
echo 'Handler = http.server.SimpleHTTPRequestHandler' >> /home/ec2-user/http_server.py
echo 'with socketserver.TCPServer(("", PORT), Handler) as httpd:' >> /home/ec2-user/http_server.py
echo '    print("Serving at port", PORT)' >> /home/ec2-user/http_server.py
echo '    httpd.serve_forever()' >> /home/ec2-user/http_server.py
python3 /home/ec2-user/http_server.py &