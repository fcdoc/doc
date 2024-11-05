---
brief: Tutorial on Configuring Single Sign-On in Authing
---

# Configuring Single Sign-On and SSO Login in Authing

Quick Overview
[Authing](https://www.authing.cn/) is a provider of identity and access management services. Through the Authing platform, you can log in to the FlashDuty management console using OIDC, SAML2.0, or CAS protocols

## Preparation
### 1. Log in or register for Authing
- If you are a new user, you need to create a user pool first. Follow the prompts to create it
### 2. Create an Application
- Choose a standard web application
- Enter the application name
- Enter the authentication URL (the URL to which users will be redirected during SSO login)

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/1.avif)

### 3. Record Relevant Information

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/2.avif)

|Field|Description|
|---|---|
|App ID|Corresponds to FlashDuty's Client ID|
|APP Secret|Corresponds to FlashDuty's Client Secret|
|Issuer|Corresponds to FlashDuty's Issuer|
|Authentication URL|The URL to which users will be redirected during SSO login|

## Start Configuring the OIDC Protocol
### 1. Open the [FlashDuty](console.flashcat.cloud) console and enable single sign-on configuration

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/3.avif)

### 2. Copy the Relevant Configuration Information into the Corresponding Fields

#### 2.1 Copy the relevant information from the Authing application into the corresponding fields
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/4.avif)

#### 2.2 Copy the Redirect URL domain to the login callback URL in Authing

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/5.avif)

### 3. Modify Authing Configuration

#### 3.1 Configure as shown, changing the id_token signing algorithm to RS256

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/6.avif)

#### 3.2 Configure login control

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/7.avif)

#### 3.3 Modify permissions

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/8.avif)

### 4. Create a User and Test Login

#### 4.1 Create a user in Authing

> [!NOTE]
> FlashDuty only supports user email association, so you need to create users using their email addresses

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/9.avif)

#### 4.2 Test login using the SSO URL

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/10.avif)

> [!NOTE]
> **You can access console.flashcat.cloud and log in via SSO**

#### 4.3 The SSO URL will redirect to the login page

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/11.avif)

> [!NOTE]
> Use the user created in Authing to log in to the FlashDuty console

## Start Configuring the SAML2.0 Protocol

> [!NOTE]
> You can create a new application or modify an existing one. Here, we will demonstrate by modifying an existing application

### 1. Protocol Configuration

#### 1.1 Select SAML2.0

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/12.avif)

#### 1.2 Change FlashDuty's single sign-on protocol to SAML and copy the ACS URL

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/13.avif)

#### 1.3 After copying the ACS URL to the Authing application, click Save and change the protocol type

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/14.avif)

### 2. Configure in FlashDuty

#### 2.1 Download the metadata, click the link, and save it locally

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/15.avif)

#### 2.2 Upload the metadata to FlashDuty's single sign-on configuration and save it

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/16.avif)

#### 2.3 Test login (refer to the OIDC protocol login process)
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/11.avif)

> [!NOTE]
> The above are the complete configuration methods for both protocols. The two platforms are interconnected during configuration, so please be careful not to miss any key information. If you encounter any issues during the configuration process, you can contact FlashDuty technical support for assistance

## Start Configuring the CAS Protocol
### 1. Open the [FlashDuty](console.flashcat.cloud) console and enable single sign-on configuration

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/3.avif)

### 2. Copy the Relevant Configuration Information into the Corresponding Fields

#### 2.1 Copy the relevant information from the Authing application into the corresponding fields
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/17.avif)

#### 2.2 Copy the Redirect URL to the login callback URL in Authing

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/18.avif)

### 3. Modify Authing Configuration

#### 3.1 Configure as shown

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/19.avif)

#### 3.2 Configure login control

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/7.avif)

#### 3.3 Modify permissions

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/8.avif)

### 4. Create a User and Test Login

#### 4.1 Create a user in Authing

> [!NOTE]
> FlashDuty only supports user email association, so you need to create users using their email addresses

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/9.avif)

#### 4.2 Test login using the SSO URL

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/20.avif)

#### 4.3 The SSO URL will redirect to the login page

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/11.avif)

> [!NOTE]
> Use the user created in Authing to log in to the FlashDuty console