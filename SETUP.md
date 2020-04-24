# SETUP
Some setup instructions and recommendations

## Display Manager
setup a display manager

```
sudo systemctl enable sddm.service
sudo systemctl start sddm.service
```

## NTP

edit `/etc/chrony.conf` and set some time servers

systemd for chrony

```
sudo systemctl enable chronyd.service
sudo systemctl start chronyd.service
```

## Laptop
to save power one might want to use TLP

```
sudo systemctl enable tlp.service
sudo systemctl start tlp.service
```

and check the status for _recommendations_

```
sudo tlp-stat
```
