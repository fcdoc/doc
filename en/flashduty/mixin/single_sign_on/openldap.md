---
brief: Tutorial on Setting Up LDAP with Docker Compose
---

# OpenLDAP Integration Guide

## Quick Overview

LDAP (Lightweight Directory Access Protocol) is a protocol based on the X.500 standard and is used to access and maintain distributed directory services. LDAP enables users and applications to query, browse, and search information stored in the directory, such as user identity information, network resources, etc. LDAP usually runs on the TCP/IP protocol stack, specifically using TCP ports 389 (for unencrypted communication) and 636 (for encrypted communication, using LDAPS).

The core features of LDAP include:

- Tree structure: LDAP data is organized into a tree structure called DIT (Directory Information Tree), which facilitates hierarchical searching and browsing.

- Entries and attributes: Each entry (Entry) in LDAP contains multiple attributes (Attribute). Attributes have types and values, such as "cn" for common name (Common Name) and "mail" for email address.

OpenLDAP is an open-source implementation of the Lightweight Directory Access Protocol (LDAP). Due to its open-source nature and flexibility, OpenLDAP has become the preferred LDAP implementation for many enterprises and organizations.

> [!NOTE]
> This article assumes that the environment already supports Docker and Docker Compose. If it does not, please install them first.

## Docker Compose Configuration File
```
version: '1'

networks:
go-ldap-admin:
driver: bridge

services:
openldap:
image: osixia/openldap:1.5.0
container_name: go-ldap-admin-openldap
hostname: go-ldap-admin-openldap
restart: always
environment:
TZ: Asia/Shanghai
LDAP_ORGANISATION: "flashduty.com"
LDAP_DOMAIN: "flashduty.com"
LDAP_ADMIN_PASSWORD: "password"
volumes:
- ./openldap/ldap/database:/var/lib/ldap
- ./openldap/ldap/config:/etc/ldap/slapd.d
ports:
- 389:389
networks:
- go-ldap-admin

phpldapadmin:
image: osixia/phpldapadmin:0.9.0
container_name: go-ldap-admin-phpldapadmin
hostname: go-ldap-admin-phpldapadmin
restart: always
environment:
TZ: Asia/Shanghai
PHPLDAPADMIN_HTTPS: "false"
PHPLDAPADMIN_LDAP_HOSTS: go-ldap-admin-openldap
ports:
- 8088:80
volumes:
- ./openldap/phpadmin:/var/www/phpldapadmin
depends_on:
- openldap
links:
- openldap:go-ldap-admin-openldap
networks:
- go-ldap-admin

```

> [!NOTE]
> Replace password with the password you want to set

## Service Start
Save the above configuration file as docker-compose.yml. In the directory where the configuration file is located, open a terminal or command prompt and run the following command to start the service:
```
docker-compose up
```

If you want to run the service in the background, you can add the -d flag:
```
docker-compose up -d
```

Check Service Status:
Use the following command to check the status of the service:
```
docker-compose ps
```

Stop Service:
When you want to stop the service, use the following command:
```
docker-compose down
```

## Log in to OpenLDAP
Visit http://ip:8088/ in the browser and log in using the username cn=admin,dc=flashduty,dc=com and password xxx.

## OpenLDAP Configuration
### Add Groups and Users

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/openldap/1.avif)

> [!NOTE]
> In **the user path** (for example, cn = falsh duty ) under ou = people in the picture above -> `Add new attribute` -> Select `Email` to add Email attributes to the user. If it already exists, please ignore it.

## FlashDuty Integration
Based on the above OpenLDAP configuration, the FlashDuty integration information is shown in the figure below:
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/openldap/2.avif)

> [!NOTE]
> For the meaning and description of the above fields, please refer to [Configuring Single Sign-On](/feature/single_sign_on)