---
brief: Access alerts through dedicated integration or shared integration, and what is the difference between dedicated integration and shared integration?
---

# Multiple ways to access alerts

FlashDuty, as a unified alert processing platform, does not generate alert data itself. It needs to connect alert events from third-party monitoring platforms to FlashDuty to achieve unified alert reception, noise reduction, dispatch, reach, resolution, analysis, and automation, such as from Nightingale/FlashCat, Zabbix, Prometheus, and other monitoring platforms, as well as from major cloud providers. For more types, please refer to [Alert Integration](/mixin/alert_integration/custom_alert).

## Access methods

### Dedicated integration
Dedicated integration addition path: **Collaboration space details => Integration data => Dedicated integration**.
- Dedicated integrations can be added when creating a collaboration space or within an already created collaboration space.
- Alerts connected via dedicated integration in the collaboration space **do not require configuring routing rules, meaning all alerts will be distributed to that space** (excluding filtered alerts) and cannot be shared with other collaboration spaces.
- When alerts do not need to be distributed to multiple different spaces, you can choose dedicated integration.

![](https://fc.3ti.site/zh/flashduty/conf/how_to_integrate_alerts/1.avif)

### Shared integration
Shared integration addition path: **Integration center => Alert events**.
- Alert event types created in the Integration Center are global and must **be routed to a specific collaboration space or multiple collaboration spaces through routing rules**.
- Each integration **must be configured with at least one collaboration space that receives alerts; otherwise, the integration will not take effect, meaning it will not be able to receive alert events**.

![](https://fc.3ti.site/zh/flashduty/conf/how_to_integrate_alerts/2.avif)

> [!NOTE]
> - Both dedicated and shared integrations will generate a push address after adding an alert integration. Just copy the generated address to the corresponding platform.
> - The data types connected from each alert event source are different. For specific methods, please refer to the integration guide's [Access Documentation](/mixin/alert_integration/custom_alert).

> [!WARN]
> In order to ensure the stability of the overall system, we have limited the frequency of event requests reported by each integration. The current limit is that the limit of reported requests per second per integration ( `qps` ) is `100` , and the limit of number of reported requests per minute ( `qpm` ) is `1000` .
>
> When your request volume exceeds this frequency, you will receive a response with a status code of `429`. In this case, you should wait for a while before retrying the report.
>
> We may modify this limit in the future. If you need to increase this limit, please contact us.

## Frequently Asked Questions

|+| The integration created in the alert event of the Integration Center cannot receive alerts?

    1. Please confirm whether routing is configured.
    2. Please confirm whether the source platform has triggered an alert event and whether an alert has been generated.

|+| Is there a limit to the number of integrations I can create?

    There are currently no restrictions.

|+| How are alert labels generated?

    FlashDuty, for each integration, includes all critical information in tags, descriptions, or titles according to the principle of taking everything. If you want to dynamically generate additional tags, please configure the label enrichment rules. For details, please refer to: /conf/label_enrichment

|+| How is the alert title determined? Can I modify it?

    FlashDuty, for each integration, uses a specific title generation method, generally a combination of "strategy name / Alert object". If you want to customize the title generation rules, please refer to: /advanced/customize_incident_attrs

|+| How can I check which integration type the alert event comes from?

    Click incident -> Enter incident details -> Associated alert -> Alert source.