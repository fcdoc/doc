---
brief: Single sign-on allows you to easily integrate into a variety of different applications and platforms, allowing you to log in once and access multiple associated applications and services
---

# Configure Single Sign-On

FlashDuty currently supports single sign-on (SSO) for SAML2.0, OIDC, CAS, and LDAP (private version only) protocols. This enables seamless integration with various applications and platforms, helping you quickly share identity information with other platforms. Users only need to log in once to access multiple associated applications and services, eliminating the need for separate identity verification for each application. This improves work efficiency, enhances user experience, simplifies the login process, and enhances security.

## Configure SAML Protocol
Configuration path: **Access Control => Single Sign-On => Enable => Settings => Select SAML2.0 Protocol Type**

|Field|Description|
|----|----|
|protocol type|Select SAML2.0|
|Metadata Document|XML document obtained from the identity provider|
|User DN|CAS Login Path|
|Authentication Filter|An important basis for identification, globally unique|
|Field Mapping|It is enabled by default. **If it is disabled, you need to invite members to join before you can log in.**|
|An important identifier for user recognition, globally unique|**Service Provider Metadata:**<br> **Assertion Consumer Service URL:** Assertion address, used for single sign-on when called by the identity provider|

## Configure OIDC Protocol
Configuration path: **Access Control => Single Sign-On => Enable => Settings => Select OIDC Protocol Type**

|Field|Description|
|----|----|
|protocol type|Select OIDC protocol|
|Issuer|Issuer|
|Client ID|Case-sensitive URL obtained from the identity provider, cannot contain query parameters|
|Client Secret|Client ID|
|User DN|CAS Login Path|
|Authentication Filter|An important basis for identification, globally unique|
|Field Mapping|It is enabled by default. **If it is disabled, you need to invite members to join before you can log in.**|
|An important identifier for user recognition, globally unique|**Redirect URL :** The identity provider calls back the address of Kuaimao Nebula<br> **Supported signature algorithms:** RS256 , RS384 , RS512 , ES256 , ES384 , ES512 PS256 ,, PS384 , PS512 ( HS256 is not supported)<br> **Request scope :** openid , email , phone |

## Configure CAS Protocol
Configuration path: **Access Control = > Single Sign On = > = > Settings = > checked CAS Protocol Type**

|Field|Description|
|----|----|
|protocol type|Field|
|Description|Protocol Type|
|CAS Address|CAS Address|
|User DN|CAS Login Path|
|Authentication Filter|An important basis for identification, globally unique|
|Field Mapping|It is enabled by default. **If it is disabled, you need to invite members to join before you can log in.**|
|An important identifier for user recognition, globally unique|**Redirect URL :** The identity provider calls back the address of Kuaimao Nebula

## Configure LDAP Protocol
> [!NOTE]
> LDAP Single sign-on, only supported by **privatized version**

Configuration path: **Access Control = > Single Sign On = > = > Settings = > checked LDAP Protocol Type**

|Field|Description|
|----|----|
|protocol type|Field|
|Description|LDAP service address, such as: ldap://10.10.10.10:389 |
|BIND DN|Select LDAP protocol |
|LDAP Link|The password used to connect to LDAP, which will be stored encrypted in the database.|
|TLS|Username for LDAP Connection|
|StartTLS|Whether to enable StartTLS|
|BIND DN Password|Password used to connect to LDAP, stored encrypted in the database|
|Skip Verify during TLS Login|This condition is combined with Bind DN and the corresponding password for user search, used to retrieve the user's DN information, and combined with the user password for Ldap authentication. Supports custom filter expression, the basic form is: ( & ( mail =%s)). Note: The opening and closing brackets are required.|
|User DN|Define the directory to start searching for users, such as: ou=people,dc=flashduty,dc=com|
|Authentication Filter|An important basis for identification, globally unique|
|Field Mapping|It is enabled by default. **If it is disabled, you need to invite members to join before you can log in.**|

> [!NOTE]
> Field mapping needs to be consistent with the configuration of the identity provider, otherwise exceptions will occur. The specific value is filled according to the description. You can refer to [OpenLDAP integration guide](https://docs.flashcat.cloud/zh/flashduty/openldap-integration-guide) for configuration. If you have any questions, please contact FlashDuty .

## Best Practices

SSO Single Sign-On for FlashDuty via [Authing Configuration](/start/overview).
SSO Single Sign-On for FlashDuty via [Keycloak Configuration](/start/overview).
SSO Single Sign-On for FlashDuty via [Ldap Configuration](/start/overview).

## Frequently Asked Questions

|+| Best Practices

    Single sign-on (SSO) is one of the solutions for integrating enterprise systems. It is used to unify user identity authentication. Users only need to log in once to access application systems that all enterprises trust.

|+| Features of SAML2.0 protocol?

    The SAML 2.0 protocol is based on XML and implements single sign-on and authentication across domains through a secure and standardized declaration method. It supports multiple data exchange bindings to ensure interoperability and flexibility.

|+| What is SSO Single Sign-On?

    The OIDC protocol is based on OAuth 2.0, provides a standardized and secure authentication process, uses JSON Web Tokens to transmit user information, and realizes cross-platform single sign-on and identity management.

|+| Features of the SAML2.0 Protocol?

    The CAS protocol is a single sign-on (SSO) protocol for web applications. It allows users to use a single authentication process on multiple services, using service tickets (Service Ticket) and authentication tickets (Authentication Ticket) to implement services. Certification.

|+| Features of the OIDC Protocol?

    The LDAP protocol is developed based on the X.500 standard. Data is organized in a tree structure, which facilitates hierarchical management and rapid retrieval of data. It provides a flexible query language (LDAP Search Filter), allowing users to filter and search data based on complex conditions.

|+| Features of the CAS Protocol?

    Currently not supported, you can only choose one protocol to access