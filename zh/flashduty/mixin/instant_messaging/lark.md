---
brief: 通过集成飞书自建应用，实现在飞书端内接收和响应告警的能力
---

# 飞书 Lark集成

通过集成飞书自建应用，实现在飞书端内接收和响应告警的能力。

## 一、创建飞书应用

### 1. 创建自建应用

访问 [飞书开发者后台](https://open.feishu.cn/app)，创建企业内自建应用。 (详见飞书开发文档-[创建企业自建应用](https://open.feishu.cn/document/uYjL24iN/uMTMuMTMuMTM/development-guide/step1#132c1aac))

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/lark/1.avif" alt="drawing" width="400"/>

应用图标可使用[Flashduty官方 icon](https://download.flashcat.cloud/flashcat_logo_circular.png)。

### 2. 复制凭证信息

前往 **凭证与基础信息** 页面，复制 `App ID` 和 `App Secret`备用。

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/lark/2.avif" alt="drawing" width="800"/>

### 3. 复制事件回调的 Token 信息

前往 **开发配置-事件与回调-加密策略** 页面，复制 `Encrypt Key`（推荐启用，更安全） 和 `Verification Token`备用。

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/lark/3.avif" alt="drawing" width="800"/>

## 二、添加飞书集成

回到 Flashduty **集成中心** 页面，选择 **即时消息=>飞书**，在表单中填入 __名称__ 以及上一步复制的`App ID`、`App Secret`、`Verification Token` 和 `Encrypt Key`后，点击保存创建。

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/lark/4.avif" alt="drawing" width="800"/>

创建后在列表中会看到刚才添加的飞书集成，点击名称进入详情后，会看到 **网页配置** 地址、**重定向 URL** 地址以及 **消息卡片请求网址** 等信息，后边流程会用到。

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/lark/5.avif" alt="drawing" width="800"/>

## 三、配置飞书应用

### 1. 开通并配置应用能力

1). 回到飞书开发者后台，进入刚才创建的飞书应用，进入 **添加应用能力-按能力添加** 页面，同时开通 **网页应用** 和 **机器人** 能力。

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/lark/6.avif" alt="drawing" width="800"/>

2). 前往 **网页应用** 页面，配置 __桌面端主页__ 和 __移动端主页__，内容均为集成详情中的 **网页配置** 地址。

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/lark/7.avif" alt="drawing" width="800"/>

(详见飞书开发文档-[配置应用主页地址](https://open.feishu.cn/document/uYjL24iN/uMTMuMTMuMTM/development-guide/step1#8366b844))

3). 前往 **事件回调-回调配置** 页面，配置 __消息卡片请求网址__（内容为集成详情中的 **消息卡片请求网址**）并添加回调。

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/lark/8.avif" alt="drawing" width="800"/>
<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/lark/9.avif" alt="drawing" width="800"/>

### 2. 添加重定向 URL 到飞书应用中

进入 **安全设置** 页面，配置 __重定向URL__，内容为集成详情中的 **重定向 URL**。

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/lark/10.avif" alt="drawing" width="800"/>

(详见飞书开发文档-[配置重定向 URL](https://open.feishu.cn/document/uYjL24iN/uYjN3QjL2YzN04iN2cDN?lang=zh-CN#c863e533))

### 3. 申请应用权限

进入 **权限管理** 页面，申请 `im:chat` 和 `im:message` 两项权限。此两项权限将允许当前应用获取自身所在群聊信息以及向群聊或个人发送消息的能力。

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/lark/11.avif" alt="drawing" width="800"/>

## 四、应用发布与使用

完成上述步骤后，进行应用的发布与使用，管理员审核后即可使用。
注意：**可用范围** 需要特别配置，推荐 **所有员工**。

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/lark/12.avif" alt="drawing" width="800"/>

详见飞书开发文档-[应用发布与使用](https://open.feishu.cn/document/uYjL24iN/uMTMuMTMuMTM/development-guide/step-4)。

应用发布后，就可以使用 手机端/PC 端 访问应用。首次访问需要登录并关联（飞书<->Flashduty）账号，后续可以免登录使用。

1. 手机端：手机端通过 飞书 > 工作台 > 搜索应用名称 > 打开应用 使用网页应用。
2. PC 端：桌面（PC）端通过 飞书 > 工作台 > 搜索应用名称 > 打开应用 使用网页应用。

## 五、常见问题

1. **消息无法投递到个人**，操作记录提示__未关联应用__？

- 前往 飞书 > 工作台 > 搜索应用名称 > 打开应用，完成一次登录并关联（飞书<->Flashduty）账号，系统才能拿到用户身份进行消息推送

2. **消息卡片按钮点击无效或报错**？

- 确保账户已经完成关联，前往 飞书 > 工作台 > 搜索应用名称 > 打开应用，完成一次登录并关联（飞书<->Flashduty）账号。如果已经登录过，尝试点击右上角菜单，切换账户，重新登录来绑定账号
- 确保已购买足够的 license，已使用 license 情况，可以在控制台 > 费用中心查看

2. **分派策略飞书群聊列表为空**？

- 前往 飞书，选择群聊会话，添加已创建的Flashduty机器人，如下图所示：
- 回到分派策略配置页面，刷新后重新选择群聊列表

<img alt="drawing" width="800" src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/lark/13.avif" />
<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/lark/14.avif" alt="drawing" width="800"/>