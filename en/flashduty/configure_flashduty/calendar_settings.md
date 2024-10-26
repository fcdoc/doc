---
brief: By configuring the service calendar, you can manage allocation strategies and silent rules using either the working day or rest day mode
---

# Configure Service Calendar

---

## Application Scenarios
---
- When assigning faults, the calendar mode can be used to dispatch them according to rest or working days.
- When it is necessary to silence alerts during a specific time period, the calendar mode can be employed for periodic silencing.

## Create Calendar
---
**Navigate to Console => Fault Management => Service Calendar => Add Calendar to create.**
- It is recommended to name the calendar based on the business dimension, for example, "Settlement Business System."
- The calendar description should provide an overview of the business characteristics and logic, allowing team members to quickly grasp the information.
- After configuring team members to manage the calendar, they will have full permissions for that calendar.
- Newly created calendars are set to all working days by default. It is generally advised to link them directly to national holidays to automatically incorporate holiday schedules, thus saving the manual marking process. Even after linking, manual adjustments can still be made as needed.

![Service Calendar](https://fcdoc.github.io/img/GG_lye0HJBxjFs54noT-0OrrOiUBH8NPZqkny2qYXl4.avif)

## Edit Calendar
---
- Only the creator and team members have the right to edit the calendar; other members have read-only access.
- Basic information such as the calendar name, description, and management team can be modified.
- Rest days can be quickly marked based on the weekday.

![](https://fcdoc.github.io/img/6we-QRWfJKvBVRJZC2rF7JdF73fg6ntjNLDnw0A5GSg.avif)


> [!WARN]
> Deleting a calendar is irreversible. Please ensure no business is using it before deletion.

## FAQs
---

|+| What is the difference between a calendar and a duty label?

    The primary difference between a service calendar and a duty schedule lies in their respective positioning and application scenarios. A duty schedule is used for receiving, serving as the recipient for fault events, responsible for acknowledging and handling assigned faults; whereas a service calendar is used for dispatching, determining which time periods' faults should be assigned, and it operates at a higher level than the receiver. Typically, service calendars are utilized in the securities industry, for instance, only businesses that trade on weekdays need to pay attention to them.