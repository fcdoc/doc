---
brief: Understand how Flashduty mitigates noise in alarms
---

# Learn about alarm noise reduction

Grasp how Flashduty reduces noise in alarms.

When Flashduty receives an alarm event (e.g., a Zabbix alert notification), the system automatically triggers an alarm, which in turn initiates a fault. Multiple similar active alarms may be consolidated into a single fault, allowing for joint dispatching, notification, and handling, which significantly reduces notification frequency and enhances response efficiency.

## Noise Reduction Model

### Basic Concepts

- **Event (Event)**: An event originating from the original monitoring system (such as Zabbix), with each trigger and recovery notification constituting an event.
- **Alarm (Alert)**: Automatically triggered by events, where alarms from the same event in the original monitoring system, occurring at different times, are consolidated into a single alert by Flashduty.
- **Fault (Incident)**: The primary object processed by the Flashduty platform, usually automatically triggered by alarms but can also be manually created. A fault is a grouping of similar alarms, with Flashduty aggregating similar alarms based on user-configured policies for dispatching and handling.

### Noise Reduction Process

Faults can be triggered in two ways: manually or automatically. Alarm noise reduction is effective only in the automatic triggering scenario. The general process of noise reduction is as follows:

1. The monitoring system generates an alarm and pushes it to Flashduty
2. Flashduty determines if the new event can be incorporated into an existing active alarm; if not, a new alarm is triggered, otherwise, it is incorporated
3. Flashduty determines if the new alarm can be incorporated into an existing active fault; if not, a new fault is triggered, otherwise, it is incorporated
4. Flashduty assigns personnel according to the dispatching strategy and notifies them
5. Personnel receive the notification and begin to address the fault

![Flashduty-Alarm Noise Reduction.png](https://fcdoc.github.io/img/zh/162SjbaT8JsHNjwpD1lTkMqYHD9AafLsUB1CvUKGVV0.avif)

## Set Alarm Aggregation

Go to [Collaboration Space Details] - [Alarm Noise Reduction], you can set the **alarm aggregation** strategy. When creating a new collaboration space, alarm aggregation is turned off by default. It is recommended that you manually enable it and set aggregation policies as needed.

> [!NOTE]
> When alarm aggregation is not enabled, each alarm will create a separate fault, with identical basic information.

- Aggregation Dimensions: A space can set multiple sets of aggregation conditions; if any set matches, the alarm and fault are considered similar and can be incorporated.
- Aggregation Window: You can choose to aggregate only alarms that occur close together (indicating stronger correlation), with alarms outside the time window triggering new faults. Note that this window is sliding and extends as new alarms are incorporated.
- Storm Alert: After a fault is triggered, the system immediately dispatches and notifies (unless a delay notification is set). Subsequent alarms are incorporated without triggering new notifications, which may prevent timely detection of an alarm storm. Therefore, we provide a threshold; when the number of incorporated alarms reaches this threshold, a storm alert is triggered to prompt urgent handling.
- Preview: Use the preview function to pull recent events and render the noise reduction results in real-time to assess the effectiveness of the noise reduction

<img src="https://fcdoc.github.io/img/zh/V7G1hZj1IPX10Fsa_ekHR77oKs8POHsib5y2zg-Yjdw.avif" style="display: block; margin: 0 auto;" height="400">

## View Aggregation Examples

When the space is set to aggregate by **alarm check items**, the system receives five alarm notifications sequentially, each triggering an alarm and a fault:

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

We can see the final [fault-alarm-event] correlation relationship through the console fault details page:
- Click on the alarm title to view the details of the associated alarm, including its timeline and related events
- Click on the event point to view the specific content reported by the event, including tags and descriptions

![](https://fcdoc.github.io/img/zh/jAkbujzJKD3war7mV4EyzsYvd-TZB1BX_wJ1PUGZKTM.avif)

## FAQs

|+| Will the title of the fault change when alarms are incorporated?

    No, the default title of the fault is identical to the first alarm that triggered it. You can manually edit the fault title at any time, and this title will not change with the incorporation of new alarms.

|+| Will the tags of the fault change when alarms are incorporated?

    - Manually created alarms: No, their tag list will always remain empty
    - Automatically triggered alarms: Possibly. In such cases, the tags of the fault will match those of the first alarm that triggered it. If the tags of the alarm change, the fault's tags will also update accordingly.

|+| Will the tags of the alarm change as events are incorporated?

    Yes, the tags of the alarm will always align with the newly incorporated events. For instance, if you receive an alarm "CPU idle too low" at 10 a.m. with a trigger value of 10%, as more events are incorporated into the alarm, the trigger value tag may change dynamically. However, if the new event is a recovery event, the alarm will retain its existing tags and add any tags that were not previously present. Our principle is to maintain the tags displayed by the alarm as close as possible to their original state at the time of triggering.

|+| Is there a limit to the number of alarms that can be incorporated into a fault?

    Yes, we have set a limit of 1,000 alarms for a single fault to be aggregated, primarily to reduce the rendering time of the console page. However, Flashduty is a high-performance event processing system with extensive concurrent logic in the background. Therefore, when you see a fault aggregated with more than 1,000 alarms, this may be a normal occurrence.

|+| Is there a limit to the number of events that can be incorporated into an alarm?

    No. However, the maximum window for an alarm to aggregate events is 24 hours. This means that if an alarm is triggered and not resolved within 24 hours, no new events will be incorporated. If Flashduty receives new events after this period, a new alarm will be generated.

|+| Why don't the number of events I push match the number of events associated with the alarm?

    The merging of events into alarms is also a process of noise reduction. If Flashduty determines that the newly reported events and the alarms have not changed significantly (e.g., status, severity, description, etc. remain unchanged), Flashduty will discard the new events and use the tags from the new events to overwrite the existing ones.