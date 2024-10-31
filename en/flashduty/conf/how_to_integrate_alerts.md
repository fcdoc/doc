---
brief: Access alerts through exclusive integration or shared integration, and what are the differences between exclusive integration and shared integration?
---

# Various methods for accessing alerts

FlashDuty serves as a unified alert processing platform, which itself does not generate alert data. It requires integrating alert events from third-party monitoring platforms into FlashDuty to achieve unified alert reception, noise reduction, dispatching, notification, resolution, analysis, and automation, such as Nightingale/FlashCat, Zabbix, Prometheus, and alerts from major cloud service providers. For more types, please refer to [Alert Integration](/mixin/alert_integration/custom_alert).

## Access methods

### Exclusive Integration
Exclusive integration addition path: **Collaboration Space Details => Integration Data => Exclusive Integration**.
- Exclusive integration can be added when creating a collaboration space or within an already created collaboration space.
- Alerts accessed through exclusive integration in the collaboration space **do not require configuring routing rules, meaning all alerts will be distributed to that space** (excluding filtered alerts), and cannot be shared with other collaboration spaces.
- When alerts do not need to be distributed to multiple different spaces, exclusive integration can be chosen.

![](https://fcdoc.github.io/img/zh/flashduty/conf/how_to_integrate_alerts/1.avif)

### Shared Integration
Shared integration addition path: **Integration Center => Alert Events**.
- The alert event types created in the Integration Center are global and must **be selected and pushed to a specific collaboration space or multiple collaboration spaces through routing rules**.
- Each integration **must be configured with at least one collaboration space to receive alerts; otherwise, the integration will not be effective, meaning it cannot receive alert events**.

![](https://fcdoc.github.io/img/zh/flashduty/conf/how_to_integrate_alerts/2.avif)

> [!NOTE]
> - Exclusive integration or shared integration will generate a push address after adding a new alert integration. Copy this address to the corresponding platform after modification.
> - Each alert event source接入的数据类型不同,具体方式参考 [Integration Guide](/mixin/alert_integration/custom_alert) 的接入说明文档.

> [!WARN]
> To ensure the overall system's stability, we have imposed frequency limits on event requests reported by each integration. The current limits are a request limit per second (`qps`) of `100` and a request limit per minute (`qpm`) of `1000`.
>
> If your request volume exceeds this frequency, you will receive a response with status code `429`. In this case, you should wait for a period before resubmitting.
>
> We may adjust these limits in the future. If you need to increase these limits, please contact us.

## FAQs

|+| Are alerts from the integration created in the Integration Center not receiving alerts?

    1. Please confirm if there is a routing configuration in place.
    2. Please confirm whether the source platform has triggered an alert event and whether an alert has been generated.

|+| Is there a limit to the number of integrations that can be created?

    There are currently no restrictions in place.

|+| How are alert labels generated?

    Flashduty adheres to the principle of extracting all necessary information for each integration, incorporating key details into tags, descriptions, or titles. Should you wish to dynamically generate additional tags based on this, please configure the label enhancement rules. For specific instructions, refer to: /conf/label_enrichment

|+| How is the alert title determined? Can I modify it?

    Flashduty employs a specific title generation method for each integration, typically in the format "strategy name / Alert object".  To customize the title generation rules, please refer to: /advanced/customize_incident_attrs

|+| How can I check the integration type of an alert event?

    Click on the incident => Enter Incident Details => Related Alerts => Alert Source.