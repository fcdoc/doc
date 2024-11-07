---
brief: Novel Incident Identification and Rapid Handling of New Incidents
---

# Understanding Novel Incidents

Identify whether incidents are common or novel to expedite incident handling.

A novel incident is one that has never occurred in the past period. If an incident is identified as novel, incident responders should be alert. This is particularly important for OnCall engineers, as the impact of novel incidents may be unknown, and their handling procedures may require on-the-spot decisions. Some engineers may focus solely on novel incidents, developing standardized processes or SOPs to address them.

> [!NOTE]
> This feature is currently in beta and is only available in the Professional version and above. If you need to enable this feature, please contact us at any time.

## Viewing Novel Incidents

### Console

1. On the incident list page, novel incidents will be marked with a prominent **Novel** label;
2. On the incident details page, novel incidents will have a prominent **Novel** label and explanation at the top.

<img src="https://fc.3ti.site/zh/flashduty/alter/understand_novel_faults/1.avif" alt="新奇" style="display: block; margin: 0 auto;" width="600">

### IM Tool

Taking Feishu as an example, when an incident is identified as a novel alert, the system will enhance the notification:

<img src="https://fc.3ti.site/zh/flashduty/alter/understand_novel_faults/2.avif" alt="新奇-feishu" style="display: block; margin: 0 auto;" width="500">

### How to Identify

The system uses a machine learning model to determine the similarity between incidents. When the similarity is greater than 90%, we consider the two incidents to be similar.

When judging similarity, we mainly consider the following factors:

1. Title of the incident
2. Detailed description of the incident
3. The service affected by the incident (generally extracted from the service tag)
4. The alert object in the incident (generally extracted from the resource tag)

When the system detects that no similar incident has occurred in the past **30** days, it will mark the incident as novel.

## Frequently Asked Questions

|+| Does the novel incident feature need to be activated separately?

    No setup or activation is required. By default, the system will trigger novel incident identification for all Professional and above subscription versions.