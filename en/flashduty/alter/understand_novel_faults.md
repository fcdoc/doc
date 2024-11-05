---
brief: Novel Incident Identification and Rapid Handling of New Incidents
---

# Understand Novel Incidents

Identify Whether Incidents Are Common or Novel to Accelerate Incident Handling

A novel incident is one that has never occurred in the past period. If an incident is identified as a novel incident, incident responders should be vigilant. This is particularly important for OnCall engineers, as the impact of novel incidents may be unknown, and their handling steps may require on-the-spot decisions. Some engineers may focus only on novel incidents and develop standardized procedures or SOPs to address them.

> [!NOTE]
> This feature is currently in beta and is only available in the Professional edition and above. If you need to activate this feature, please contact us at any time.

## View Novel Incidents

### Console

1. On the incident list page, novel incidents will have a clear **novelty** label;
2. On the incident details page, novel incidents will have a clear **novelty** label and explanation at the top.

<img src="https://fcdoc.github.io/img/zh/flashduty/alter/understand_novel_faults/1.avif" alt="新奇" style="display: block; margin: 0 auto;" width="600">

### IM Tool

Taking Feishu as an example, when an incident is identified as a novel alert, the system will enhance the notification:

<img src="https://fcdoc.github.io/img/zh/flashduty/alter/understand_novel_faults/2.avif" alt="新奇-feishu" style="display: block; margin: 0 auto;" width="500">

### How to Identify

The system uses a machine learning model to determine the similarity between incidents. When the similarity is greater than 90%, we consider the two incidents to be similar.

When judging similarity, we primarily consider the following factors:

1. Title of the Incident
2. Detailed Description of the Incident
3. The Service Affected by the Incident (generally extracted from the service tag)
4. The Alert Object in the Incident (generally extracted from the resource tag)

When the system detects that no similar incident has occurred in the past **30** days, it will mark the incident as a novel incident.

## Frequently Asked Questions

|+| Do Novel Incidents Need to Be Enabled Separately?

    No setup or activation is required. By default, the system will trigger novel incident identification for all Professional and above subscription versions.