---
brief: By customizing configuration templates, you can achieve personalized notification content
---

# Configure Notification Template

## What Scenarios Would Use Templates?
When the system __dispatches an incident__ , it uses templates to render [Incident](#Incident) and trigger notifications. Dispatch may occur in the following scenarios:

1. Manually create an incident and dispatch it
2. When an alert event is reported, the system automatically generates an incident and dispatches it according to the matching dispatch strategy
3. After an incident is created, manually change the dispatch, i.e., re-dispatch
4. According to the dispatch policy settings, the system automatically upgrades the dispatch
5. An incident is closed and reopened, and reassigned according to the previous settings

We use **Golang template syntax** [template/html](/0) to parse data, and you can complete any complex rendering requirements.

- Please refer to the Chinese documentation [here](https://www.topgoer.com/%E5%B8%B8%E7%94%A8%E6%A0%87%E5%87%86%E5%BA%93/template.html#%E6%A8%A1%E6%9D%BF%E8%AF%AD%E6%B3%95). It supports logical judgment, loops, pipelines, and common functions;
- We have quoted the open-source library [sprig](https://github.com/flashcatcloud/sprig/tree/flashcat), which includes hundreds of commonly used functions that you can call directly in the template;
- If you want to introduce more functions, you are welcome to submit a merge request

## What Variables Can I Reference?
**Example of Referencing Variables**:

```i18n
// Reference title
{{.Title}}

// Reference initiator name
{{.Creator.PersonName}}

// Reference resource tag value
{{.Labels.resource}}

// Reference the tag value with "." in the name
{{index .Labels "A.B"}}
```

**Complete Variable List** (direct reference):
<span id="Incident"></span>
Field|Type|Required|Description
:-:|:-:|:-:|:---
ID | string | Yes | incident ID
`Title` | string | Yes | Incident title
`Description` | string | Yes | Incident description, may be empty
DetailUrl | string | Yes | Incident details page URL
Num | string | Yes | Incident short identifier, used only for easy visual identification, may be repeated
`IncidentSeverity` | string | Yes | Severity, enumeration values: Critical, Warning, Info
IncidentStatus | string | Yes | Incident status, enumeration values: Critical, Warning, Info, Ok
`Progress` | string | Yes | Processing progress, enumeration values: Triggered, Processing, Closed
`StartTime` | int64 | Yes | Trigger time, Unix seconds timestamp
LastTime | int64 | No | Latest event time, the latest combined event time in the associated alert, Unix seconds timestamp, default is 0
EndTime | int64 | No | Recovery time, when all associated alerts are recovered, the incident will automatically recover and close. Unix seconds timestamp, default is 0
SnoozedBefore | int64 | No | Suppression deadline, Unix seconds timestamp, default is 0
AckTime | int64 | No | First claim time, Unix seconds timestamp, default is 0
CloseTime | int64 | No | Closing time, end_time is the incident time, close_time is the closing time of the processing progress, Incident it will automatically close during recovery, Incident and manual closing will not affect incident recovery. Unix seconds timestamp, default is 0
Creator | [Person](#Person) | No | Initiator information, does not exist when the system automatically generates it
Closer | [Person](#Person) | No | Closer information, does not exist when the incident automatically recovers
AssignedTo | [Assignment](Assignment) | No | Dispatch configuration
Responders | [][Responder](#Responder) | No | Handler list, initialized according to the dispatch configuration. If a non-assigned person claims the incident, there will also be a corresponding record
ChannelID | int64 | No | Collaboration space ID, the value is 0 when a global incident is manually created
ChannelName | string | No | Collaboration space name
GroupMethod | string | No | Aggregation method, enumeration values: n: no aggregation, p: aggregation by rules, i: intelligent aggregation
`Labels` | map[string]string | No | Tags KV, Key and Value are both strings. There is no such information when created manually. When created automatically, it is the label information of the first alert in the aggregation
AlertCnt | int64 | Yes | Number of associated alerts
Alerts | [][Alert](#Alert) | No | Associated alert details, there is no such information when manually created
FireType | string | No | Notification type, enumeration values: fire: notification, refire: circular notification
IsFlapping | bool | No | Whether it is in a jittering state, i.e., occurs and recovers frequently, is related to the convergence configuration
Impact | string | No | Incident impact, filled in after the incident is closed
RootCause | string | No | Incident root cause, filled in after the incident is closed
Resolution | string | No | Incident solution, filled in after the incident is closed

<span id="Person"></span>
**Person** (indirect reference):
Field|Type|Required|Description
:-:|:-:|:-:|:---
person_id | int64 | Yes | Person ID
person_name | string | Yes | Person name
email | string | Yes | Email address

<span id="Assignment"></span>
**Assignment** (indirect reference):
Field|Type|Required|Description
:-:|:-:|:-:|:---
PersonIDs | []string| No | List of person IDs, only exists when assigned by person
EscalateRuleID | string | No | Dispatch policy ID, present only when dispatching according to policy
EscalateRuleName | string | No | Dispatch policy name
LayerIdx | string | No | Dispatch stage, corresponding to the hierarchical index of the dispatch strategy, starting from 0
Type | string | Yes | Dispatch type, enumeration values: assign: assign, reassign: reassign, escalate: upgrade dispatch, reopen: reopen dispatch

<span id="Responder"></span>
**Responder** (indirect reference):
Field|Type|Required|Description
:-:|:-:|:-:|:---
PersonID | int64 | Yes | Person ID
PersonName | string | Yes | Person name
Email | string | Yes | Email address
AssignedAt | int64 | Yes | Dispatch time, Unix seconds timestamp, default is 0
AcknowledgedAt | int64 | No | Claim time, Unix seconds timestamp, default is 0

<span id="Alert"></span>
**Alert** (indirect reference):
Field|Type|Required|Description
:-:|:-:|:-:|:---
Title | string | Yes | Alert title
Description | string | Yes | Alert description, may be empty
AlertSeverity | string | Yes | Severity, enumeration values: Critical, Warning, Info
AlertStatus | string | Yes | Alert status, enumeration values: Critical, Warning, Info, Ok
Progress | string | Yes | Processing progress, enumeration values: Triggered, Processing, Closed
StartTime | int64 | Yes | Trigger time, Unix seconds timestamp
EndTime | int64 | No | Recovery time, Unix seconds timestamp, default is 0
CloseTime | int64 | No | Closing time, EndTime is the alert recovery time, and CloseTime is the closing time of the processing progress. Alert will be automatically closed when it is restored. Manually closing Alert will not affect alert recovery. Unix seconds timestamp, default is 0
`Labels` | map[string]string | No | Tags KV, Key and Value are both strings

## Frequently Asked Questions
1. **How do I know what specific tag information `Labels` has?**

- Manually created incidents have no labels;
- The automatically created incident tag exists, which is the same as the tag of the first alert that was merged. Go to the **incident list** page, find an item incident and view the details incident , and you can see all tag information.

2. **Why does the actual content sent use the __default template__ even though I configured rendering according to a custom template?**

- When creating a custom template, the system uses mock data to render the template to check for syntax errors;
- Mock data covers limited scenarios and may not match some of the logical branches in your template. During actual operation, rendering may fail;
- After rendering fails, the system will use the default template to ensure that the message is delivered;
- It is recommended that you use logical judgment to avoid rendering exceptions when you are not sure whether the reference variable exists, such as the `resource` tag:

```i18n
// Wrong approach: reading the tag directly
{{.Labels.resource}}

// Recommended approach: judge first, then read the tag
{{if .Labels.resource}}{{.Labels.resource}}{{end}}
```

3. **Why does the incident title contain __character escapes such as " > "__?**

```i18n
// Use toHtml function
{{toHtml .Title}}

// Use the first non-null value for rendering to avoid writing complex if logic
{{toHtml .Title .TitleEnglish}}
```

4. **Time variables are all timestamp types. __How to convert the time format__?**

```i18n
// date function, convert timestamp into readable format
// "2006-01-02 15:04:05" is a common format, please search the internet for more formats
{{date "2006-01-02 15:04:05" .StartTime}}

// ago function, convert the time difference into a readable format
{{ago .StartTime}}
```

5. **How to reference external variables inside a for loop?**
```i18n
// Add a "$" before external variables
{{range .Responders}}
{{if eq $.Progress "Triggered"}}
【Pending】{{.Email}}
{{end}}
{{end}}
```
6. **How to extract the value of a field with "." in the name, such as the information of "obj.instance" in the label?**

```i18n
// Use the index function
{{index .Labels "obj.instance"}}
```

7. **How to extract the information of a label in an incident-associated alert and remove duplicates?**

```i18n
// Use the alertLabels function to get the deduplicated array
{{alertLabels . "resource"}}

// Use the joinAlertLabels function to get the deduplicated array, and then splice it into a string according to "sep"
{{joinAlertLabels . "resource" "sep"}}
```

8. **How to loop through and print labels?**

```i18n
// Complete traversal
{{range $k, $v := .Labels}}
{{$k}} : {{toHtml $v}}
{{end}}

// Exclude a single label
{{range $k, $v := .Labels}}
{{if ne $k "resource"}}
{{$k}} : {{toHtml $v}}
{{end}}
{{end}}

// Exclude multiple labels
{{range $k, $v := .Labels}}
{{if not (in $k "resource" "body_text")}}
{{$k}} : {{toHtml $v}}
{{end}}
{{end}}

```

9. **How can I view more functions and examples of their use?**
- Function list: https://github.com/flashcatcloud/sprig/blob/master/functions.go#L97
- Usage example: View the corresponding _test.go file, such as date test case see [https://github.com/flashcatcloud/sprig/blob/master/date_test.go](https://github.com/flashcatcloud/sprig/blob/master/date_test.go)

The following are specific descriptions of each notification channel.

## Feishu Application
You need to pre-configure **the integration center - Instant Messaging -** integration to send message cards. If no custom content is set, the system default template will be used to render all label information:

```
{{if .Description}}**description** :{{toHtml .Labels.body_text .Description}}{{end}}
{{if .Labels.resource}}**resource** : {{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{range $k, $v := .Labels}}
{{if not (in $k "resource" "body_text")}}**{{$k}}** : {{toHtml $v}}{{end}}{{end}}
```

As shown below:

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/template/1.avif" alt="drawing" style="display: block; margin: 0 auto;" width="500"/>

If you want to display only key tag information, you can refer to the following code snippet:

- We have listed some common tags that you can delete at your own pace;
- In the Feishu app, the system will automatically delete empty rendering lines (caused by the non-existence of tags) for you, and you can configure it with confidence

```i18n
{{if (index .Labels "resource")}}resource: {{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{if (index .Labels "check")}}check: {{toHtml (index .Labels "check")}}{{end}}
{{if (index .Labels "metric")}}metric: {{index .Labels "metric"}}{{end}}
{{if (index .Labels "prom_ql")}}prom_ql: {{toHtml (index .Labels "prom_ql")}}{{end}}
{{if (index .Labels "host_ql")}}host_ql: {{toHtml (index .Labels "host_ql")}}{{end}}
{{if (index .Labels "trigger_value")}}trigger_value: {{index .Labels "trigger_value"}}{{end}}
{{if (index .Labels "region")}}region: {{index .Labels "region"}}{{end}}
{{if (index .Labels "cluster")}}cluster: {{index .Labels "cluster"}}{{end}}
{{if (index .Labels "business")}}business: {{index .Labels "business"}}{{end}}
{{if (index .Labels "service")}}service: {{index .Labels "service"}}{{end}}
{{if (index .Labels "env")}}env: {{index .Labels "env"}}{{end}}
{{if (index .Labels "type")}}type: {{index .Labels "type"}}{{end}}
{{if (index .Labels "topic")}}topic: {{index .Labels "topic"}}{{end}}
{{if (index .Labels "cpu")}}cpu: {{index .Labels "cpu"}}{{end}}
{{if (index .Labels "device")}}device: {{index .Labels "device"}}{{end}}
{{if (index .Labels "path")}}path: {{index .Labels "path"}}{{end}}
{{if (index .Labels "fstype")}}fstype: {{index .Labels "fstype"}}{{end}}
{{if (index .Labels "name")}}name: {{index .Labels "name"}}{{end}}
{{if (index .Labels "mode")}}mode: {{index .Labels "mode"}}{{end}}
{{if (index .Labels "runbook_url")}}runbook_url: {{toHtml (index .Labels "runbook_url")}}{{end}}
```

## DingTalk Application
You need to pre-configure **the integration center - Instant Messaging -** integration before you can send message cards. If no custom content is set, the system default template will be used to render all label information:

```
{{if .Description}}**description** :{{toHtml .Labels.body_text .Description}}{{end}}
{{if .Labels.resource}}**resource** : {{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{range $k, $v := .Labels}}
{{if not (in $k "resource" "body_text")}}**{{$k}}** : {{toHtml $v}}{{end}}{{end}}
```

As shown below:

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/template/2.avif" alt="drawing" style="display: block; margin: 0 auto;" width="500"/>

If you want to display only key tag information, you can refer to the following code snippet:

- We have listed some common tags that you can delete at your own pace;
- In the DingTalk application, the system will automatically delete empty rendering lines (caused by the non-existence of tags) for you, and you can configure it with confidence

```i18n
{{if (index .Labels "resource")}}**resource**: {{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{if (index .Labels "metric")}}**metric**: {{index .Labels "metric"}}{{end}}
{{if (index .Labels "prom_ql")}}**prom_ql**: {{toHtml (index .Labels "prom_ql")}}{{end}}
{{if (index .Labels "trigger_value")}}**trigger_value**: {{index .Labels "trigger_value"}}{{end}}
{{if (index .Labels "host_ql")}}**host_ql**: {{toHtml (index .Labels "host_ql")}}{{end}}
{{if (index .Labels "region")}}**region**: {{index .Labels "region"}}{{end}}
{{if (index .Labels "cluster")}}**cluster**: {{index .Labels "cluster"}}{{end}}
{{if (index .Labels "business")}}**business**: {{index .Labels "business"}}{{end}}
{{if (index .Labels "service")}}**service**: {{index .Labels "service"}}{{end}}
{{if (index .Labels "env")}}**env**: {{index .Labels "env"}}{{end}}
{{if (index .Labels "type")}}**type**: {{index .Labels "type"}}{{end}}
{{if (index .Labels "topic")}}**topic**: {{index .Labels "topic"}}{{end}}
{{if (index .Labels "cpu")}}**cpu**: {{index .Labels "cpu"}}{{end}}
{{if (index .Labels "device")}}**device**: {{index .Labels "device"}}{{end}}
{{if (index .Labels "path")}}**path**: {{index .Labels "path"}}{{end}}
{{if (index .Labels "fstype")}}**fstype**: {{index .Labels "fstype"}}{{end}}
{{if (index .Labels "name")}}**name**: {{index .Labels "name"}}{{end}}
{{if (index .Labels "mode")}}**mode**: {{index .Labels "mode"}}{{end}}
{{if (index .Labels "runbook_url")}}**runbook_url**: {{index .Labels "runbook_url"}}{{end}}
```

## Enterprise WeChat Application

You need to pre-configure **the integration center - Instant Messaging - EnterpriseWeChat** integration to send message cards. If no custom content is set, the system default template will be used and only common tag information will be rendered:

- We have listed some common tags that you can delete at your own pace;
- In the Enterprise WeChat application, the system will automatically delete the rendering blank lines (caused by the non-existence of the label) for you, and you can configure it with confidence

```i18n
{{if (index .Labels "resource")}}resource: {{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{if (index .Labels "metric")}}metric: {{index .Labels "metric"}}{{end}}
{{if (index .Labels "prom_ql")}}prom_ql: {{toHtml (index .Labels "prom_ql")}}{{end}}
{{if (index .Labels "trigger_value")}}trigger_value: {{index .Labels "trigger_value"}}{{end}}
{{if (index .Labels "host_ql")}}host_ql: {{toHtml (index .Labels "host_ql")}}{{end}}
{{if (index .Labels "region")}}region: {{index .Labels "region"}}{{end}}
{{if (index .Labels "cluster")}}cluster: {{index .Labels "cluster"}}{{end}}
{{if (index .Labels "business")}}business: {{index .Labels "business"}}{{end}}
{{if (index .Labels "service")}}service: {{index .Labels "service"}}{{end}}
{{if (index .Labels "env")}}env: {{index .Labels "env"}}{{end}}
{{if (index .Labels "type")}}type: {{index .Labels "type"}}{{end}}
{{if (index .Labels "topic")}}topic: {{index .Labels "topic"}}{{end}}
{{if (index .Labels "cpu")}}cpu: {{index .Labels "cpu"}}{{end}}
{{if (index .Labels "device")}}device: {{index .Labels "device"}}{{end}}
{{if (index .Labels "path")}}path: {{index .Labels "path"}}{{end}}
{{if (index .Labels "fstype")}}fstype: {{index .Labels "fstype"}}{{end}}
{{if (index .Labels "name")}}name: {{index .Labels "name"}}{{end}}
{{if (index .Labels "mode")}}mode: {{index .Labels "mode"}}{{end}}
{{if (index .Labels "runbook_url")}}runbook_url: {{toHtml (index .Labels "runbook_url")}}{{end}}
```

As shown below:

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/template/3.avif" alt="drawing" style="display: block; margin: 0 auto;" width="500"/>

**Note that Enterprise WeChat limits the length of the card. In the template rendering area, you can render no more than 8 lines of content, and the part exceeding 8 lines will be hidden.**

## Slack Application
You need to pre-configure **the Integration Center - IM - Slack integration before** you can send message cards. If no custom content is set, the system default template will be used and only common tag information will be rendered:

```
{{if .Description}}*description* :{{toHtml .Labels.body_text .Description}}{{end}}
{{if .Labels.resource}}*resource* : {{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{range $k, $v := .Labels}}
{{if not (in $k "resource" "body_text")}}*{{$k}}* : {{toHtml $v}}{{end}}{{end}}
```

As shown below:

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/template/4.avif" alt="drawing" style="display: block; margin: 0 auto;" width="600"/>

If you want to display only key tag information, you can refer to the following code snippet:

- We have listed some common tags that you can delete at your own pace;
- Messages can be sent with a length of about 15,000 characters, and will be truncated if exceeded;
- In the Slack application, the system will automatically delete the rendering empty lines (caused by the non-existence of the label) for you, and you can configure it with confidence

```i18n
{{if (index .Labels "resource")}}*resource*: {{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{if (index .Labels "metric")}}*metric*: {{index .Labels "metric"}}{{end}}
{{if (index .Labels "prom_ql")}}*prom_ql*: {{toHtml (index .Labels "prom_ql")}}{{end}}
{{if (index .Labels "trigger_value")}}*trigger_value*: {{index .Labels "trigger_value"}}{{end}}
{{if (index .Labels "host_ql")}}*host_ql*: {{index .Labels "host_ql"}}{{end}}
{{if (index .Labels "region")}}*region*: {{index .Labels "region"}}{{end}}
{{if (index .Labels "cluster")}}*cluster*: {{index .Labels "cluster"}}{{end}}
{{if (index .Labels "business")}}*business*: {{index .Labels "business"}}{{end}}
{{if (index .Labels "service")}}*service*: {{index .Labels "service"}}{{end}}
{{if (index .Labels "env")}}*env*: {{index .Labels "env"}}{{end}}
{{if (index .Labels "type")}}*type*: {{index .Labels "type"}}{{end}}
{{if (index .Labels "topic")}}*topic*: {{index .Labels "topic"}}{{end}}
{{if (index .Labels "cpu")}}*cpu*: {{index .Labels "cpu"}}{{end}}
{{if (index .Labels "device")}}*device*: {{index .Labels "device"}}{{end}}
{{if (index .Labels "path")}}*path*: {{index .Labels "path"}}{{end}}
{{if (index .Labels "fstype")}}*fstype*: {{index .Labels "fstype"}}{{end}}
{{if (index .Labels "name")}}*name*: {{index .Labels "name"}}{{end}}
{{if (index .Labels "mode")}}*mode*: {{index .Labels "mode"}}{{end}}
{{if (index .Labels "runbook_url")}}*runbook_url*: {{index .Labels "runbook_url"}}{{end}}
```

## Microsoft Teams Application
You need to pre-configure **the Integration Center - IM - Microsoft Teams integration before** you can send message cards. If no custom content is set, the system default template will be used and only common tag information will be rendered:

```
{{if .Description}}**description** :{{toHtml .Labels.body_text .Description}}{{end}}
{{if .Labels.resource}}**resource** : {{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{range $k, $v := .Labels}}
{{if not (in $k "resource" "body_text" "body_text_with_table")}}**{{$k}}** : {{toHtml $v}}{{end}}{{end}}
```

As shown below:

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/template/5.avif" alt="drawing" style="display: block; margin: 0 auto;" width="300"/>

If you want to display only key tag information, you can refer to the following code snippet:

- We have listed some common tags that you can delete at your own pace;
- The message can be sent with a length of about 28KB bytes, and an error will be reported if it exceeds;
- In the Microsoft Teams application, the system will automatically delete the rendering blank lines (caused by the non-existence of the label) for you, and you can configure it with confidence

```i18n
{{if (index .Labels "resource")}}**resource**: {{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{if (index .Labels "metric")}}**metric**: {{index .Labels "metric"}}{{end}}
{{if (index .Labels "prom_ql")}}**prom_ql**: {{toHtml (index .Labels "prom_ql")}}{{end}}
{{if (index .Labels "trigger_value")}}**trigger_value**: {{index .Labels "trigger_value"}}{{end}}
{{if (index .Labels "host_ql")}}**host_ql**: {{index .Labels "host_ql"}}{{end}}
{{if (index .Labels "region")}}**region**: {{index .Labels "region"}}{{end}}
{{if (index .Labels "cluster")}}**cluster**: {{index .Labels "cluster"}}{{end}}
{{if (index .Labels "business")}}**business**: {{index .Labels "business"}}{{end}}
{{if (index .Labels "service")}}**service**: {{index .Labels "service"}}{{end}}
{{if (index .Labels "env")}}**env**: {{index .Labels "env"}}{{end}}
{{if (index .Labels "type")}}**type**: {{index .Labels "type"}}{{end}}
{{if (index .Labels "topic")}}**topic**: {{index .Labels "topic"}}{{end}}
{{if (index .Labels "cpu")}}**cpu**: {{index .Labels "cpu"}}{{end}}
{{if (index .Labels "device")}}**device**: {{index .Labels "device"}}{{end}}
{{if (index .Labels "path")}}**path**: {{index .Labels "path"}}{{end}}
{{if (index .Labels "fstype")}}**fstype**: {{index .Labels "fstype"}}{{end}}
{{if (index .Labels "name")}}**name**: {{index .Labels "name"}}{{end}}
{{if (index .Labels "mode")}}**mode**: {{index .Labels "mode"}}{{end}}
{{if (index .Labels "runbook_url")}}**runbook_url**: {{index .Labels "runbook_url"}}{{end}}
```

## Microsoft Teams Application
You need to pre-configure **the Integration Center - IM - Microsoft Teams integration before** you can send message cards. If no custom content is set, the system default template will be used and only common tag information will be rendered:

```
{{if .Description}}**description** :{{toHtml .Labels.body_text .Description}}{{end}}
{{if .Labels.resource}}**resource** : {{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{range $k, $v := .Labels}}
{{if not (in $k "resource" "body_text" "body_text_with_table")}}**{{$k}}** : {{toHtml $v}}{{end}}{{end}}
```

As shown below:

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/template/5.avif" alt="drawing" style="display: block; margin: 0 auto;" width="300"/>

If you want to display only key tag information, you can refer to the following code snippet:

- We have listed some common tags that you can delete at your own pace;
- The message can be sent with a length of about 28KB bytes, and an error will be reported if it exceeds;
- In the Microsoft Teams application, the system will automatically delete the rendering blank lines (caused by the non-existence of the label) for you, and you can configure it with confidence

```i18n
{{if (index .Labels "resource")}}**resource**: {{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}
{{if (index .Labels "metric")}}**metric**: {{index .Labels "metric"}}{{end}}
{{if (index .Labels "prom_ql")}}**prom_ql**: {{toHtml (index .Labels "prom_ql")}}{{end}}
{{if (index .Labels "trigger_value")}}**trigger_value**: {{index .Labels "trigger_value"}}{{end}}
{{if (index .Labels "host_ql")}}**host_ql**: {{index .Labels "host_ql"}}{{end}}
{{if (index .Labels "region")}}**region**: {{index .Labels "region"}}{{end}}
{{if (index .Labels "cluster")}}**cluster**: {{index .Labels "cluster"}}{{end}}
{{if (index .Labels "business")}}**business**: {{index .Labels "business"}}{{end}}
{{if (index .Labels "service")}}**service**: {{index .Labels "service"}}{{end}}
{{if (index .Labels "env")}}**env**: {{index .Labels "env"}}{{end}}
{{if (index .Labels "type")}}**type**: {{index .Labels "type"}}{{end}}
{{if (index .Labels "topic")}}**topic**: {{index .Labels "topic"}}{{end}}
{{if (index .Labels "cpu")}}**cpu**: {{index .Labels "cpu"}}{{end}}
{{if (index .Labels "device")}}**device**: {{index .Labels "device"}}{{end}}
{{if (index .Labels "path")}}**path**: {{index .Labels "path"}}{{end}}
{{if (index .Labels "fstype")}}**fstype**: {{index .Labels "fstype"}}{{end}}
{{if (index .Labels "name")}}**name**: {{index .Labels "name"}}{{end}}
{{if (index .Labels "mode")}}**mode**: {{index .Labels "mode"}}{{end}}
{{if (index .Labels "runbook_url")}}**runbook_url**: {{index .Labels "runbook_url"}}{{end}}
```

## Feishu Robot
Feishu Robot only supports sending plain text messages.

- Messages __have a maximum length of 4000 bytes, and will be truncated if exceeded__;
- If the text contains `<br>`, when rendering, __the blank line will be deleted first, and then `<br>` will be replaced with a newline character__;
- If you do not set custom content, the system default template will be used to display only key information:

```i18n
{{fireReason .}}INC #{{.Num}} {{toHtml .Title}}
-----
Collaboration space: {{if .ChannelName}}{{.ChannelName}}{{else}}None{{end}}
Severity: {{.IncidentSeverity}}
Trigger time: {{date "2006-01-02 15:04:05" .StartTime}}
Duration: {{ago .StartTime}}{{if gt .AlertCnt 1}}
Aggregated alerts: {{.AlertCnt}}Items{{end}}{{if .Labels.resource}}
Alert object: {{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}{{if .Description}}
Fault description: {{toHtml .Description}}{{end}}{{if gt (len .Responders) 0}}
Assigned personnel: {{range .Responders}}@{{.PersonName}} {{end}}{{end}}
<br>Details: {{.DetailUrl}}
```

## DingTalk Robot
DingTalk Robot only supports sending Markdown messages ( [grammar restrictions](https://open.dingtalk.com/document/robots/custom-robot-access#title-7ur-3ok-s1a) ).

- Messages __have a maximum length of 4000 bytes, and will be truncated if exceeded__;
- If the text contains `<br>` , when rendering, __the blank lines will be removed first, and then `<br>` will be replaced with a newline character__ ;
- If you do not set custom content, the system default template will be used to display only key information:

```i18n
{{fireReason .}}INC [#{{.Num}}]({{.DetailUrl}}) {{toHtml .Title}}

- Collaborative Space: {{if .ChannelName}}{{.ChannelName}}{{else}}None{{end}}
- Severity: {{$s := colorSeverity .IncidentSeverity}}{{toHtml $s}}
- Trigger Time: {{date "2006-01-02 15:04:05" .StartTime}}
- Duration: {{ago .StartTime}}{{if gt .AlertCnt 1}}
- Aggregated Alerts: {{.AlertCnt}}Items{{end}}{{if .Labels.resource}}
- Alert Object: {{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}{{if .Description}}
- Fault Description: {{toHtml .Description}}{{end}}{{if gt (len .Responders) 0}}
- Assigned Personnel: {{range .Responders}}@{{.PersonName}} {{end}}{{end}}
<br>[Details]({{.DetailUrl}})|[Claim]({{.DetailUrl}}?ack=1)
```

## Enterprise WeChat Robot
The Enterprise WeChat robot only supports sending Markdown messages ([syntax restrictions](https://developer.work.weixin.qq.com/document/path/91770#markdown%E7%B1%BB%E5%9E%8B)).

- The message __can be up to 4000 bytes. If it exceeds this limit, it will be truncated and sent__ ;
- If the text contains `<br>` , when rendering, __the blank lines will be removed first, and then `<br>` will be replaced with a newline character__ ;
- If you do not set custom content, the system default template will be used to display only key information:

```i18n
{{fireReason .}}**INC [#{{.Num}}]({{.DetailUrl}}) {{toHtml .Title}}**
> Collaborative Space: <font color="warning">{{if .ChannelName}}{{.ChannelName}}{{else}}None{{end}}</font>
> Severity: <font color="warning">{{.IncidentSeverity}}</font>
> Trigger Time: {{date "2006-01-02 15:04:05" .StartTime}}
> Duration: {{ago .StartTime}}{{if gt .AlertCnt 1}}
> Aggregated Alerts: {{.AlertCnt}}Items{{end}}{{if .Labels.resource}}
> Alert Object: {{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}{{if .Description}}
> Fault Description: {{toHtml .Description}}{{end}}{{if gt (len .Responders) 0}}
> Assigned Personnel: {{range .Responders}}@{{.PersonName}} {{end}}{{end}}
<br>[Details]({{.DetailUrl}})|[Claim]({{.DetailUrl}}?ack=1)
```

## Telegram Bot
- Configure a Telegram service address that can be accessed domestically;
- The message __can be up to 4096 characters. If it exceeds this limit, it will not be sent__ ;
- If the text contains `<br>` , when rendering, __the blank lines will be removed first, and then `<br>` will be replaced with a newline character__ ;
- If you do not set custom content, the system default template will be used to display only key information:

```i18n
{{fireReason .}}INC [#{{.Num}}]({{.DetailUrl}}) {{toHtml .Title}}
-----
Collaborative Space: {{if .ChannelName}}{{.ChannelName}}{{else}}None{{end}}
Severity: {{.IncidentSeverity}}
Trigger Time: {{date "2006-01-02 15:04:05" .StartTime}}
Duration: {{ago .StartTime}}{{if gt .AlertCnt 1}}
Aggregated Alerts: {{.AlertCnt}}Items{{end}}{{if .Labels.resource}}
Alert Object: {{toHtml (joinAlertLabels . "resource" ", ")}}({{.Labels.resource}}){{end}}{{if .Description}}
Fault Description: {{toHtml .Description}}{{end}}{{if gt (len .Responders) 0}}
Assigned Personnel: {{range .Responders}}@{{.PersonName}} {{end}}{{end}}

<br>[Details]({{.DetailUrl}})|[Claim]({{.DetailUrl}}?ack=1)
```

## Slack Bot
- The message __can be up to 15000 characters. If it exceeds this limit, it will be truncated and sent__ ;
- If the text contains `<br>` , when rendering, __the blank lines will be removed first, and then `<br>` will be replaced with a newline character__ ;
- If you do not set custom content, the system default template will be used to display only key information:

```i18n
{{fireReason .}}INC <{{.DetailUrl}}|#{{.Num}}> {{toHtml .Title}}
-----
Collaborative Space: {{if .ChannelName}}{{.ChannelName}}{{else}}None{{end}}
Severity: {{.IncidentSeverity}}
Trigger Time: {{date "2006-01-02 15:04:05" .StartTime}}
Duration: {{ago .StartTime}}{{if gt .AlertCnt 1}}
Aggregated Alerts: {{.AlertCnt}}Items{{end}}{{if .Labels.resource}}
Alert Object: {{toHtml (joinAlertLabels . "resource" ", ")}}{{end}}{{if .Description}}
Fault Description: {{toHtml .Description}}{{end}}{{if gt (len .Responders) 0}}
Assigned Personnel: {{range .Responders}}@{{.PersonName}} {{end}}{{end}}
-----
<br><{{.DetailUrl}}|Details>|<{{.DetailUrl}}?ack=1|Claim>
```

## Zoom Bot
- The message __can be up to 4000 characters. If it exceeds this limit, it will be truncated and sent__ ;
- If the text contains `<br>` , when rendering, __the blank lines will be removed first, and then `<br>` will be replaced with a newline character__ ;
- The message format **follows the Zoom message format** . The current robot application does not support Markdown . For other formats, please refer to the official website : [https://developers.zoom.us/docs/team-chat-apps/customizing-messages/](https://developers.zoom.us/docs/team-chat-apps/customizing-messages/)
- If you do not set custom content, the system default template will be used to display only key information:

```i18n
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
"text": "Collaborative Space: {{if .ChannelName}}{{.ChannelName}}{{else}}None{{end}}",
"style": {
"bold": false,
"italic": false
}
},
{
"type": "message",
"text": "Severity: {{.IncidentSeverity}}",
"style": {
"bold": false,
"italic": false,
"color": "{{$s := serverityToColor .IncidentSeverity}}{{toHtml $s}}"
}
},
{
"type": "message",
"text": "Duration: {{ago .StartTime}}{{if gt .AlertCnt 1}}",
"style": {
"bold": false,
"italic": false
}
},
{
"type": "message",
"text": "Aggregated Alerts: {{.AlertCnt}}Items{{end}}{{if .Labels.resource}}",
"style": {
"bold": false,
"italic": false
}
},
{
"type": "message",
"text": "Alert Object: {{.Labels.resource}}{{end}}{{if .Description}}",
"style": {
"bold": false,
"italic": false
}
},
{
"type": "message",
"text": "Fault Description: {{toHtml .Description}}{{end}}{{if gt (len .Responders) 0}}",
"style": {
"bold": false,
"italic": false
}
},
{
"type": "message",
"text": "Assigned Personnel: {{range .Responders}}@{{.PersonName}}{{end}}{{end}}",
"style": {
"bold": false,
"italic": false
}
},
{
"type": "message",
"text": "View Details
"link": "{{.DetailUrl}}{{if .IsFlapping}}"
},
{
"type": "message",
"text": "Notice: The current fault status changes frequently, and notifications will be converged{{.Flapping.MuteMinutes}}Minutes, it is recommended that you optimize the alert strategy.{{end}}{{if .IsInStorm}}",
"style": {
"bold": true,
"italic": false
}
},
{
"type": "message",
"text": "Notice: The current fault has been aggregated{{.AlertCnt}}Items, triggering an alert storm. Please handle it urgently!{{end}}",
"style": {
"bold": true,
"italic": false
}
}
]
}
```

## SMS
If you do not set custom content, the system default template will be used to render the notification:

```
您有故障待处理: {{toHtml .Title}}, 协作空间: {{.ChannelName}}, 等级: {{.IncidentSeverity}}{{if gt .AlertCnt 1}}, 共聚合{{.AlertCnt}}条告警{{end}}
```

## Email
If you do not set custom content, the system default template will be used to render the notification:

```i18n
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
<div style="display:flex;align-items:flex-end;gap:1rem"><img witdh="120" data-id="react-email-img" src="https://fcdoc.github.io/img/zh/flashduty/conf/template/6.avif" height="40" style="display:block;outline:none;border:none;text-decoration:none" /><span style="font-size:1.25rem;line-height:1.75rem;font-weight:600">You have a pending issue</span></div>
</div>
<div style="background-color:rgb(243,244,246);padding:2rem;margin-top:1rem;border-radius:0.5rem">
<div style="display:flex;flex-direction:column;gap:0.75rem">
<div style="display:flex">
<div class="text-title">Fault Title</div>
<div class="text-content">{{.Title}}</div>
</div>
<div style="display:flex">
<div class="text-title">Severity</div>
<div class="text-{{.IncidentSeverity}}">{{.IncidentSeverity}}</div>
</div>
<div style="display:flex">
<div class="text-title">Collaborative Space</div>
<div class="text-content">{{if .ChannelName}}{{.ChannelName}}{{else}}None{{end}}</div>
</div>
<div style="display:flex">
<div class="text-title">Trigger Time</div>
<div class="text-content">{{date "2006-01-02 15:04:05" .StartTime}}</div>
</div>
{{if .CreatorID}}
<div style="display:flex">
<div class="text-title">Initiator</div>
<div class="text-content">{{.Creator.PersonName}}</div>
</div>
{{end}}
{{if gt (len .Responders) 0}}
<div style="display:flex">
<div class="text-title">Assigned Personnel</div>
<div class="text-content">{{range .Responders}}@{{.PersonName}} {{end}}</div>
</div>
{{end}}
<div style="display:flex">
<div class="text-title">Processing Progress</div>
<div class="text-content">{{.Progress}}</div>
</div>
<div style="display:flex">
<div class="text-title">Fault Description</div>
<div style="color:rgb(55,65,81);margin-top:0.125rem">
<div data-id="react-email-markdown">{{toHtml .Description}}</div>
</div>
</div>
{{if .Labels.resource}}
<div style="display:flex;margin-bottom:0.5rem;">
<div style="color:#000;font-weight:500;width:6rem;margin-right:1rem;">Alert Object</div>
<div style="color:rgb(55,65,81);margin-top:0.125rem">
<div data-id="react-email-markdown">{{toHtml (joinAlertLabels . "resource" ", ")}}</div>
</div>
</div>
{{end}}
</div>
<div style="display:flex;gap:1rem;margin-top:2rem"><a href="{{.DetailUrl}}?ack=1" data-id="react-email-button" target="_blank" style="line-height:100%;text-decoration:none;display:inline-block;max-width:100%;padding:0px 0px"><span></span><span style="max-width:100%;display:inline-block;line-height:120%;mso-padding-alt:0px;mso-text-raise:0"><div style="padding-left:2rem;padding-right:2rem;padding-top:0.5rem;padding-bottom:0.5rem;background-color:rgb(108,83,177);border-radius:0.25rem;font-size:1rem;line-height:1.5rem;color:rgb(255,255,255);font-weight:600;transition-property:color, background-color, border-color, text-decoration-color, fill, stroke, opacity, box-shadow, transform, filter, backdrop-filter;transition-timing-function:cubic-bezier(0.4, 0, 0.2, 1);transition-duration:150ms">Claim Now</div></span><span></span></a><a href="{{.DetailUrl}}" data-id="react-email-button" target="_blank" style="color:#61dafb;line-height:100%;text-decoration:none;display:inline-block;max-width:100%;padding:0px 0px"><span></span><span style="max-width:100%;display:inline-block;line-height:120%;mso-padding-alt:0px;mso-text-raise:0"><div style="padding-left:2rem;padding-right:2rem;padding-top:0.5rem;padding-bottom:0.5rem;background-color:rgb(255,255,255);border-width: 1px;border-style:solid;border-color:rgb(229,231,235);border-radius:0.25rem;font-size:1rem;line-height:1.5rem;color:rgb(0,0,0);font-weight:600">View Details</div></span><span></span></a></div>
</div>
<div style="display:flex;justify-content:flex-end;align-items:flex-end;margin-top:2rem">
<div style="font-size:0.875rem;line-height:1.25rem;font-weight:500">ALL RIGHTS RESERVED © Beijing Kuaimao Nebula Technology Co., Ltd</div>
</div>
</body>

</html>
```

As shown below:

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/template/7.avif" alt="drawing" style="display: block; margin: 0 auto;" width="500"/>