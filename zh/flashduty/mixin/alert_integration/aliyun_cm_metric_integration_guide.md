---
brief: 通过 webhook 的方式同步阿里云云监控告警事件到快猫星云，实现告警事件自动化降噪处理
---

# 阿里云监控 CM 指标集成

通过 webhook 的方式同步阿里云云监控告警事件到 Flashduty，实现告警事件自动化降噪处理。

## 在 Flashduty
您可通过以下2种方式，获取一个集成推送地址，任选其一即可。

### 使用专属集成

当您不需要将告警事件路由到不同的协作空间，优先选择此方式，更简单。

|+| 展开

    1. 进入 Flashduty 控制台，选择 **协作空间**，进入某个空间的详情页面
    2. 选择 **集成数据** tab，点击 **添加一个集成**，进入添加集成页面
    3. 选择 **阿里云 CM 指标** 集成，点击 **保存**，生成卡片。
    4. 点击生成的卡片，可以查看到 **推送地址**，复制备用，完成。

### 使用共享集成

当您需要根据告警事件的 Payload 信息，将告警路由到不同的协作空间，优先选择此方式。

|+| 展开

    1. 进入 Flashduty 控制台，选择 **集成中心=>告警事件**，进入集成选择页面。
    2. 选择 **阿里云 CM 指标** 集成：
    - **集成名称**：为当前集成定义一个名称。
    3. 点击 **保存** 后，复制当前页面的新生成的 **推送地址** 备用。
    4. 点击 **创建路由**，为集成配置路由规则。您可以按条件匹配不同的告警到不同的协作空间，也可以直接设置默认协作空间作为兜底，后续再按需调整。
    5. 完成。

## 在阿里云监控
以下两种方式任选其一。

**方式 1：按规则配置**

1. 登录您的阿里云控制台，选择云监控产品
2. 进入 报警服务 -> 报警规则 页面，选择一个规则，单击 修改 按钮，开始编辑规则内容
3. 如图，在 高级设置 下填写回调地址为集成的推送地址
4. 点击 确认 按钮，提交更新

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/n5-x2vmAcZT9W1drSq44Cz74Tmi7RGcJCjr2w_n3Vls.avif" />

5. 对于所有期望同步事件的告警规则，重复上述步骤
6. 回到集成列表，如果展示了最新事件时间，说明配置成功且收到事件
7. 完成

**方式 2：按联系人配置**

1. 登录您的阿里云控制台，选择云监控产品
2. 进入 报警服务 -> 报警联系人 页面，选择修改某一个联系人
3. 如图，在 Webhook 下填写集成的推送地址
4. 点击 确认 按钮，提交更新

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/tJbcFhqxnFI_YxB1_byBDX_PODjjD-DNSFzTXoCKZFM.avif" />

5. 对于所有期望同步事件的联系人，重复上述步骤
6. 回到集成列表，如果展示了最新事件时间，说明配置成功且收到事件
7. 完成

## 状态对照

阿里云云监控到 Flashduty 告警等级映射关系：

| 阿里云云监控 |  Flashduty  | 状态 |
| ------------ | -------- | ---- |
| CRITICAL     | Critical | 严重 |
| WARN         | Warning  | 警告 |
| INFO         | Info     | 提醒 |
| NODATA       | Info     | 提醒 |