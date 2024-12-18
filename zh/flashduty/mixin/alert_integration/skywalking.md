---
brief: 通过 webhook 的方式同步 Skywalking 告警事件到快猫星云，实现告警事件自动化降噪处理
---

# Skywalking告警事件

通过 webhook 的方式同步 Skywalking 告警事件到快猫星云，实现告警事件自动化降噪处理。

## 在 Flashduty
您可通过以下2种方式，获取一个集成推送地址，任选其一即可。

### 使用专属集成

当您不需要将告警事件路由到不同的协作空间，优先选择此方式，更简单。

|+| 展开

    1. 进入 Flashduty 控制台，选择 **协作空间**，进入某个空间的详情页面
    2. 选择 **集成数据** tab，点击 **添加一个集成**，进入添加集成页面
    3. 选择 **Skywalking** 集成，点击 **保存**，生成卡片。
    4. 点击生成的卡片，可以查看到 **推送地址**，复制备用，完成。

### 使用共享集成

当您需要根据告警事件的 Payload 信息，将告警路由到不同的协作空间，优先选择此方式。

|+| 展开

    1. 进入 Flashduty 控制台，选择 **集成中心=>告警事件**，进入集成选择页面。
    2. 选择 **Skywalking** 集成：
    - **集成名称**：为当前集成定义一个名称。
    3. 点击 **保存** 后，复制当前页面的新生成的 **推送地址** 备用。
    4. 点击 **创建路由**，为集成配置路由规则。您可以按条件匹配不同的告警到不同的协作空间，也可以直接设置默认协作空间作为兜底，后续再按需调整。
    5. 完成。

## 在 Skywalking

## 一、修改 Skywalking 服务的配置文件

1. 登录 Skywalking 服务器。
2. 找到 Skywalking 的配置文件 ./config/alarm-settings.yml。
3. 在告警规则中添加 Level 的 tags。

```i18n
# v8.6.0+ 及以上版本才支持tags标签, 其他版本可以不添加。
# Level 的对应 value : Critical、Warning、Info。
# 请注意大小写。
rules:
endpoint_relation_resp_time_rule:
expression: sum(endpoint_relation_resp_time > 1000) >= 2
period: 10
message: Response time of endpoint relation {name} is more than 1000ms in 2 minutes of last 10 minutes
tags:
Level: Warning
```
4. 添加 FlashDuty 的 webhook 地址。

```i18n
# 在配置文件底部添加
# v8.8.0 ~ v9.5.0 的添加方式
webhooks:
- url: https://api.flashcat.cloud/event/push/alert/skywalking?integration_key=18c7f1551df55fa28a1a87f0846d9d1e131

# v10.0.0 的添加方式
hooks:
webhook:
default:
is-default: true
urls:
- https://api.flashcat.cloud/event/push/alert/skywalking?integration_key=18c7f1551df55fa28a1a87f0846d9d1e131
```

5. 编辑完成后，保存并重启 Skywalking 服务，使配置文件生效

## 二、状态对照

|Skywalking|快猫星云|状态|
|---|---|---|
|Critical|Critical|严重|
|Warning|Warning|警告|
|Info|Info|提醒|
|其他或为空|Info|提醒|