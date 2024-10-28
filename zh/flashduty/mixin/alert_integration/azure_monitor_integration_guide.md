---
brief: 通过 webhook 的方式同步 Azure Monitor 告警事件到快猫星云，实现告警事件自动化降噪处理
---

# Azure Monitor集成

通过 webhook 的方式同步 Azure Monitor 告警事件到 Flashduty，实现告警事件自动化降噪处理。

## 在 Flashduty
您可通过以下2种方式，获取一个集成推送地址，任选其一即可。

### 使用专属集成

当您不需要将告警事件路由到不同的协作空间，优先选择此方式，更简单。

|+| 展开

    1. 进入 Flashduty 控制台，选择 **协作空间**，进入某个空间的详情页面
    2. 选择 **集成数据** tab，点击 **添加一个集成**，进入添加集成页面
    3. 选择 **Azure Monitor** 集成，点击 **保存**，生成卡片。
    4. 点击生成的卡片，可以查看到 **推送地址**，复制备用，完成。

### 使用共享集成

当您需要根据告警事件的 Payload 信息，将告警路由到不同的协作空间，优先选择此方式。

|+| 展开

    1. 进入 Flashduty 控制台，选择 **集成中心=>告警事件**，进入集成选择页面。
    2. 选择 **Azure Monitor** 集成：
    - **集成名称**：为当前集成定义一个名称。
    3. 点击 **保存** 后，复制当前页面的新生成的 **推送地址** 备用。
    4. 点击 **创建路由**，为集成配置路由规则。您可以按条件匹配不同的告警到不同的协作空间，也可以直接设置默认协作空间作为兜底，后续再按需调整。
    5. 完成。

## 在 Azure Monitor
**步骤 1：配置 Webhook**

1. 登录您的 Azure 门户，选择 Monitor 产品；
2. 进入 `Alerts -> Action groups` 页面，单击 Create 按钮，开始编辑；
3. 如图，`Actions` 选项选择 `Action type` 为 `Webhook`；
4. 填写名称，`URI` 部分复制写入集成的推送地址，注意要 `Enable` 通用 alert 结构；
5. 点击 Create 按钮，提交保存。

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/4gzLFt9GChD5e3f_GYsfB0c4VwgFWvEtl4oBrNyvKzs.avif" />

**步骤 2：配置 Alert rule**

1. 进入 `Alerts -> Alert rules` 页面，单击 Create 或 选择已有的策略进行编辑；
2. 如下图所示，在 `Actions` 页面，选择已创建好的 Action group；

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/b-vF-yP22lZacuG_Q9t4J7xx0uPFYqYcILv3Fc3vI3k.avif" />

3. 提交保存，等待告警触发。

## 状态对照

Azure Monitor 到 Flashduty 告警等级映射关系：

| Azure Monitor  |  Flashduty  | 状态 |
| ------------ | -------- | ---- |
| Sev0     | Critical | 严重 |
| Sev1     | Warning  | 警告 |
| Sev2     | Warning  | 警告 |
| Sev3     | Info     | 提醒 |
| Sev4     | Info     | 提醒 |