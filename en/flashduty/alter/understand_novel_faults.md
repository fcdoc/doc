---
brief: Novel incident identification and rapid handling of new incidents
---

# Understanding novel incidents

Identify whether incidents are common or novel to expedite incident handling.

A novel incident is one that has never occurred in the past period. If an incident is identified as a novel incident, incident responders should be vigilant. This is particularly important for OnCall engineers, as the impact of novel incidents may be unknown, and the response steps may require on-the-spot decisions. Some engineers may focus solely on novel incidents and develop standardized procedures or SOPs to address them.

> [!NOTE]
> This feature is currently in beta and is only available in the Professional Edition and above. If you need to enable this feature, please feel free to contact us.

## Viewing novel incidents

### Console

1. On the incident list page, novel incidents will be marked with a clear **novel** label;
2. On the incident details page, novel incidents will have a clear **novel** label and explanation at the top.

<img src="https://fcdoc.github.io/img/zh/flashduty/alter/understand_novel_faults/1.avif" alt="新奇" style="display: block; margin: 0 auto;" width="600">

### IM Tool

Taking Feishu as an example, when an incident is identified as a novel alert, the system will provide a stronger reminder:

<img src="https://fcdoc.github.io/img/zh/flashduty/alter/understand_novel_faults/2.avif" alt="新奇-feishu" style="display: block; margin: 0 auto;" width="500">

### How to Identify

The system uses a machine learning model to determine the similarity between incidents. When the similarity is greater than 90%, we consider the two incidents to be similar.

When judging similarity, we primarily consider the following factors:

1. Incident Title
2. Detailed Description of the Incident
3. The service affected by the incident (usually extracted from the service tag)
4. Alert objects in the incident (usually extracted from the resource tag)

When the system detects that no similar incident has occurred in the past **30** days, the incident is marked as a novel incident.

## Frequently Asked Questions

|+| Does the novel incident feature need to be enabled separately?

    No setup or activation is required. By default, the system will trigger novel incident identification for all Professional and above subscription editions.