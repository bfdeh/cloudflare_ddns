# Simple Cloudflare DDNS Client

## Install/uninstall ( for systemd only )

`./install.sh install|uninstall`

## config file

/opt/cloudflare\_ddns/cloudflare\_ddns.conf

example

```bash
TOKEN=*******************
DOMAIN=sub.example.com
PROXY=true
RECORD_TYPE=AAAA
INTERFACE=eth1
TTL=1
```