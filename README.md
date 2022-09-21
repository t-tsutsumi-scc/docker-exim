# docker-exim

A Docker image for an Exim mail relay, based on the Docker official Debian slim image.

## How to use this image

## Example for use with docker-compose

```
# docker-compose.yml
version: "3.9"

services:
  smtp:
    container_name: smtp-relay
    image: ghcr.io/t-tsutsumi-scc/docker-exim:main
    restart: always
    cap_add:
      - NET_BIND_SERVICE
    ports:
      - "25:25"
    volumes:
      - PATH_TO_CONF:/etc/exim4/exim4.conf.localmacros:ro
      - PATH_TO_CONF:/etc/exim4/update-exim4.conf.conf:ro
      - smtp-spool:/var/spool/exim4
    environment:
      TZ: UTC

volumes:
  smtp-spool:
```

```
# /etc/exim4/exim4.conf.localmacros
disable_ipv6 = true
log_file_path = syslog
received_header_text =
smtp_accept_max = 100
smtp_accept_max_nonmail = 50
smtp_banner = ESMTP
tls_advertise_hosts =
```

```
# /etc/exim4/update-exim4.conf.conf
dc_eximconfig_configtype='internet'
dc_other_hostnames=''
dc_local_interfaces='0.0.0.0'
dc_readhost=''
dc_relay_domains='gmail.com;googlemail.com'
dc_minimaldns='false'
dc_relay_nets='172.16.0.0/12'
dc_smarthost=''
CFILEMODE='644'
dc_use_split_config='false'
dc_hide_mailname=''
dc_mailname_in_oh='false'
dc_localdelivery='mail_spool'
```
