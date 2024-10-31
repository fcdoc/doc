---
brief: The incident in Flashduty represents an ongoing issue or a matter requiring attention. Incidents are typically initiated by alerts and often coincide with a series of related alerts.
---

# What is an Incident?

An Incident signifies an ongoing issue or a matter requiring attention. It is usually triggered by an alert and is often linked to a series of similar alerts.

## Incident, Alert, and Events

When Flashduty receives an alert event (such as an alert notification from Zabbix), the system automatically triggers an alert, which in turn initiates an incident. Multiple similar active alerts may be consolidated into a single incident, and are then dispatched, notified, and processed concurrently.

We can simply understand it as: **an Incident is a consolidation of similar alerts**. In the absence of noise reduction, an Incident is equivalent to an alert. Conversely, in a noise-reduction scenario, an Incident is equivalent to the associated multiple alerts. For more information on the noise reduction model of alerts, please refer to [Understanding the Noise Reduction Process](doc-4185939).

## Incident Severity, Status, and Progress

### Severity

- **Info**: Minor; the service is still operating normally; this is merely a service status alert, and no immediate action is required.
- **Warning**: Caution; the service may be experiencing issues or is on the verge of problems; early intervention is recommended to prevent escalation.
- **Critical**: Severe; the service is widely affected or even disrupted; users are impacted, and immediate intervention is necessary.

Incidents, Alerts, and events all utilize the three severity levels mentioned above. **Severities are capitalized**, and you should pay close attention when using the API. The rules for generating severities for the three are as follows:

- **Event Severity**: Alerts from various integration sources (e.g., Zabbix and Nightingale) carry different severity enumeration values. Flashduty maps these values to the three standard severity levels outlined above according to specific rules. For detailed mapping information, please consult the access documentation for the respective integration.
- **Alert Severity**: Matches the highest severity level among the associated events.
- **Incident Severity**: Matches the highest severity level among the associated alerts.

### Processing Progress

- **Pending**: After an Incident is triggered, the default processing status is "Pending". The system will automatically dispatch, assign handlers, and notify them.
- **In Progress**: If anyone clicks **Claim Incident**, the processing status is immediately changed to "In Progress". In this case, the Incident's handlers may be in **Claimed** or **Unclaimed** status, but at least one person must be in "Claimed" status. When all handlers **unclaim** the Incident, the processing status will revert to "Pending".
- **Closed**: Clicking **Close incident** or **Incident Auto Recovery** will immediately change the processing progress to "Closed".

### Incident Status

The status of an Alert represents the status of the Incident in the original monitoring system, i.e., "Recovered" or "Unrecovered". The status of an Incident is entirely determined by its associated Alert.

- **Recovered**: All associated Alerts have been resolved, and the Incident will automatically recover.
- **Unrecovered**: At least one of the associated Alerts has not been resolved, and the Incident will remain in an unrecovered state.

> [!TIP]
> Automatic incident recovery will cause (processing progress) to be automatically closed; however, closing the incident manually will have no impact on the status of the incident.

## Incident Tags

Labels are a very important basic concept in Flashduty. Different labels describe alert and incident information in different dimensions, and are widely used in filtering, retrieval, aggregation and other scenarios.

**How are tags generated?**

The tags of Alerts are extracted from the event message body reported by the original alert system. Different sources have different extraction methods. Generally, we adhere to the principle of **extracting as much as possible**. For example, for Prometheus source alert events, Flashduty extracts the Labels and Annotations information from the Payload.

Tags can only be obtained through event reporting and cannot be manually modified or added. The tag of an automatically triggered Incident is always equal to the tag of its associated first Alert. For a manually triggered Incident, its tag will always be empty.

Flashduty offers a label enhancement solution for automated label generation. For more information, visit [Configure Label Enhancement](http://docs.flashcat.cloud/zh/flashduty/label-enrichment-settings).

## Incident Life Cycle

**1. Triggering a New Incident**

**Automatic Triggering**: Upon receiving an alert event reported by an integration (e.g., a notification from Zabbix), Flashduty automatically triggers an alert, which subsequently initiates an incident.

**Manual Triggering**: Manually create an Incident in the Flashduty console by clicking the **Create Incident** button, filling in the title, description, severity, and other information to trigger a new Incident.

**2. Distribution and Notification**

After a new Incident is triggered, Flashduty will sequentially match the dispatch strategy under the relevant collaborative space. Once a dispatch strategy is matched, the system will assign the Incident to individuals, team members, or on-duty personnel and notify them. **If no dispatch strategy is matched, the Incident will not be assigned to anyone, and no notification will be sent**.

You can set different dispatch strategies for different time periods or types of Incidents to achieve flexible dispatch. The system allows you to set up multiple dispatch stages within a single dispatch strategy. If the assigned personnel for the current stage do not confirm and process the Incident within the specified time, the system will automatically escalate to the next stage. Escalation is equivalent to reassigning the Incident to other personnel.

You can flexibly arrange notification methods within the dispatch strategy. Flashduty supports a wide range of group chat and one-on-one notification channels. One-on-one chat is a direct push channel (such as voice, text message, and email), while group chat pushes messages to a message group (such as Feishu, DingTalk, and Slack) and provides additional reminders to the assigned personnel.

> [!TIP]
> Note that **Incidents will not be notified until they are assigned**. Without assignment, there will be no notifications.

If you assign an Incident to a duty schedule (rota) where no one is on-call, the system will not initiate a notification to any individual, but if you have configured a group chat channel, messages will still be pushed to the group chat.

**3. Claim and Resolve**

After On-Call personnel receive the notification, they can immediately claim the Incident. You can claim an Incident via **voice calls** and **instant messages**. After claiming, the Incident processing status will change to **In Progress**.

> [!TIP]
> Flashduty currently does not restrict Incidents to only being claimed by "assigned handlers". Anyone who can see the Incident can click to claim it.

**Closing an Incident** will change the processing status to **Closed**. If the associated Alerts auto-recover, the Incident will also auto-close. Conversely, if you manually close an Incident, all associated Alerts will auto-close. This means these Alerts will no longer be merged into any new events.

## Incident Timeline

Each Incident has a timeline that allows you to trace the changes and operations that occurred at different times in the Incident's history. For instance, it records when and through which channel the Incident was notified to whom, and the outcome of the notification.

![](https://fcdoc.github.io/img/zh/flashduty/alter/what_is_incident/1.avif)

## Triggering an Incident

### Triggering an Incident Through Integration

Flashduty supports most common monitoring systems, including Prometheus, Zabbix, Nightingale, and cloud monitoring, among others. For specific steps, please refer to [Alert Integration](/mixin/alert_integration/nightingale).

> [!TIP]
> Flashduty supports both dedicated and shared integration models. Deliver alerts to exclusive integrations under the collaboration space, and Incidents will be triggered within that space.
> Or deliver alerts to the shared integration in the integration center and configure routing to deliver alerts to different collaboration spaces according to rules.

### Triggering an Incident via API

Flashduty provides a custom event standard that allows you to report alerts through standard protocols, suitable for any unadapted monitoring system. For detailed documentation, please read [Custom Events](/mixin/alert_integration/custom_alert).

> [!TIP]
> To ensure the stability of the entire system, Flashduty currently imposes a **200qps** frequency limit on API reporting. Exceeding this limit will result in the rejection of reports.

> [!TIP]
> Please ensure that you actively close alerts or set Incident timeouts to automatically close in the collaboration space. When there are too many Incidents, console retrieval performance may significantly decrease. In such cases, the system may close historical Incidents without notification.

### Triggering an Incident via Email

Flashduty provides an email integration that allows you to report alerts by sending an email, suitable for all monitoring systems that support email reminders. For detailed documentation, please read [Custom Events](/mixin/alert_integration/email).

> [!TIP]
> You can set specific email prefixes for each integration. You can also contact us to set an easy-to-remember exclusive domain name for your main account. For example, order-service@tesla.flashcat.cloud.

### Triggering an Incident Through the Console

Click the **Create** button on the console to initiate Incident creation.

| Field | Is it necessary | Description |
| :---: | :---:   | ---- |
| Incident title | yes | A brief statement indicating what has occurred |
| Incident Description | no | Detailed description of the Incident, supporting Markdown syntax |
| Severity | yes | Select one of the three enumeration values: Critical, Warning, and Info |
| Collaborative space | no | Incident Attribution<br>If not selected, it represents a global incident.<br>In this case, the incident must be directly assigned to a person for notification |
| Assign personnel | no | Incident Handler<br>If not selected, assignment and notification will be based on the assigned collaboration space.<br>Otherwise, notifications will be sent directly according to the individual's preferences |