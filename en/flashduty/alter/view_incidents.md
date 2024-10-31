---
brief: Understand the use of incident lists and detail pages, including aggregate views, filtering, and timelines
---

# Search and view incidents

Connect all company alert events to Flashduty to enable centralized viewing and handling of alerts.

## Incident List

Flashduty offers two entry points for viewing the incident list: one within the collaboration space and another under the incident management menu. The difference lies in the fact that under the incident management menu, you can view incidents from multiple collaboration spaces, even all incidents across the entire company.

![](https://fcdoc.github.io/img/zh/flashduty/alter/view_incidents/1.avif)

1. **Assignees**: By default, focus is on incidents **assigned to me**, which can be switched to view incidents across the entire account.
2. **Processing Progress**: Filter incidents by processing progress, with the default set to **All**.
3. **Time Filtering**: Supports relative time and custom range filtering. Note that for performance reasons, **the query's start and end times must not exceed one month**. To query data older than one month, adjust the start and end times accordingly.
4. **Search by Typing**: Support searching for incident IDs; if the assignee is switched to “Assigned to me,” it also supports fuzzy matching of “Incident Titles.”
5. **Common Filters**: Allows saving frequently used filter conditions, such as "My Collaboration Space", as "Common Filters" to enhance daily processing efficiency.
6. **Advanced Filters**: Supports a variety of filtering dimensions, including severity, tags, or custom fields.
7. **View Settings**: Offers a range of rendering options, including the ability to introduce **custom display attributes** and aggregate views.
8. **Pagination Settings**: Adjust pagination and the number of items per page.

> [!TIP]
> To enhance performance, when search conditions match more than **1000** incidents, the system will display only "1000+" instead of the exact number. As such, you can only view 1000 incidents through pagination. If you need to view more, please adjust your search time range or obtain all data via the [Incident Query](https://developer.flashcat.cloud/api-110655782) API.

### Use Aggregate Views

Aggregate views provide a different perspective for viewing incidents, allowing you to define various aggregation dimensions. The essence of aggregation dimensions is real-time grouping, such as aggregating by severity.

![](https://fcdoc.github.io/img/zh/flashduty/alter/view_incidents/2.avif)

> [!TIP]
> For performance reasons, the system will match up to **100 pieces of** data for aggregation in the aggregate view. Thus, the list page you see may not include all matching data. If this is a concern, switch to the list view.

### Use Advanced Filters

Flashduty provides various filtering capabilities and offers ample flexibility. A typical scenario is:

- Search for related incidents triggered by the alert policy "Host Down" based on the check tag.
- Search for related incidents marked as "False Positives" based on the false positive field.

> [!TIP]
> Flexibility often comes at the cost of performance, and this is also true for Flashduty, despite our extensive performance optimizations. We always recommend narrowing your search time range and using conditions like **assigned to me** and **processing progress** to limit the scope of your query.

### Custom Rendering

Under the **Settings** tab, select or disable the display of the following content to customize the incident list view:

1. **Basic Attributes**: Define whether to display basic information such as duration and handler.
2. **Custom Fields**: You can choose custom fields defined by the platform; if an incident does not have this field set, it will display as “-”.
3. **Tags**: You can filter and select tags; if an incident does not have a particular tag, it will display as “-”.

## Incident Details

Incident details are the primary entry point for investigating incidents, displaying all available information. Especially on the incident overview page, Flashduty presents the most critical information you need.

![](https://fcdoc.github.io/img/zh/flashduty/alter/view_incidents/3.avif)

1. **Key Information**: Includes the incident's title, severity, processing progress, ID number, collaboration space, and duration.
2. **Detailed Information**: Includes the incident's description, impact, and tags, with both description and impact supporting Markdown formatting.
3. **Action Area**: Various frequently used action buttons, including additional custom and infrequent action buttons.
4. **Assignment Information**: Current handler information and method of assignment. If using strategic assignment and there is a subsequent step, an upgrade countdown will be displayed here.
5. **Custom Fields**: The area for configuring custom fields.

You can switch to the top tabs to view more detailed **related alerts**, **timelines**, and **historical changes** for root cause analysis. For closed incidents, the system also displays the **Problem Resolution** page to show the root causes and solutions.

### FAQs

|+| The console error message reads: "Due to the large volume of data, we are unable to respond to your request promptly..."

    This error frequently occurs on pages such as incident lists, alert list queries, and analysis dashboards. It is mainly due to the system matching too much data, resulting in query timeouts.

    In such instances, please refine your search criteria, for example by specifying a narrower time range, or by using more precise query conditions. Should you continue to experience issues, please feel free to contact us.