---
brief: By configuring the service calendar, you can manage allocation policies and quiescing rules using working day or rest day modes
---

# Configure Service Calendar

## Application Scenarios
- When assigning incidents, you can use the calendar mode to dispatch incidents based on whether it is a rest day or a working day.
- When you need to silence alerts during a specific time period, you can use the calendar mode to periodically silence alerts.

## Create Calendar
**Go to console => Incident Management => Service Calendar => Add Calendar to create it.**
- It is recommended to name the calendar according to the business dimension, such as the Settlement Business System.
- The calendar description should outline the business characteristics and logic to help team members quickly understand it.
- After configuring management team members for the calendar, those team members will have full permissions for the calendar.
- The newly created calendar defaults to all working days. It is generally recommended to directly associate it with national holidays to automatically obtain holiday schedules, eliminating the need for manual marking. Even after association, manual adjustments are still supported as needed.

![Service Calendar](https://fcimg.3ti.site/zh/flashduty/conf/calendar/1.avif)

## Edit Calendar
- Only the creator and team members have edit permissions for the calendar; other members have read-only access.
- Basic information can be modified, such as the calendar name, description, and management team.
- Rest days can be quickly marked based on the day of the week.

![](https://fcimg.3ti.site/zh/flashduty/conf/calendar/2.avif)

> [!WARN]
> Deleted calendars cannot be recovered. Please ensure that no business is using the calendar before deleting it.

## Frequently Asked Questions

|+| What is the difference between a calendar and duty labels?

    The main difference between a service calendar and a duty schedule lies in their positioning and application scenarios. A duty schedule is used for receiving incidents and is responsible for receiving and processing incidents assigned to the duty team. In contrast, a service calendar is used for dispatching incidents and determines which time periods incidents should be dispatched, serving as the upper layer for the receiver. The service calendar is commonly used in the securities industry, for example, to focus on business that only trades on weekdays.