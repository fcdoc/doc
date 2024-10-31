---
brief: Learn how to modify the title and other details of an incident, as well as how to manage the incident
---

# Handle and update incidents

Investigate incidents, update key information, and synchronize with others.

## Modify information

When an incident is triggered and its issues become clearer over time, you can modify the title and other key details of the incident to make it more accurate than the original alert information.

### Modify incident title

1. Open incident details in the console, and click the "Modify" button in the title section.
2. Enter a new title and finish.

> [!TIP]
> The modified title will not change with the addition of new alerts.

### Modify incident severity

1. Open incident details in the console, and select a new severity level in the severity section.
2. Remove the mouse focus to complete.

> [!TIP]
> The modified severity will not change with the incorporation of new alerts.

### Modify incident description and impact

1. Open incident details in the console, and click to enter new information directly in the description and impact section.
2. The system will automatically save the changes.

**You can use Markdown syntax to update the description and impact of the incident, and you can also directly copy and paste images!**

> [!TIP]
> The modified description will not change with the addition of new alerts.

## Claim the incident

You have three methods to claim a newly triggered incident.

### Claim the incident through the console

- **Single Claim**: Click the **Claim** button on the console after selecting the incident details to complete the claim.
- **Batch Operation**: On the console incident list, select multiple incidents to be processed, then click the **Claim** button to complete batch claiming.

### Claim the incident through an IM application

- 6	**Application Messages**: The main card of application messages features a **Claim** button. Click the card to complete the claim. If the card does not respond upon clicking, it may indicate that you have not associated your login account within the app or for other reasons. For details, please refer to the [Feishu Lark Integration Guide](http://docs.flashcat.cloud/zh/flashduty/lark-integration-guide).
- 7	**Robot Messages**: Most robot channels deliver messages in Markdown format. You can modify the notification template to include a **Claim** link that directs to the console for the claim process. Please consult the default template for more information.

### Claim the incident via a voice call

Flashduty pushed voice alerts will remind you to **press 1 to claim with one click** at the end of the voice broadcast. Press button 1, and the system will complete the incident claim on your behalf.

### Unclaim the incident

Once an incident is claimed by one person, the incident's status will change from "Pending" to "Closed." Subsequent claims by others will not change the incident's status.

After an incident is claimed by an individual, they can choose to **Unclaim** it, which is applicable in cases of accidental claim. If all claimants cancel their claims, the incident will revert to the **Pending** state.

### Handling progress and MTTA

You can view each person's assigned time and claim time in the console. The MTTA for incidents is calculated according to the following rules:

- MTTA (Mean Time to Acknowledge) is defined as the average time to acknowledge, which is the average difference between the claim time and the trigger time.
- For the same incident, each person may have different assignment and claim times. Therefore, the MTTA calculation will vary for each person.
- For the overall MTTA of an incident, we only calculate the time difference between the incident's trigger time and the time it is first claimed.

## Postpone handling

After claiming an incident, the handler may need some time to investigate and address the incident. The **Suspend** action can temporarily halt the incident's escalation according to the expected dispatch strategy. You can set a suspension time, such as 2 hours, 4 hours, or a custom expiration time within 24 hours after claiming the incident.

> [!TIP]
> If you have initiated a suspension and the suspension period has elapsed, yet you have not completed the incident processing, the system will automatically revert the incident to the **Pending** state and reinitiate the dispatch notification.

### Suspend the incident via the console

Click on the incident details on the console, select the **Suspend** button, choose the suspension duration, and complete the action.

### Suspend the incident via an IM application

Click the **Suspend** button on the incident message card, select the suspension duration, and complete the process.

## Close the incident

You have several methods to close an incident.

### Close the incident via the console

- **Single Closure**: On the console, click the incident details, then click the **Close** button to complete the closure.
- **Batch Operation**: On the console incident list, select multiple incidents to be processed, click the **Close** button to complete batch closure.

### Close the incident through an IM application

17	The application message main card includes a **Close** button. Click the card to complete the claim. If the card does not respond upon clicking, it may indicate that you have not associated your login account within the app or for other reasons. For details, please refer to the [Feishu Lark Integration Guide](http://docs.flashcat.cloud/zh/flashduty/lark-integration-guide).

### Reopen the incident

Manually closing an incident will change its processing status to **Closed**. You can click the **Close** button in any state. After manually closing an incident, its associated alerts will also stop incorporating new events. If the alerts in the original alert system are not recovered, new notification events may be generated, potentially triggering new alerts and incidents in Flashduty.

You can reopen an incident after accidentally closing it. Upon reopening, the incident will revert to the **Pending** state, and dispatches and notifications will be reinitiated.

## Merge handling

You can manually merge incidents with each other or with alerts. Merging similar alerts and incidents can converge information into a single incident and accelerate the processing.

**Merge incidents**: You can select multiple incidents in the console and merge them into a target incident. You can also select other target incidents for merging under the details of a specific incident.

**Merge Alert into Incident**: If an alert is merged into an incident due to aggregation strategy, but you wish to adjust the relationship between the incident and the alert, you can go to the alert details, click the **Merge** button, and migrate the alert to the target incident.

**The essence of merging is to change the association between the alert and the incident. If all alerts in an incident are merged into another incident, the original incident will be closed directly, and you will only need to handle the target incident afterward.**

The timeline will fully record your modification process.

## FAQs

|+| I suspended the incident. Why did the system still trigger a new similar incident?

    You might have misunderstood **the postponement feature** as **the silent feature**, but there is a significant difference between the two.

    - The silent function requires you to fill in matching criteria. When a newly triggered incident matches the silent criteria, no notification will be sent. The silent policy can affect the notification of new incident triggers.
    - The suspension function does not require you to fill in any criteria. It simply buys you time to process the incident after you have claimed it, preventing the incident from being escalated to the next handler during the processing period.

    If you need to suppress an alert policy, use **Silence**, not **Suspend**.