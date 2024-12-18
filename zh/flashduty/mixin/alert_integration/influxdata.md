---
brief: 通过 webhook 的方式同步 Influxdata 告警事件到快猫星云，实现告警事件自动化降噪处理
---

# Influxdata 集成

通过 webhook 的方式同步 Influxdata 告警事件到 Flashduty，实现告警事件自动化降噪处理。

## 在 Flashduty
您可通过以下2种方式，获取一个集成推送地址，任选其一即可。

### 使用专属集成

当您不需要将告警事件路由到不同的协作空间，优先选择此方式，更简单。

|+| 展开

    1. 进入 Flashduty 控制台，选择 **协作空间**，进入某个空间的详情页面
    2. 选择 **集成数据** tab，点击 **添加一个集成**，进入添加集成页面
    3. 选择 **Influxdata** 集成，点击 **保存**，生成卡片。
    4. 点击生成的卡片，可以查看到 **推送地址**，复制备用，完成。

### 使用共享集成

当您需要根据告警事件的 Payload 信息，将告警路由到不同的协作空间，优先选择此方式。

|+| 展开

    1. 进入 Flashduty 控制台，选择 **集成中心=>告警事件**，进入集成选择页面。
    2. 选择 **Influxdata** 集成：
    - **集成名称**：为当前集成定义一个名称。
    3. 点击 **保存** 后，复制当前页面的新生成的 **推送地址** 备用。
    4. 点击 **创建路由**，为集成配置路由规则。您可以按条件匹配不同的告警到不同的协作空间，也可以直接设置默认协作空间作为兜底，后续再按需调整。
    5. 完成。

## 在 Influxdata

1. 登录您的 Influxdata 控制台，进去 Alerting > Alert Rules 页面
2. 点击需要同步事件的告警规则，进入 Alert Rule Builder 页面，开始编辑规则
3. Alert Handlers 部分，选择 Add Another Handler，类型选择 post，HTTP endpoint 填入集成的推送地址，如下图所示：

![influxdb-alert-rule](https://fc.3ti.site/zh/flashduty/mixin/alert_integration/influxdata/1.avif)

4. 点击 Save Rule 按钮，保存。等待事件触发，如果在集成列表展示了最新事件时间，说明配置成功且收到事件
5. 完成

## 状态对照

Influxdata 告警事件到 Flashduty 告警等级映射关系：

| Influxdata |  Flashduty  | 状态 |
| ---------- | -------- | ---- |
| CRITICAL   | Critical | 严重 |
| WARNING    | Warning  | 警告 |
| INFO       | Info     | 提醒 |