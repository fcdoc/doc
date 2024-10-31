---
brief: >-
  1. FlashDuty affords silent and suppression mechanisms to assist enterprises in refining their alerting processes. The former temporarily mutes alert notifications under specific conditions, while the latter automatically halts the issuance of redundant or anticipated alerts under certain circumstances, collectively diminishing distractions and enhancing the efficiency and accuracy of the alerting system
---

# 2. Incident Silence and Suppression

3. FlashDuty affords silent and suppression mechanisms to assist enterprises in refining their alerting processes. The former temporarily mutes alert notifications under specific conditions, while the latter automatically halts the issuance of redundant or anticipated alerts under certain circumstances, collectively diminishing distractions and enhancing the efficiency and accuracy of the alerting system.

## Silent Rules

During scheduled system maintenance windows or other specific time frames, silent rules can be预先设定 in advance to reduce unnecessary notifications.
Configuration path: **Collaboration Space Details => Noise Reduction Configuration => Silent Rules**
### Silent Time
- **Single Silence:**  Effective only during the selected time period. It will expire and no longer be valid afterward, **but the rule will not be automatically deleted**.
- **Periodic Silence:**

- Weekly Mode: Can be set to activate daily or on certain days of the week.
- Calendar Mode: You must proactively create a [Service Calendar](/conf/calendar), after which it will become effective based on the working or non-working days indicated in the calendar.

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/fault_silence_and_suppression/1.avif" style="display: block; margin: 0 auto;" width="800">

### Silent Conditions
- 4. **Condition Configuration:** Selection for matching or not matching can be based on the severity of incidents or incident tags, as well as combined conditions.
- 5. **In Case of Multiple Conditions:** The system supports advanced logical operators (such as AND, OR) to allow for flexible combinations of incident severity, incident tags, and other attributes, enabling precise multi-dimensional alert matching and control.

> [!WARN]
> 6. When an incident meeting the criteria is silenced, it will still be displayed and processed on the console; however, no notifications will be triggered.

### Quick Silence
7. Quick Silence refers to the rapid creation of **temporary or one-time** silence rules within the mobile app based on an existing incident. Operation path: **Click on incident details => More actions => Quick Silence**.

- 8. **Basic Information:** The rule name and description are automatically derived from the incident's ID and title by default.
- 9. **Effective Scope:** The collaboration space where the silence rule takes effect is that of the incident's assigned collaboration space and **cannot be altered**.
- **Effective Time:** Only supports a single time range (default 24 hours); the rule is automatically deleted upon expiration without a deletion record.
- 10. **Silence Conditions:** By default, the incident's tags are used as the criteria, requiring an exact match. You can visit [Configure Filter Conditions](/conf/how_to_filter) to understand how to set up restrictive conditions.

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/fault_silence_and_suppression/2.avif" style="display: block; margin: 0 auto;" width="800">

> [!NOTE]
> 11. Entering and operating Quick Silence from the same incident details constitutes editing the original rule and does not create a new one.

## Suppression Rules
12. Optimize the notification process in specific incident scenarios. For instance, when a Critical-level incident occurs, the system will suppress subsequent notifications for Info or Warning-level incidents to avoid redundancy and ensure focus remains on the most pressing issues, achieving notification effectiveness and relevance. Configuration path: **Collaboration Space Details => Noise Reduction Configuration => Suppression Rules**.

### Suppression Conditions
13. When a new incident meets the conditions and there is an active incident that meets the conditions within the last 24 hours, and the new incident shares identical items with the active one, it will be suppressed.

- 14. **New Incident:** This refers to an incident that has occurred after the rule has been configured and meets the specified conditions.
- **Active Incident:** This refers to an **incident that remains unclaimed and unresolved** within a 24-hour period, qualifying as an active incident.
- 16. **Conditional Matching:** You can choose to match or not match based on the severity of incidents or incident tags, as well as combined conditions.
- **Same Items:** Supports matching using the same attributes or labels, with multiple conditions, selecting at least one attribute or label, and requiring simultaneous satisfaction when both are chosen.

You can visit [Configure filters](/conf/how_to_filter) to understand how to set up restrictive conditions.

> [!WARN]
> 17. When an incident meeting the criteria is suppressed, it will still be displayed and processed on the console; however, no notifications will be triggered.

### Configuration Example

18. When there are Critical-level incidents with the same check items within 24 hours, incidents of Warning and Info levels will be suppressed.

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/fault_silence_and_suppression/3.avif" style="display: block; margin: 0 auto;" width=800>