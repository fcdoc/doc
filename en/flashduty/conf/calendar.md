---
brief: By configuring the service calendar, you can manage allocation policies and quiescing rules using working day or rest day modes
---

# Configure Service Calendar

## Application Scenarios
- When assigning incidents, you can use the calendar mode to dispatch incidents based on whether it is a rest day or a working day.
- When you need to silence alerts during a specific time period, you can use the calendar mode to set up periodic silencing.

## Create Calendar
**Go to Console => Incident Management => Service Calendar => Add Calendar to create it.**
- It is recommended to name the calendar based on the business dimension, such as the Settlement Business System.
- The calendar description should outline the business features and logic to help team members quickly understand it.
- After configuring the management team for a calendar, the team members have full permissions for that calendar.
- The newly created calendar defaults to all working days. It is generally recommended to associate it with national holidays to automatically obtain holiday schedules, thus eliminating the need for manual marking. Even after association, manual adjustments can still be made as needed.

![Service Calendar](https://fcdoc.github.io/img/zh/flashduty/conf/calendar/1.avif)

## Edit Calendar
- Only the creator and team members have edit permissions for the calendar; other members have read-only access.
- Basic information, such as the calendar name, description, and management team, can be modified.
- Rest days can be quickly marked based on the day of the week.

![](https://fcdoc.github.io/img/zh/flashduty/conf/calendar/2.avif)

> [!WARN]
> Deleted calendars cannot be recovered. Ensure that no business is using the calendar before deleting it.

## Frequently Asked Questions

|+| What is the difference between a calendar and duty labels?

    The main difference between the service calendar and the duty schedule lies in their positioning and application scenarios. The duty schedule is used for receiving incidents and is responsible for receiving and processing incidents assigned to the duty team. In contrast, the service calendar is used for dispatching incidents, determining which time periods incidents should be dispatched, and serves as an upper layer for the receivers. The service calendar is commonly used in the securities industry, for example, where only business that operates on weekdays requires attention.