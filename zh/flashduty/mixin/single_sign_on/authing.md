---
brief: 在Authing中配置单点登录教程
---

# Authing配置单点登录、配置SSO登录

快速了解
[Authing](https://www.authing.cn/)是一家提供身份识别和访问控制管理的供应商，通过Authing平台，可实现以OIDC、SAML2.0或CAS协议的方式登录FlashDuty管理控制台

## 准备工作
### 1. 登录或注册 Authing
- 如果是新注册用户，需先创建用户池，根据提示创建即可
### 2. 创建应用
- 选择标准 web 应用
- 填写应用名称
- 填写认证地址(SSO 登录时跳转的地址)

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/1.avif)

### 3.记录相关信息

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/2.avif)

|字段|描述|
|---|---|
|App ID|对应 FlashDuty 的 Client ID|
|APP Secret|对应 FlashDuty 的 Client Secret|
|Issuer|对应 FlashDuty 的 Issuer|
|认证地址|通过 SSO 登录时跳转的地址|

## 开始配置 OIDC 协议
### 1. 打开 [FlashDuty](console.flashcat.cloud) 控制台并开启单点登录配置

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/3.avif)

### 2.配置相关信息复制到对应的填写框中

#### 2.1 将 Authing 应用的相关信息复制到对应的填写框中
![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/4.avif)

#### 2.2 将 Redirect UR L域名复制到 Authing 的登录回调 URL中

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/5.avif)

### 3.更改 Authing 配置

#### 3.1 按图配置，只需将 id_token 签名算法更改为 RS256 即可

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/6.avif)

#### 3.2 配置登录控制

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/7.avif)

#### 3.3 更改权限

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/8.avif)

### 4.创建用户并测试登录

#### 4.1 在 Authing 中创建用户

> [!NOTE]
> FlashDuty 只支持用户邮箱关联，所以需要用邮箱创建用户

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/9.avif)

#### 4.2 使用 SSO 地址测试登录

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/10.avif)

> [!NOTE]
> **可以访问 console.flashcat.cloud 通过 SSO 的方式登录**

#### 4.3 SSO 地址跳转到登录页面

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/11.avif)

> [!NOTE]
> 使用在 Authing 创建的用户，登录 FlashDuty 控制台

## 开始配置 SAML2.0 协议

> [!NOTE]
> 可以新创建应用或者在已有的应用中修改，这里通过修改应用进行演示

### 1.协议配置

#### 1.1 选择 SAML2.0

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/12.avif)

#### 1.2 将 FlashDuty 的单点登录协议改成 SAML 协议，并复制 acs 地址

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/13.avif)

#### 1.3 acs 地址复制到 authing 应用中后，点击保存并修改协议类型

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/14.avif)

### 2.在 FlashDuty 中配置

#### 2.1 下载 metadata 数据，点击链接并保存到本地

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/15.avif)

#### 2.2 上传到 FlashDuty 的单点登录配置中并保存

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/16.avif)

#### 2.3 测试登录（参考 OIDC 协议的登录）
![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/11.avif)

> [!NOTE]
> 以上是两种方式的全部配置方式，两个平台在配置时有穿插，所以请务必小心不要遗忘关键信息，如在配置过程中有任何问题，可以联系 FlashDuty 技术支持协助

## 开始配置 CAS 协议
### 1. 打开 [FlashDuty](console.flashcat.cloud) 控制台并开启单点登录配置

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/3.avif)

### 2.配置相关信息复制到对应的填写框中

#### 2.1 将 Authing 应用的相关信息复制到对应的填写框中
![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/17.avif)

#### 2.2 将 Redirect URL 复制到 Authing 的登录回调URL 中

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/18.avif)

### 3.更改 Authing 配置

#### 3.1 按图配置

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/19.avif)

#### 3.2 配置登录控制

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/7.avif)

#### 3.3 更改权限

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/8.avif)

### 4.创建用户并测试登录

#### 4.1 在 Authing 中创建用户

> [!NOTE]
> FlashDuty 只支持用户邮箱关联，所以需要用邮箱创建用户

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/9.avif)

#### 4.2 使用 SSO 地址测试登录

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/20.avif)

#### 4.3 SSO 地址跳转到登录页面

![](https://fcimg.3ti.site/zh/flashduty/mixin/single_sign_on/authing/11.avif)

> [!NOTE]
> 使用在 Authing 创建的用户，登录 FlashDuty 控制台