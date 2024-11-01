---
brief: Tutorial on Configuring Single Sign-On in Authing
---

# Configuring Single Sign-On with Authing

Quick Overview
[Authing](https://www.authing.cn/) is a provider of identity and access management services. Through the Authing platform, you can log in to the FlashDuty management console using the OIDC, SAML2.0, or CAS protocols

## Preparation
### 1. Log in or Register with Authing
- If you are a new user, you need to create a user pool first. Follow the prompts to complete the creation
### 2. Create an Application
- Choose a Standard Web Application
- Enter the Application Name
- Enter the Authentication URL (the URL to which users will be redirected during SSO login)

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
### 1. Open the [FlashDuty](console.flashcat.cloud) Console and Enable Single Sign-On Configuration

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/3.avif)

### 2. Copy the Relevant Configuration Information to the Corresponding Fields

#### 2.1 Copy the Relevant Information from the Authing Application to the Corresponding Fields
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/4.avif)

#### 2.2 Copy the Redirect URL to the Login Callback URL in Authing

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/5.avif)

### 3. Modify Authing Configuration

#### 3.1 Configure as Shown in the Image, Changing the id_token Signing Algorithm to RS256

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/6.avif)

#### 3.2 Configure Login Control

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/7.avif)

#### 3.3 Modify Permissions

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/8.avif)

### 4. Create Users and Test Login

#### 4.1 Create Users in Authing

> [!NOTE]
> FlashDuty only supports user email association, so users must be created using email addresses

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/9.avif)

#### 4.2 Test Login Using the SSO URL

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/10.avif)

> [!NOTE]
> **You can access console.flashcat.cloud and log in via SSO**

#### 4.3 The SSO URL Redirects to the Login Page

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/11.avif)

> [!NOTE]
> Log in to the FlashDuty console using the user created in Authing

## Start Configuring the SAML2.0 Protocol

> [!NOTE]
> You can create a new application or modify an existing one. Here, we will demonstrate by modifying an existing application

### 1. Protocol Configuration

#### 1.1 Select SAML2.0

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/12.avif)

#### 1.2 Change FlashDuty’s Single Sign-On Protocol to SAML and Copy the ACS URL

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/13.avif)

#### 1.3 After Copying the ACS URL to the Authing Application, Click Save and Change the Protocol Type

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/14.avif)

### 2. Configure in FlashDuty

#### 2.1 Download the Metadata, Click the Link, and Save It Locally

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/15.avif)

#### 2.2 Upload the Metadata to FlashDuty’s Single Sign-On Configuration and Save It

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/16.avif)

#### 2.3 Test Login (Refer to the OIDC Protocol Login Process)
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/11.avif)

> [!NOTE]
> The above are the complete configuration methods for both protocols. The two platforms are intertwined during configuration, so please be careful not to miss any key information. If you encounter any issues during the configuration process, you can contact FlashDuty technical support for assistance

## Start Configuring the CAS Protocol
### 1. Open the [FlashDuty](console.flashcat.cloud) Console and Enable Single Sign-On Configuration

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/3.avif)

### 2. Copy the Relevant Configuration Information to the Corresponding Fields

#### 2.1 Copy the Relevant Information from the Authing Application to the Corresponding Fields
![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/17.avif)

#### 2.2 Copy the Redirect URL to the Login Callback URL in Authing

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/18.avif)

### 3. Modify Authing Configuration

#### 3.1 Configure as Shown in the Image

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/19.avif)

#### 3.2 Configure Login Control

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/7.avif)

#### 3.3 Modify Permissions

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/8.avif)

### 4. Create Users and Test Login

#### 4.1 Create Users in Authing

> [!NOTE]
> FlashDuty only supports user email association, so users must be created using email addresses

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/9.avif)

#### 4.2 Test Login Using the SSO URL

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/20.avif)

#### 4.3 The SSO URL Redirects to the Login Page

![](https://fcdoc.github.io/img/zh/flashduty/mixin/single_sign_on/authing/11.avif)

> [!NOTE]
> Log in to the FlashDuty console using the user created in Authing