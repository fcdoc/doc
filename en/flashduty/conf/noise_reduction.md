---
brief: Through alert aggregation, multiple similar active alerts can be aggregated into the same incident and dispatched, notified, and processed together. This can significantly reduce the frequency of notifications and improve processing efficiency
---

# Configure Alert Noise Reduction

## Set Alert Aggregation
Go to [Collaboration Space Details] - [ Alert reduction], you can set the **alert aggregation** strategy. When creating a new collaboration space, alert is turned off by default. It is recommended that you manually turn it on and set aggregation policies as needed.

> [!NOTE]
> When alert aggregation is not enabled, each alert will create an incident, and the basic information of the two will be exactly the same.

- Aggregation Dimensions: A space can set multiple default aggregation dimensions. If any set of dimensions matches, the alert and incident are considered similar and can be merged.

- If you wish to分流处理 different alerts, please turn on __fine-grained control__.
- Fine-grained control allows you to filter incidents and set a specific aggregation dimension.
- The system always gives priority to matching fine-grained controls. If no match is found, the default aggregation dimension will be used.
- You can go to [Configure Filters](/conf/how_to_filter) to learn how to configure filters.

- Aggregation Window: You can choose to aggregate only recently occurred alerts (with stronger correlation), and alerts that exceed the time window will trigger a new incident. **Note that this window is a sliding window and always extends as new alerts are added**.

- It is generally recommended that you use the average arrival time of alerts as the aggregation window. For example, 10 minutes.

- Storm Warning: After an incident is triggered, the system will dispatch and notify immediately (assuming you have not set a delay notification), and then continue to merge new alerts, **but no new notifications will be triggered**, which can cause you to miss an alert storm. Therefore, we provide this threshold. When the number of merged alerts reaches the threshold, the system will trigger a storm warning to remind you to expedite processing.

- We always recommend turning on storm warnings.

- Preview: You can use the preview function to pull recent events and render the noise reduction results in real time to evaluate the noise reduction effect. The system can pull at most `666` historical events.

<img src="https://fcdoc.github.io/img/zh/flashduty/alter/what_is_noise_reduction/2.avif" style="display: block; margin: 0 auto;" height="400">

## See Aggregation Examples

Set the space to aggregate by **alert check items**. The system received 5 alert notifications in sequence. These notifications triggered alerts and incidents in turn:

```i18n
Fault: cpu idle < 20% / es.nj.03, Critical

- Alert CPU Idle< 20% / es.nj.03:
- Event 1: es.nj.03, cpu.idle = 10%, Critical
- Event 2: es.nj.03, cpu.idle = 18%, Warning
- Event 4: es.nj.03, cpu.idle = 10%, Ok

- Alert CPU Idle< 20% / es.nj.01:
- Event 3: es.nj.01, cpu.idle = 15%, Warning

- Alert CPU Idle< 20% / es.nj.02:
- Event 5: es.nj.02, cpu.idle = 19%, Warning
```

We can see the final [Incident-Alert-Event] correlation through the incident details page of the console:
- Click the alert title to view the details of the associated alert, including the alert's timeline and associated events
- Click the event point to view the specific content of the event report, including labels and descriptions

![](https://fcdoc.github.io/img/zh/flashduty/alter/what_is_noise_reduction/3.avif)

## Frequently Asked Questions

|+| Will the title of the incident change when alerts are merged?

    No, the default incident title is exactly the same as the first alert that triggered the incident. You can manually modify the incident title at any time. This title will not change with the new alerts.

|+| Will the incident labels change when alerts are merged?

    - Manually created alerts: No, their label list will always be empty
    - Automatically triggered alerts: Possibly, the incident's labels will be consistent with the labels of the first alert that triggered the incident. If the alert's labels change, the incident's labels will also change synchronously.

|+| Will the alert labels change as events are merged?

    Yes, the alert labels will always be consistent with the newly merged events. For example, if you receive an alert "CPU Idle Low" at 10 o'clock, the trigger value is 10%. As the alert incorporates more events, the trigger value label may change dynamically. But if the newly received event is a recovery event, the alert will keep the existing labels unchanged and add labels that did not exist before. Our principle is that the labels displayed by the alert should remain as they were when it was triggered as much as possible.

|+| Is there an upper limit on the number of alerts that can be merged into an incident?

    Yes, we set a single incident to aggregate up to 1,000 alerts. This is mainly to reduce the rendering time of the console page. However, Flashduty is a high-performance event processing system with a lot of concurrent logic in the background, so when you see an incident aggregating more than 1,000 alerts, this is a normal phenomenon that may occur.

|+| Is there an upper limit on the number of events that can be merged into an alert?

    No. But the maximum window for an alert to aggregate events is 24 hours. This means that if an alert is triggered and has not been resolved within 24 hours, new events will not be merged in the future. If Flashduty receives a new event, a new alert will be generated.

|+| Why do the number of events I push and the number of events associated with the alert not match?

    The merging of events into alerts is also a noise reduction process. If Flashduty believes that the newly reported event and the alert have not changed much (for example, the status, severity, description, etc. have not changed), Flashduty will directly discard the newly reported event and use the label of the new event to overwrite the existing label.