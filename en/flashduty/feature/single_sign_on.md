---
brief: Single sign-on enables you to easily integrate with a variety of different applications and platforms, allowing you to log in once and access multiple related applications and services
---

# Configure Single Sign-On

FlashDuty currently supports single sign-on (SSO) integration via SAML2.0, OIDC, CAS, and LDAP (only for the private version) protocols. These features allow you to easily integrate with various applications and platforms, enabling you to share identity information with other platforms quickly. Users only need to log in once to access multiple associated applications and services without the need for separate authentication for each application, thus improving work efficiency, user experience, simplifying the login process, and enhancing security.

## Configure SAML Protocol
Configuration path: **Access Control => Single Sign-On => Enable => Settings => Select SAML2.0 Protocol Type**

|Field|Description|
|----|----|
|Protocol Type|Select SAML2.0|
|Metadata Document|XML document obtained from the identity provider|
|Field Mapping|FlashDuty extracts user email, username, and mobile phone information from the identity provider through field mapping.|
|Login Domain|An important identifier for user recognition, globally unique|
|Login and Create Account|Enabled by default. **If disabled, members need to be invited to join before they can log in.**|
|Flashcat Service Provider Information|**Service Provider Metadata:** <br> **Assertion Consumer Service URL:** Assertion address, used for single sign-on when called by the identity provider|

## Configure OIDC Protocol
Configuration path: **Access Control => Single Sign-On => Enable => Settings => Select OIDC Protocol Type**

|Field|Description|
|----|----|
|Protocol Type|Select OIDC Protocol|
|Issuer|Issuer|
|Client ID|Client ID, obtained from the identity provider|
|Client Secret|Client Secret, obtained from the identity provider|
|Field Mapping|FlashDuty extracts user email, username, and mobile phone information from the identity provider through field mapping.|
|Login Domain|An important identifier for user recognition, globally unique|
|Login and Create Account|Enabled by default. **If disabled, members need to be invited to join before they can log in.**|
|Flashcat Service Provider Information|**Redirect URL:** The address to which the identity provider redirects Flashcat <br> **Supported Signature Algorithms:** RS256, RS384, RS512, ES256, ES384, ES512, PS256, PS384, PS512 (HS256 is not supported) <br> **Request Scope:** openid, email, phone |

## Configure CAS Protocol
Configuration path: **Access Control => Single Sign-On => Enable => Settings => Select CAS Protocol Type**

|Field|Description|
|----|----|
|Protocol Type|Select CAS Protocol|
|CAS Address|CAS service address obtained from the identity provider|
|CAS login path|CAS login path|
|Field Mapping|FlashDuty extracts user email, username, and mobile phone information from the identity provider through field mapping.|
|Login Domain|An important identifier for user recognition, globally unique|
|Login and Create Account|Enabled by default. **If disabled, members need to be invited to join before they can log in.**|
|Flashcat Service Provider Information|**Redirect URL:** The address to which the identity provider redirects Flashcat

## Configure LDAP Protocol
> [!NOTE]
> LDAP Single sign-on, only supported by **privatized version**

Configuration path: **Access Control => Single Sign-On => Enable => Settings => Select LDAP Protocol Type**

|Field|Description|
|----|----|
|Protocol Type|Select LDAP Protocol|
|LDAP Link|LDAP service address, such as: ldap://10.10.10.10:389 |
|BIND DN|Username for LDAP connection, used to test connection results and search for users or user groups. For example, cn=admin,dc=flashduty,dc=com |
|BIND DN Password|Password for LDAP connection, stored encrypted in the database.|
|TLS|Skip Verify during TLS Login|
|StartTLS|Whether to enable StartTLS|
|User DN|Define the directory to start searching for users, such as: ou=people,dc=flashduty,dc=com|
|Authentication Filtering|This condition is combined with the Bind DN and the corresponding password to search for users, used to retrieve the user's DN information and authenticate the user's password. Supports custom filter expressions, the basic form is: ( &(mail=%s) ). Note: The opening and closing brackets are required.|
|Field Mapping|FlashDuty extracts user email, username, and mobile phone information from the identity provider through field mapping. Email is a required mapping field|
|Login Domain|An important identifier for user recognition, globally unique|
|Login and Create Account|Enabled by default. **If disabled, members need to be invited to join before they can log in.**|

> [!NOTE]
> Field mapping must be consistent with the identity provider's configuration, otherwise exceptions may occur. The specific values should be filled according to the descriptions. You can refer to the [OpenLDAP Integration Guide](https://docs.flashcat.cloud/zh/flashduty/openldap-integration-guide) for configuration. If you have any questions, please contact FlashDuty support.

## Best Practices

SSO single sign-on via [Authing Configuration](/start/overview) for FlashDuty.
SSO single sign-on via [Keycloak Configuration](/start/overview) for FlashDuty.
SSO single sign-on via [LDAP Configuration](/start/overview) for FlashDuty.

## Frequently Asked Questions

|+| What is SSO single sign-on?

    Single sign-on (SSO) is a solution for integrating enterprise systems, used to unify user identity authentication. Users only need to log in once to access all mutually trusted application systems.

|+| Features of the SAML2.0 Protocol?

    The SAML 2.0 protocol is based on XML and implements single sign-on and authentication across domains through a secure and standardized declaration method. It supports multiple data exchange bindings to ensure interoperability and flexibility.

|+| Features of the OIDC Protocol?

    The OIDC protocol is based on OAuth 2.0 and provides a standardized and secure authentication process. It uses JSON Web Tokens to transmit user information, enabling cross-platform single sign-on and identity management.

|+| Features of the CAS Protocol?

    The CAS protocol is a single sign-on (SSO) protocol for web applications. It allows users to use a single authentication process across multiple services, using service tickets (Service Ticket) and authentication tickets (Authentication Ticket) to authenticate services.

|+| Features of the LDAP Protocol?

    The LDAP protocol is developed based on the X.500 standard. Data is organized in a tree structure, facilitating hierarchical management and rapid retrieval. It provides a flexible query language (LDAP Search Filter), allowing users to filter and search data based on complex conditions.

|+| Does it support multiple protocol access?

    Currently not supported; only one protocol can be selected for access