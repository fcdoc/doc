---
brief: Realize dynamic dispatch of alerts based on tags, and integrate with your self-developed system
---

# Dynamically set assignees

Realize dynamic dispatch of alerts based on tags, and integrate with your self-developed system.

## Adaptation Scenarios

**The alert responsible person is maintained and frequently adjusted in the source monitoring system, and you hope to synchronize this information to Flashduty in a timely manner.**

Scenario 1:

Customer A has developed a self-researched big data task system. Internal personnel can create various data batch processing tasks on this platform, and each task can set a primary and secondary responsible person. When a batch processing task fails, the system will first alert and notify the primary responsible person. If the alert has not been resolved within 30 minutes, it will be escalated to the secondary responsible person.

Scenario 2:

Customer B uses Zabbix for host monitoring and sets a responsible person tag for each host. The customer hopes that when a host is alerted, the system can notify the corresponding responsible person based on this tag.

Scenario 3:

Customer C has a self-developed monitoring system with many alert strategies, each of which is set to notify a specific WeChat group. The customer decided to migrate incident response to Flashduty but wants to retain the relationship between the strategies in the source monitoring system and the WeChat groups, and be able to dynamically notify the WeChat groups based on this relationship.

## Implementation Method

**Add specific tags or Query parameters to override the dispatch object in Flashduty to achieve dynamic dispatch.**

The parameter format is as follows:

- **To replace the assignee**:
- **Parameter name**: Must match the regular expression: ^layer_person_reset_(\d)_emails$, with the link number starting from 0. For example, layer_person_reset_0_emails represents replacing the assignee in the first dispatch link of the dispatch strategy.
- **Parameter value**: Email addresses of the assignees, separated by ",". For example, zhangsan@flashcat.cloud,lisi@flashcat.cloud, which replaces the assignees with Zhang San and Li Si.
- **Parameter position**: Query parameter or tag value. For example, set this tag in a Nightingale alert, or automatically generate tags through tag enhancement.
- **To replace the WeChat group chat bot**:
- **Parameter name**: Must match the regular expression: ^layer_webhook_reset_(\d)_wecoms$, with the link number starting from 0. For example, layer_webhook_reset_0_wecoms represents replacing the WeChat group chat bot in the first dispatch link of the dispatch strategy.
- **Parameter value**: Target group chat bot token, separated by ",". For example, bbb025a0-e2e8-4b79-939d-82c91a275b06, which replaces the group chat bot with the bot corresponding to this token.
- **Parameter position**: Query parameter or tag value. For example, set this tag in a Nightingale alert, or automatically generate tags through tag enhancement.

> [!NOTE]
> When an incident is triggered, Flashduty matches it to the existing dispatch strategy. After matching the dispatch strategy, it dispatches or escalates according to the links in the strategy. If the above parameters are set, the system will automatically replace the dispatch object or group chat channel.
>
> In the matched dispatch strategy, except for the changes in the dispatch object and group chat target, all other content remains unchanged, effectively serving as a template dispatch strategy.

## Push Example

### Set a Template Dispatch Strategy

Configure a dispatch strategy for the collaboration space. As shown in the figure below, this space only sets one dispatch link, with the dispatch object being Toutie Technology, and the WeChat group chat token ending in 5b96.

![](https://fcdoc.github.io/img/zh/flashduty/advanced/dynamic_notifications/1.avif)

### Set Labels for the Alert

Let's take custom alert event integration as an example and push an example alert to the target collaboration space. The layer_person_reset_0_emails tag is set, hoping to replace the assignee in the first link with guoyuhang and yushuangyu. The layer_webhook_reset_0_wecoms tag is set, hoping to replace the WeChat group chat token in the first link with the token ending in d9c0.

The request content is as follows:

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

### View the Incident Dispatch Timeline

As shown in the figure below, the target incident is triggered and dispatched normally. The dispatchers and target group chats have been replaced as expected.

![](https://fcdoc.github.io/img/zh/flashduty/advanced/dynamic_notifications/2.avif)

## Frequently Asked Questions

|+| What if my monitoring system does not have these tags?

    1. If your system supports actively adding tags, such as Prometheus or Nightingale, it is recommended that you add specific tags directly in the alert policy.
    2. If your system already has relevant tags but in a different format or naming, for example, if your host has a team tag and you need to find the corresponding responsible person based on the team, you can use the tag enhancement feature to generate responsible person-related tags based on the team tag. For details, please refer to [Configuring Tag Enhancement](http://docs.flashcat.cloud/zh/flashduty/label-enrichment-settings).