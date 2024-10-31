---
brief: Understand, configure, and utilize custom fields
---

# Custom Fields

Understand, configure, and utilize custom fields.

## Usage Scenarios

FlashDuty now supports integration with most common alert systems, and we have placed a significant portion of the push content information into Labels for display. Nonetheless, our users still have some extended or custom requirements, such as manually marking whether an incident is a false positive. Therefore, we have introduced a **Custom Fields** feature to further enhance the description of incidents.

With custom fields, you can add custom metadata, record specific information related to incidents, and pass and utilize this information throughout the incident management process. Here are some common use cases for custom fields:

- **Flexible Definition**: You can create multiple custom fields as needed, defining field names, types, optional choices, and default values.

![](https://fcdoc.github.io/img/zh/flashduty/alter/custom_fields/1.avif)

- **Information Association**: Custom fields enable the correlation of incidents with other related data. For example, you can add custom fields to identify affected systems, geographic locations, associated clients, or to indicate false positives.

![](https://fcdoc.github.io/img/zh/flashduty/alter/custom_fields/2.avif)

- **Filtering and Sorting**: The incident list supports filtering and sorting views based on custom fields. You can create common filter options based on the values of custom fields to better organize and handle incidents.

![](https://fcdoc.github.io/img/zh/flashduty/alter/custom_fields/3.avif)

## Configure Custom Fields

### Create Fields

> [!TIP]
> An account can support the creation of up to 15 custom fields.

1. Navigate to the console **Incident Management => Custom Fields**
2. Click **Create Custom Field**
3. Enter the following information:

   **Field Name**: Identifies the field in the API and cannot be modified after creation.
   **Display Name**: The name of the field displayed on the incident details page, which can be modified after creation.
   **Field Description**: This provides auxiliary information for incident handlers to understand and use the field effectively.

4. Select the field type and add optional choices and default values as necessary. The following field types are available:

   **Text**: A plain text input box that can accommodate up to 500 characters.
   **Single Choice**: A single selection dropdown allowing for up to ten options, with each option not exceeding 200 characters.
   **Multiple Choice**: A multi-selection dropdown allowing for up to ten options, with each option not exceeding 200 characters.
   **Checkbox**: A checkbox input.

5. Click **Submit** to complete the process

> [!TIP]
> If a field is set with a default value, the system will automatically populate this field with the default value upon incident creation. Note that this field setting only applies to new incidents and does not affect existing ones.

### Update Fields

Only the following content can be updated:

1. 3	display name
2. 4	Field description
3. 5	Field options (available for single-select and multi-select types only)
4. 6	default value

> [!TIP]
> Updates to a field will only take effect for new incidents and will not impact those that are already in existence.

### Delete Field

You can initiate a deletion operation in the console at any time. However, be aware that deletion is a time-consuming process. When a field is deleted, the system will scan historical incidents and update them asynchronously, removing the association between the field and the incident. You will not be able to recreate a field with the same name until the deletion process is complete.

## FAQs

|+| Why can't I search for incidents using the field I created?

    Please confirm if the field type you wish to search is **text**. To maintain system stability, the system currently does not support searching fields of the text type. Your understanding is appreciated.