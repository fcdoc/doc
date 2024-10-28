---
brief: 通过 webhook 的方式同步 Open-Falcon 告警事件到 Flashduty，实现告警事件自动化降噪处理
---

# Open Falcon集成

通过 webhook 的方式同步 Open-Falcon 告警事件到 Flashduty，实现告警事件自动化降噪处理。
## 在 Flashduty
您可通过以下2种方式，获取一个集成推送地址，任选其一即可。

### 使用专属集成

当您不需要将告警事件路由到不同的协作空间，优先选择此方式，更简单。

|+| 展开

    1. 进入 Flashduty 控制台，选择 **协作空间**，进入某个空间的详情页面
    2. 选择 **集成数据** tab，点击 **添加一个集成**，进入添加集成页面
    3. 选择 **Falcon** 集成，点击 **保存**，生成卡片。
    4. 点击生成的卡片，可以查看到 **推送地址**，复制备用，完成。

### 使用共享集成

当您需要根据告警事件的 Payload 信息，将告警路由到不同的协作空间，优先选择此方式。

|+| 展开

    1. 进入 Flashduty 控制台，选择 **集成中心=>告警事件**，进入集成选择页面。
    2. 选择 **Falcon** 集成：
    - **集成名称**：为当前集成定义一个名称。
    3. 点击 **保存** 后，复制当前页面的新生成的 **推送地址** 备用。
    4. 点击 **创建路由**，为集成配置路由规则。您可以按条件匹配不同的告警到不同的协作空间，也可以直接设置默认协作空间作为兜底，后续再按需调整。
    5. 完成。

## 在 Falcon
选择告警规则，逐一配置 webhook。

1. 登录您的 Falcon 控制台，选择 Templates，进入告警规则模板列表页面
2. 打开任意一个告警规则模板，填写回调地址为当前集成对应的推送地址
3. 点击 Save 按钮，保存告警规则
4. 针对所有要发送事件的告警规则模板，重复步骤2和3

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/K8WaMj6aJuvE6gB_F7OMBexypNErGAVawIwmAlCr64Y.avif" />
<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/BO_Ai0Y13E8v87DBBXD5IOD16hvspuJGBLxdpAkq7uY.avif" />

同样的，针对 Expressions 告警规则，也可以配置相同的推送地址。

5. 回到集成列表，如果展示了最新事件时间，说明配置成功且收到事件
6. 完成

## 状态对照

Open-Falcon 到 Flashduty 告警等级映射关系：

| Open-Falcon |  Flashduty  | 状态 |
| ----------- | -------- | ---- |
| 0           | Critical | 严重 |
| 1           | Critical | 严重 |
| 2           | Warning  | 警告 |
| 3           | Warning  | 警告 |
| 4           | Info     | 提醒 |
| 5           | Info     | 提醒 |
| 6           | Info     | 提醒 |