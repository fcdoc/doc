---
brief: 通过集成钉钉自建应用，实现在钉钉端内接收和响应告警的能力
---

# 钉钉集成

通过集成钉钉自建应用，实现在钉钉端内接收和响应告警的能力。

**（本文档以钉钉开放平台新版为例）**

## 一、创建钉钉应用

### 1. 创建自建应用

访问 [钉钉开发者后台](https://open-dev.dingtalk.com/fe/app) - 应用开发 - 企业内部开发，创建应用。 (详见钉钉开发文档-[创建企业内部应用-H5 微应用](https://open.dingtalk.com/document/orgapp/microapplication-creation-and-release-process#title-ovn-666-1ty))

<img src="https://fcdoc.github.io/img/zh/RTvcYtYGThVmEpijD77H6D3E_CDYcr-UvJkDXNwHCu8.avif" alt="drawing" width="400"/>

应用图标可使用[Flashduty官方 icon](https://download.flashcat.cloud/flashcat_logo_circular.png)。

### 2. 复制企业 CorpId

点击页面右上角企业，在下拉菜单中复制 `CorpId` 备用。

<img src="https://fcdoc.github.io/img/zh/BF4b4YV4GjGAVCAm7dYbMv8VN7aXnp9z8crYe1cnmg0.avif" alt="drawing" width="500"/>

### 3. 复制应用凭证信息

前往 **凭证与基础信息** 页面，复制 `AgentID`、 `ClientID` 和 `ClientSecret` 备用。

<img src="https://fcdoc.github.io/img/zh/d9CD89k7qyZiR9GD2ZwzGHcT1cN5H3Q5G-yyE5-2M8g.avif" alt="drawing" width="500"/>

### 4. 复制事件订阅信息

前往 **开发配置 - 事件与回调** 页面。

生成 __加密 aes_key__ 和 __签名 Token__ 备用。

**（注意：生成 aes_key 和 Token 后请将信息临时保存到其它地方，离开页面后信息会消失，后续会用到）**

<img src="https://fcdoc.github.io/img/zh/NGXlVEMEAif9TLDyX8YR8-EEJIpaPD1LoT2k9jRW17k.avif" alt="drawing" width="500"/>

## 二、添加钉钉集成

回到Flashduty **集成中心** 页面，选择即时消息 > 钉钉，在表单中填入 __集成名称__ 以及上一步复制的 应用信息后，点击保存创建。

<img src="https://fcdoc.github.io/img/zh/hzqPYfpHgsCWPcj1zD8ra0pibK3rmxt3i4lHXD5mRv0.avif" alt="drawing" width="400"/>

保存后会看到 **网页配置** 地址、**服务器出口 IP** 地址以及 **事件订阅请求网址** 等信息，后边流程会用到。

<img src="https://fcdoc.github.io/img/zh/F0m958Mv6fHG7pIJd6kdU_vonunBaUNqYZI4rmYzVWI.avif" alt="drawing" width="400"/>

## 三、配置钉钉应用

### 1. 添加酷应用、网页应用和机器人
<img src="https://fcdoc.github.io/img/zh/ih9n4XTWewUf61MiouGbFFtEnPTsFPoRWPuJgw8olOM.avif" alt="drawing" width="500"/>

1）创建酷应用 **酷应用-酷应用列表** 页面，点击 **创建酷应用** 按钮，选择 **扩展到群会话**

<img src="https://fcdoc.github.io/img/zh/dQVGxefckwha0Hh8JzJGKVm7cdcvHRunC0Ix3pu8ls8.avif" alt="drawing" width="500"/>

2）进入到 **编辑酷应用** 页面，完成以下步骤：

2.1) 第一步，填写基本信息，图标可使用[Flashduty官方 icon](https://download.flashcat.cloud/flashcat_logo_circular.png)。

<img src="https://fcdoc.github.io/img/zh/64K399RN43ZP0OchWo-7jcr76696uY1JV_JMzxbnSjI.avif" alt="drawing" width="500"/>

2.2) 第二步，配置功能设计，左侧选中 **群快捷入口** 和 **消息卡片**。群快捷入口图标可使用[Flashduty官方 icon](https://download.flashcat.cloud/flashcat_logo_circular.png)，桌面和移动端访问地址请复制集成详情里的 **酷应用网页地址**。

<img src="https://fcdoc.github.io/img/zh/olmdxNwHs4941t6PXYoqEQXfh1xInjwOzcbqyD9UMig.avif" alt="drawing" width="500"/>

2.3) 跳过第三步功能开发，来到第四步 **预览发布**，点击 **发布** 按钮并确认。

### 2. 配置机器人与消息推送

进入 **应用能力-机器人** 页面，打开机器人配置，填写名称并上传图标，图标可使用[Flashduty官方 icon](https://download.flashcat.cloud/flashcat_logo_circular.png)，保存即可。

<img src="https://fcdoc.github.io/img/zh/FZ1WeSh2EWJ_3VRrXuVqIDoOLGjpir_qm--qzvTOF20.avif" alt="drawing" width="500"/>

### 3. 配置应用地址

进入 **应用能力-网页应用** 页面

1）配置 **应用首页地址** 和 **PC 端首页地址**，内容为集成详情中的 **应用首页地址** 和 **PC 端首页地址**。

2）点击右上角 **保存**。

<img src="https://fcdoc.github.io/img/zh/-b9ijKBrj6M-iNWQrMT5MmF4nH59ftKMhVZTcHaaWgM.avif" alt="drawing" width="500"/>

### 4. 配置事件订阅

1）**开发配置-事件订阅** 页面，配置 **请求网址**，内容为集成详情中的 **事件订阅请求网址**，配置完成后**保存**。

<img src="https://fcdoc.github.io/img/zh/UdO8kQuRI0Ex52MVVkv_gvALuFH2sYsvuGYWy1vXlig.avif" alt="drawing" width="500"/>

2）**保存**按钮下方，选中__群会话更换群名称__、__群内安装酷应用__和__群内卸载酷应用__三种群会话事件，配置完成后**保存**。

<img src="https://fcdoc.github.io/img/zh/VEVlLxSjred73fQYJkhMhb_b8xKKT5Yg5wSW190MiIU.avif" alt="drawing" width="500"/>

### 5. 申请应用权限

进入 权限管理 页面，申请 `qyapi_chat_manage` 和 `qyapi_robot_sendmsg` 两项权限。此两项权限将允许当前应用获取自身所在群聊信息以及向群聊或个人发送消息的能力。

<img src="https://fcdoc.github.io/img/zh/3rG7tgIuLGrcn51sE-rA6vfasbg6sIKj3FWoud39Bt4.avif" alt="drawing" width="600"/>

## 四、应用发布与使用

完成上述步骤后，进行**应用发布-版本管理与发布**，进行创建新版本，然后进行发布（注意把可见范围调整为全部员工，否则其他人无法使用）

<img src="https://fcdoc.github.io/img/zh/ssun50wZGrS360-Q3u600DQ-adnsgq50UFXOQDdcwjo.avif" alt="drawing" width="500"/>
<img src="https://fcdoc.github.io/img/zh/7i9N1NY-KqrOGe_yXdEGuPrnEm5FEX1ODajEZZIvNTo.avif" alt="drawing" width="500"/>

应用发布后，就可以使用 手机端/PC 端 访问应用。首次访问需要登录并关联（钉钉<->Flashduty）账号，后续可以免登录使用。

1. 手机端：手机端通过 钉钉 > 工作台 > 搜索应用名称 > 打开应用 使用网页应用。
2. PC 端：桌面（PC）端通过 钉钉 > 工作台 > 搜索应用名称 > 打开应用 使用网页应用。

## 五、常见问题

1. **消息无法投递到个人**，操作记录提示__未关联应用__？

- 前往 钉钉 > 工作台 > 搜索应用名称 > 打开应用，完成一次登录并关联（钉钉<->Flashduty）账号，系统才能拿到用户身份进行消息推送

2. **消息卡片按钮点击无效或报错？**

- 前往 钉钉 > 工作台 > 搜索应用名称 > 打开应用，完成一次登录并关联（钉钉<->Flashduty）账号。如果已经登录过，尝试点击右上角菜单，切换账户，重新登录来绑定账号
- 确保已购买足够的 license，已使用 license 情况，可以在控制台 > 费用中心查看

2. **分派策略钉钉群聊列表为空？**

- 前往 钉钉，选择群聊会话安装酷应用，否则无法拿到群聊列表
- 回到分派策略配置页面，刷新后重新选择群聊列表
- 如果仍然拿不到群聊列表，请尝试群内卸载酷应用后，重试以上步骤。如果还不可以，请联系客户或专属技术支持

<img src="https://fcdoc.github.io/img/zh/WNYrQ1kP_sWCP5pfqaM1T6hOcJDSNzRwKaeaX30MTIo.avif" alt="drawing" width="800"/>

<img src="https://fcdoc.github.io/img/zh/tozO1joDTFHA0dFDo6rHeqQizyrTHBc8OHz205C025Q.avif" alt="drawing" width="800"/>