# block-domains
To Manage and Control Domains 

## Restart / Clear DNS Cache in Linux
```
$ sudo /etc/init.d/dnsmasq restart
$ sudo /etc/init.d/named restart
$ sudo systemctl restart network-manager
```

## Restart / Clear DNS Cache in OSX
```
sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
```

## Restart / Clear DNS Cache in Windows
```
C:\> ipconfig /flushdns
```
