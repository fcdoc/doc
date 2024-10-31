---
brief: Implement dynamic alert dispatch based on tags, integrating with your proprietary system
---

# Dynamically set dispatch personnel

Implement dynamic alert dispatch based on tags, integrating with your proprietary system.

## Adaptation scenarios

**The responsible person for alerts is maintained and frequently adjusted in the source monitoring system, with the hope of synchronizing with Flashduty promptly.**

Scenario 1:

Customer A has a self-developed big data task system, where internal personnel can create various data batch processing tasks. Each task can assign a primary and secondary responsible person. If a batch processing task fails, the system will first alert the primary responsible person. If the alert is not resolved within 30 minutes, it will be escalated to the secondary responsible person.

Scenario 2:

Customer B uses Zabbix for host monitoring and has assigned a responsible person tag for each host. The customer wants to ensure that when a host alert occurs, the corresponding responsible person is notified based on this tag.

Scenario 3:

Customer C has a self-developed monitoring system with many alert policies, each set to notify a specific WeChat group. The customer has decided to migrate incident response to Flashduty but wants to retain the relationship between the source monitoring system's policies and the WeChat groups, allowing alerts to dynamically notify the groups based on this relationship.

## Implementation methods

**Add specific tags or Query parameters to override the dispatch targets in Flashduty for dynamic dispatching.**

Parameter format as follows:

- **Replace dispatch personnel**:
- **Parameter name**: Must match the regex: ^layer_person_reset_(\d)_emails$. The link number starts from 0. For example, layer_person_reset_0_emails represents replacing the dispatch personnel in the first link of the dispatch strategy.
- **Parameter value**: Email addresses of the dispatch personnel, separated by commas. For example, zhangsan@flashcat.cloud, lisi@flashcat.cloud, replacing the personnel with Zhang San and Li Si.
- **Parameter Position**: Query parameter or label value. e.g., set this tag in the Nightingale alert, or automatically generate tags through label enhancement, etc.
- **Replace the WeChat group chat bot**:
- **Parameter name**: Must match the regex: ^layer_webhook_reset_(\d)_wecoms$. The link number starts from 0. For example, layer_webhook_reset_0_wecoms represents replacing the WeChat group chat bot in the first link of the dispatch strategy.
- **Parameter value**: Target group chat bot token, separated by commas for multiple tokens. For example, bbb025a0-e2e8-4b79-939d-82c91a275b06, replacing the group chat bot with the corresponding bot for this token.
- **Parameter Position**: Query parameter or label value. e.g., set this tag in the Nightingale alert, or automatically generate tags through label enhancement, etc.

> [!NOTE]
> When an incident is triggered, Flashduty matches it against existing dispatch policies. After a dispatch policy is matched, it proceeds with dispatching or escalating according to the stages in the policy. If the aforementioned parameters are set, the system will automatically replace the dispatch targets or group chat channels.
>
> In the matched dispatch strategy, only the dispatch targets and group chat destinations change, while other content remains the same, similar to a template dispatch strategy.

## Push example

### Set a template dispatch policy

Configure a dispatch policy for the collaboration space. As shown in the figure below, the space is set up with one dispatch link, with the dispatch target being Toutie Technology, and simultaneously pushing to a WeChat group with a token ending in 5b96.

![](https://fcdoc.github.io/img/zh/flashduty/advanced/dynamic_notifications/1.avif)

### Set tags for alerts

Let's take custom alert event integration as an example and push an example alert to the target collaboration space. The layer_person_reset_0_emails tag is set, hoping to replace the dispatcher of stage one with guoyuhang and yushuangyu . The layer_webhook_reset_0_wecoms label is set, hoping to replace token in the WeChat group chat in link 1 d9c0 token at the end.

Request content as follows:

```
curl --location --request POST 'https://api.flashcat.cloud/event/push/alert/standard?integration_key=your-integration-key' \
--header 'Content-Type: application/json' \
--data-raw '{
"event_status": "Warning",
"alert_key": "lasdfl2xzasd0262",
"description": "cpu idle lower than 20%",
"title_rule": "$cluster::$resource::$check",
"labels": {
"service": "engine",
"cluster":"nj",
"resource":"es.nj.01",
"check":"cpu.idle<20%",
"metric":"node_cpu_seconds_total",
"layer_person_reset_0_emails": "guoyuhang@flashcat.cloud,yushuangyu@flashcat.cloud",
"layer_webhook_reset_0_wecoms":"90dbb66b-af39-4235-956c-636a9c1ed9c0"
}
}'
```

### View the incident dispatch timeline

As shown in the figure below, the target incident is triggered and dispatched normally. The incident's dispatchers and target group chats have been replaced as expected.

![](https://fcdoc.github.io/img/zh/flashduty/advanced/dynamic_notifications/2.avif)

## FAQs

|+| What should I do if my monitoring system lacks these tags?

    1. If your system supports actively adding tags, such as Prometheus or Nightingale, it is recommended to add specific tags directly in the alert policy.
    2. If your system already possesses relevant tags but differs in format or naming, for instance, if your host is labeled with a team tag, and you need to identify the responsible individual based on the team, you can utilize the tag enhancement feature to generate tags related to the responsible person based on the team tag. Please refer to [Configuring Tag Enhancement](http://docs.flashcat.cloud/zh/flashduty/label-enrichment-settings) for specific instructions.