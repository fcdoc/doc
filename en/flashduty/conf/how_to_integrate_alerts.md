---
brief: Access alerts through dedicated or shared integrations, and what is the difference between dedicated and shared integrations?
---

# Multiple alert access methods

FlashDuty, as a unified alert processing platform, does not generate alert data itself. It needs to connect alert events from third-party monitoring platforms to FlashDuty to achieve unified alert reception, noise reduction, dispatch, delivery, resolution, analysis, and automation, such as Nightingale/FlashCat, Zabbix, Prometheus, and other monitoring platforms, as well as alerts from major cloud providers. For more types, please refer to [Alert Integration](/mixin/alert_integration/custom_alert).

## Access methods

### Dedicated Integration
Dedicated integration adding path: **Collaboration Space Details => Integration Data => Dedicated Integration**.
- Dedicated integrations can be added when creating a collaboration space or within an already created collaboration space.
- Alerts connected via dedicated integration in a collaboration space **do not require configuring routing rules, meaning all alerts will be distributed to that space** (excluding filtered alerts) and cannot be shared with other collaboration spaces.
- When alerts do not need to be distributed to multiple different spaces, you can choose a dedicated integration.

![](https://fcdoc.github.io/img/zh/flashduty/conf/how_to_integrate_alerts/1.avif)

### Shared Integration
Shared integration adding path: **Integration Center => Alert Events**.
- Alert event types created in the Integration Center are global and must **be routed to a specific collaboration space or multiple collaboration spaces through routing rules**.
- Each integration **must be configured with at least one collaboration space that receives alerts; otherwise, the integration will not take effect, meaning it will not be able to receive alert events**.

![](https://fcdoc.github.io/img/zh/flashduty/conf/how_to_integrate_alerts/2.avif)

> [!NOTE]
> - Both dedicated and shared integrations will generate a push address after adding an alert integration. Just copy the generated address to the corresponding platform.
> - The data types connected by each alert event source are different. For specific methods, please refer to the access documentation in [Integration Guide](/mixin/alert_integration/custom_alert).

> [!WARN]
> In order to ensure the stability of the overall system, we have imposed frequency limits on the event requests reported by each integration. The current limits are: each integration is limited to `100` requests per second (`qps`) and `1000` requests per minute (`qpm`).
>
> When the number of your requests exceeds this frequency, you will receive a request response with status code `429`. In this case, you should wait for a while and then report again.
>
> We may modify this limit in the future. If you need to extend this limit, please contact us.

## Common Issues

|+| Why does the integration created in the alert event of the Integration Center not receive alerts?

    1. Please confirm whether routing is configured.
    2. Please confirm whether the source platform triggers alert events and whether alerts are generated.

|+| Is there a limit to the number of integrations I can create?

    There are currently no restrictions.

|+| How are alert labels generated?

    FlashDuty, for each integration, includes all critical information in tags, descriptions, or titles according to the principle of including everything. If you want to dynamically generate other labels on this basis, please configure the label enhancement rules. For details, please refer to: /conf/label_enrichment

|+| How is the alert title determined? Can I modify it?

    FlashDuty, for each integration, uses a specific title generation method, generally a combination of "Strategy Name / Alert Object". If you want to customize the title generation rules, please refer to: /advanced/customize_incident_attrs

|+| How do I check which integration type an alert event comes from?

    Click incident -> Enter incident details -> Associated alert -> Alert source.