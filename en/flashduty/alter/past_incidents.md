---
brief: View historical solutions for similar incidents to quickly address new incidents
---

# Understand historical incidents

View historical solutions for similar incidents to quickly address new incidents.

When responding to an incident, if we can refer to the solutions of similar historical incidents, it will significantly enhance the efficiency of incident resolution. The historical incident feature is designed to provide responders with a list of resolved similar incidents. For those unfamiliar with the issue, they can swiftly review the timeline, root causes, and solutions of past incidents, and replicate relevant actions. Historical incidents provide the necessary context for problem-solving and prevent panic among responders who are faced with unfamiliar issues.

> [!NOTE]
> This feature is currently in beta and is only available in the professional version and higher subscription plans. If you need to enable this feature, please contact us at any time.

## View similar incidents

### Console

1. Locate an incident that requires attention from the incident list or collaboration space
2. Click on the incident title to enter the incident details and select the **History Incidents** tab.

![](https://fcdoc.github.io/img/zh/flashduty/alter/past_incidents/1.avif)

The system will display up to 5 similar historical incidents to prevent information overload and save time in identification.

### Sorting Principles

How do we sort?

1. The system will only match incidents with a similarity greater than 90%
2. The system prioritizes incidents with more detailed solutions and root cause analysis
3. The system prioritizes incidents with higher similarity
4. The system lists the most recent incidents first.

> [!NOTE]
> It is a good practice to document **solutions** and **root causes** upon resolving an incident, which greatly aids subsequent responders.

### How to Identify

The system employs a machine learning model to assess the similarity between incidents, considering those with a similarity greater than 90% as similar.

When assessing similarity, we primarily consider the following factors:

1. Incident Title
2. Incident Detailed Description
3. The services affected by the incident (usually extracted from the service tag)
4. Incident includes alert objects (usually extracted from the resource tag)

When searching for historical incidents, the system matches only resolved incidents within the current collaboration space.

## FAQs

|+| How far back can I view historical incidents?

    Currently, you can only view similar incidents within 30 days prior to the current incident. Over time, the system may archive historical data, which could make past incidents inaccessible.

    Nonetheless, for ongoing incidents, you can access up to 30 days of historical data.

|+| Can I mark the current incident as dissimilar to historical incidents?

    No, the system currently lacks a marking feature. However, you can communicate with us and provide feedback through alternative channels.

|+| How can I improve the effectiveness of historical incidents?

    1. It is advisable to meticulously document the root causes and proposed solutions for significant incidents
    2. It is recommended to enrich incident tags, particularly the service and resource tags
    3. It is recommended to enhance the title and description of alerts to accurately convey the incident phenomena.