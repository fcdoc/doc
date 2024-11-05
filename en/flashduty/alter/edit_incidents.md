---
brief: Learn how to modify the title and other information of an incident, and how to handle the incident
---

# Handling and Updating Incidents

Investigate incidents, update key information, and synchronize the situation with others.

## Modify Information

When an incident is triggered, the problem may become clearer over time. You can modify the incident's title and other key information to make it more accurate than the original alert.

### Modify Incident Title

1. Click on the incident details in the console, and in the title section, click the "Modify" button.
2. Enter a new title and you're done.

> [!TIP]
> The modified title will not change with the incorporation of new alerts.

### Modify Incident Severity

1. Click on the incident details in the console, and in the severity section, select a new severity level.
2. Once you click away, the change is complete.

> [!TIP]
> The modified severity will not change with the incorporation of new alerts.

### Modify Incident Description and Impact

1. Click on the incident details in the console, and in the description and impact section, click to enter new information directly.
2. The system will save it automatically.

**You can use Markdown syntax to update the description and impact of the incident, or you can copy and paste images!**

> [!TIP]
> The modified description will not change with the incorporation of new alerts.

## Claim an Incident

You have three ways to claim a newly triggered incident.

### Claim an Incident Through the Console

- **Single Claim**: Click on the incident details in the console, and click the **Claim** button to complete the claim.
- **Batch Operation**: In the console incident list, select multiple incidents to be processed, and click the **Claim** button to complete the batch claim.

### Claim an Incident Through IM Application

- **Application Messages**: The main card of application messages provides a **Claim** button. Click the card to complete the claim. If nothing happens when you click on the card, it may be that you have not completed the login account association within the app or for other reasons. For details, please refer to [Feishu Lark Integration Guide](http://docs.flashcat.cloud/zh/flashduty/lark-integration-guide).
- **Robot Messages**: Most robot channels push messages in Markdown format. You can modify the notification template to add a **Claim** jump link to redirect to the console for claiming. For details, please refer to the default template.

### Claim an Incident via Voice Call

Flashduty's voice alert will remind you to **press 1 to claim it with one click** at the end of the voice broadcast. Press button 1, and the system will complete the incident claim on your behalf.

### Unclaim an Incident

Once someone claims an incident, the processing progress will change from "Pending" to "Closed." Other people claiming the incident will not change the processing progress.

After one person claims an incident, they can choose to **Unclaim** it, which is useful in case of a mistaken claim. When all claimed personnel unclaim the incident, it will revert to the **Pending** state.

### Processing Progress and MTTA

You can view each person's assignment time and claim time in the console. We calculate the incident's MTTA according to the following rules:

- MTTA (Mean Time to Acknowledge) is defined as the average time to acknowledge, which is the average difference between the claim time and the trigger time.
- For the same incident, each person can have different assignment and claim times. Therefore, the MTTA calculation difference varies for each person.
- For the overall MTTA of an incident, only the difference between the incident's trigger time and the time it is first claimed is calculated.

## Suspend Processing

The handler of an incident, after claiming it, may need some time to investigate and process the incident. The **Suspend** operation can temporarily stop the incident from escalating according to the expected dispatch strategy. After claiming the incident, you can set a suspension time, such as 2 hours, 4 hours, or a custom expiration time within 24 hours.

> [!TIP]
> If you have already suspended the incident, and the suspension time has expired, and you still have not completed the processing, the system will automatically revert the incident to the **Pending** state and re-initiate the dispatch notification.

### Suspend an Incident via Console

Click on the incident details in the console, and click the **Suspend** button, select the suspension duration, and complete.

### Suspend an Incident via IM Application

Click the **Suspend** button on the incident message card, select the suspension duration, and complete.

## Close an Incident

You have multiple ways to close an incident.

### Close an Incident via Console

- **Single Close**: Click on the incident details in the console, and click the **Close** button to complete the closure.
- **Batch Operation**: In the console incident list, select multiple incidents to be processed, and click the **Close** button to complete the batch closure.

### Close an Incident via IM Application

The main card of application messages provides a **Close** button. Click the card to complete the closure. If nothing happens when you click on the card, it may be that you have not completed the login account association within the app or for other reasons. For details, please refer to [Feishu Lark Integration Guide](http://docs.flashcat.cloud/zh/flashduty/lark-integration-guide).

### Reopen an Incident

Manually closing an incident will change its processing progress to **Closed**. You can click the **Close** button in any state. After an incident is manually closed, its associated alerts will stop incorporating new events. If the alert in the original alert system has not recovered, new notification events may be generated, which will trigger new alerts and incidents in Flashduty.

You can reopen an incident after accidentally closing it. After reopening, the incident will revert to the **Pending** state, and dispatches and notifications will be re-initiated.

## Merge Processing

You can manually merge between incidents or between incidents and alerts. Merging similar alerts and incidents can converge information into a single incident, accelerating the processing process.

**Merge Between Incidents**: You can select multiple incidents in the console and merge them into one target incident. You can also merge other target incidents under the details of a specific incident.

**Merge Alert into Incident**: If an alert is merged into an incident due to aggregation policies, but you want to adjust the relationship between the incident and the alert, you can go to the alert details and click the **Merge** button to move the alert to the target incident.

**The essence of merging is: changing the relationship between alerts and incidents. If all alerts associated with an incident are merged into another incident, the original incident will be closed directly, and you will only need to handle the target incident.**

A complete timeline will fully record your modification process.

## Frequently Asked Questions

|+| I suspended an incident. Why does the system still trigger a new similar incident?

    You may have misunderstood the **Suspend** function as the **Silence** function, but there is a significant difference between the two.

    - The silent function requires you to fill in a matching policy. When a newly triggered incident matches this policy, no notification will be issued. The silent policy can affect the trigger notifications of new incidents.
    - The suspension function does not require you to fill in any policies. It only provides you with a period of time to handle the incident after you claim it, preventing the incident from being escalated to the next handler during the handling process.

    If you need to block an alert policy, use **Silence** instead of **Suspend**.