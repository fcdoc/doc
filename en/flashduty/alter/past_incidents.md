---
brief: View solutions to similar historical incidents to quickly handle new incidents
---

# Learn about Historical Incidents

View solutions to similar historical incidents to quickly handle new incidents.

When responding to an incident, if we can view the solutions to similar historical incidents, it will greatly accelerate the resolution process. The historical incident feature provides responders with a list of similar incidents that have been resolved. For responders unfamiliar with the issue, they can quickly review the timeline, root causes, and solutions of historical incidents, and replicate relevant actions. Historical incidents provide the necessary context for problem-solving and help prevent panic when responders encounter unfamiliar issues.

> [!NOTE]
> This feature is currently in beta and is only available in the Professional version and above. If you need to enable this feature, please contact us.

## View Similar Incidents

### Console

1. From the incident list or collaboration space, find an incident that needs to be processed;
2. Click the incident title, enter the incident details, and select the **Historical Incidents** tab.

![](https://fcdoc.github.io/img/zh/flashduty/alter/past_incidents/1.avif)

The system will provide up to 5 similar historical incidents to avoid overwhelming you with too much information.

### Sorting Principle

How do we sort?

1. The system only matches incidents with a similarity greater than 90%;
2. The system prioritizes incidents with more detailed solutions and root causes;
3. The system prioritizes incidents with higher similarity;
4. The system prioritizes more recent incidents.

> [!NOTE]
> Leaving **solutions** and **root causes** when resolving an incident is a good habit. This will greatly enhance the response speed for future incidents.

### How to Identify

The system uses a machine learning model to determine the similarity between incidents. When the similarity is greater than 90%, we consider the two incidents to be similar.

When judging similarity, we primarily consider the following factors:

1. Title of the Incident
2. Detailed Description of the Incident
3. The service affected by the Incident (generally extracted from the service tag)
4. The alert object in the Incident (generally extracted from the resource tag)

When retrieving historical incidents, the system only matches similar incidents that have been resolved in the current collaboration space.

## Frequently Asked Questions

|+| How far back can I view historical incidents?

    Currently, you can only view similar incidents within 30 days before the current incident. Over time, the system may delete historical data, in which case you may not be able to view historical incidents.

    Regardless, for the current incident, you can view up to 30 days of historical data.

|+| Can I mark that the current incident is not similar to historical incidents?

    No, the system currently does not have a marking function. However, you can communicate and provide feedback to us through other channels.

|+| How can I make historical incidents more effective?

    1. It is recommended that you fill in the root causes and solutions for important incidents;
    2. It is recommended that you enrich the incident tags, especially the service and resource tags;
    3. It is recommended that you provide more detailed titles and descriptions for alerts to more accurately describe the incident.