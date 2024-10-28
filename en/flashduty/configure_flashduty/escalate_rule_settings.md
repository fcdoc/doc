---
brief: Alarm events from various businesses or teams can be assigned to the corresponding handling groups through dispatch strategies, ensuring that the relevant handlers are reached via different communication channels
---

# Configure Dispatch Strategy

Each collaborative workspace should have at least one dispatch policy in place. Through this policy, alarms from different businesses or teams can be directed to the appropriate handling groups, and the responsible members can be notified through various means such as IM apps, SMS, voice messages, and robots. Additionally, it supports multi-stage notification configurations and automatic progression between stages. If no dispatch policy is configured for a collaborative workspace, incoming alarms will not trigger any notifications.

## Policy Configuration
### Time Filtering
- By default, all faults are notified according to this policy at any time.
- It supports selecting whether to dispatch based on specific days of the week, for instance, only handling faults from Monday to Friday, with Saturday and Sunday exceptions.
- It supports dispatch selection based on the service calendar (which needs to be created beforehand), allowing configuration according to holidays or working days, such as notifying only on trading days, which is common in the securities industry.

![rilitongzhi.png](https://fcdoc.github.io/img/zh/gsUqruaXsUQO8Vbb-QgEIJb23EQ3jUZDMWBvtOYSEBs.avif)

### Fault Filtering
- By default, all faults are notified in accordance with this policy.
- It supports conditional matching of faults by title, level, and tags, for example, following the dispatch for alarms with a level of "Info."

![tiaojian.png](https://fcdoc.github.io/img/zh/WyGIe6d3UjoWaGg4Y8KCZ87KCalIEM3cdR1YMRI6RVc.avif)

Go to [How to Configure Filter Conditions](/configure_flashduty/how_to_filter) for more information.

## Dispatch configuration

### Dispatch Object
- **Individual:** Specify certain members to receive the alarm, with support for multiple selections and no duplicates allowed.
- **Team:** Specify a team to receive the alarm, with support for multiple selections. If there are duplicate team members, only one notification will be sent to each member.
- **Duty:** Specify a duty schedule to receive the alarm, with the specific recipients determined by the duty rules. Multiple selections are supported, and duplicate duty personnel will only receive one notification.
- **Combination:** Select a combination of individuals, teams, and duty schedules.

> [!NOTE]
> Looking to integrate with internal self-developed systems for dynamic dispatching?
>
> Please refer to [Dynamically Setting Dispatch Personnel](/advanced_features/dynamic_notifications).

### Single Chat Channel
Single chat refers to one-on-one notifications, such as through email, SMS, voice, and certain IM applications.

- **Follow Individual Preferences:** Notification methods are set by members individually within the [Account Configuration](/configure_flashduty/preference_settings) for each alert category's reception channels and methods.
- **Follow Unified Settings:** Notification recipients' channels and methods are configured uniformly by the policy setter.

### Group Chat Channel

Group chat involves sending notifications to a group with special mentions for dispatch personnel, including various webhook robots and some IM applications.

- In group chats, various applications and group bots can be selected to reach recipients. **When choosing IM app notifications**, the notification recipient must first associate with the corresponding app. Details can be found in [Instant Messaging Integration](/integration_guide/instant_messaging/lark_integration_guide)

> [!NOTE]
> Select at least one notification channel for personal and group chats. If you prefer not to notify individuals, only groups, you can set an empty team as the dispatch target.

### Cyclic Notification

- Cyclic notifications are disabled by default, meaning that the same event is notified only once. If enabled, configure the number of notifications appropriately. Note that you must enter a value of at least `2` to receive additional cyclic notifications.
- If a fault is claimed, cyclic notifications will cease.

### Upgrade Dispatch

- To ensure that faults are addressed, set automatic upgrades for faults that are not closed or claimed within a timeout. This involves setting up multiple stages.
- You can opt for an automatic upgrade when the fault __Timeout is not closed__ or __Timeout is not claimed__.
- Typical scenarios include hierarchical upgrades between primary and backup duty personnel, between superiors and subordinates, and between first and second lines of support.

You can also manually escalate faults; visit [Escalating and Dispatching Faults](/incident_management/escalate_incidents) for more details.

### Strategy Sequence Adjustment
- When multiple dispatch strategies are in place, notifications are matched sequentially and stop once a match is found. Consider the relevant dispatch conditions thoroughly when configuring.
- Different strategies can be adjusted by dragging and dropping to change the notification order, with changes taking effect immediately. Please proceed with caution.

> [!NOTE]
> If you need to set up multiple dispatch strategies in a collaborative workspace and ensure that every fault is notified, it's advisable to have a fallback strategy with no filtering criteria.

> [!WARN]
> We do not recommend setting up an overly large collaborative workspace, especially when managing alerts for a large-scale business. This can lead to the maintenance of numerous dispatch strategies, increasing the long-term maintenance burden, confusion, and the likelihood of errors.

## Policy Configuration Principles
General principles for configuring dispatch strategies should consider the following aspects:

1. **Matching Notification Object Capabilities:** Ensure that notification objects have the ability and authority to handle alerts within the space. This means that only relevant individuals or teams should receive alerts related to their work, avoiding the delivery of irrelevant alerts to unrelated individuals.
2. **Multi-channel Notification:** Utilize multiple notification methods to ensure that notification objects receive alerts promptly. For example, use various channels such as SMS, email, and instant messaging tools to improve the timeliness and reliability of notifications. However, different notification methods are recommended for different alert levels to prevent information overload.
3. **Alarm Escalation Mechanism:** When an alert remains unclaimed or unhandled for an extended period, an escalation mechanism should be in place. This could involve automatically escalating the alert to the next level of handler or team or sending the alert to multiple handlers to ensure timely resolution.

## FAQs

|+| How to investigate if an alarm is generated but no notification is received?

    Go to Fault Details => Timeline to check the notification status of each channel in the notification trigger process. If there is a failure, a failure message will be provided for reference. For further reasons, please contact technical support for assistance with troubleshooting.

|+| Why do the notification methods not align with my personal preference settings?

    Flashduty's single chat notification channel supports two settings: "Follow Personal Preferences" and "Follow Unified Settings." Notifications will be personalized according to your settings only when the "Follow Personal Preferences" option is selected.

    Go to Collaboration Space Details => Assignment Policy to review your specific settings.