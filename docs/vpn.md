# Accessing staging through VPN

> Our non-production and production environments are restricted to our office IP and our external VPN server IP.

> Request permission and access credentials from relevant persons (Ievgen)

> Download pritunl client from https://client.pritunl.com/ or any other VPN client that supports OpenvVPN

> Open the client and request a VPN profile created for you

> You will get a VPN profile URI which will expire after 24 hours or a zip file you can can just unzip and add the .ovpn file manually to your client

### Installation

Run the below script on any Ubuntu xenial server.

```
#!/bin/bash
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.6.list
echo "deb http://repo.pritunl.com/stable/apt xenial main" > /etc/apt/sources.list.d/pritunl.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
apt-get --assume-yes update
apt-get --assume-yes upgrade
apt-get --assume-yes install pritunl mongodb-org
systemctl start pritunl mongod
systemctl enable pritunl mongod
```

### Management

The web console is only accessible from our office IP address https://newvpn.thehomelike.com/

Pritunl contains two services only,

pritunl ( web )
mongod (db ) to store all the configs
In case the services is down start with running the below commands to see why

```
systemctl status mongod
systemctl status pritunl
journalctl --unit=pritunl
journalctl --unit=mongod
```

#### To reset the password

ssh into the server
https://docs.pritunl.com/docs/commands#section-reset-password
