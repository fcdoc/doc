---
brief: Access alarms through exclusive or shared integration, and what is the difference between exclusive and shared integration?
---

# Various alarm access methods

FlashDuty serves as a unified alert processing platform, itself not generating alert data. It requires integrating alert events from third-party monitoring platforms into FlashDuty to facilitate centralized alert reception, noise reduction, dispatching, notification, resolution, analysis, and automation. Examples include platforms such as Nightingale/FlashCat, Zabbix, Prometheus, as well as alerts from major cloud service providers. For more types, please refer to [Alarm Integration](/mixin/alert_integration/custom_alert).

## Access methods

### Exclusive Integration
Exclusive integration addition path: **Collaboration Space Details => Integration Data => Exclusive Integration**.
- Exclusive integration can be added when creating a collaboration space or within an already created collaboration space.
- In exclusive integration, alarms accessed in a collaboration space **do not require configuration of routing rules, meaning all alarms will be distributed to this space** (excluding filtered alarms) and cannot be shared with other collaboration spaces.
- Exclusive integration should be chosen when alarms do not need to be distributed to multiple different spaces.

![](https://fcdoc.github.io/img/zh/flashduty/conf/how_to_integrate_alerts/1.avif)

### Shared Integration
Shared integration addition path: **Integration Center => Alarm Events**.
- Alarm event types created in the Integration Center are global and must **be directed to specific collaboration spaces or multiple collaboration spaces using routing rules**.
- Each integration **must be configured with at least one collaboration space to receive alarms; otherwise, the integration will not be effective, meaning it cannot receive alarm events**.

![](https://fcdoc.github.io/img/zh/flashduty/conf/how_to_integrate_alerts/2.avif)

> [!NOTE]
> - Exclusive or shared integration will generate a push address after a new alarm integration is added. Copy the modified address to the corresponding platform.
> - Each alert event source may access different data types. For specific integration methods, please refer to the access instructions in [Integration Guide](/mixin/alert_integration/custom_alert).

> [!WARN]
> To ensure the overall system's stability, we have imposed frequency limits on event requests reported by each integration. The current limits are a request limit per second (`qps`) of `100` and a request limit per minute (`qpm`) of `1000`.
>
> If your request volume exceeds this frequency, you will receive a response with status code `429`. In this case, you should wait for a period before resubmitting.
>
> We may adjust these limits in the future. If you need to increase these limits, please contact us.

## FAQs

|+| The alarm event created in the integrated center's alert is not receiving any alarms?

    1. Please confirm if there is a routing configuration in place.
    2. Please confirm whether the source platform has triggered an alert event and whether an alert has been generated.

|+| Is there a limit to the number of integrations that can be created?

    There are currently no restrictions in place.

|+| How are alarm labels generated?

    FlashDuty, for each integration, adheres to the principle of capturing all essential information, incorporating it into tags, descriptions, or titles. If you wish to dynamically generate additional tags based on this information, please configure the label enhancement rules. For details, please refer to: /conf/label_enrichment_settings

|+| How is the alarm title determined? Can I modify it?

    FlashDuty employs a specific title generation method for each integration, typically a combination of "Policy Name / Alarm Object". If you desire to customize the title generation rules, please refer to: /advanced/customize_incident_attrs

|+| How can I check the integration type from which an alarm event originates?

    Click on Fault -> Enter Fault Details -> Related Alarms -> Alarm Source.