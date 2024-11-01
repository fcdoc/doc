---
brief: Through alert aggregation, multiple similar active alerts can be combined into a single incident, allowing for unified dispatch, notification, and handling. This can significantly reduce notification frequency and improve processing efficiency
---

# Configure Alert Noise Reduction

## Set Alert Aggregation
Go to [Collaboration Space Details] - [ Alert reduction], you can set the **alert aggregation** strategy. When creating a new collaboration space, alert is turned off by default. It is recommended that you manually turn it on and set aggregation policies as needed.

> [!NOTE]
> When alert aggregation is not enabled, each alert will create an incident, and the basic information of both will be identical.

- Aggregation Dimensions: A space can have multiple sets of default aggregation dimensions. If any set of dimensions matches, the alert and incident are considered similar and can be merged.

- If you wish to offload processing to different alert please turn on __ fine-grained control __ .
- Fine-grained control allows you to filter incidents and set specific aggregation dimensions.
- The system always prioritizes matching fine-grained controls. If no match is found, the default aggregation dimensions will be used.
- You can go to [Configure Filters](/conf/how_to_filter) to learn how to configure filters.

- Aggregation Window: You can choose to aggregate only recently occurring alerts (with stronger correlation), and alerts exceeding the time window will trigger a new incident. **Note that this window is a sliding window and always extends as new alerts are merged**.

- It is generally recommended that you use the average arrival time of alerts as the aggregation window. For example, 10 minutes.

- Storm Warning: After an incident is triggered, the system will immediately dispatch and notify (assuming you have not set a delayed notification), and then continue to merge new alerts, **but no new notifications will be triggered**. This can cause you to miss an alert storm. Therefore, we provide this threshold. When the number of merged alerts reaches the threshold, the system will trigger a storm warning to remind you to expedite processing.

- We always recommend enabling storm warnings.

- Preview: You can use the preview function to pull recent events and render the noise reduction results in real time to evaluate the noise reduction effect. The system can pull up to `666` historical events.

<img src="https://fcdoc.github.io/img/zh/flashduty/alter/what_is_noise_reduction/2.avif" style="display: block; margin: 0 auto;" height="400">

## See Aggregation Examples

Set the space to aggregate alerts based on **alert check items**. The system receives 5 alert notifications in sequence, each of which triggers an alert and incident:

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
- Click the alert title to view the details of the associated alert, including the alert's timeline and associated events
- Click the event point to view the specific content of the event report, including labels and descriptions

![](https://fcdoc.github.io/img/zh/flashduty/alter/what_is_noise_reduction/3.avif)

## Frequently Asked Questions

|+| Will the title of the incident change when the alert is merged?

    No, the default incident title is exactly the same as the first alert that triggered the incident. You can manually modify the incident title at any time. This title will not change with the new alert.

|+| Will the incident label change when the alert is merged?

    - Manually created alerts: No, their label list will always be empty
    - Automatically triggered alerts: It is possible. In this case, the incident's label will be consistent with the label of the first alert that triggered the incident. If the alert's label changes, the incident's label will also change synchronously.

|+| Will the alert label change as the event merges?

    Yes, the alert label always remains consistent with the newly merged event. For example, if you receive an alert "CPU idle low" at 10 o'clock with a trigger value of 10%, as the alert incorporates more events, the trigger value label may change dynamically. However, if the newly received event is a recovery event, the alert will keep the existing labels unchanged and add any new labels. Our principle is that the label displayed by the alert should remain as it was when it was triggered as much as possible.

|+| Is there an upper limit on the number of alerts that can be merged into an incident?

    Yes, we set a single incident to aggregate up to 1,000 alerts. This is mainly to reduce the rendering time of the console page. However, Flashduty is a high-performance event processing system with a lot of concurrent logic in the background, so when you see an incident aggregating more than 1,000 alerts, this is a possible normal phenomenon.

|+| Is there an upper limit on the number of events that an alert can merge?

    No. However, the maximum window for an alert to aggregate events is 24 hours. This means that if an alert is triggered and has not been resolved within 24 hours, it will not merge new events in the future. If Flashduty receives a new event, a new alert will be generated.

|+| Why do the number of events I push and the number of events associated with the alert not match?

    The merging of events into alerts is also a noise reduction process. If Flashduty determines that the newly reported event and the existing alert have not changed significantly (for example, the status, severity, and description have not changed), Flashduty will discard the newly reported event and use the label of the new event to overwrite the existing label.