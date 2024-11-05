---
brief: By configuring the service calendar, you can manage allocation policies and quiescing rules using working day or rest day modes
---

# Configure Service Calendar

## Application Scenarios
- When assigning incidents, you can use the calendar mode to assign incidents based on rest days or working days.
- When you need to silence alerts for a certain period, you can use the calendar mode for periodic silencing.

## Create Calendar
**Go to console => Incident Management => Service Calendar => Add Calendar to create it.**
- It is recommended to name the calendar based on the business dimension, such as the Settlement Business System.
- The calendar description should outline the business features and logic to help team members quickly understand.
- After configuring management team members for a calendar, those team members have full permissions for the calendar.
- The newly created calendar defaults to all working days. It is generally recommended to directly associate it with national holidays to automatically obtain holiday schedules, eliminating the need for manual marking. Even after association, manual adjustments are still supported as needed.

![Service Calendar](https://fcdoc.github.io/img/zh/flashduty/conf/calendar/1.avif)

## Edit Calendar
- Only the creator and team members have edit permissions for the calendar; other members have read-only access.
- You can modify basic information, such as the calendar name, description, and management team.
- Rest days can be quickly marked based on the day of the week.

![](https://fcdoc.github.io/img/zh/flashduty/conf/calendar/2.avif)

> [!WARN]
> Deleted calendars cannot be recovered. Please ensure that no business is using the calendar before deleting it.

## Frequently Asked Questions

|+| What is the difference between a calendar and duty labels?

    The main difference between a service calendar and a duty schedule lies in their positioning and application scenarios. A duty schedule is used for receiving incidents, acting as the receiving object for incident events and responsible for receiving and processing incidents assigned to the duty. In contrast, a service calendar is used for dispatching incidents, determining which time periods incidents should be assigned to, and serves as the upper layer for the receiver. Service calendars are commonly used in the securities industry, for example, where only business that trades on weekdays requires attention.