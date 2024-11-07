---
brief: >-
  FlashDuty provides silencing and suppression mechanisms to help enterprises optimize their alert processes. The former temporarily blocks alert notifications under specific conditions, while the latter automatically prevents repeated or expected alerts from being issued under specific conditions, thereby reducing interference and improving the efficiency and accuracy of the alert system
---

# Incident Silencing and Suppression

FlashDuty provides silencing and suppression mechanisms to help enterprises optimize their alert processes. The former temporarily blocks alert notifications under specific conditions, while the latter automatically prevents repeated or expected alerts from being issued under specific conditions, thereby reducing interference and improving the efficiency and accuracy of the alert system.

## Silence Rules

During scheduled system maintenance windows or other specific time periods, silence rules can be set in advance to reduce unnecessary notifications.
Configuration path: **Collaboration space details => Noise reduction configuration => Silence rules**
### Silence Time
- **Single silence:** It will only take effect within the specified time period and will no longer be effective after expiration, **but the rule will not be automatically deleted**.
- **Periodic silence:**

- Weekly mode: You can choose to have it take effect every day or on specific days of the week.
- Calendar mode: You need to create a [service calendar](/conf/calendar) in advance, and then it will take effect based on the working days or rest days in the calendar.

<img src="https://fc.3ti.site/zh/flashduty/conf/fault_silence_and_suppression/1.avif" style="display: block; margin: 0 auto;" width="800">

### Silence Conditions
- **Condition configuration:** You can choose to match or not match based on the severity of the incident or incident tags and combination conditions.
- **Multiple conditions:** The system supports advanced logical operators (such as AND, OR) to flexibly combine the severity of the incident, incident tags, and other attributes, achieving precise multi-dimensional alert matching and control.

> [!WARN]
> When a qualified incident is silenced, it will still be displayed and processed on the console, but the notification will not be triggered.

### Quick Silence
Quick silence refers to quickly creating **temporary or single** silence rules on the mobile terminal based on an incident that has already occurred. Operation path: **Click incident details => More operations => Quick silence**.

- **Basic information:** The rule name and rule description are combined by default with the incident's ID and title.
- **Effective scope:** The collaboration space in which the silence rule takes effect is the collaboration space to which the incident belongs and **cannot be changed**.
- **Effective time:** Only supports a single time range (default 24 hours). The rule will be automatically deleted after expiration and there will be no deletion record.
- **Silence condition:** By default, the label of this incident is used as the condition, and it is an exact matching condition. You can go to [Configure filters](/conf/how_to_filter) to learn how to configure restrictions.

<img src="https://fc.3ti.site/zh/flashduty/conf/fault_silence_and_suppression/2.avif" style="display: block; margin: 0 auto;" width="800">

> [!NOTE]
> When entering and operating quick silence in the same incident details, the original rule is edited and no new rule is created.

## Suppression Rules
Optimize the notification process under specific incident scenarios. For example, when there is a Critical-level incident, the system will suppress subsequent Info or Warning-level related incident notifications to avoid information redundancy and ensure that the focus remains on the most urgent issues, achieving effective and targeted notifications. Configuration path: **Collaboration space details => Noise reduction configuration => Suppression rules**.

### Suppression Conditions
When a new incident meets the conditions and there is an active incident that meets the conditions within 24 hours, and the new incident has the same items as the active incident, it will be suppressed.

- **New incident:** Refers to a newly occurring incident, i.e., an incident that occurs after the rules are configured and meets the conditions.
- **Active incident:** It refers to incidents that have **not been claimed and not closed** within 24 hours.
- **Condition matching:** You can choose to match or not match based on the severity of the incident or incident tags and combination conditions.
- **Identical items:** Supports matching using the same attribute or the same label, supports multiple conditions, and requires at least one attribute and label. When both are selected, they need to be satisfied simultaneously.

You can go to [Configure filters](/conf/how_to_filter) to learn how to configure restrictions.

> [!WARN]
> When a qualified incident is suppressed, it will still be displayed and processed on the console, but the notification will not be triggered.

### Configuration Examples

When there are Critical-level incidents of the same check item within 24 hours, the incidents of Warning and Info are suppressed.

<img src="https://fc.3ti.site/zh/flashduty/conf/fault_silence_and_suppression/3.avif" style="display: block; margin: 0 auto;" width=800>