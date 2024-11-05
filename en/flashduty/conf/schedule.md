---
brief: By configuring duty rules, you can automatically schedule and notify specific duty personnel
---

# ### Configure Duty Rules

Duty rules are a core component of an enterprise's internal management, helping to reasonably arrange employees' working hours and ensure business continuity and efficiency. FlashDuty's duty schedule offers a wide range of duty rules, which can be adjusted and customized according to the actual business needs of the enterprise.

## ### Duty Schedule
1. On the duty management page, you can see a summary of all your duty assignments.
2. Subject members can view all duty schedules or only the schedules they manage.
3. Before setting up duty rules, you need to create a duty schedule first. This schedule can also belong to a specific team, allowing team members to maintain and plan it.
4. When creating a duty schedule, you can flexibly configure the notification method for shift changes:
- Notification time: During shift handover, notify the next person on duty N minutes in advance
- Notification channels: one-on-one chat (notification via SMS, voice, email, etc.), group chat (push to IM message group and @ mention assigned personnel).

### ### Composition of Duty Rules

- The final duty rules are formed by combining duty rules and shift adjustment rules.
- The final duty schedule can be viewed from a timeline or calendar perspective.

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/schedule/1.avif" style="display: block; margin: 0 auto;" height="500">

### ### Edit Rules
#### 1. #### Create

- The same duty schedule can have multiple duty rules to meet different business needs.
- When scheduling shifts, fully consider the duty hours and rotation cycles to avoid any gaps in business coverage.
#### 2. #### Change

- Hover over the rule and click to open the rule configuration dialog box.
- Changes to the scheduled duty rules will not affect historical data, including adding/deleting on-duty personnel or changing duty hours.
- Save the rule changes to apply them immediately.

#### 3. #### Delete

- Once a rule is deleted, it cannot be restored, so proceed with caution.
- Deletion takes effect immediately. Confirm that no ongoing business is using the rule before deleting.

#### 4. ### Temporary Shift Adjustments
- Temporary shift adjustments are primarily used in pre-planned duty schedules. For example, if a person on duty is temporarily unavailable or on leave, another colleague needs to take over.
- Before making a temporary shift adjustment, fully communicate with the substitute about the duty hours. Although there will be a notification during the shift change, the system will not notify when the adjustment takes effect immediately.

## ### Duty Examples

### #### Daily Duty
- Requirements overview:
- Group A and Group B take turns on duty every day.

- Rules/Effects:

![](https://fcdoc.github.io/img/zh/flashduty/conf/schedule/2.avif)

### #### Combined Shift Scheduling
- Requirements overview
- Group A is on duty from 9:00 AM to 6:00 PM every Monday to Friday.
- Group B is on duty from 7:00 PM to 9:00 AM the next day every Monday to Friday.
- Group C is on duty every weekend.
- The duty group rotates every week.

- Rule display:

![](https://fcdoc.github.io/img/zh/flashduty/conf/schedule/3.avif)

- Effect display:

![](https://fcdoc.github.io/img/zh/flashduty/conf/schedule/4.avif)