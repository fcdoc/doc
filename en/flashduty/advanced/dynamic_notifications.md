---
brief: Realize dynamic dispatch of alerts based on tags and integrate with your self-developed system
---

# Dynamically set assignees

Realize dynamic dispatch of alerts based on tags and integrate with your self-developed system.

## Adaptation Scenarios

**The responsible person for alerts is maintained and frequently adjusted in the source monitoring system, and you hope to synchronize these changes to Flashduty in a timely manner.**

Scenario 1:

Customer A has developed a self-researched big data task system. Internal personnel can create various data batch processing tasks on this platform, and each task can set a primary and secondary responsible person. When a batch processing task fails, the system will first alert and notify the primary responsible person. If the alert has not been resolved after 30 minutes, it will be escalated to the secondary responsible person.

Scenario 2:

Customer B uses Zabbix for host monitoring and sets a responsible tag for each host. The customer hopes that when a host alert is triggered, the system can notify the corresponding responsible person based on this tag.

Scenario 3:

Customer C has a self-developed monitoring system with many alert strategies. Each strategy is set to notify a specific WeChat group. The customer decided to migrate incident response to Flashduty but wants to retain the relationship between the strategies in the source monitoring system and the WeChat groups, and be able to dynamically notify the WeChat groups based on this relationship.

## Implementation Method

**Add specific tags or Query parameters to override the dispatch object in Flashduty and achieve dynamic dispatch.**

The parameter format is as follows:

- **To replace a dispatcher**:
- **Parameter name** : Need to meet the regular rules: ^ layer_person_reset_ (\d) _emails$ , the link number starts from 0. eg.layer_person_reset_0_emails represents the replacement of the dispatcher in link 1 of the dispatch strategy.
- **Parameter value** : Email address of the dispatcher. Use "," to separate multiple addresses. [eg.zhangsan@flashcat.cloud](mailto:eg.zhangsan@flashcat.cloud) , [lisi@flashcat.cloud](mailto:lisi@flashcat.cloud) , replace the personnel with Zhang San and Li Si.
- **Parameter position**: Query parameter or tag value. For example, set this tag in a Nightingale alert or automatically generate tags through tag enhancement.
- **To replace the WeChat group chat bot**:
- **Parameter name** : Need to meet the regular rules: ^ layer_webhook_reset_ (\d) _wecoms$ , the link number starts from 0. eg.layer_webhook_reset_0_wecoms represents the replacement of the enterprise micro group chat robot in link 1 of the dispatch strategy.
- **Parameter value** : Target group chat robot token use "," to separate multiple token . eg.bbb025a0-e2e8-4b79-939d-82c91a275b06 , replace the group chat robot with this token corresponding robot.
- **Parameter position**: Query parameter or tag value. For example, set this tag in a Nightingale alert or automatically generate tags through tag enhancement.

> [!NOTE]
> When an incident is triggered, Flashduty matches it according to the existing dispatch strategy. After matching the dispatch strategy, it dispatches or escalates according to the links in the strategy. If the above parameters are set, the system will automatically replace the dispatch object or group chat channel.
>
> In the matched dispatch strategy, except for the changes in the dispatch object and group chat target, all other content remains unchanged, effectively serving as a template dispatch strategy.

## Push Example

### Set a Template Dispatch Policy

Configure a dispatch policy for the collaboration space. As shown in the figure below, this space only sets up one dispatch stage, with the dispatch object being Toutie Technology. At the same time, the enterprise WeChat group chat with the token ending in 5b96 is pushed.

![](https://fcdoc.github.io/img/zh/flashduty/advanced/dynamic_notifications/1.avif)

### Set Labels for Alerts

Let's take custom alert event integration as an example and push an example alert to the target collaboration space. The layer_person_reset_0_emails tag is set, hoping to replace the dispatcher of stage one with guoyuhang and yushuangyu . The layer_webhook_reset_0_wecoms label is set, hoping to replace token in the WeChat group chat in link 1 d9c0 token at the end.

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

![](https://fcdoc.github.io/img/zh/flashduty/advanced/dynamic_notifications/2.avif)

## Frequently Asked Questions

|+| What should I do if my monitoring system does not have these tags?

    1. If your system supports actively adding tags, such as Prometheus or Nightingale, it is recommended that you add specific tags directly to the alert policy.
    2. If your system already has relevant tags but with different formats or names, such as a team tag on your host, you need to find the corresponding responsible person based on the team. In this case, you can use the tag enhancement feature to generate tags related to the responsible person based on the team tag. For details, please refer to [Configuring Tag Enhancement](http://docs.flashcat.cloud/zh/flashduty/label-enrichment-settings).