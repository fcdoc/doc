---
brief: Check historical solutions for similar failures to address new issues promptly
---

# Understand historical failures

Check historical solutions for similar failures to address new issues promptly.

When responding to failures, having access to solutions for similar historical issues can significantly expedite the resolution process. The historical failure feature provides responders with a list of resolved similar failures. For those unfamiliar with the issue, they can quickly review the timeline, root causes, and solutions of past failures, and replicate relevant actions. Historical failures offer the necessary context for problem-solving and help prevent panic among responders encountering unfamiliar issues.

> [!NOTE]
> This feature is currently in beta and is only available in the professional version and higher subscription plans. If you need to enable this feature, please contact us at any time.

## View Similar Failures

### Console

1. Locate a failure that requires attention from the failure list or collaboration space
2. Click on the failure title to enter the details, and select the **Historical Failures** tab within the details.

![](https://fcdoc.github.io/img/zh/flashduty/alter/past_incidents/1.avif)

The system will provide up to 5 similar historical failures to avoid excessive time spent on reviewing and identifying information.

### Sorting Principles

How do we sort?

1. The system only matches failures with a similarity greater than 90%
2. The system prioritizes returning failures with more detailed solutions and root causes
3. The system prioritizes returning failures with higher similarity
4. The system returns the most recent failures first.

> [!NOTE]
> Recording the **solution** and **root cause** of each resolved failure is a good practice that greatly enhances the efficiency of subsequent responders.

### How to Identify

The system uses a machine learning model to determine the similarity between failures. When the similarity exceeds 90%, we consider the two failures to be similar.

When assessing similarity, we primarily consider the following factors:

1. Failure title
2. Detailed description of the failure
3. The service affected by the failure (usually extracted from the service tag)
4. Alarm objects included in the failure (usually extracted from the resource tag)

When searching for historical failures, the system only matches resolved similar failures within the current collaboration space.

## FAQs

|+| How long ago can I review historical failures?

    At present, you can only review similar failures within 30 days prior to the occurrence of the current failure. As time progresses, the system may delete historical data, in which case you might not be able to access past failures.

    Nonetheless, for failures currently in progress, you can consult up to 30 days of historical data.

|+| Can I indicate that the current failure is dissimilar to historical failures?

    No, the system currently lacks a marking feature. However, you can communicate with us and provide feedback through alternative channels.

|+| How can I enhance the effectiveness of historical failures?

    1. It is recommended that you fill in the root cause and solution for significant failures in detail;
    2. It is suggested that you enrich the tags for failures, particularly focusing on service and resource tags;
    3. It is recommended that you enhance the title and description of alerts to more accurately convey the symptoms of the failure.