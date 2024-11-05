---
brief: The incident in Flashduty represents an ongoing problem or a matter that needs to be handled. An incident is generally triggered by an alert and is often associated with a series of similar alerts.
---

# What Is an Incident

An incident represents an ongoing problem or a matter that needs to be handled. An incident is generally triggered by an alert and is often associated with a series of similar alerts.

## Incident, Alert, and Events

When Flashduty receives an alert event (such as an alert notification from Zabbix), the system will automatically trigger an alert, and this alert will trigger an incident. Multiple similar active alerts may be aggregated into the same incident and dispatched, notified, and processed together.

We can simply understand it as: **an incident is a combination of similar alerts**. In the absence of noise reduction, an incident is equivalent to an alert. Conversely, in the case of noise reduction, an incident is equivalent to its associated multiple alerts. For more information on the noise reduction model for alerts, please read [Understanding the Noise Reduction Process](doc-4185939).

## Incident Severity, Status, and Progress

### Severity

- **Info**: Minor, the service itself is still running normally, only a service status reminder is provided, and no immediate action is required.
- **Warning**: Warning, the service may be malfunctioning or problems are about to occur, and early intervention is recommended to prevent escalation.
- **Critical**: Severe, the service is experiencing widespread issues or even outages, affecting users, and immediate intervention is required.

Incidents, alerts, and events all use the above three severity levels. **The severity level is capitalized**, so you need to be careful when using the API. The severity generation rules for the three are as follows:

- **Event Severity**: Alert events from different integration sources (such as Zabbix and Nightingale) have different severity enumeration values, and Flashduty will map them to the above three standard severity levels according to certain rules. For specific mapping relationships, please refer to the access documentation of the specific integration.
- **Alert Severity**: Equal to the highest severity level in the associated event.
- **Incident Severity**: Equal to the highest severity level in the associated alerts.

### Processing Progress

- **Pending**: After an incident is triggered, the processing progress defaults to "Pending," and the system will initiate automatic dispatch, set handlers, and notify them.
- **Processing**: If any person clicks **Claim Incident**, the processing progress will immediately change to "Processing." In this case, the incident's handlers may be in **claimed** or **unclaimed** status, but at least one person is in "claimed" status. When all handlers **unclaim**, the incident processing progress will revert to "Pending."
- **Closed**: If anyone clicks **Close Incident** or the incident **automatically recovers**, the processing progress will immediately change to "Closed."

### Incident Status

The status of an alert represents the status of the incident in the original monitoring system, i.e., "Recovered" or "Not Recovered." The status of an incident is entirely determined by its associated alerts.

- **Recovered**: If all associated alerts have recovered, the incident will automatically recover.
- **Not Recovered**: If at least one associated alert has not recovered, the incident will remain in an "Not Recovered" state.

> [!TIP]
> Automatic incident recovery will cause the (processing progress) to be automatically closed; however, manually closing an incident will have no impact on the incident's status.

## Incident Tags

Labels are a very important basic concept in Flashduty. Different labels describe alert and incident information in different dimensions, and are widely used in filtering, retrieval, aggregation and other scenarios.

**How are tags generated?**

The tags of an alert are extracted from the event message body reported by the original alert system. Different sources have different extraction methods. Generally, we adopt the principle of **extracting as much as possible**. For example, for alerts from Prometheus, Flashduty will extract the Labels and Annotations information from the Payload.

Tags can only be obtained through event reporting and cannot be manually modified or added. The tags of an automatically triggered incident are always equal to the tags of its associated first alert. For a manually triggered incident, its tags will always be empty.

Flashduty provides a tag enhancement solution for automatically generating tags. For more information, go to [Configure Tag Enhancement](http://docs.flashcat.cloud/zh/flashduty/label-enrichment-settings).

## Incident Lifecycle

**1. Trigger a New Incident**

**Automatic Triggering**: When Flashduty receives an alert event (such as a Zabbix notification) reported by an integration, the event automatically triggers an alert, and the alert automatically triggers an incident.

**Manual Triggering**: Manually in the Flashduty console, click the **Create Incident** button, fill in the title, description, severity, and other information to trigger a new incident.

**2. Dispatch and Notification**

After a new incident is triggered, Flashduty will match the dispatch strategy under the associated collaboration space. After matching the dispatch strategy, the system will assign the incident to individuals, team members, or on-duty personnel and notify them. **If no dispatch strategy is matched, the incident will not be dispatched to anyone, and no notification will be given**.

You can set different dispatch strategies for different time periods or different types of incidents to achieve flexible dispatch. The system allows you to set up multiple dispatch stages under one dispatch strategy. If the assigned personnel of the current stage do not complete the incident confirmation and processing within the specified time, the system will automatically upgrade to the next stage. Upgrading is equivalent to reassigning the incident to other personnel.

You can flexibly arrange notification methods in the dispatch strategy. Flashduty supports a large number of group chat and one-on-one notification channels. One-on-one is a one-to-one push channel (such as voice, text message, and email), and group chat is a push message to a message group (such as Feishu, DingTalk, and Slack), and provides additional reminders to assigned personnel.

> [!TIP]
> Note that **an incident will only be notified after it is dispatched**. Without dispatch, there are no notifications.

If you assign an incident to a duty schedule where no one is on call (a bye), the system will not send notifications to any individual. However, if you have configured a group chat channel, messages will still be pushed to the group chat.

**3. Claim and Resolve**

After on-call personnel receive the notification, they can immediately claim the incident. You can claim the incident in **voice calls** and **instant messages**. After claiming, the incident processing progress will change to **Processing**.

> [!TIP]
> Flashduty currently does not restrict incidents to only being claimed by "assigned handlers." Anyone who sees the incident can click to claim it.

**Closing an Incident** will cause the processing progress to change to **Closed**. If the incident's associated alerts automatically recover, the incident will also automatically close. Conversely, if you manually close the incident, it will cause all associated alerts to automatically close. This means that these alerts will no longer be merged into any new events.

## Incident Timeline

Each incident has a timeline that is used to trace back the changes and operations that occurred at different moments in the incident's history. For example, at what point in time, through what channel, who was notified of the incident, and the results of the notification.

![](https://fcdoc.github.io/img/zh/flashduty/alter/what_is_incident/1.avif)

## Triggering an Incident

### Triggering an Incident Through Integration

Flashduty already supports most common monitoring systems, including Prometheus, Zabbix, Nightingale, and cloud monitoring, etc. Go to [Alert Integration](/mixin/alert_integration/nightingale) to view specific operation steps.

> [!TIP]
> Flashduty supports dedicated integration and shared integration models. Delivering alerts to the exclusive integration under the collaboration space will trigger the incident under this collaboration space.
> Or deliver alerts to the shared integration of the integration center, and then configure routing to deliver alerts to different collaboration spaces according to rules.

### Triggering an Incident via API

Flashduty provides a custom event standard that allows you to report alerts through standard protocols, suitable for any unadapted monitoring system. For detailed documentation, please read [Custom Events](/mixin/alert_integration/custom_alert).

> [!TIP]
> To ensure the stability of the entire system, Flashduty currently has a **200qps** frequency limit for API reporting. If the limit is exceeded, reporting will be refused.

> [!TIP]
> Please ensure that you will actively close alerts, or set the incident to automatically close after a timeout in the collaboration space. When there are too many incidents, console retrieval performance will drop sharply. At that time, the system may close historical incidents without any notification.

### Triggering an Incident via Email

Flashduty provides an email integration that allows you to report alerts by sending emails, suitable for all monitoring systems that support email notifications. For detailed documentation, please read [Custom Events](/mixin/alert_integration/email).

> [!TIP]
> You can set specific email prefixes for each integration. You can also contact us to set an exclusive domain name for your main account that is easy to remember. For example, order-service@tesla.flashcat.cloud.

### Triggering an Incident Through the Console

Click the **Create** button on the console to initiate the creation of an incident.

| Field | Required | Description |
| :---: | :---:   | ---- |
| Incident title | Yes | A brief statement of what happened |
| Incident Description | No | A detailed description of the incident, supporting Markdown syntax |
| Severity | Yes | Select one of the three enumeration values: Critical, Warning, Info |
| Collaborative Space | No | Incident Attribution<br>If not selected, it represents a global incident.<br>In this case, the incident must be directly assigned to a person to trigger notifications |
| Assigned Personnel | No | Incident Handler<br>If not selected, the handler will be matched and assigned based on the collaboration space they belong to.<br>Otherwise, notifications will be sent directly according to personal preferences |