---
brief: 通过 webhook 的方式同步阿里云日志服务 SLS 监控告警事件到快猫星云，实现告警事件自动化降噪处理
---

# 阿里云 SLS集成

通过 webhook 的方式同步阿里云日志服务 SLS 监控告警事件到 Flashduty，实现告警事件自动化降噪处理。

## 在 Flashduty
您可通过以下2种方式，获取一个集成推送地址，任选其一即可。

### 使用专属集成

当您不需要将告警事件路由到不同的协作空间，优先选择此方式，更简单。

|+| 展开

    1. 进入 Flashduty 控制台，选择 **协作空间**，进入某个空间的详情页面
    2. 选择 **集成数据** tab，点击 **添加一个集成**，进入添加集成页面
    3. 选择 **阿里云 SLS** 集成，点击 **保存**，生成卡片。
    4. 点击生成的卡片，可以查看到 **推送地址**，复制备用，完成。

### 使用共享集成

当您需要根据告警事件的 Payload 信息，将告警路由到不同的协作空间，优先选择此方式。

|+| 展开

    1. 进入 Flashduty 控制台，选择 **集成中心=>告警事件**，进入集成选择页面。
    2. 选择 **阿里云 SLS** 集成：
    - **集成名称**：为当前集成定义一个名称。
    3. 点击 **保存** 后，复制当前页面的新生成的 **推送地址** 备用。
    4. 点击 **创建路由**，为集成配置路由规则。您可以按条件匹配不同的告警到不同的协作空间，也可以直接设置默认协作空间作为兜底，后续再按需调整。
    5. 完成。

## 在阿里云 SLS
**步骤 1：配置 Webhook**

<div class="md-block">

1. 登录您的阿里云控制台，选择日志服务 SLS 产品，选择一个 Project
2. 进入 __告警__->__告警管理__->__Webhook集成__ 页面，单击 __新建__ 按钮，开始编辑

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/do6Aljc-9776gTE_GTxT9gsVkAEejjOPvjVOZjEMs8U.avif" />

3. 如图，__类型__选择“通用 Webhook”，__请求方法__选择 POST，__请求地址__填写集成的推送地址（保存后得到）

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/l7QslDgInVpUwfNHW6GyVdSgdLrHiblCHY8-Zq1YR4M.avif" />

4. 点击__确认__按钮，提交保存

</div>

**步骤 2：配置内容模板**

<div class="md-block">

1. 切换到__内容模板__页面，点击__添加__按钮，开始编辑
2. 进入__Webhook-自定义__配置项，__发送方式__选择“逐条发送”，__发送内容__复制以下内容：

```
{{ alert | to_json}}
```

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/iqZZ9Gy8c1s1h7ZnI8NaZQRxTLcNnoO5BLGRl3KUU5Q.avif" />

3. 点击__确认__按钮，提交保存

</div>

**步骤 3：配置行动策略**

<div class="md-block">

1. 切换到__行动策略__页面，点击__添加__按钮，开始编辑
2. 进入__第一行动列表__配置项，点击添加一个__行动组__节点。
3. __渠道__选择“通用 Webhook”，__选择Webhook__和__内容模板__使用前边创建的对象，__发送时段__选择“任意”

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/Dl-kqzyg53lz-hqYR8rZw8wC-cVpK4103tdtDLESOzU.avif" />

4. 点击__结束__，完成第一行动列表创建
5. 点击__确认__按钮，提交保存

</div>

**步骤 4：配置监控规则**

<div class="md-block">

1. 切换到__规则/事务__页面，点击__新建告警__按钮或选择一个已有的告警进行更新编辑
2. 进入__告警规则__编辑页面，__告警策略__。
3. __告警策略__选择“普通模式”，__行动策略__使用前边创建的对象

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/TQ-mllhuKcn6FKPy11GIPpGB8GvwiJ17ZSraCR-IPCg.avif" />

4. 点击__确定__按钮，提交保存
5. 针对所有其他规则，重复上述步骤，可以将全部告警推送到 FlashDuty

</div>

## 状态对照
<div class="md-block">

阿里云SLS监控到 Flashduty 告警等级映射关系：

| 阿里云 SLS 监控 |  Flashduty  | 状态 |
| --------------- | -------- | ---- |
| 10              | Critical | 严重 |
| 8               | Critical | 严重 |
| 6               | Warning  | 警告 |
| 4               | Warning  | 警告 |
| 2               | Info     | 提醒 |

</div>