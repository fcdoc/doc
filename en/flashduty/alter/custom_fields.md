---
brief: Understand, Configure, and Use Custom Fields
---

# Custom Fields

Understand, configure, and use custom fields.

## Usage Scenarios

FlashDuty has supported access to most common alert systems, and we have put most of the information in the push content into Lables for display. Despite this, our users will still have some expansion or customization needs, such as manually marking a incident whether it is a false positive. Therefore, we provide a **custom field** function to further enrich incident description.

With custom fields, you can add custom metadata, record specific incident-related information, and pass and use this information during incident processing. The following are common usage scenarios for custom fields:

- **Flexible Definition**: You can create multiple custom fields as needed and define the field names, types, options, and default values. Common custom field types include text, drop-down lists, and checkboxes.

![](https://fcdoc.github.io/img/zh/flashduty/alter/custom_fields/1.avif)

- **Information Association**: Through custom fields, you can associate incidents with other related data. For example, you can add custom fields to identify affected systems, geographic locations, associated customers, or whether it is a false positive.

![](https://fcdoc.github.io/img/zh/flashduty/alter/custom_fields/2.avif)

- **Filtering and Categorization**: The incident list supports filtering and categorizing views based on custom fields. You can create common filters based on the values of custom fields to better organize and process incidents.

![](https://fcdoc.github.io/img/zh/flashduty/alter/custom_fields/3.avif)

## Configure Custom Fields

### Create Fields

> [!TIP]
> An account supports the creation of up to 15 custom fields.

1. Enter the console **Incident Management => Custom Fields**
2. Click **Create Custom Field**
3. Enter the following information:

   **Field Name**: Identifies the field in the API; cannot be modified after creation.
   **Display Name**: The field name displayed on the incident details page; can be modified after creation.
   **Field Description**: Helps incident handlers understand and use this field.

4. Select the field type and add options and default values as needed. Field types include:

   **Text**: Plain text input box, up to 500 characters.
   **Single-Select**: Single-selection drop-down box, allowing up to ten options, each not exceeding 200 characters.
   **Multi-Select**: Multi-selection drop-down box, allowing up to ten options, each not exceeding 200 characters.
   **Checkbox**: Checkbox.

5. Click **Submit** to complete

> [!TIP]
> If a field has a default value set, the system will automatically write the field and assign the default value when the incident is generated. Note that the field only affects new incidents and has no impact on existing incidents.

### Update Fields

Only the following content can be updated:

1. Display Name
2. Field Description
3. Field Options (for single-select and multi-select types only)
4. Default Value

> [!TIP]
> After the field is updated, it only affects new incidents and has no impact on existing incidents.

### Delete Fields

You can initiate a deletion operation in the console at any time. However, please note that deletion is a time-consuming operation. When a field is deleted, the system will scan historical incidents and asynchronously update to remove the association between the field and the incident. You cannot re-create a field with the same name until the deletion is complete.

## Frequently Asked Questions

|+| Why Can't I Retrieve Incidents by the Field I Created?

    Please confirm whether the field type you want to retrieve is **Text**. To ensure system stability, the system currently does not support retrieving text type fields. Please understand.