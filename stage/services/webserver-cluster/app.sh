#!/bin/bash

cat > index.html <<EOS
<h1>Hello!</h1>
<p>DB address: ${db_address}</p>
<p>DB port: ${db_port}</p>
EOS

nohup busybox httpd -f -p ${instance_server_port} &