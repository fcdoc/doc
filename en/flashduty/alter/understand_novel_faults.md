---
brief: Novel incident identification, swift handling of new incidents
---

# Understanding novel incidents

Distinguishing between common and novel incidents to expedite handling.

so-called novel incidents refer to those that have not occurred within a certain past period. If an incident is identified as novel, incident responders should be on alert. This is crucial for OnCall engineers, as the impact of novel incidents may be unknown, and their response steps might require on-the-spot decision-making. Some engineers may focus only on novel incidents, creating standardized procedures or SOPs to address them.

> [!NOTE]
> This feature is currently in beta and is only available in the professional version and higher subscription plans. If you need to enable this feature, please contact us at any time.

## View novel incidents

### Console

1. On the incident list page, novel incidents will be marked with a distinct **Novelty** identifier
2. On the incident details page, novel incidents will be prominently marked with a **Novelty** identifier and explanation at the top.

<img src="https://fcdoc.github.io/img/zh/flashduty/alter/understand_novel_faults/1.avif" alt="新奇" style="display: block; margin: 0 auto;" width="600">

### IM Tool

For example, on Feishu, when an incident is identified as a novel alert, the system will enhance notifications:

<img src="https://fcdoc.github.io/img/zh/flashduty/alter/understand_novel_faults/2.avif" alt="新奇-feishu" style="display: block; margin: 0 auto;" width="500">

### How to Identify

The system employs a machine learning model to assess the similarity between incidents, considering those with a similarity greater than 90% as similar.

When assessing similarity, we primarily consider the following factors:

1. Incident Title
2. Incident Detailed Description
3. The services affected by the incident (usually extracted from the service tag)
4. Incident includes alert objects (usually extracted from the resource tag)

If the system detects no similar incident in the past **30** days, it will mark the incident as novel.

## FAQs

|+| Does a novel incident need to be activated separately?

    No setup or activation is required. By default, the system will trigger novel incident identification for all professional and above subscription versions.