---
brief: Realize dynamic dispatch of alerts based on tags and integrate with your self-developed system
---

# Dynamically set assignees

Realize dynamic dispatch of alerts based on tags and integrate with your self-developed system.

## Adaptation Scenarios

**The responsible person is maintained and frequently adjusted in the source monitoring system, hoping to synchronize to Flashduty in a timely manner.**

Scenario 1:

Customer A has developed a self-researched big data task system. Internal personnel can create various data batch processing tasks on this platform, and each task can set a primary and secondary responsible person. When a batch processing task fails, the system will prioritize alerting the primary responsible person. If the alert has not been resolved after 30 minutes, it will escalate to the secondary responsible person.

Scenario 2:

Customer B uses Zabbix for host monitoring and sets a responsible person tag for each host. The customer hopes that when the host is alerted, the corresponding responsible person can be notified based on this tag.

Scenario 3:

Customer C has a self-developed monitoring system with many alert strategies. Each strategy is set to notify a specific WeChat group. The customer decided to migrate incident response to Flashduty but wants to retain the relationship between the policies in the source monitoring system and the WeChat groups, and be able to dynamically notify the WeChat groups based on this relationship.

## Implementation Method

**Add specific tags or Query parameters to override the dispatch object in Flashduty to achieve dynamic dispatch.**

The parameter format is as follows:

- **Replace Assignees**:
- **Parameter Name**: Must match the regular expression: ^layer_person_reset_(\d)_emails$, with the link number starting from 0. For example, layer_person_reset_0_emails represents replacing the assignees in the first dispatch link.
- **Parameter Value**: Email addresses of the assignees, separated by “,”. For example, zhangsan@flashcat.cloud,lisi@flashcat.cloud, which replaces the assignees with Zhang San and Li Si.
- **Parameter Position**: Query parameter or tag value. For example, set this tag in a Nightingale alert or automatically generate tags through tag enhancement.
- **Replace WeChat Group Chat Robot**:
- **Parameter Name**: Must match the regular expression: ^layer_webhook_reset_(\d)_wecoms$, with the link number starting from 0. For example, layer_webhook_reset_0_wecoms represents replacing the WeChat group chat robot in the first dispatch link.
- **Parameter Value**: Target group chat robot token, separated by “,”. For example, bbb025a0-e2e8-4b79-939d-82c91a275b06, which replaces the group chat robot with the one corresponding to this token.
- **Parameter Position**: Query parameter or tag value. For example, set this tag in a Nightingale alert or automatically generate tags through tag enhancement.

> [!NOTE]
> When an incident is triggered, Flashduty matches it according to the existing dispatch strategy. After matching the dispatch strategy, it dispatches or escalates according to the links in this strategy. If the above parameters are set, the system will automatically replace the dispatch object or group chat channel.
>
> In the matched dispatch strategy, except for the changes in the dispatch object and group chat target, other content remains unchanged, equivalent to a template dispatch strategy.

## Push Example

### Set Template Dispatch Policy

Configure a dispatch policy for the collaboration space. As shown in the figure below, this space only sets one dispatch link, with the dispatch object being Toutie Technology, and the WeChat group chat token ending in 5b96.

![](https://fc.3ti.site/zh/flashduty/advanced/dynamic_notifications/1.avif)

### Set Labels for Alert

Let's take custom alert event integration as an example and push an example alert to the target collaboration space. The layer_person_reset_0_emails tag is set, hoping to replace the assignees in the first link with guoyuhang and yushuangyu. The layer_webhook_reset_0_wecoms tag is set, hoping to replace the WeChat group chat token in the first link with the one ending in d9c0.

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

### View Incident Dispatch Timeline

As shown in the figure below, the target incident is triggered and dispatched normally. The dispatchers and target group chats have been replaced as expected.

![](https://fc.3ti.site/zh/flashduty/advanced/dynamic_notifications/2.avif)

## Frequently Asked Questions

|+| What should I do if my monitoring system does not have these tags?

    1. If your system supports actively adding tags, such as Prometheus or Nightingale, it is recommended that you add specific tags directly to the alert policy.
    2. If your system already has relevant tags but in a different format or naming convention. For example, if your host has a team tag, you need to find the corresponding responsible person based on the team. In this case, you can use the tag enhancement feature to generate responsible person tags based on the team tag. For more details, please refer to [Configuring Tag Enhancement](http://docs.flashcat.cloud/zh/flashduty/label-enrichment-settings).