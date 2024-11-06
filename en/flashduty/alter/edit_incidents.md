---
brief: Learn how to modify the title and other information of an incident, and how to handle the incident
---

# Handling and Updating Incidents

Investigate incidents, update key information, and synchronize the situation with others.

## Modify Information

When an incident is triggered, and the problem manifestation becomes clearer over time, you can modify the incident's title and other key information to make it more accurate than the original alert information.

### Modify Incident Title

1. Click on the incident details in the console, and in the title section, click the Modify button.
2. Enter a new title and you're done.

> [!TIP]
> The modified title will not change with the incorporation of new alerts.

### Modify Incident Severity

1. Click on the incident details in the console, and in the severity section, select a new severity level.
2. Once the mouse loses focus, the change is complete.

> [!TIP]
> The modified severity will not change with the incorporation of new alerts.

### Modify Incident Description and Impact

1. Click on the incident details in the console, and in the description and impact section, click to directly input new information.
2. The system will save it automatically.

**You can use Markdown syntax to update the description and impact of the incident, or you can directly copy and paste images!**

> [!TIP]
> The modified description will not change with the incorporation of new alerts.

## Claim the Incident

You have three ways to claim a newly triggered incident.

### Claim the Incident Through the Console

- **Single Claim**: In the console, click on the incident details, and click the **Claim** button to complete the claim.
- **Batch Operation**: In the console incident list, select multiple incidents to be processed, and click the **Claim** button to complete the batch claim.

### Claim the Incident Through the IM Application

- **Application Messages**: The main card of application messages provides a **Claim** button. Click the card to complete the claim. If nothing happens when you click on the card, it may be that you have not completed the login account association within the app or for other reasons. For details, please refer to [Feishu Lark Integration Guide](http://docs.flashcat.cloud/zh/flashduty/lark-integration-guide).
- **Robot Messages**: Most robot channels push messages in Markdown format. You can modify the notification template and add a **Claim** jump link to redirect to the console for claiming. For details, please refer to the default template.

### Claim the Incident via Voice Call

Flashduty's voice alerts, at the end of the voice broadcast, will remind you to **press 1 to claim it with one click**. Press button 1, and the system will complete the incident claim on your behalf.

### Unclaim the Incident

Once someone claims an incident, the incident's processing progress will change from "Pending" to "Closed." Other people claiming the incident will not change the processing progress.

After one person claims an incident, they can choose to **Unclaim** it, which is useful in case of a mistaken claim. When all claimed individuals cancel their claims, the incident will revert to the **Pending** state.

### Processing Progress and MTTA

You can view each person's dispatch time and claim time in the console. We calculate the incident's MTTA according to the following rules:

- MTTA (Mean Time to Acknowledge) is defined as the average time to claim, i.e., the average difference between the claim time and the trigger time.
- For the same incident, each person can have different dispatch times and claim times. Therefore, for an incident, the MTTA calculation difference varies for each person.
- For the overall MTTA of an incident, only the difference between the incident's trigger time and the time of the first claim is calculated.

## Suspend Processing

The handler of an incident, after claiming it, may need some time to investigate and process the incident. The **Suspend** operation can temporarily stop the incident from escalating according to the expected dispatch strategy. After claiming the incident, you can set a suspension time, such as 2 hours, 4 hours, or a custom expiration time within 24 hours.

> [!TIP]
> If you have already suspended the incident, and the suspension time has expired, and you still have not completed the incident's processing, the system will automatically revert the incident to the **Pending** state and re-initiate the dispatch notification.

### Suspend Incident via Console

Click on the incident details in the console, click the **Suspend** button, select the suspension duration, and complete.

### Suspend Incident via IM Application

Click the **Suspend** button on the incident message card, select the suspension duration, and complete.

## Close Incident

You have multiple ways to close an incident.

### Close Incident via Console

- **Single Close**: In the console, click on the incident details, and click the **Close** button to complete the closure.
- **Batch Operation**: In the console incident list, select multiple incidents to be processed, and click the **Close** button to complete the batch closure.

### Close Incident via IM Application

The main card of application messages provides a **Close** button. Click the card to complete the closure. If nothing happens when you click on the card, it may be that you have not completed the login account association within the app or for other reasons. For details, please refer to [Feishu Lark Integration Guide](http://docs.flashcat.cloud/zh/flashduty/lark-integration-guide).

### Reopen Incident

Manually closing an incident will change its processing progress to **Closed**. You can click the **Close** button in any state. After an incident is manually closed, its associated alerts will also stop incorporating new events. If the alert in the original alert system has not recovered, new notification events may be generated, which will trigger new alerts and incidents in Flashduty.

You can reopen an incident after accidentally closing it. After reopening, the incident will revert to the **Pending** state, and dispatches and notifications will be re-initiated.

## Merge Processing

You can manually merge between incidents or between incidents and alerts. Merging similar alerts and incidents together can converge information into the same incident and speed up the processing process.

**Merge Between Incidents**: In the console, you can select multiple incidents and merge them into one target incident. You can also merge at a certain location in the incident details by selecting another target incident.

**Merge Alert into Incident**: Alerts that are merged into an incident due to aggregation policies can be adjusted. You can go to the alert details and click the **Merge** button to migrate the alert to the target incident.

**The essence of merging is: changing the relationship between alerts and incidents. If all alerts associated with an incident are merged into another incident, this incident will be closed directly, and you only need to handle the target incident later.**

A complete timeline will fully record your modification process.

## Frequently Asked Questions

|+| I suspended the incident. Why does the system still trigger a new similar incident?

    You may have misunderstood the **Suspend** function as the **Silence** function, but there is a significant difference between the two.

    - The silent function requires you to fill in the matching policy. When a newly triggered incident matches the silent policy, no notification will be issued. The silent policy can affect the trigger notification of new incidents.
    - The suspension function does not require you to fill in any policies. It only buys you a period of time to process the incident after you claim the incident, preventing the incident from being escalated to the next handler during the processing process.

    If you need to block an alert policy, use **Silence** instead of **Suspend**.