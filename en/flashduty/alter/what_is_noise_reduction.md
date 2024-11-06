---
brief: Understand how Flashduty reduces noise for alerts
---

# Learn about alert noise reduction

Understand how Flashduty reduces noise for alerts.

When Flashduty receives an alert event (such as an alert notification from Zabbix), the system will automatically trigger an alert, and this alert will trigger an incident. Multiple similar active alerts may be aggregated into the same incident and dispatched, notified, and processed together. This can significantly reduce the frequency of notifications and improve processing efficiency.

## Noise Reduction Model

### Basic Concepts

- **Event (Event)**: From the original monitoring system (such as Zabbix), each trigger and recovery notification is an event.
- **Alert (Alert)**: Automatically triggered by events. Events that occur at different times in the same alert in the original monitoring system will be merged into the same alert by Flashduty.
- **Incident (Incident)**: The main object processed by the Flashduty platform, generally automatically triggered by an alert, but can also be manually created. An incident can be understood as a combination of similar alerts. Flashduty, based on the aggregation strategy configured by the user, will automatically aggregate similar alerts together for dispatch and processing.

### Noise Reduction Process

An incident can be triggered in two ways: manual creation and automatic triggering. Alert noise reduction only takes effect in the automatic trigger scenario. The general noise reduction process is as follows:

1. The monitoring system generates an alert and pushes it to Flashduty
2. Flashduty determines whether the new event can be merged into an active alert. If not, a new alert is triggered; otherwise, it is merged
3. Flashduty determines whether the new alert can be merged into an active incident. If not, a new incident is triggered; otherwise, it is merged
4. Flashduty assigns personnel according to the dispatch strategy and notifies them
5. The personnel receive the notification and begin to handle the incident

![](https://fcdoc.github.io/img/zh/flashduty/alter/what_is_noise_reduction/1.avif)

## Set Alert Aggregation

Go to [Collaboration Space Details] - [ Alert reduction], you can set the **alert aggregation** strategy. When creating a new collaboration space, alert is turned off by default. It is recommended that you manually turn it on and set aggregation policies as needed.

> [!NOTE]
> When alert aggregation is not enabled, each alert will create an incident, and the basic information of the two will be exactly the same.

- Aggregation Dimension: A space can set multiple sets of aggregation conditions. If any set of conditions matches, the alert and incident are considered similar and can be combined.
- Aggregation Window: You can choose to aggregate only alerts that occur nearby (with stronger correlation). Alerts that exceed the time window will trigger new incidents. Note that this window is a sliding window and is always extended as new alerts are added.
- Storm Warning: After an incident is triggered, the system will dispatch and notify immediately (assuming you do not set a delay notification). Subsequently, it will continue to merge new alerts, but no new notifications will be triggered, which can cause you to miss an alert storm. Therefore, we provide this threshold. When the number of merged alerts reaches the threshold, the system will trigger a storm warning to remind you to expedite processing.
- Preview: You can use the preview function to pull recent events and render the noise reduction results in real time to evaluate the noise reduction effect

<img src="https://fcdoc.github.io/img/zh/flashduty/alter/what_is_noise_reduction/2.avif" style="display: block; margin: 0 auto;" height="400">

## View Aggregation Examples

Set the space to aggregate based on **alert check items**. The system receives 5 alert notifications in sequence. These notifications trigger alerts and incidents in turn:

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

|+| Will the title of the incident change when the alert is merged?

    No, the default incident title is exactly the same as the first alert that triggered the incident. You can manually modify the incident title at any time. This title will not change with the new alert.

|+| Will the incident label change when the alert is merged?

    - Manually created alerts: No, its label list will always be empty
    - Automatically triggered alerts: It is possible. The labels of the incident will be consistent with the labels of the first alert that triggered the incident. If the labels of the alert change, the labels of the incident will also change synchronously.

|+| Will the alert label change as the event merges?

    Yes, the alert label will always be consistent with the newly merged event. For example, if you receive an alert "CPU Idle Low" at 10 o'clock, the trigger value is 10%. As the alert incorporates more events, the trigger value label may change dynamically. However, if the newly received event is a recovery event, the alert will keep the existing labels unchanged and add labels that did not exist before. Our principle is to keep the labels displayed by the alert as much as possible when it is triggered.

|+| Is there an upper limit on the number of alerts that can be merged into an incident?

    Yes, we have set a single incident to aggregate up to 1,000 alerts. This is mainly to reduce the rendering time of the console page. However, Flashduty is a high-performance event processing system with a lot of concurrent logic in the background, so when you see an incident aggregating more than 1,000 alerts, this is a possible normal phenomenon.

|+| Is there an upper limit on the number of events that an alert can merge?

    No. However, the maximum window for an alert to aggregate events is 24 hours. This means that if an alert is triggered and has not been resolved for 24 hours, new events will not be merged in the future. If Flashduty receives a new event, a new alert will be generated.

|+| Why do the number of events I push and the number of events associated with the alert not match?

    The merging of events into alerts is also a noise reduction process. If Flashduty believes that the newly reported event and the alert have not changed much (for example, the status, severity, description, etc., have not changed), Flashduty will directly discard the newly reported event and use the labels of the new event to overwrite the existing labels.