---
brief: Configuring Single Sign-On Tutorial in Keycloak
---

# Keycloak Single Sign-On Configuration and SSO Login Setup

## Quick Overview

Keycloak is an open-source identity and access management solution that offers a comprehensive suite of tools and features to assist developers in swiftly implementing secure user authentication and authorization mechanisms, while also streamlining the identity and access management process for applications

> [!NOTE]
> This article does not cover the deployment or explanation of Keycloak-related content. For more information, please refer to [the official documentation](https://www.keycloak.org/)

## Based on the SAML2.0 Protocol
### 1. Log in to the FlashDuty Console
#### 1.1 Obtain the ACS Address from FlashDuty (to be used in step 2)
#### 1.2 Path: Access Control => Single Sign-On => Settings => SAML2.0 Protocol => Flashcat Service Provider Information => Assertion Consumer Service URL

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/1.avif)

### 2. Log in to the Keycloak Console and Create a New Client
#### 2.1 Path: Clients => Create Client
#### 2.2 Client Type: Select SAML Protocol
#### 2.3 Client ID: Enter flashcat.cloud (fixed value, cannot be changed)
#### 2.4 Valid Redirect URIs: Enter the ACS address obtained from FlashDuty

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/2.avif)
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/3.avif)

### 3. Configure Client-Related Information

#### 3.1 Change Name ID Format to Email Type

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/4.avif)

#### 3.2 Set Client Signature Required to Off

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/5.avif)

#### 3.3 Create Three Field Types: email/phone/username
> [!NOTE]
> Before creating, you need to delete the user associated with the previous OpenID Connect protocol and set the new one as Default after completion
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/6.avif)
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/7.avif)

#### 3.4 Add the Created Users to the Client
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/8.avif)
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/9.avif)

#### 3.5 Configure Email/Phone/Username Mappers (Using Email as an Example; Configure Others Following These Steps)
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/10.avif)
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/11.avif)
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/12.avif)

### 4. Download the XML File
> [!NOTE]
> The downloaded file is a compressed package. After extracting it locally, you will find two XML files, but only the idp-metadata.xml file is needed
#### 4.1 Download to Local in Client > Action
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/13.avif)

#### 4.2 Upload the XML File to FlashDuty's Single Sign-On Configuration
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/14.avif)

### 5. Create a User in Keycloak and Test Login

#### 5.1 Create a User (Make Sure to Bind an Email Address)
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/15.avif)

#### 5.2 Test Login
- Access console.flashcat.cloud, select SSO Login, and fill in the login domain prefix as specified in the single sign-on configuration

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/16.avif)

## Based on the OIDC Protocol
### 1. Log in to the FlashDuty Platform
- Obtain the Redirect URL from FlashDuty (to be used in step 2)
- Path: **Access Control => Single Sign-On => Settings => OIDC Protocol => Flashcat Service Provider Information => Redirect URL**
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/17.avif)

### 2. Log in to the Keycloak Console and Create a New Client

- Client Type: Select OIDC Protocol
- Client ID: No Special Requirements
- Client Authentication: Keep Enabled
- Valid Redirect URIs: Enter the Redirect URL Address Obtained in Step 1

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/18.avif)
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/19.avif)
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/20.avif)

### 3. Obtain Client-Related Information

- Client ID: The ID Filled in When Creating the Client
- Client Secret: Visible in the **Client Details > Credentials** Tab
- Issuer: Found in **Realm Settings > Endpoints > OpenID Endpoint Configuration**

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/21.avif)
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/22.avif)

### 4. FlashDuty Single Sign-On Configuration Format

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/keycloak/23.avif)

> [!NOTE]
> After completing the OIDC configuration, refer to the "Configuring Single Sign-On" section for login testing