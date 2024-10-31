---
brief: By configuring the service calendar, you can manage allocation strategies and silent rules using either the working day or rest day mode
---

# Configure Service Calendar

## Application Scenarios
- When assigning incidents, you can utilize the calendar mode to distribute them based on either rest days or working days.
- For silencing alerts during a specific time frame, the calendar mode can be employed to achieve periodic silencing.

## Create Calendar
**Navigate to Console => Incident Management => Service Calendar => Add Calendar to create a new one**.
- It is recommended to name the calendar based on the business dimension, for example, "Settlement Business System."
- The calendar description should provide an overview of the business characteristics and logic, allowing team members to quickly grasp the information.
- After configuring team members to manage the calendar, they will have full permissions for that calendar.
- Newly created calendars are set to all working days by default. It is generally advised to link them directly to national holidays to automatically incorporate holiday schedules, thus saving the manual marking process. Even after linking, manual adjustments can still be made as needed.

![Service Calendar](https://fcdoc.github.io/img/zh/flashduty/conf/calendar/1.avif)

## Edit Calendar
- Only the creator and team members have the right to edit the calendar; other members have read-only access.
- Basic information such as the calendar name, description, and management team can be modified.
- Rest days can be quickly marked based on the weekday.

![](https://fcdoc.github.io/img/zh/flashduty/conf/calendar/2.avif)

> [!WARN]
> Deleting a calendar is irreversible. Please ensure no business is using it before deletion.

## FAQs

|+| What is the difference between a calendar and a duty label?

    The primary difference between the service calendar and the duty schedule lies in their distinct positioning and application scenarios. The duty schedule is used for reception, serving as the recipient of incident events and responsible for receiving and processing incidents assigned to the duty shift; whereas the service calendar is used for dispatching, determining which time periods' incidents are to be assigned, and it sits at a higher level than the recipient. The service calendar is typically applied in the securities industry, for instance, only businesses that operate on weekdays require attention.