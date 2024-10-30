---
brief: >-
  FlashDuty affords silent and suppression mechanisms to assist enterprises in optimizing the alarm process. The former temporarily mutes alarm notifications under specific conditions, while the latter automatically prevents the issuance of duplicate or anticipated alarms under certain conditions, collectively reducing disturbances and enhancing the efficiency and accuracy of the alarm system
---

# Fault Silencing and Suppression

FlashDuty affords silent and suppression mechanisms to assist enterprises in optimizing the alarm process. The former temporarily mutes alarm notifications under specific conditions, while the latter automatically prevents the issuance of duplicate or anticipated alarms under certain conditions, collectively reducing disturbances and enhancing the efficiency and accuracy of the alarm system.

## Silent Rules

During scheduled system maintenance windows or other specific time frames, silent rules can be预先设定 in advance to reduce unnecessary notifications.
Configuration path: **Collaboration Space Details => Noise Reduction Configuration => Silent Rules**
### Silent Time
- **Single Silence:**  Effective only during the selected time period. It will expire and no longer be valid afterward, **but the rule will not be automatically deleted**.
- **Periodic Silence:**

- Weekly Mode: Can be set to activate daily or on certain days of the week.
- Calendar mode: You need to create a [service calendar](/conf/calendar_settings) in advance, and then it will take effect based on the working or non-working days indicated in the calendar.

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/fault_silence_and_suppression/1.avif" style="display: block; margin: 0 auto;" width="800">

### Silent Conditions
- **Condition Configuration:** Allows selection of match or non-match based on fault severity, fault tags, or combined conditions.
- **Multiple Conditions:** The system supports advanced logical operators (such as AND, OR) for flexible combination of fault severity, fault tags, and other attributes, enabling precise multi-dimensional alarm matching and control.

> [!WARN]
> When a fault meeting the conditions is silenced, it will still be displayed and processed in the console, but no notification will be triggered.

### Quick Silence
Quick Silence refers to the rapid creation of **temporary or single** silent rules within the mobile app based on occurred faults. The operation path is: **Click on Fault Details => More Actions => Quick Silence**.

- **Basic Information:** The rule name and description are automatically generated based on the fault's ID and title.
- **Effective Scope:** The silent rule applies to the collaboration space of the associated fault and **cannot be changed**.
- **Effective Time:** Only supports a single time range (default 24 hours); the rule is automatically deleted upon expiration without a deletion record.
- **Silent condition:** By default, the label associated with the fault is used as the condition, requiring an exact match. You can visit [Configure filters](/conf/how_to_filter) to understand how to set up restrictive conditions.

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/fault_silence_and_suppression/2.avif" style="display: block; margin: 0 auto;" width="800">

> [!NOTE]
> Entering and operating Quick Silence from the same fault details edits the original rule and does not create a new one.

## Suppression Rules
Optimizes the notification process in specific fault scenarios. For instance, when a Critical-level fault occurs, the system suppresses subsequent Info or Warning-level fault notifications related to it, avoiding redundancy and ensuring focus on the most urgent issues, thus achieving effective and targeted notifications. Configuration path: **Collaboration Space Details => Noise Reduction Configuration => Suppression Rules**.

### Suppression Conditions
When a new fault meets the conditions and there is an active fault that meets the conditions within 24 hours, and the new fault shares the same items as the active fault, it will be suppressed.

- **New Fault:** Refers to a newly occurring fault, i.e., a fault that arises after rule configuration and meets the conditions.
- **Active Faults:** Faults that remain **unclaimed and unresolved** within a 24-hour period are considered active faults.
- **Condition Matching:** Allows selection of match or non-match based on fault severity, fault tags, or combined conditions.
- **Same Items:** Supports matching using the same attributes or labels, with multiple conditions, selecting at least one attribute or label, and requiring simultaneous satisfaction when both are chosen.

You can visit [Configure filters](/conf/how_to_filter) to understand how to set up restrictive conditions.

> [!WARN]
> When a fault meeting the conditions is suppressed, it will still be displayed and processed in the console, but no notification will be triggered.

### Configuration Example

When there is a Critical-level fault with the same check item within 24 hours, suppress Waning and Info-level faults.

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/fault_silence_and_suppression/3.avif" style="display: block; margin: 0 auto;" width=800>