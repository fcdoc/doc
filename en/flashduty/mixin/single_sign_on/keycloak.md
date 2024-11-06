---
brief: Configuring Single Sign-On in Keycloak Tutorial
---

# Configuring Single Sign-On with Keycloak

## Quick Overview

Keycloak is an open-source identity and access management solution that provides a comprehensive set of tools and features to help developers quickly implement secure user authentication and authorization mechanisms while simplifying the identity and access management process for applications

> [!NOTE]
> This article does not cover the deployment or explanation of Keycloak. For more information, please refer to the [official documentation](https://www.keycloak.org/)

## Based on the SAML2.0 Protocol
### 1. Log in to the FlashDuty Console
#### 1.1 Obtain the ACS Address from FlashDuty (Will be used in Step 2)
#### 1.2 Path: Access Control => Single Sign-On => Settings => SAML2.0 Protocol => Flashcat Service Provider Information => Assertion Consumer Service URL

![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/1.avif)

### 2. Log in to the Keycloak Console and Create a New Client
#### 2.1 Path: Clients => Create client
#### 2.2 Client Type: Select SAML Protocol
#### 2.3 Fill in the Client ID: flashcat.cloud (Fixed Value, Cannot Be Changed)
#### 2.4 Valid Redirect URIs: Enter the ACS address obtained from FlashDuty

![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/2.avif)
![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/3.avif)

### 3. Configure Client Information

#### 3.1 Change the Name ID Format to Email Type

![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/4.avif)

#### 3.2 Set Client Signature Required to Off

![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/5.avif)

#### 3.3 Create Three Field Types: email/phone/username
> [!NOTE]
> Before creating, delete the user from the previous OpenID Connect protocol. After creation, set it to Default
![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/6.avif)
![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/7.avif)

#### 3.4 Add the Created User to the Client
![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/8.avif)
![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/9.avif)

#### 3.5 Configure Email/Phone/Username Mappers (Example: Email, others follow the same steps)
![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/10.avif)
![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/11.avif)
![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/12.avif)

### 4. Download the XML File
> [!NOTE]
> The downloaded file is a compressed package. After decompression locally, there will be two xml files. Only the idp-metadata.xml file is needed
#### 4.1 Download to Local in Client > Actions
![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/13.avif)

#### 4.2 Upload the XML File to FlashDuty’s Single Sign-On Configuration
![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/14.avif)

### 5. Create a User in Keycloak and Test Login

#### 5.1 Create a User (Must Bind an Email Address)
![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/15.avif)

#### 5.2 Test Login
- Visit console.flashcat.cloud, select SSO login---Fill in the login domain name prefix in the single sign-on configuration for the domain name

![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/16.avif)

## Based on the OIDC Protocol
### 1. Log in to the FlashDuty Platform
- Obtain the Redirect URL from FlashDuty (Will be used in Step 2)
- Path: **Access Control => Single Sign-On => Settings => OIDC Protocol => Flashcat Service Provider Information => Redirect URL**
![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/17.avif)

### 2. Log in to the Keycloak Console and Create a New Client

- Client Type: Select OIDC Protocol
- Client ID: No special requirements
- Client Authentication: Keep it on
- Valid Redirect URIs: Enter the Redirect URL address obtained in Step 1

![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/18.avif)
![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/19.avif)
![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/20.avif)

### 3. Obtain Client Information

- Client ID: The ID entered when creating the Client
- Client Secret: **Client Details > Credentials** card
- Issuer: **Realm Settings > Endpoints > OpenID Endpoint Configuration**

![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/21.avif)
![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/22.avif)

### 4. FlashDuty Single Sign-On Configuration Style

![](https://fcimg.i18n.site/zh/flashduty/mixin/single_sign_on/keycloak/23.avif)

> [!NOTE]
> After the configuration based on OIDC is completed, please refer to the Configuring Single Sign-On section for the login test