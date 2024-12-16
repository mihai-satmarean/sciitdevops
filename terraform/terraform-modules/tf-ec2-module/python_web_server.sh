#!/bin/bash
yum update -y
yum install -y python3
echo 'import http.server' > /home/ubuntu/http_server.py
echo 'import socketserver' >> /home/ubuntu/http_server.py
echo 'PORT = 8000' >> /home/ubuntu/http_server.py
echo 'Handler = http.server.SimpleHTTPRequestHandler' >> /home/ubuntu/http_server.py
echo 'with socketserver.TCPServer(("", PORT), Handler) as httpd:' >> /home/ubuntu/http_server.py
echo '    print("Serving at port", PORT)' >> /home/ubuntu/http_server.py
echo '    httpd.serve_forever()' >> /home/ubuntu/http_server.py
python3 /home/ubuntu/http_server.py &
