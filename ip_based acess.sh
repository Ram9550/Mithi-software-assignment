server {
  listen 80;
  server_name example.com; # replace with your domain name

  location /wp-admin {
    allow 192.168.1.100; # replace with your allowed IP address
    deny all;
    # add additional "allow" directives for other allowed IP addresses
    # make sure to add "deny all;" at the end to deny access to all other IP addresses
    proxy_pass http://backend;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
  }

  location / {
    proxy_pass http://backend;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
  }
}
