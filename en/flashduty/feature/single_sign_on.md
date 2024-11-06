---
brief: Single sign-on enables you to easily integrate with a variety of different applications and platforms, allowing you to log in once and access multiple associated applications and services
---

# Configure Single Sign-On

FlashDuty currently supports single sign-on (SSO) via SAML2.0, OIDC, CAS, and LDAP (only for the private version) protocols, allowing you to easily integrate with various applications and platforms. These features help you quickly share identity information with other platforms, enabling users to log in once on one platform to access multiple associated applications and services without the need for separate identity verification for each application. This improves work efficiency, enhances user experience, simplifies the login process, and enhances security.

## Configure SAML Protocol
Configuration path: **Access Control => Single Sign-On => Enable => Settings => Select SAML2.0 Protocol Type**

|Field|Description|
|----|----|
|Protocol Type|Select SAML2.0|
|Metadata Document|XML document obtained from the identity provider|
|Field Mapping|FlashDuty extracts user email, username, and mobile phone information from the identity provider through field mapping.|
|Login Domain Name|An important identifier for user recognition, globally unique|
|Login and Create Account|Enabled by default. **If disabled, members must be invited to join before they can log in.**|
|Flashcat Service Provider Information|**Service Provider Metadata:** <br> **Assertion Consumer Service URL:** Assertion address, used for single sign-on when called by the identity provider|

## Configure OIDC Protocol
Configuration path: **Access Control => Single Sign-On => Enable => Settings => Select OIDC Protocol Type**

|Field|Description|
|----|----|
|Protocol Type|Select OIDC protocol|
|Issuer|Issuer|
|Client ID|Client ID, obtained from the identity provider|
|Client Secret|Client Secret, obtained from the identity provider|
|Field Mapping|FlashDuty extracts user email, username, and mobile phone information from the identity provider through field mapping.|
|Login Domain Name|An important identifier for user recognition, globally unique|
|Login and Create Account|Enabled by default. **If disabled, members must be invited to join before they can log in.**|
|Flashcat Service Provider Information|**Redirect URL:** The address to which the identity provider redirects Flashcat <br> **Supported Signature Algorithms:** RS256, RS384, RS512, ES256, ES384, ES512, PS256, PS384, PS512 (HS256 not supported)<br> **Request Scope:** openid, email, phone |

## Configure CAS Protocol
Configuration path: **Access Control => Single Sign-On => Enable => Settings => Select CAS Protocol Type**

|Field|Description|
|----|----|
|Protocol Type|Select CAS protocol|
|CAS Address|CAS service address obtained from the identity provider|
|CAS Login Path|CAS login path|
|Field Mapping|FlashDuty extracts user email, username, and mobile phone information from the identity provider through field mapping.|
|Login Domain Name|An important identifier for user recognition, globally unique|
|Login and Create Account|Enabled by default. **If disabled, members must be invited to join before they can log in.**|
|Flashcat Service Provider Information|**Redirect URL:** The address to which the identity provider redirects Flashcat

## Configure LDAP Protocol
> [!NOTE]
> LDAP Single sign-on, only supported by **privatized version**

Configuration path: **Access Control => Single Sign-On => Enable => Settings => Select LDAP Protocol Type**

|Field|Description|
|----|----|
|Protocol Type|Select LDAP protocol|
|LDAP Link|LDAP service address, such as: ldap://10.10.10.10:389 |
|BIND DN|Username for LDAP Connection |
|BIND DN password|BIND DN Password|
|TLS|Skip verification during TLS login|
|StartTLS|Skip Verify during TLS Login|
|Whether to enable StartTLS|User DN|
|Authentication filter|This condition is combined with Bind DN and the corresponding password for user search, used to retrieve the user's DN information, and combined with the user password for Ldap authentication. Supports custom filter expression, the basic form is: ( & ( mail =%s)). Note: The opening and closing brackets are required.|
|Field mapping|Field Mapping|
|Login domain|Login Domain Name|
|An important identifier for user recognition, globally unique|It is enabled by default. **If disabled, members must be invited to join before they can log in.**|

> [!NOTE]
> Field mapping must be consistent with the identity provider's configuration; otherwise, issues may occur. The specific values should be filled in according to the descriptions. You can refer to the [OpenLDAP integration guide](https://docs.flashcat.cloud/zh/flashduty/openldap-integration-guide) for configuration. If you have any problems, please contact FlashDuty customer service.

## Best practices

Configure FlashDuty's SSO single sign-on through [Authing configuration](/start/overview).
Configure FlashDuty's SSO single sign-on via [Authing](/start/overview).
Configure FlashDuty's SSO single sign-on via [Keycloak](/start/overview).

## Frequently Asked Questions

|+| Frequently Asked Questions

    Single sign-on (SSO) is a solution for integrating enterprise systems, used to unify user identity authentication. Users only need to log in once to access all mutually trusted application systems within the enterprise.

|+| What are the features of the SAML2.0 protocol?

    What are the features of the SAML2.0 protocol?

|+| What are the characteristics of the OIDC protocol?

    What are the features of the OIDC protocol?

|+| What are the characteristics of the CAS protocol?

    The CAS protocol is a single sign-on (SSO) protocol for web applications. It allows users to use a single authentication process across multiple services, using service tickets (Service Ticket) and authentication tickets (Authentication Ticket) to authenticate services.

|+| What are the characteristics of the LDAP protocol?

    The LDAP protocol is based on the X.500 standard, with data organized in a tree structure, facilitating hierarchical management and rapid data retrieval. It provides a flexible query language (LDAP Search Filter), allowing users to filter and search data based on complex conditions.

|+| Does it support multiple protocol access?

    Does it support multiple protocol access?