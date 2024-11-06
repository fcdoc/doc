---
brief: 通过集成企业微信第三方应用，实现在企业微信端内接收和响应告警的能力
---

# 企业微信集成

通过集成企业微信第三方应用，实现在企业微信端内接收和响应告警的能力。

## 一、安装应用

1. 访问 [企业微信管理后台](https://work.weixin.qq.com/wework_admin/frame#apps) - __应用管理__ - __第三方__，选择添加第三方应用

<img src="https://fcimg.i18n.site/zh/flashduty/mixin/instant_messaging/wecom/1.avif" alt="drawing" width="400"/>

2. 搜索栏输入 `flashduty`，检索到应用，并点击 __添加__ 按钮

<img src="https://fcimg.i18n.site/zh/flashduty/mixin/instant_messaging/wecom/2.avif" alt="drawing" width="400"/>

3. 修改应用 __可见范围__，推荐全员或具体部门节点，防止新增成员时还要修改范围。点击 __同意以上授权并添加__，完成安装

<img src="https://fcimg.i18n.site/zh/flashduty/mixin/instant_messaging/wecom/3.avif" alt="drawing" width="400"/>

4. 访问 [企业微信管理后台](https://work.weixin.qq.com/wework_admin/frame#apps) - __我的企业__ 页面，复制 __企业ID__ 作为当前页面的 `Corp ID` 填写到集成配置，点击保存，完成集成配置

<img src="https://fcimg.i18n.site/zh/flashduty/mixin/instant_messaging/wecom/4.avif" alt="drawing" width="400"/>

5. **请注意：Flashduty作为企业微信服务商，为您提供 `FlashDuty` 应用的长期免费版本。该应用需要获得企业微信接口调用许可才能使用（免密登录+发消息），该许可目前支持__最多60天__免费，超过后我们必须为您购买企微许可才能使用。**

## 二、常见问题

1. **点击集成保存按钮，报错 `authorize app first`？**

- 请检查您是否完成应用的安装步骤，比如您是否可以在工作台看到 `FlashDuty` 这个应用
- 请检查您是否正确配置了 `Corp ID`

2. **如何完成账户关联？或消息发送提示__未关联应用__？**

- 登入企业微信客户端（桌面端和移动端均可），进入 __工作台__，找到并进入应用 `FlashDuty`
- 首次进入应用需要登录，选择成员账号 - 密码或单点登录，登入成功后，即完成 `Flashduty` 到 __企业微信__ 账户关联
- 后续进入应用将免密登录

3. **如何进行故障通知？**

- 必须参照问题 1，先完成账户关联，才能发送通知
- 进入某个协作空间详情页面-分派策略，在个人渠道部分，选择通知到企业微信集成，完成通知配置
- 支持对企业微信通知内容进行自定义，您前往模板管理页面，设定自定义模板。注意：**自定义区域展示行数最多 8 行**，超过会被企业微信截断

<img src="https://fcimg.i18n.site/zh/flashduty/mixin/instant_messaging/wecom/5.avif" alt="drawing" width="400"/>

4. **如何在微信内处理告警？**

- 点击卡片消息，直接进入告警详情页面
- 点击 __开始处理__，直接将告警置为 __处理中__ 状态
- 点击 __直接关闭__，直接将告警置为 __已关闭__ 状态
- 点击 __屏蔽2小时__，直接将告警屏蔽 2 小时，如果想屏蔽更多时间，点击卡片右上角 `...`有更多屏蔽选项

5. **为什么卡片消息提供了 __状态刷新__ 按钮？**

- 企业微信限制一次卡片交互后 72 小时只可更新一次。每一次按钮操作，都是一次交互
- 当告警的状态发生变化时，Flashduty会请求卡片内容更新
- 当告警状态频繁变化时，可能因为超过更新次数限制，导致卡片无法实时更新，这时可以点击刷新按钮，来获得一次更新卡片状态机会

6. **Mac 桌面端点击卡片消息如何使用 __系统默认浏览器__ 打开？**

- Mac 桌面端默认使用端内浏览器打开链接
- 您可以尝试快捷键 `ctrl` + `command` + `shift` + `d` 开启调试模式，然后选择 __调试 - 浏览器、webView相关 - 系统浏览器打开网页__，来更改链接打开模式。使用同样的快捷键可以关闭调试模式，并保持设置。

7. **故障通知失败，提示__未开通企微许可__？**

- 联系 Flashduty 客服或专属支持，为您购买开通