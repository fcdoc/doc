---
brief: Access alerts through dedicated integration or shared integration, and what is the difference between dedicated integration and shared integration?
---

# Multiple alert access methods

As a unified alert processing platform, FlashDuty itself does not generate alert data. It needs to connect alert events from third-party monitoring platforms to FlashDuty to achieve unified alert reception, noise reduction, dispatch, delivery, resolution, analysis, and automation, such as from Nightingale/FlashCat, Zabbix, Prometheus, and other monitoring platforms, as well as alerts from major cloud providers. For more types, please refer to [Alert Integration](/mixin/alert_integration/custom_alert).

## Access Methods

### Dedicated Integration
Dedicated integration adding path: **Collaboration Space Details => Integration Data => Dedicated Integration**.
- Dedicated integrations can be added when creating a collaboration space or in an already created collaboration space.
- Alerts integrated via dedicated integration **do not require configuring routing rules, meaning all alerts will be distributed to that space** (excluding filtered alerts) and cannot be shared with other collaboration spaces.
- When alerts do not need to be distributed to multiple different spaces, you can choose dedicated integration.

![](https://fcdoc.github.io/img/zh/flashduty/conf/how_to_integrate_alerts/1.avif)

### Shared Integration
Shared integration adding path: **Integration Center => Alert Events**.
- Alert event types created in the Integration Center are global and must **be routed to a specific collaboration space or multiple collaboration spaces through routing rules**.
- Each integration **must be configured with at least one collaboration space that receives alerts; otherwise, the integration will not take effect and will not be able to receive alert events**.

![](https://fcdoc.github.io/img/zh/flashduty/conf/how_to_integrate_alerts/2.avif)

> [!NOTE]
> - Both dedicated integration and shared integration will generate a push URL after adding an alert integration. Just copy the URL to the corresponding platform.
> - The data types connected from each alert event source are different. For specific methods, please refer to the integration guide's [Access Documentation](/mixin/alert_integration/custom_alert).

> [!WARN]
> In order to ensure the stability of the overall system, we have limited the frequency of event requests reported by each integration. The current limit is that the limit of reported requests per second per integration ( `qps` ) is `100` , and the limit of number of reported requests per minute ( `qpm` ) is `1000` .
>
> When the number of your requests exceeds this frequency, you will receive a request response with status code `429`. In this case, you should wait for a while and then retry the report.
>
> We may modify this limit in the future. If you need to increase this limit, please contact us.

## Frequently Asked Questions

|+| Why is the integration created in the Integration Center not receiving alerts?

    1. Please confirm whether routing is configured.
    2. Please confirm whether the source platform has triggered an alert event and whether an alert has been generated.

|+| Is there a limit to the number of integrations I can create?

    There are currently no limits.

|+| How are alert labels generated?

    FlashDuty, for each integration, includes all critical information in tags, descriptions, or titles according to the principle of including everything. If you want to dynamically generate additional tags, please configure the label enrichment rules. For details, please refer to: /conf/label_enrichment

|+| How is the alert title determined, and can I modify it?

    FlashDuty uses a specific title generation method for each integration, generally a combination of "Strategy Name / Alert Object". If you want to customize the title generation rules, please refer to: /advanced/customize_incident_attrs

|+| How do I check which integration type an alert event comes from?

    Click on the incident -> Enter the incident details -> Associated alert -> Alert source.