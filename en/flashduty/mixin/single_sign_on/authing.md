---
brief: Tutorial on Configuring Single Sign-On in Authing
---

# Configuring Single Sign-On and SSO Login in Authing

Quick Overview
[Authing](https://www.authing.cn/) is a provider of identity and access management services. Through the Authing platform, you can log in to the FlashDuty management console using OIDC, SAML2.0, or CAS protocols

## Preparation
### 1. Log in or Register for Authing
- If you are a new user, you need to create a user pool first. Follow the prompts to create it
### 2. Create an Application
- Choose a Standard Web Application
- Enter the Application Name
- Enter the Authentication URL (the URL to which users will be redirected during SSO login)

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/1.avif)

### 3. Record Relevant Information

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/2.avif)

|Type|Description|
|---|---|
|App ID|Corresponds to FlashDuty's Client ID|
|APP Secret|Corresponds to FlashDuty's Client Secret|
|Issuer|Corresponds to FlashDuty's Issuer|
|Authentication URL|The URL to which users will be redirected during SSO login|

## Start Configuring the OIDC Protocol
### 1. Open the [FlashDuty](console.flashcat.cloud) Console and Enable Single Sign-On Configuration

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/3.avif)

### 2. Copy the Relevant Configuration Information into the Corresponding Fields

#### 2.1 Copy the Relevant Information of the Authing Application into the Corresponding Fields
![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/4.avif)

#### 2.2 Copy the Redirect URL Domain to the Login Callback URL in Authing

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/5.avif)

### 3. Modify Authing Configuration

#### 3.1 Configure as Shown; Just Change the id_token Signature Algorithm to RS256

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/6.avif)

#### 3.2 Configure Login Control

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/7.avif)

#### 3.3 Modify Permissions

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/8.avif)

### 4. Create a User and Test Login

#### 4.1 Create a User in Authing

> [!NOTE]
> FlashDuty only supports user email association, so you need to use an email address to create a user

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/9.avif)

#### 4.2 Test Login Using the SSO URL

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/10.avif)

> [!NOTE]
> **You Can Access console.flashcat.cloud and Log in via SSO**

#### 4.3 The SSO URL Redirects to the Login Page

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/11.avif)

> [!NOTE]
> Use the user created in Authing to log in to the FlashDuty console

## Start Configuring the SAML2.0 Protocol

> [!NOTE]
> You can create a new application or modify an existing one. Here, we will demonstrate by modifying an existing application

### 1. Protocol Configuration

#### 1.1 Select SAML2.0

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/12.avif)

#### 1.2 Change FlashDuty's Single Sign-On Protocol to SAML and Copy the ACS URL

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/13.avif)

#### 1.3 After Copying the ACS URL to the Authing Application, Click Save and Change the Protocol Type

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/14.avif)

### 2. Configure in FlashDuty

#### 2.1 Download the Metadata, Click the Link, and Save It Locally

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/15.avif)

#### 2.2 Upload the Metadata to FlashDuty's Single Sign-On Configuration and Save It

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/16.avif)

#### 2.3 Test Login (Refer to the OIDC Protocol Login)
![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/11.avif)

> [!NOTE]
> The above are the complete configuration methods for both protocols. The two platforms are intertwined during configuration, so please be careful not to miss any key information. If you encounter any issues during the configuration process, you can contact FlashDuty technical support for assistance

## Start Configuring the CAS Protocol
### 1. Open the [FlashDuty](console.flashcat.cloud) Console and Enable Single Sign-On Configuration

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/3.avif)

### 2. Copy the Relevant Configuration Information into the Corresponding Fields

#### 2.1 Copy the Relevant Information of the Authing Application into the Corresponding Fields
![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/17.avif)

#### 2.2 Copy the Redirect URL to the Login Callback URL in Authing

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/18.avif)

### 3. Modify Authing Configuration

#### 3.1 Configure as Shown

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/19.avif)

#### 3.2 Configure Login Control

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/7.avif)

#### 3.3 Modify Permissions

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/8.avif)

### 4. Create a User and Test Login

#### 4.1 Create a User in Authing

> [!NOTE]
> FlashDuty only supports user email association, so you need to use an email address to create a user

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/9.avif)

#### 4.2 Test Login Using the SSO URL

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/20.avif)

#### 4.3 The SSO URL Redirects to the Login Page

![](https://fc.3ti.site/zh/flashduty/mixin/single_sign_on/authing/11.avif)

> [!NOTE]
> Use the user created in Authing to log in to the FlashDuty console