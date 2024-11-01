---
brief: >-
  FlashDuty provides silencing and suppression mechanisms to help enterprises optimize the alert process. The former temporarily blocks alert notifications under specific conditions, while the latter automatically prevents repeated or expected alerts from being issued under specific conditions, thereby reducing interference and improving the efficiency and accuracy of the alert system
---

# Incident Silencing and Suppression

FlashDuty provides silencing and suppression mechanisms to help enterprises optimize the alert process. The former temporarily blocks alert notifications under specific conditions, while the latter automatically prevents repeated or expected alerts from being issued under specific conditions, thereby reducing interference and improving the efficiency and accuracy of the alert system.

## Silence Rules

During scheduled system maintenance windows or other specific time periods, silence rules can be set in advance to reduce unnecessary notifications.
Configuration path: **Collaboration space details => Noise reduction configuration => Silence rules**
### Silence Time
- **Single silence:** It will only take effect within the specified time period and will no longer be effective after expiration, **but the rule will not be automatically deleted**.
- **Periodic silence:**

- Weekly mode: You can choose to take effect every day or on specific days of the week.
- Calendar mode: [The service calendar](/conf/calendar) needs to be created in advance, and then it will take effect according to the working days or rest days in the calendar.

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/fault_silence_and_suppression/1.avif" style="display: block; margin: 0 auto;" width="800">

### Silence Conditions
- **Condition configuration:** You can choose to match or not match based on the severity of the incident or incident tags, as well as combination conditions.
- **When there are multiple conditions:** The system supports advanced logical operators (such as AND, OR) to flexibly combine the severity of the incident, incident tags, and other attributes, achieving precise multi-dimensional alert matching and control.

> [!WARN]
> When a qualified incident is silenced, it will still be displayed and processed on the console, but the notification will not be triggered.

### Quick Silence
Quick silence refers to quickly creating **temporary or single** silence rules on the mobile terminal based on an incident that has occurred. Operation path: **Click incident => More operations => Quick silence**.

- **Basic information:** The rule name and rule description are combined by default using the incident ID and title.
- **Effective scope:** The collaboration space in which the silence rule takes effect is the collaboration space to which the incident belongs and **cannot be changed**.
- **Effective time:** Only supports a single time range (default 24 hours). The rule will be automatically deleted after expiration and there will be no deletion record.
- **Silence condition:** By default, the label of the incident is used as the condition, and it is an exact match condition. You can go to [Configure filters](/conf/how_to_filter) to learn how to configure restrictions.

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/fault_silence_and_suppression/2.avif" style="display: block; margin: 0 auto;" width="800">

> [!NOTE]
> When entering and operating quick silence in the same incident details, the original rule is edited, and no new rule is created.

## Suppression Rules
Optimize the notification process under specific incident scenarios. For example, when there is a Critical-level incident, the system will suppress subsequent Info or Warning-level related incidents to avoid information redundancy and ensure that the focus remains on the most urgent issues, achieving the effectiveness and pertinence of notifications. Configuration path: **Collaboration space details => Noise reduction configuration => Suppression rules**.

### Suppression Conditions
When a new incident meets the conditions and there is an active incident that meets the conditions within 24 hours, and the new incident has the same items as the active incident, it will be suppressed.

- **New incident:** Refers to a newly occurring incident, i.e., an incident that occurs after the rule is configured and meets the conditions.
- **Active incident** It means that **incident that has not been claimed and not closed** within 24 hours is active incident .
- **Condition matching:** You can choose to match or not match based on the severity of the incident or incident tags, as well as combination conditions.
- **Same item:** Supports matching using the same attribute or the same label, supports multiple conditions, and at least one attribute and label must be selected. When selected simultaneously, all conditions must be met.

You can go to [Configure filters](/conf/how_to_filter) to learn how to configure restrictions.

> [!WARN]
> When a qualified incident is suppressed, it will still be displayed and processed on the console, but the notification will not be triggered.

### Configuration Examples

When there are Critical-level incidents of the same check item within 24 hours, the incidents of Warning and Info are suppressed.

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/fault_silence_and_suppression/3.avif" style="display: block; margin: 0 auto;" width=800>