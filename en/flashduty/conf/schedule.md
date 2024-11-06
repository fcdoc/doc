---
brief: By configuring duty rules, you can achieve automatic scheduling and notification to specific duty personnel
---

# Configure Duty Rules

Duty rules are one of the core components of an enterprise's internal management, helping to reasonably arrange employees' working hours and ensure business continuity and efficiency. FlashDuty's duty schedule offers a variety of duty rules, which can be adjusted and customized according to the company's actual business needs.

## Duty Schedule
1. On the duty management page, you can see a summary of all your duty assignments.
2. Subject members can view all duty schedules or only the schedules they manage.
3. Before setting up duty rules, you need to create a duty schedule. This schedule can also belong to a team, allowing team members to maintain and plan it.
4. When creating a duty schedule, you can flexibly configure the notification method for shift changes:
- Notification Time: Notify the next person on duty N minutes before the shift handover
- Notification Channels: Single Chat (one-to-one notification, e.g., SMS, voice, email, etc.), Group Chat (push to IM message group and @ mention assigned personnel).

### Duty Rule Composition

- Duty rules combined with shift adjustment rules form the final duty rules.
- The final duty schedule can be viewed from a timeline or calendar perspective.

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/schedule/1.avif" style="display: block; margin: 0 auto;" height="500">

### Edit Rules
#### 1. Create

- The same duty schedule can have multiple duty rules to meet different business needs.
- When scheduling shifts, fully consider the duty hours and rotation cycles to avoid business gaps.
#### 2. Change

- Hover over the rule and click to open the rule configuration dialog box.
- Changes to the scheduled duty rules will not affect historical data, including adding/deleting on-duty personnel or changing duty hours.
- Saved rule changes take effect immediately.

#### 3. Delete

- Once a rule is deleted, it cannot be restored, so please proceed with caution.
- Deletion takes effect immediately. Please confirm that no business is still using the rule before proceeding.

#### 4. Temporary Shift Change
- Temporary shift adjustments are primarily used in pre-planned duty schedules, such as when a duty person is temporarily unavailable or on leave and needs to be replaced by another colleague.
- Before making a temporary shift adjustment, fully communicate with the substitute about the duty hours. Although there will be a notification during the shift change, there will be no system notification when the adjustment takes effect immediately.

## Duty Examples

### Daily Duty
- Requirements Overview:
- Group A and Group B take turns on duty every day.

- Rules/Effects:

![](https://fcdoc.github.io/img/zh/flashduty/conf/schedule/2.avif)

### Combined Shift Scheduling
- Requirements Overview:
- Group A is on duty from 9:00 AM to 6:00 PM every Monday to Friday.
- Group B is on duty from 7:00 PM to 9:00 AM the next day every Monday to Friday.
- Group C is on duty every weekend.
- The duty group rotates every week.

- Rule Display:

![](https://fcdoc.github.io/img/zh/flashduty/conf/schedule/3.avif)

- Effect Display:

![](https://fcdoc.github.io/img/zh/flashduty/conf/schedule/4.avif)