---
brief: View solutions to similar historical incidents to quickly handle new incidents
---

# Understand Historical Incidents

View solutions to similar historical incidents to quickly handle new incidents.

When responding to an incident, if you can view the solutions to similar historical incidents, it will significantly speed up the resolution process. The historical incident feature provides responders with a list of similar incidents that have been resolved. For responders unfamiliar with the issue, they can quickly review the timeline, root cause, and solution of historical incidents and replicate the relevant actions. Historical incidents provide the context needed to solve problems and prevent responders from panicking when encountering unfamiliar issues.

> [!NOTE]
> This feature is currently in beta and is only available in the Professional Edition and above. If you need to enable this feature, please feel free to contact us.

## View Similar Incidents

### Console

1. From the incident list or collaboration space, find an incident that needs to be processed;
2. Click the incident title to enter the incident details, and select the **Historical Incidents** tab.

![](https://fcdoc.github.io/img/zh/flashduty/alter/past_incidents/1.avif)

The system will provide up to 5 similar historical incidents to avoid overwhelming you with too much information and wasting time on identification.

### Sorting Principle

How do we sort?

1. The system only matches incidents with a similarity greater than 90%;
2. The system prioritizes incidents with more detailed solutions and root causes;
3. The system prioritizes incidents with higher similarity;
4. The system prioritizes more recent incidents.

> [!NOTE]
> It is a good habit to document the **solution** and **root cause** each time you resolve an incident. This will greatly enhance the speed at which future responders can handle similar incidents.

### How to Identify

The system uses a machine learning model to determine the similarity between incidents. When the similarity is greater than 90%, we consider the two incidents to be similar.

When judging similarity, we primarily consider the following factors:

1. Incident Title
2. Detailed Description of the Incident
3. The service affected by the incident (usually extracted from the service tag)
4. Alert objects in the incident (usually extracted from the resource tag)

When searching for historical incidents, the system only matches similar incidents that have been resolved within the current collaboration space.

## Frequently Asked Questions

|+| How far back can I view historical incidents?

    Currently, you can only view similar incidents within 30 days before the current incident. Over time, the system may delete historical data, in which case you may not be able to view historical incidents.

    Regardless, for current incidents, you can review up to 30 days of historical data.

|+| Can I mark that the current incident is not similar to historical incidents?

    No, the system currently does not have a marking function. However, you can communicate and provide feedback to us through other channels.

|+| How can I make historical incidents more effective?

    1. It is recommended that you thoroughly document the root cause and solution for important incidents;
    2. It is recommended that you enrich the incident tags, especially the service and resource tags;
    3. It is recommended that you provide detailed titles and descriptions for alerts to more accurately describe the incident.