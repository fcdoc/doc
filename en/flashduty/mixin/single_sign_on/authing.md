---
brief: Tutorial: Configuring Single Sign-On in Authing
---

# Authing Single Sign-On Configuration and SSO Login Setup

Quick Overview
[Authing](https://www.authing.cn/) is a provider offering identity recognition and access control management. Through the Authing platform, you can log in to the FlashDuty management console using OIDC, SAML 2.0, or CAS protocols

## Preparation
### 1. Login or Register with Authing
- Newly registered users need to first create a user pool; follow the prompts to do so
### 2. Create an Application
- Select a Standard Web Application
- Enter the Application Name
- Enter the Authentication Address (the address to redirect to during SSO login)

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/1.avif)

### 3. Record Relevant Information

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/2.avif)

|Field|Description|
|---|---|
|App ID|FlashDuty Corresponding Client ID|
|APP Secret|FlashDuty Corresponding Client Secret|
|Issuer|FlashDuty Corresponding Issuer|
|Authentication Address|Redirect Address for SSO Login|

## Begin Configuring the OIDC Protocol
### 1. Open the [FlashDuty](console.flashcat.cloud) Console and Enable SSO Configuration

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/3.avif)

### 2. Copy the Relevant Information to the Corresponding Fields

#### 2.1 Copy the Authing Application's Relevant Information to the Corresponding Fields
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/4.avif)

#### 2.2 Copy the Redirect URL Domain to Authing's Login Callback URL

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/5.avif)

### 3. Modify Authing Configuration

#### 3.1 As shown in the diagram, change the id_token Signature Algorithm to RS256

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/6.avif)

#### 3.2 Configure Login Control

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/7.avif)

#### 3.3 Change Permissions

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/8.avif)

### 4. Create a User and Test Login

#### 4.1 Create a User in Authing

> [!NOTE]
> FlashDuty only supports user email association, so create users using email addresses

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/9.avif)

#### 4.2 Test Login Using the SSO Address

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/10.avif)

> [!NOTE]
> **Access console.flashcat.cloud via SSO Login**

#### 4.3 The SSO Address Redirects to the Login Page

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/11.avif)

> [!NOTE]
> Use the user created in Authing to log in to the FlashDuty console

## Begin Configuring the SAML 2.0 Protocol

> [!NOTE]
> You can create a new application or modify an existing one. Here, we demonstrate by modifying an application

### 1. Protocol Configuration

#### 1.1 Select SAML 2.0

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/12.avif)

#### 1.2 Change FlashDuty's SSO Protocol to SAML and Copy the ACS Address

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/13.avif)

#### 1.3 After Copying the ACS Address to the Authing Application, Click Save and Change the Protocol Type

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/14.avif)

### 2. Configure in FlashDuty

#### 2.1 Download the Metadata, Click the Link, and Save Locally

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/15.avif)

#### 2.2 Upload to FlashDuty's SSO Configuration and Save

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/16.avif)

#### 2.3 Test Login (Refer to the OIDC Protocol Login)
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/11.avif)

> [!NOTE]
> The above are the complete configurations for both methods. The configurations on the two platforms overlap, so please be cautious not to overlook any critical information. If you encounter any issues during the configuration process, you can contact FlashDuty technical support for assistance

## Begin Configuring the CAS Protocol
### 1. Open the [FlashDuty](console.flashcat.cloud) Console and Enable SSO Configuration

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/3.avif)

### 2. Copy the Relevant Information to the Corresponding Fields

#### 2.1 Copy the Authing Application's Relevant Information to the Corresponding Fields
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/17.avif)

#### 2.2 Copy the Redirect URL to Authing's Login Callback URL

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/18.avif)

### 3. Modify Authing Configuration

#### 3.1 Configure as Shown

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/19.avif)

#### 3.2 Configure Login Control

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/7.avif)

#### 3.3 Change Permissions

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/8.avif)

### 4. Create a User and Test Login

#### 4.1 Create a User in Authing

> [!NOTE]
> FlashDuty only supports user email association, so create users using email addresses

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/9.avif)

#### 4.2 Test Login Using the SSO Address

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/20.avif)

#### 4.3 The SSO Address Redirects to the Login Page

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/11.avif)

> [!NOTE]
> Use the user created in Authing to log in to the FlashDuty console