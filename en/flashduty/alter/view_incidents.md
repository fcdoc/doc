---
brief: Understand the use of incident lists and detail pages, including aggregate views and filtering, and timelines
---

# Search and view incidents

Connect all alert events of your company to Flashduty to view and process alerts in a centralized manner.

## Incident List

Flashduty provides two entrances to view the incident list. One is within a collaboration space, and the other is under the incident management menu. The difference is that under the Incident Management menu, you can see incidents from multiple collaboration spaces, or even all incidents across the company.

![](https://fcdoc.github.io/img/zh/flashduty/alter/view_incidents/1.avif)

1. **Assigned Personnel**: By default, the focus is on incidents **assigned to me**. You can switch to view incidents across the entire account.
2. **Processing Progress**: Filter incidents by processing progress. The default is **all**.
3. **Time Filtering**: Supports relative time and custom interval filtering. Note that for query performance, **the start and end time of the query must not exceed one month**. If you need to query data from more than a month ago, adjust the start and end times accordingly.
4. **Type Search**: Supports searching by incident ID. If the assignee is switched to "Assigned to me," it also supports fuzzy matching of "Incident Titles."
5. **Frequently Used Filters**: Supports saving high-frequency filtering conditions, such as "My Collaboration Space," as "Frequently Used Filters" to speed up daily processing efficiency.
6. **More Filters**: Supports rich dimension filters, including severity, labels, or custom fields.
7. **View Settings**: Supports rich rendering forms, including the introduction of **custom display attributes** and even aggregate views.
8. **Pagination Settings**: Adjust pagination and the number of items per page.

> [!TIP]
> To improve performance, when the search conditions match more than **1000** incidents, the system only displays 1000+. Therefore, you can only view 1000 incidents by navigating through pages. If you need to view more, please adjust your search time interval. Or retrieve all data through the [Incident Query](https://developer.flashcat.cloud/api-110655782) API.

### Using Aggregate Views

Aggregate views provide a different perspective on incidents, allowing you to define different aggregation dimensions. The essence of aggregation dimensions is real-time Group By, such as aggregating by severity.

![](https://fcdoc.github.io/img/zh/flashduty/alter/view_incidents/2.avif)

> [!TIP]
> To improve performance, in the aggregate view, the system can match up to **100** data points for aggregation. Therefore, the list page you see may not contain all matching data. If this is a concern, switch to list view.

### Using More Filters

Flashduty provides filtering capabilities across various dimensions and gives you ample flexibility. The most typical scenarios are:

- Searching for incidents triggered by the alert policy "Host Down" based on the check tag.
- Searching for incidents marked as "False Positives" based on the false positive field.

> [!TIP]
> Flexibility often means lower performance, and this is no exception in Flashduty, despite the extensive performance optimization we have implemented. We always recommend narrowing your time query range and using conditions like **Assigned to me** and **Processing Progress** to reduce the query scope.

### Custom Rendering

In the **Settings** tab, select or turn off the display of the following content to customize the incident list:

1. **Basic Attributes**: Define whether to display basic information such as duration and processing personnel.
2. **Custom Fields**: You can select custom fields defined by the platform. If an incident has not set this field, it will display " - ".
3. **Tags**: You can filter and select tags. If an incident does not have this tag, it will display " - ".

## Incident Details

Incident details are the main entry point for investigating incidents, displaying all the information we can gather. Especially on the incident overview page, Flashduty focuses on the information you need most.

![](https://fcdoc.github.io/img/zh/flashduty/alter/view_incidents/3.avif)

1. **Key Information**: Incident title, severity, processing progress, ID number, collaboration space, duration, etc.
2. **Details**: Incident description, impact, and tags. The description and impact support Markdown.
3. **Operation Area**: Various high-frequency operation buttons, including custom and low-frequency operation buttons.
4. **Dispatch Information**: Current processing personnel information and dispatch method. If a strategy dispatch is used and there is a next step, the upgrade countdown will be displayed here.
5. **Custom Fields**: Custom field configuration area.

You can switch to the tab above to view more detailed **associated alerts**, **timelines**, and **historical changes** for incident root cause analysis. For closed incidents, the system will also display the **problem resolution** page to show the root cause and solution of the incident.

### Frequently Asked Questions

|+| Console Error: Due to the large volume of data, we are unable to respond to your request in a timely manner...

    This error often appears on incident lists, alert lists, and analysis dashboards. It mainly occurs because the system matches too much data, causing the query to time out.

    In this case, please narrow the query scope, such as the time interval, or use precise query conditions. If you still have issues, please contact us.