```
# SSH from Anywhere to Device
[Local Machine] (Anywhere Network) <---> [Host] (Public Network) <---> [Device] (Private Network)
```

```
# Quick Install (Device)
export HOST_PORT=2222
export HOST_USER=user@domain.com

# SSH Key Gen
ssh-keygen
ssh-copy-id $HOST_USER

# Install autossh & Config
curl -sSL https://raw.githubusercontent.com/pornpasok/iot2050-autossh/main/iot2050_install_autossh.sh | sh
```


```
# SSH to Device (Local Machine)
ssh root@domain.com -p 2222
```
