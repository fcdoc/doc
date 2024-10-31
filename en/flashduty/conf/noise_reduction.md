---
brief: Through alert aggregation, multiple similar active alerts can be consolidated into a single incident for joint dispatching, notification, and handling, which significantly reduces notification frequency and enhances response efficiency
---

# Configure Alert Noise Reduction

## Set alert aggregation
Go to [Collaboration Space Details] - [ Alert reduction], you can set the **alert aggregation** strategy. When creating a new collaboration space, alert is turned off by default. It is recommended that you manually turn it on and set aggregation policies as needed.

> [!NOTE]
> When alert aggregation is not enabled, each alert will create a separate incident, with both sharing identical basic information.

- Aggregation dimensions: A space can be configured with multiple sets of default aggregation dimensions. If any set matches, the alert and incident are considered similar and can be merged.

- If you wish to manage different alerts separately, please enable __Fine-Grained Control__.
- Fine-Grained Control allows you to filter incidents and specify a particular aggregation dimension.
- The system always prioritizes fine-grained control matching. If no match is found, the default aggregation dimensions will be used.
- You can proceed to [Configure filters](/conf/how_to_filter) to understand how to set up filtering criteria.

- Aggregation window: You can choose to aggregate only alerts that are close in time (which have stronger相关性), and alerts outside the time window will trigger a new incident. **Note that this window is a sliding window, always extending as new alerts are incorporated.**

- It is generally recommended to use the average arrival time of alerts as the aggregation window, for instance, 10 minutes.

- Storm Alert: After an incident is triggered, the system will immediately dispatch and notify (unless a delay notification is set). Subsequently, it will continue to incorporate new alerts, **but no new notifications will be triggered**, which may prevent timely perception of an alert storm. Therefore, we provide a threshold; when the number of incorporated alerts reaches this threshold, the system will trigger a storm alert to prompt expedited handling.

- We always suggest enabling storm alerts.

- Preview: You can use the preview feature to retrieve recent events and render the noise reduction results in real-time, thus assessing the noise reduction effect. The system can retrieve up to `666` historical events.

<img src="https://fcdoc.github.io/img/zh/flashduty/alter/what_is_noise_reduction/2.avif" style="display: block; margin: 0 auto;" height="400">

## View Aggregation Examples

By setting the space to aggregate according to **alert check items**, the system receives five alert notifications in sequence, each triggering an alert and incident:

```
故障：cpu idle < 20% / es.nj.03，Critical

- 告警cpu idle < 20% / es.nj.03：
- 事件1：es.nj.03，cpu.idle = 10%，Critical
- 事件2：es.nj.03，cpu.idle = 18%，Warning
- 事件4：es.nj.03，cpu.idle = 10%，Ok

- 告警cpu idle < 20% / es.nj.01：
- 事件3：es.nj.01，cpu.idle = 15%，Warning

- 告警cpu idle < 20% / es.nj.02：
- 事件5：es.nj.02，cpu.idle = 19%，Warning
```

We can see the final [Incident-Alert-Event] correlation through the incident details page of the console:
- Click on the alert title to view the associated alert's details, including the timeline and related events
- Click on the event point to view the specific content reported by the event, including tags and descriptions

![](https://fcdoc.github.io/img/zh/flashduty/alter/what_is_noise_reduction/3.avif)

## FAQs

|+| Will the incident title change when an alert is incorporated?

    No, the default incident title is identical to the first alert that triggered the incident. You can manually modify the incident title at any time; it will not change with the incorporation of new alerts.

|+| Will the incident tags change when an alert is incorporated?

    - For manually created alerts: No, the tag list will always be empty
    - For automatically triggered alerts: They may change. The incident's tags will be consistent with the first alert that triggered the incident. If the alert's tags change, the incident's tags will also change accordingly.

|+| Will the alert tags change as events are incorporated?

    Yes, the alert tags always align with the newly incorporated events. For instance, if you receive an alert "CPU idle low" at 10 a.m. with a trigger value of 10%, the trigger value tag may change dynamically as more events are incorporated. However, if a new event is a recovery event, the alert will retain existing tags and add any new ones.

|+| Is there an upper limit to the number of alerts that can be incorporated into an incident?

    Yes, we set a maximum of 1,000 alerts per incident. This is primarily to reduce console page rendering time. However, Flashduty is a high-performance event processing system with extensive concurrent logic in the background. Therefore, seeing an incident with more than 1,000 alerts is a normal occurrence that may happen.

|+| Is there an upper limit to the number of events an alert can incorporate?

    No, but the maximum window for incorporating events into an alert is 24 hours. This means that if an alert is triggered and has not been resolved within 24 hours, no future events will be incorporated. If Flashduty receives a new event, a new alert will be generated.

|+| Why don't the number of events I push match the number of events associated with the alert?

    The process of incorporating events into alerts is also a noise reduction measure. If Flashduty determines that the newly reported event and the alert have not significantly changed (e.g., status, severity, description), Flashduty will discard the new event and use the new event's tags to overwrite existing ones.