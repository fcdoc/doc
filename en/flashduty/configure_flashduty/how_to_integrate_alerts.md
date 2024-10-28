---
brief: Access alarms through exclusive or shared integration, and what is the difference between exclusive and shared integration?
---

# Various alarm access methods

FlashDuty serves as a unified alert processing platform that does not generate alert data on its own. It requires integrating alert events from third-party monitoring platforms such as Nightingale/FlashCat, Zabbix, Prometheus, and alerts from major cloud service providers into FlashDuty to facilitate unified alert reception, noise reduction, dispatching, notification, resolution, analysis, and automation. For more types, please refer to [Alarm Integration](/integration_guide/alert_integration/custom_alert_integration_guide).

## Access methods

### Exclusive Integration
Exclusive integration addition path: **Collaboration Space Details => Integration Data => Exclusive Integration**.
- Exclusive integration can be added when creating a collaboration space or within an already created collaboration space.
- In exclusive integration, alarms accessed in a collaboration space **do not require configuration of routing rules, meaning all alarms will be distributed to this space** (excluding filtered alarms) and cannot be shared with other collaboration spaces.
- Exclusive integration should be chosen when alarms do not need to be distributed to multiple different spaces.

![zhuanshujicheng1.png](https://fcdoc.github.io/img/zh/OjUArE19Yq2a3UdlhEmLR_3NvXfy2pvEnGf2ZYBpIxE.avif)

### Shared Integration
Shared integration addition path: **Integration Center => Alarm Events**.
- Alarm event types created in the Integration Center are global and must **be directed to specific collaboration spaces or multiple collaboration spaces using routing rules**.
- Each integration **must be configured with at least one collaboration space to receive alarms; otherwise, the integration will not be effective, meaning it cannot receive alarm events**.

![jichengzhongxin.png](https://fcdoc.github.io/img/zh/Ag1OnefntjpAjD-qq6fCgotIHvpQl1F-G2kc9VC7WAs.avif)

> [!NOTE]
> - Exclusive or shared integration will generate a push address after a new alarm integration is added. Copy the modified address to the corresponding platform.
> - Each alert event source integrates different data types. For specific integration methods, please refer to the access instructions in [Integration Guide](/integration_guide/alert_integration/custom_alert_integration_guide).

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

    Flashduty applies the principle of "take everything" to tag, describe, or title all crucial information for each integration. To dynamically generate additional tags based on this, please configure tag enrichment rules. For details, refer to: /configure_flashduty/label_enrichment_settings

|+| How is the alarm title determined? Can I modify it?

    Flashduty employs a specific title generation method for each integration, typically combining "policy name / alarm object". To customize the title generation rules, please refer to: /advanced_features/customize_incident_attrs

|+| How can I check the integration type from which an alarm event originates?

    Click on Fault -> Enter Fault Details -> Related Alarms -> Alarm Source.