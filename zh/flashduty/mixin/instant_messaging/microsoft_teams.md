---
brief: 通过集成 Microsoft Teams 第三方应用，实现在 Microsoft Teams 内接收和响应告警的能力
---

# Microsoft Teams集成

通过集成 Microsoft Teams 第三方应用，实现在 Microsoft Teams 内接收和响应告警的能力。
## 一、安装应用

Microsoft Teams 集成现处于 Beta 阶段，在关联前您需要先完成以下操作：

> [!WARN]
> 此步骤需由 Microsoft Teams 管理员完成

### 1. 下载应用包
将 [FlashDutyBot.zip](https://fcpub-1301667576.cos.ap-nanjing.myqcloud.com/flashduty/integration/microsoft-teams/FlashDutyBot.zip) 下载到本地

### 2. 上传应用包
进入 **Microsoft Teams，跳转 [+Apps] - [Manage your apps] - [Upload an app] - [Upload an app to your org's app catalog]** 上传应用包 FlashDutyBot.zip

![](https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/microsoft_teams/1.avif)

### 3. 配置应用可见范围
进入 Microsoft Teams 管理中心，找到 FlashDuty 应用，将应用可见范围调整为所有人（或者您自定义的范围）

> [!NOTE]
> 如遇到应用状态为 [已阻止]，请稍等片刻后刷新页面或手动修改
![](https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/microsoft_teams/2.avif)

### 4. 查看是否添加成功
等待几分钟，组织成员即可在 [+Apps] - [Built for your org] 找到此应用集成

![](https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/microsoft_teams/3.avif)

## 二、关联团队

### 1. 添加 FlashDuty 应用到目标 Team 中

#### 1.1 找到 FlashDuty 应用
如无应用，请联系您的 Microsoft Teams 组织管理员
![](https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/microsoft_teams/3.avif)

#### 1.2 添加到目标 Team
> [!WARN]
> 注意：此步必须选择目标 Team 的 General Channel，否则将无法发送故障到 Team 中

![](https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/microsoft_teams/4.avif)

### 2. 发送关联指令
@FlashDuty 并发送 linkTeam {ID} 到添加的 Team 中，点击立即关联

![](https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/microsoft_teams/5.avif)

## 三、关联用户

### 1. 添加 FlashDuty 应用

#### 1.1 找到 FlashDuty 应用
如无应用，请联系您的 Microsoft Teams 组织管理员
![](https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/microsoft_teams/3.avif)

#### 1.2 点击添加按钮
> [!WARN]
> 注意：此步必须选择目标 Team 的 General Channel，否则将无法发送故障到 Team 中

![](https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/microsoft_teams/6.avif)

### 2. 发送关联指令
复制指令：linkUser {} 发送到聊天中，再点击立即关联

![](https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/microsoft_teams/7.avif)

## 常见问题

|+| 团队或个人收不到消息

    请前往集成中心=>即时消息=>Microsoft Teams中的团队和用户是否有关联成功

|+| 怎么查看已关联的团队和用户

    请前往集成中心=>即时消息=>Microsoft Teams中的关联Teams和关联用户中查看

|+| 怎么取消关联的团队和用户

    暂不支持