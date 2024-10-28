---
brief: 通过自定义配置模版，可以实现个性化通知内容的需求
---

# 配置通知模版

## 什么场景会使用模板？
系统在__分派故障__时，使用模板渲染 [Incident](#Incident) 并触发通知，分派可能发生于以下场景：

1. 手动创建故障并分派
2. 上报告警事件，系统自动生成故障，按匹配到的分派策略进行分派
3. 故障创建后，手动更改分派，即重新分派
4. 根据分派策略设置，系统自动升级分派
5. 故障关闭后重新打开，按照之前的设置，重新分派

我们使用 __Golang模板语法__ [template/html](https://pkg.go.dev/html/template@go1.18.1) 解析数据，您可完成任何复杂的渲染需求。

- 中文文档请参考 [这里](https://www.topgoer.com/%E5%B8%B8%E7%94%A8%E6%A0%87%E5%87%86%E5%BA%93/template.html#%E6%A8%A1%E6%9D%BF%E8%AF%AD%E6%B3%95)，支持逻辑判断、循环、pipeline 以及常用函数；
- 我们引用了开源库 [sprig](https://github.com/flashcatcloud/sprig/tree/flashcat)，其中包括上百个常用函数，您可直接在模板中直接调用；
- 如果您期望引入更多函数，欢迎提交 merge request

## 我可以引用哪些变量？
**引用变量示例**：

```
// 引用标题
{{.Title}}

// 引用发起人名称
{{.Creator.PersonName}}

// 引用resource标签值
{{.Labels.resource}}

// 引用命名中带”.“的标签值
{{index .Labels "A.B"}}
```

**完整变量列表**（直接引用）：
<span id="Incident"></span>
字段|类型|必含|释义
:-:|:-:|:-:|:---
ID | string | 是 | 故障 ID
`Title` | string | 是 | 故障标题
`Description` | string | 是 | 故障描述，可能为空
DetailUrl | string | 是 | 故障详情页地址
Num | string | 是 | 故障短标识，仅用于方便肉眼识别，可能重复
`IncidentSeverity` | string | 是 | 严重程度，枚举值：Critical，Warning，Info
IncidentStatus | string | 是 | 故障状态，枚举值：Critical，Warning，Info，Ok
`Progress` | string | 是 | 处理进度，枚举值：Triggered，Processing，Closed
`StartTime` | int64 | 是 | 触发时间，Unix 秒时间戳
LastTime | int64 | 否 | 最新事件时间，关联告警中的最新合入事件时间，Unix 秒时间戳，默认为 0
EndTime | int64 | 否 | 恢复时间，关联的告警全部恢复时，故障会自动恢复且自动关闭。Unix 秒时间戳，默认为 0
SnoozedBefore | int64 | 否 | 屏蔽截止时间，Unix 秒时间戳，默认为 0
AckTime | int64 | 否 | 首次认领时间，Unix 秒时间戳，默认为 0
CloseTime | int64 | 否 | 关闭时间，end_time 为故障恢复时间，close_time 为处理进度的关闭时间，故障恢复时会自动关闭，故障手动关闭时不影响故障恢复。Unix 秒时间戳，默认为 0
Creator | [Person](#Person) | 否 | 发起人信息，系统自动生成时不存在
Closer | [Person](#Person) | 否 | 关闭人信息，故障自动恢复时不存在
AssignedTo | [Assignment](Assignment) | 否 | 分派配置
Responders | [][Responder](#Responder) | 否 | 处理人列表，根据分派配置初始化，如果有非分派人员认领了故障，也会存在对应记录
ChannelID | int64 | 否 | 协作空间 ID，当手动创建全局故障时值为 0
ChannelName | string | 否 | 协作空间名称
GroupMethod | string | 否 | 聚合方式，枚举值：n：不聚合，p：按规则聚合，i：智能聚合
`Labels` | map[string]string | 否 | 标签 KV，Key 和 Value 均为字符串。手动创建时无此信息，自动创建时为聚合的第一条告警的标签信息
AlertCnt | int64 | 是 | 关联告警个数
Alerts | [][Alert](#Alert) | 否 | 关联告警详情，手动创建时无此信息
FireType | string | 否 | 通知类型，枚举值：fire：通知，refire：循环通知
IsFlapping | bool | 否 | 是否处于抖动状态，即频繁发生与恢复，与收敛配置有关
Impact | string | 否 | 故障影响，故障关闭后填写
RootCause | string | 否 | 故障根因，故障关闭后填写
Resolution | string | 否 | 故障解决办法，故障关闭后填写

<span id="Person"></span>
**Person**（间接引用）:
字段|类型|必含|释义
:-:|:-:|:-:|:---
person_id | int64 | 是 | 人员 ID
person_name | string | 是 | 人员名称
email | string | 是 | 邮件地址

<span id="Assignment"></span>
**Assignment**（间接引用）:
字段|类型|必含|释义
:-:|:-:|:-:|:---
PersonIDs | []string| 否 | 人员 ID 列表，仅当按照人员分派时存在
EscalateRuleID | string | 否 | 分派策略 ID，仅当按照策略分派时存在
EscalateRuleName | string | 否 | 分派策略名称
LayerIdx | string | 否 | 分派环节，对应分派策略的层级索引，从 0 开始
Type | string | 是 | 分派类型，枚举值：assign：分派，reassign：重新分派，escalate：升级分派，reopen：重开分派

<span id="Responder"></span>
**Responder**（间接引用）:
字段|类型|必含|释义
:-:|:-:|:-:|:---
PersonID | int64 | 是 | 人员 ID
PersonName | string | 是 | 人员名称
Email | string | 是 | 邮件地址
AssignedAt | int64 | 是 | 分派时间，Unix 秒时间戳，默认为 0
AcknowledgedAt | int64 | 否 | 认领时间，Unix 秒时间戳，默认为 0

<span id="Alert"></span>
**Alert**（间接引用）:
字段|类型|必含|释义
:-:|:-:|:-:|:---
Title | string | 是 | 告警标题
Description | string | 是 | 告警描述，可能为空
AlertSeverity | string | 是 | 严重程度，枚举值：Critical，Warning，Info
AlertStatus | string | 是 | 告警状态，枚举值：Critical，Warning，Info，Ok
Progress | string | 是 | 处理进度，枚举值：Triggered，Processing，Closed
StartTime | int64 | 是 | 触发时间，Unix 秒时间戳
EndTime | int64 | 否 | 恢复时间，Unix 秒时间戳，默认为 0
CloseTime | int64 | 否 | 关闭时间，EndTime 为告警恢复时间，CloseTime 为处理进度的关闭时间，告警恢复时会自动关闭，告警手动关闭时不影响告警恢复。Unix 秒时间戳，默认为 0
`Labels` | map[string]string | 否 | 标签 KV，Key 和 Value 均为字符串

## 常见问题
1. **我如何知道`Labels`具体有哪些标签信息？**

- 手动创建的故障没有标签；
- 自动创建的故障存在标签，与合入的第一条告警的标签相同。前往 __故障列表__ 页面，找到一条故障并查看故障详情，可以看到全部标签信息

2. **我配置按照自定义模板渲染，实际发送内容却使用了__默认模板__？**

- 创建自定义模板时，系统使用 mock 数据来渲染模板，以检查语法错误；
- mock 数据覆盖场景有限，可能无法匹配到您模板中部分逻辑分支，在实际运行时，可能会渲染失败；
- 渲染失败后，系统将使用默认模板兜底，来保证消息可达；
- 推荐您在不确定引用变量是否存在时，使用逻辑判断来避免渲染异常，如`resource`标签：

```
// 错误做法：直接读取标签
{{.Labels.resource}}

// 推荐做法：先判断，再读取标签
{{if .Labels.resource}}{{.Labels.resource}}{{end}}
```

3. **故障标题含有“>”之类的__字符转义__？**

```
// 使用toHtml函数
{{toHtml .Title}}

// 使用第一个不为空的值进行渲染，避免写复杂的if逻辑
{{toHtml .Title .TitleEnglish}}
```

4. **时间变量都是时间戳类型，如何__转换时间格式__？**

```
// date函数，将时间戳转换可读格式
// "2006-01-02 15:04:05"是一种常见格式，更多格式请检索网络
{{date "2006-01-02 15:04:05" .StartTime}}

// ago函数，将时间差转换为可读格式
{{ago .StartTime}}
```

5. **如何在 for 循环内部引用外部变量？**
```
// 在外部变量前增加”$“
{{range .Responders}}
{{if eq $.Progress "Triggered"}}
【待处理】{{.Email}}
{{end}}
{{end}}
```
6. **如何提取命名中带”.“的字段值，如标签中的“obj.instance”的信息？**

```
// 使用index函数
{{index .Labels "obj.instance"}}
```

7. **如何提取故障关联告警中某个label的信息并去重？**

```
// 使用alertLabels函数，得到去重后的数组
{{alertLabels . "resource"}}

// 使用joinAlertLabels函数，得到去重后的数组，然后按照“sep”来拼接为字符串
{{joinAlertLabels . "resource" "sep"}}
```

8. **如何遍历并打印labels？**

```
// 完整遍历
{{range $k, $v := .Labels}}
{{$k}} : {{toHtml $v}}
{{end}}

// 排除单个label
{{range $k, $v := .Labels}}
{{if ne $k "resource"}}
{{$k}} : {{toHtml $v}}
{{end}}
{{end}}

// 排除多个labels
{{range $k, $v := .Labels}}
{{if not (in $k "resource" "body_text")}}
{{$k}} : {{toHtml $v}}
{{end}}
{{end}}

```

9. **如何查阅更多的函数及其使用示例？**
- 函数列表：https://github.com/flashcatcloud/sprig/blob/master/functions.go#L97
- 使用示例：查看对应的\_test.go 文件，比如 date 函数测试用例见 https://github.com/flashcatcloud/sprig/blob/master/date_test.go

以下为各通知渠道具体说明。

## 飞书应用
您需要预先配置 __集成中心-即时消息-飞书__ 集成，才能发送消息卡片。如果不设置自定义内容，将采用系统默认模板，渲染全部标签信息：

```
{{if .Description}}**description** :{{toHtml .Labels.body_text .Description}}{{end}}
{{if .Labels.resource}}**resource** : {{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{range $k, $v := .Labels}}
{{if not (in $k "resource" "body_text")}}**{{$k}}** : {{toHtml $v}}{{end}}{{end}}
```

如下图所示：

<img src="https://fcdoc.github.io/img/zh/J98dSP86cWqCChp7NGPy5yWabfG66jrDlLFIgzpMjYw.avif" alt="drawing" style="display: block; margin: 0 auto;" width="500"/>

如果您期望仅展示关键标签信息，可以参照下边的代码段：

- 我们列出了一些常见标签，您可自行删减；
- 在飞书应用中，系统会自动帮您删除（因标签不存在导致的）渲染空行，您可放心配置

```
{{if (index .Labels "resource")}}resource：{{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{if (index .Labels "check")}}check：{{toHtml (index .Labels "check")}}{{end}}
{{if (index .Labels "metric")}}metric：{{index .Labels "metric"}}{{end}}
{{if (index .Labels "prom_ql")}}prom_ql：{{toHtml (index .Labels "prom_ql")}}{{end}}
{{if (index .Labels "host_ql")}}host_ql：{{toHtml (index .Labels "host_ql")}}{{end}}
{{if (index .Labels "trigger_value")}}trigger_value：{{index .Labels "trigger_value"}}{{end}}
{{if (index .Labels "region")}}region：{{index .Labels "region"}}{{end}}
{{if (index .Labels "cluster")}}cluster：{{index .Labels "cluster"}}{{end}}
{{if (index .Labels "business")}}business：{{index .Labels "business"}}{{end}}
{{if (index .Labels "service")}}service：{{index .Labels "service"}}{{end}}
{{if (index .Labels "env")}}env：{{index .Labels "env"}}{{end}}
{{if (index .Labels "type")}}type：{{index .Labels "type"}}{{end}}
{{if (index .Labels "topic")}}topic：{{index .Labels "topic"}}{{end}}
{{if (index .Labels "cpu")}}cpu：{{index .Labels "cpu"}}{{end}}
{{if (index .Labels "device")}}device：{{index .Labels "device"}}{{end}}
{{if (index .Labels "path")}}path：{{index .Labels "path"}}{{end}}
{{if (index .Labels "fstype")}}fstype：{{index .Labels "fstype"}}{{end}}
{{if (index .Labels "name")}}name：{{index .Labels "name"}}{{end}}
{{if (index .Labels "mode")}}mode：{{index .Labels "mode"}}{{end}}
{{if (index .Labels "runbook_url")}}runbook_url：{{toHtml (index .Labels "runbook_url")}}{{end}}
```

## 钉钉应用
您需要预先配置 __集成中心-即时消息-钉钉__ 集成，才能发送消息卡片。如果不设置自定义内容，将采用系统默认模板，渲染全部标签信息：

```
{{if .Description}}**description** :{{toHtml .Labels.body_text .Description}}{{end}}
{{if .Labels.resource}}**resource** : {{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{range $k, $v := .Labels}}
{{if not (in $k "resource" "body_text")}}**{{$k}}** : {{toHtml $v}}{{end}}{{end}}
```

如下图所示：

<img src="https://fcdoc.github.io/img/zh/weJqFl22lWcHW3KZo4lFHKRadEvGUclE7OL3W8BM2F0.avif" alt="drawing" style="display: block; margin: 0 auto;" width="500"/>

如果您期望仅展示关键标签信息，可以参照下边的代码段：

- 我们列出了一些常见标签，您可自行删减；
- 在钉钉应用中，系统会自动帮您删除（因标签不存在导致的）渲染空行，您可放心配置

```
{{if (index .Labels "resource")}}**resource**：{{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{if (index .Labels "metric")}}**metric**：{{index .Labels "metric"}}{{end}}
{{if (index .Labels "prom_ql")}}**prom_ql**：{{toHtml (index .Labels "prom_ql")}}{{end}}
{{if (index .Labels "trigger_value")}}**trigger_value**：{{index .Labels "trigger_value"}}{{end}}
{{if (index .Labels "host_ql")}}**host_ql**：{{toHtml (index .Labels "host_ql")}}{{end}}
{{if (index .Labels "region")}}**region**：{{index .Labels "region"}}{{end}}
{{if (index .Labels "cluster")}}**cluster**：{{index .Labels "cluster"}}{{end}}
{{if (index .Labels "business")}}**business**：{{index .Labels "business"}}{{end}}
{{if (index .Labels "service")}}**service**：{{index .Labels "service"}}{{end}}
{{if (index .Labels "env")}}**env**：{{index .Labels "env"}}{{end}}
{{if (index .Labels "type")}}**type**：{{index .Labels "type"}}{{end}}
{{if (index .Labels "topic")}}**topic**：{{index .Labels "topic"}}{{end}}
{{if (index .Labels "cpu")}}**cpu**：{{index .Labels "cpu"}}{{end}}
{{if (index .Labels "device")}}**device**：{{index .Labels "device"}}{{end}}
{{if (index .Labels "path")}}**path**：{{index .Labels "path"}}{{end}}
{{if (index .Labels "fstype")}}**fstype**：{{index .Labels "fstype"}}{{end}}
{{if (index .Labels "name")}}**name**：{{index .Labels "name"}}{{end}}
{{if (index .Labels "mode")}}**mode**：{{index .Labels "mode"}}{{end}}
{{if (index .Labels "runbook_url")}}**runbook_url**：{{index .Labels "runbook_url"}}{{end}}
```

## 企业微信应用

您需要预先配置 __集成中心-即时消息-企业微信__ 集成，才能发送消息卡片。如果不设置自定义内容，将采用系统默认模板，仅渲染常见标签信息：

- 我们列出了一些常见标签，您可自行删减；
- 在企业微信应用中，系统会自动帮您删除（因标签不存在导致的）渲染空行，您可放心配置

```
{{if (index .Labels "resource")}}resource：{{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{if (index .Labels "metric")}}metric：{{index .Labels "metric"}}{{end}}
{{if (index .Labels "prom_ql")}}prom_ql：{{toHtml (index .Labels "prom_ql")}}{{end}}
{{if (index .Labels "trigger_value")}}trigger_value：{{index .Labels "trigger_value"}}{{end}}
{{if (index .Labels "host_ql")}}host_ql：{{toHtml (index .Labels "host_ql")}}{{end}}
{{if (index .Labels "region")}}region：{{index .Labels "region"}}{{end}}
{{if (index .Labels "cluster")}}cluster：{{index .Labels "cluster"}}{{end}}
{{if (index .Labels "business")}}business：{{index .Labels "business"}}{{end}}
{{if (index .Labels "service")}}service：{{index .Labels "service"}}{{end}}
{{if (index .Labels "env")}}env：{{index .Labels "env"}}{{end}}
{{if (index .Labels "type")}}type：{{index .Labels "type"}}{{end}}
{{if (index .Labels "topic")}}topic：{{index .Labels "topic"}}{{end}}
{{if (index .Labels "cpu")}}cpu：{{index .Labels "cpu"}}{{end}}
{{if (index .Labels "device")}}device：{{index .Labels "device"}}{{end}}
{{if (index .Labels "path")}}path：{{index .Labels "path"}}{{end}}
{{if (index .Labels "fstype")}}fstype：{{index .Labels "fstype"}}{{end}}
{{if (index .Labels "name")}}name：{{index .Labels "name"}}{{end}}
{{if (index .Labels "mode")}}mode：{{index .Labels "mode"}}{{end}}
{{if (index .Labels "runbook_url")}}runbook_url：{{toHtml (index .Labels "runbook_url")}}{{end}}
```

如下图所示：

<img src="https://fcdoc.github.io/img/zh/kc9K5HzTgAu_MmhpaEV9CWqmg5AZwDmV6X4g_T10mnc.avif" alt="drawing" style="display: block; margin: 0 auto;" width="500"/>

**注意，企业微信限制了卡片长度，在模板渲染区域，您最多可以渲染不超过 8 行内容，超过 8 行的部分将被隐藏**

## Slack 应用
您需要预先配置 __集成中心-即时消息- Slack__ 集成，才能发送消息卡片。如果不设置自定义内容，将采用系统默认模板，仅渲染常见标签信息：

```
{{if .Description}}*description* :{{toHtml .Labels.body_text .Description}}{{end}}
{{if .Labels.resource}}*resource* : {{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{range $k, $v := .Labels}}
{{if not (in $k "resource" "body_text")}}*{{$k}}* : {{toHtml $v}}{{end}}{{end}}
```

如下图所示：

<img src="https://fcdoc.github.io/img/zh/0m3LAvve_fgFH8cVvhTk6Z4Qwpw5SUFee7hf7XliCAs.avif" alt="drawing" style="display: block; margin: 0 auto;" width="600"/>

如果您期望仅展示关键标签信息，可以参照下边的代码段：

- 我们列出了一些常见标签，您可自行删减；
- 消息可以发送长度为15000左右字符，超出后截断发送；
- 在 Slack 应用中，系统会自动帮您删除（因标签不存在导致的）渲染空行，您可放心配置

```
{{if (index .Labels "resource")}}*resource*：{{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{if (index .Labels "metric")}}*metric*：{{index .Labels "metric"}}{{end}}
{{if (index .Labels "prom_ql")}}*prom_ql*：{{toHtml (index .Labels "prom_ql")}}{{end}}
{{if (index .Labels "trigger_value")}}*trigger_value*：{{index .Labels "trigger_value"}}{{end}}
{{if (index .Labels "host_ql")}}*host_ql*：{{index .Labels "host_ql"}}{{end}}
{{if (index .Labels "region")}}*region*：{{index .Labels "region"}}{{end}}
{{if (index .Labels "cluster")}}*cluster*：{{index .Labels "cluster"}}{{end}}
{{if (index .Labels "business")}}*business*：{{index .Labels "business"}}{{end}}
{{if (index .Labels "service")}}*service*：{{index .Labels "service"}}{{end}}
{{if (index .Labels "env")}}*env*：{{index .Labels "env"}}{{end}}
{{if (index .Labels "type")}}*type*：{{index .Labels "type"}}{{end}}
{{if (index .Labels "topic")}}*topic*：{{index .Labels "topic"}}{{end}}
{{if (index .Labels "cpu")}}*cpu*：{{index .Labels "cpu"}}{{end}}
{{if (index .Labels "device")}}*device*：{{index .Labels "device"}}{{end}}
{{if (index .Labels "path")}}*path*：{{index .Labels "path"}}{{end}}
{{if (index .Labels "fstype")}}*fstype*：{{index .Labels "fstype"}}{{end}}
{{if (index .Labels "name")}}*name*：{{index .Labels "name"}}{{end}}
{{if (index .Labels "mode")}}*mode*：{{index .Labels "mode"}}{{end}}
{{if (index .Labels "runbook_url")}}*runbook_url*：{{index .Labels "runbook_url"}}{{end}}
```

## Microsoft Teams 应用
您需要预先配置 __集成中心-即时消息- Microsoft Teams__ 集成，才能发送消息卡片。如果不设置自定义内容，将采用系统默认模板，仅渲染常见标签信息：

```
{{if .Description}}**description** :{{toHtml .Labels.body_text .Description}}{{end}}
{{if .Labels.resource}}**resource** : {{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{range $k, $v := .Labels}}
{{if not (in $k "resource" "body_text" "body_text_with_table")}}**{{$k}}** : {{toHtml $v}}{{end}}{{end}}
```

如下图所示：

<img src="https://fcdoc.github.io/img/zh/BAqnlzAiIJTgO4QpAvulu4fB62HIMfiWSXjldSxB5Uk.avif" alt="drawing" style="display: block; margin: 0 auto;" width="300"/>

如果您期望仅展示关键标签信息，可以参照下边的代码段：

- 我们列出了一些常见标签，您可自行删减；
- 消息可以发送长度为 28KB 左右字节，超出后报错；
- 在 Microsoft Teams 应用中，系统会自动帮您删除（因标签不存在导致的）渲染空行，您可放心配置

```
{{if (index .Labels "resource")}}**resource**：{{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{if (index .Labels "metric")}}**metric**：{{index .Labels "metric"}}{{end}}
{{if (index .Labels "prom_ql")}}**prom_ql**：{{toHtml (index .Labels "prom_ql")}}{{end}}
{{if (index .Labels "trigger_value")}}**trigger_value**：{{index .Labels "trigger_value"}}{{end}}
{{if (index .Labels "host_ql")}}**host_ql**：{{index .Labels "host_ql"}}{{end}}
{{if (index .Labels "region")}}**region**：{{index .Labels "region"}}{{end}}
{{if (index .Labels "cluster")}}**cluster**：{{index .Labels "cluster"}}{{end}}
{{if (index .Labels "business")}}**business**：{{index .Labels "business"}}{{end}}
{{if (index .Labels "service")}}**service**：{{index .Labels "service"}}{{end}}
{{if (index .Labels "env")}}**env**：{{index .Labels "env"}}{{end}}
{{if (index .Labels "type")}}**type**：{{index .Labels "type"}}{{end}}
{{if (index .Labels "topic")}}**topic**：{{index .Labels "topic"}}{{end}}
{{if (index .Labels "cpu")}}**cpu**：{{index .Labels "cpu"}}{{end}}
{{if (index .Labels "device")}}**device**：{{index .Labels "device"}}{{end}}
{{if (index .Labels "path")}}**path**：{{index .Labels "path"}}{{end}}
{{if (index .Labels "fstype")}}**fstype**：{{index .Labels "fstype"}}{{end}}
{{if (index .Labels "name")}}**name**：{{index .Labels "name"}}{{end}}
{{if (index .Labels "mode")}}**mode**：{{index .Labels "mode"}}{{end}}
{{if (index .Labels "runbook_url")}}**runbook_url**：{{index .Labels "runbook_url"}}{{end}}
```

## Microsoft Teams 应用
您需要预先配置 __集成中心-即时消息- Microsoft Teams__ 集成，才能发送消息卡片。如果不设置自定义内容，将采用系统默认模板，仅渲染常见标签信息：

```
{{if .Description}}**description** :{{toHtml .Labels.body_text .Description}}{{end}}
{{if .Labels.resource}}**resource** : {{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{range $k, $v := .Labels}}
{{if not (in $k "resource" "body_text" "body_text_with_table")}}**{{$k}}** : {{toHtml $v}}{{end}}{{end}}
```

如下图所示：

<img src="https://fcdoc.github.io/img/zh/BAqnlzAiIJTgO4QpAvulu4fB62HIMfiWSXjldSxB5Uk.avif" alt="drawing" style="display: block; margin: 0 auto;" width="300"/>

如果您期望仅展示关键标签信息，可以参照下边的代码段：

- 我们列出了一些常见标签，您可自行删减；
- 消息可以发送长度为 28KB 左右字节，超出后报错；
- 在 Microsoft Teams 应用中，系统会自动帮您删除（因标签不存在导致的）渲染空行，您可放心配置

```
{{if (index .Labels "resource")}}**resource**：{{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{if (index .Labels "metric")}}**metric**：{{index .Labels "metric"}}{{end}}
{{if (index .Labels "prom_ql")}}**prom_ql**：{{toHtml (index .Labels "prom_ql")}}{{end}}
{{if (index .Labels "trigger_value")}}**trigger_value**：{{index .Labels "trigger_value"}}{{end}}
{{if (index .Labels "host_ql")}}**host_ql**：{{index .Labels "host_ql"}}{{end}}
{{if (index .Labels "region")}}**region**：{{index .Labels "region"}}{{end}}
{{if (index .Labels "cluster")}}**cluster**：{{index .Labels "cluster"}}{{end}}
{{if (index .Labels "business")}}**business**：{{index .Labels "business"}}{{end}}
{{if (index .Labels "service")}}**service**：{{index .Labels "service"}}{{end}}
{{if (index .Labels "env")}}**env**：{{index .Labels "env"}}{{end}}
{{if (index .Labels "type")}}**type**：{{index .Labels "type"}}{{end}}
{{if (index .Labels "topic")}}**topic**：{{index .Labels "topic"}}{{end}}
{{if (index .Labels "cpu")}}**cpu**：{{index .Labels "cpu"}}{{end}}
{{if (index .Labels "device")}}**device**：{{index .Labels "device"}}{{end}}
{{if (index .Labels "path")}}**path**：{{index .Labels "path"}}{{end}}
{{if (index .Labels "fstype")}}**fstype**：{{index .Labels "fstype"}}{{end}}
{{if (index .Labels "name")}}**name**：{{index .Labels "name"}}{{end}}
{{if (index .Labels "mode")}}**mode**：{{index .Labels "mode"}}{{end}}
{{if (index .Labels "runbook_url")}}**runbook_url**：{{index .Labels "runbook_url"}}{{end}}
```

## 飞书机器人
飞书机器人仅支持发送纯文本消息。

- 消息__最大长度为4000字节，超出后截断发送__；
- 如果文本中包含`<br>`，渲染时会__先删除空行，再将`<br>`替换为换行符__；
- 如果不设置自定义内容，将采用系统默认模板，仅展示关键信息：

```
{{fireReason .}}INC #{{.Num}} {{toHtml .Title}}
-----
协作空间：{{if .ChannelName}}{{.ChannelName}}{{else}}无{{end}}
严重程度：{{.IncidentSeverity}}
触发时间：{{date "2006-01-02 15:04:05" .StartTime}}
持续时长：{{ago .StartTime}}{{if gt .AlertCnt 1}}
聚合告警：{{.AlertCnt}}条{{end}}{{if .Labels.resource}}
告警对象：{{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}{{if .Description}}
故障描述：{{toHtml .Description}}{{end}}{{if gt (len .Responders) 0}}
分派人员：{{range .Responders}}@{{.PersonName}} {{end}}{{end}}
<br>详情：{{.DetailUrl}}
```

## 钉钉机器人
钉钉机器人仅支持发送 Markdown 消息（[语法限制](https://open.dingtalk.com/document/robots/custom-robot-access#title-7ur-3ok-s1a)）。

- 消息__最大长度为4000字节，超出后截断发送__；
- 如果文本中包含`<br>`，渲染时会__先删除空行，再将`<br>`替换为换行符__；
- 如果不设置自定义内容，将采用系统默认模板，仅展示关键信息：

```
{{fireReason .}}INC [#{{.Num}}]({{.DetailUrl}}) {{toHtml .Title}}

- 协作空间：{{if .ChannelName}}{{.ChannelName}}{{else}}无{{end}}
- 严重程度：{{$s := colorSeverity .IncidentSeverity}}{{toHtml $s}}
- 触发时间：{{date "2006-01-02 15:04:05" .StartTime}}
- 持续时长：{{ago .StartTime}}{{if gt .AlertCnt 1}}
- 聚合告警：{{.AlertCnt}}条{{end}}{{if .Labels.resource}}
- 告警对象：{{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}{{if .Description}}
- 故障描述：{{toHtml .Description}}{{end}}{{if gt (len .Responders) 0}}
- 分派人员：{{range .Responders}}@{{.PersonName}} {{end}}{{end}}
<br>[详情]({{.DetailUrl}})|[认领]({{.DetailUrl}}?ack=1)
```

## 企业微信机器人
企微机器人仅支持发送 Markdown 消息（[语法限制](https://developer.work.weixin.qq.com/document/path/91770#markdown%E7%B1%BB%E5%9E%8B)）。

- 消息__最大长度为4000字节，超出后截断发送__；
- 如果文本中包含`<br>`，渲染时会__先删除空行，再将`<br>`替换为换行符__；
- 如果不设置自定义内容，将采用系统默认模板，仅展示关键信息：

```
{{fireReason .}}**INC [#{{.Num}}]({{.DetailUrl}}) {{toHtml .Title}}**
> 协作空间：<font color="warning">{{if .ChannelName}}{{.ChannelName}}{{else}}无{{end}}</font>
> 严重程度：<font color="warning">{{.IncidentSeverity}}</font>
> 触发时间：{{date "2006-01-02 15:04:05" .StartTime}}
> 持续时长：{{ago .StartTime}}{{if gt .AlertCnt 1}}
> 聚合告警：{{.AlertCnt}}条{{end}}{{if .Labels.resource}}
> 告警对象：{{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}{{if .Description}}
> 故障描述：{{toHtml .Description}}{{end}}{{if gt (len .Responders) 0}}
> 分派人员：{{range .Responders}}@{{.PersonName}} {{end}}{{end}}
<br>[详情]({{.DetailUrl}})|[认领]({{.DetailUrl}}?ack=1)
```

## Telegram 机器人
- 配置国内能访问的Telegram服务地址；
- 消息__最大长度为4096字符，超出后不发送__；
- 如果文本中包含`<br>`，渲染时会__先删除空行，再将`<br>`替换为换行符__；
- 如果不设置自定义内容，将采用系统默认模板，仅展示关键信息：

```
{{fireReason .}}INC [#{{.Num}}]({{.DetailUrl}}) {{toHtml .Title}}
-----
协作空间：{{if .ChannelName}}{{.ChannelName}}{{else}}无{{end}}
严重程度：{{.IncidentSeverity}}
触发时间：{{date "2006-01-02 15:04:05" .StartTime}}
持续时长：{{ago .StartTime}}{{if gt .AlertCnt 1}}
聚合告警：{{.AlertCnt}}条{{end}}{{if .Labels.resource}}
告警对象：{{toHtml (joinAlertLabels . "resource" ", ")}}({{.Labels.resource}}){{end}}{{if .Description}}
故障描述：{{toHtml .Description}}{{end}}{{if gt (len .Responders) 0}}
分派人员：{{range .Responders}}@{{.PersonName}} {{end}}{{end}}

<br>[详情]({{.DetailUrl}})|[认领]({{.DetailUrl}}?ack=1)
```

## Slack 机器人
- 消息__可以发送长度为15000左右字符，超出后截断发送__；
- 如果文本中包含`<br>`，渲染时会__先删除空行，再将`<br>`替换为换行符__；
- 如果不设置自定义内容，将采用系统默认模板，仅展示关键信息：

```
{{fireReason .}}INC <{{.DetailUrl}}|#{{.Num}}> {{toHtml .Title}}
-----
协作空间：{{if .ChannelName}}{{.ChannelName}}{{else}}无{{end}}
严重程度：{{.IncidentSeverity}}
触发时间：{{date "2006-01-02 15:04:05" .StartTime}}
持续时长：{{ago .StartTime}}{{if gt .AlertCnt 1}}
聚合告警：{{.AlertCnt}}条{{end}}{{if .Labels.resource}}
告警对象：{{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}{{if .Description}}
故障描述：{{toHtml .Description}}{{end}}{{if gt (len .Responders) 0}}
分派人员：{{range .Responders}}@{{.PersonName}} {{end}}{{end}}
-----
<br><{{.DetailUrl}}|详情>|<{{.DetailUrl}}?ack=1|认领>
```

## Zoom 机器人
- 消息__可以发送长度为4000左右字符，超出后截断发送__；
- 如果文本中包含`<br>`，渲染时会__先删除空行，再将`<br>`替换为换行符__；
- 消息格式 __遵循Zoom消息格式__，当前机器人应用不支持Markdown，其他格式可以参考官网: https://developers.zoom.us/docs/team-chat-apps/customizing-messages/
- 如果不设置自定义内容，将采用系统默认模板，仅展示关键信息：

```
{"head": {
"text": "{{fireReason .}}INC [#{{.Num}}] {{toHtml .Title}}",
"style": {
"bold": true,
"italic": false,
"color": "{{$s := serverityToColor .IncidentSeverity}}{{toHtml $s}}"
}
},
"body": [
{
"type": "message",
"text": "协作空间：{{if .ChannelName}}{{.ChannelName}}{{else}}无{{end}}",
"style": {
"bold": false,
"italic": false
}
},
{
"type": "message",
"text": "严重程度：{{.IncidentSeverity}}",
"style": {
"bold": false,
"italic": false,
"color": "{{$s := serverityToColor .IncidentSeverity}}{{toHtml $s}}"
}
},
{
"type": "message",
"text": "持续时长：{{ago .StartTime}}{{if gt .AlertCnt 1}}",
"style": {
"bold": false,
"italic": false
}
},
{
"type": "message",
"text": "聚合告警：{{.AlertCnt}}条{{end}}{{if .Labels.resource}}",
"style": {
"bold": false,
"italic": false
}
},
{
"type": "message",
"text": "告警对象：{{.Labels.resource}}{{end}}{{if .Description}}",
"style": {
"bold": false,
"italic": false
}
},
{
"type": "message",
"text": "故障描述：{{toHtml .Description}}{{end}}{{if gt (len .Responders) 0}}",
"style": {
"bold": false,
"italic": false
}
},
{
"type": "message",
"text": "分派人员：{{range .Responders}}@{{.PersonName}}{{end}}{{end}}",
"style": {
"bold": false,
"italic": false
}
},
{
"type": "message",
"text": "查看详情",
"link": "{{.DetailUrl}}{{if .IsFlapping}}"
},
{
"type": "message",
"text": "注意：当前故障状态变化频繁，将收敛通知{{.Flapping.MuteMinutes}}分钟，建议您优化告警策略。{{end}}{{if .IsInStorm}}",
"style": {
"bold": true,
"italic": false
}
},
{
"type": "message",
"text": "注意：当前故障已聚合{{.AlertCnt}}条告警，触发告警风暴，请加急处理！{{end}}",
"style": {
"bold": true,
"italic": false
}
}
]
}
```

## 短信
如果不设置自定义内容，将采用系统默认模板渲染通知：

```
您有故障待处理：{{toHtml .Title}}，协作空间：{{.ChannelName}}，等级：{{.IncidentSeverity}}{{if gt .AlertCnt 1}}，共聚合{{.AlertCnt}}条告警{{end}}
```

## 邮件
如果不设置自定义内容，将采用系统默认模板渲染通知：

```
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>{{.Title}}</title>
<html lang="zh">

<head data-id="__react-email-head">
<style>
.bg-Critical { background-color: #C80000; }
.bg-Warning { background-color: #FA7D00; }
.bg-Info { background-color: #FABE00; }
.bg-Ok { background-color: rgb(132 204 22); }
.text-Critical { color: #C80000; }
.text-Warning { color: #FA7D00; }
.text-Info { color: #FABE00; }
.text-Ok { color: rgb(132 204 22); }
.text-title {font-weight:500;width:6rem;flex-shrink:0}
.text-content {color:rgb(55,65,81)}
</style>
</head>

<body data-id="__react-email-body" style="background-color:rgb(255,255,255);border-radius:0.25rem;margin-top:2.5rem;margin-bottom:2.5rem;margin-left:auto;margin-right:auto;padding:1rem;min-width:400px;max-width:660px;font-family:ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji">
<div style="width:100%;height:0.375rem;margin-bottom:2rem" class="bg-{{.IncidentSeverity}}"></div>
<div style="display:flex;align-items:center;margin-bottom:1.5rem">
<div style="display:flex;align-items:flex-end;gap:1rem"><img witdh="120" data-id="react-email-img" src="https://fcdoc.github.io/img/zh/5sp7YaSh-LnDzReB0Qnd3HSfrGRY6X8Amie5S-FmmNc.avif" height="40" style="display:block;outline:none;border:none;text-decoration:none" /><span style="font-size:1.25rem;line-height:1.75rem;font-weight:600">您有故障待处理</span></div>
</div>
<div style="background-color:rgb(243,244,246);padding:2rem;margin-top:1rem;border-radius:0.5rem">
<div style="display:flex;flex-direction:column;gap:0.75rem">
<div style="display:flex">
<div class="text-title">故障标题</div>
<div class="text-content">{{.Title}}</div>
</div>
<div style="display:flex">
<div class="text-title">严重程度</div>
<div class="text-{{.IncidentSeverity}}">{{.IncidentSeverity}}</div>
</div>
<div style="display:flex">
<div class="text-title">协作空间</div>
<div class="text-content">{{if .ChannelName}}{{.ChannelName}}{{else}}无{{end}}</div>
</div>
<div style="display:flex">
<div class="text-title">触发时间</div>
<div class="text-content">{{date "2006-01-02 15:04:05" .StartTime}}</div>
</div>
{{if .CreatorID}}
<div style="display:flex">
<div class="text-title">发起人员</div>
<div class="text-content">{{.Creator.PersonName}}</div>
</div>
{{end}}
{{if gt (len .Responders) 0}}
<div style="display:flex">
<div class="text-title">分派人员</div>
<div class="text-content">{{range .Responders}}@{{.PersonName}} {{end}}</div>
</div>
{{end}}
<div style="display:flex">
<div class="text-title">处理进度</div>
<div class="text-content">{{.Progress}}</div>
</div>
<div style="display:flex">
<div class="text-title">故障描述</div>
<div style="color:rgb(55,65,81);margin-top:0.125rem">
<div data-id="react-email-markdown">{{toHtml .Description}}</div>
</div>
</div>
{{if .Labels.resource}}
<div style="display:flex;margin-bottom:0.5rem;">
<div style="color:#000;font-weight:500;width:6rem;margin-right:1rem;">告警对象</div>
<div style="color:rgb(55,65,81);margin-top:0.125rem">
<div data-id="react-email-markdown">{{toHtml (joinAlertLabels . "resource" ", ")}}</div>
</div>
</div>
{{end}}
</div>
<div style="display:flex;gap:1rem;margin-top:2rem"><a href="{{.DetailUrl}}?ack=1" data-id="react-email-button" target="_blank" style="line-height:100%;text-decoration:none;display:inline-block;max-width:100%;padding:0px 0px"><span></span><span style="max-width:100%;display:inline-block;line-height:120%;mso-padding-alt:0px;mso-text-raise:0"><div style="padding-left:2rem;padding-right:2rem;padding-top:0.5rem;padding-bottom:0.5rem;background-color:rgb(108,83,177);border-radius:0.25rem;font-size:1rem;line-height:1.5rem;color:rgb(255,255,255);font-weight:600;transition-property:color, background-color, border-color, text-decoration-color, fill, stroke, opacity, box-shadow, transform, filter, backdrop-filter;transition-timing-function:cubic-bezier(0.4, 0, 0.2, 1);transition-duration:150ms">立即认领</div></span><span></span></a><a href="{{.DetailUrl}}" data-id="react-email-button" target="_blank" style="color:#61dafb;line-height:100%;text-decoration:none;display:inline-block;max-width:100%;padding:0px 0px"><span></span><span style="max-width:100%;display:inline-block;line-height:120%;mso-padding-alt:0px;mso-text-raise:0"><div style="padding-left:2rem;padding-right:2rem;padding-top:0.5rem;padding-bottom:0.5rem;background-color:rgb(255,255,255);border-width: 1px;border-style:solid;border-color:rgb(229,231,235);border-radius:0.25rem;font-size:1rem;line-height:1.5rem;color:rgb(0,0,0);font-weight:600">查看详情</div></span><span></span></a></div>
</div>
<div style="display:flex;justify-content:flex-end;align-items:flex-end;margin-top:2rem">
<div style="font-size:0.875rem;line-height:1.25rem;font-weight:500">ALL RIGHTS RESERVED © 北京快猫星云科技有限公司</div>
</div>
</body>

</html>
```

如下图所示：

<img src="https://fcdoc.github.io/img/zh/t84afsCGAkRd_qtwBXqtWMEseQIZRcdCoeRYViFtl8Y.avif" alt="drawing" style="display: block; margin: 0 auto;" width="500"/>