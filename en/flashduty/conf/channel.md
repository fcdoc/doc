---
brief: What is a Collaboration Space, What Functions Does It Have, and How Is It Managed?
---

# Collaboration Space

As a core tool for organizing and managing incident investigations, a collaboration space is designed to manage alerts from different teams, business systems, or service modules separately. Each collaboration space typically corresponds to a specific scope of a team's daily operations and maintenance.

## Creating a Collaboration Space

### Key Points for Space Planning

✓ It is recommended to create collaboration spaces based on a specific dimension, such as business systems or team responsibilities. For example, creating a collaboration space for an order management system that receives incidents related to the order processing workflow. This ensures focused information and efficient collaboration, allowing relevant team members to quickly access information directly related to their work, improving processing efficiency, and reducing cross-domain interference. This clarity of responsibilities and task tracking promotes the timeliness of project management and problem-solving.

✗ Avoid connecting different types or unrelated alerts to the same collaboration space. For example, a space that receives both order-related alerts and hardware or network-related alerts. This can lead to confusion during processing, dispatching, and analysis, making it difficult for teams to accurately identify and prioritize issues, thus reducing productivity.

### Getting Started
Log in to the console to create a collaboration space. Path: **Incident Management => Collaboration Space => Create Collaboration Space**.

- **Space Name:** It is recommended to name and plan the space based on departments, teams, or business types to intuitively understand its purpose.
- **Description Information:** It is recommended to briefly outline the business scope and the types of alerts the space will handle.
- **Management Team:** When creating the space, you can set the management team. **Team members have full operational permissions for the space**, while non-creators have read-only access to the space's configuration.
- **Automatic Closure After Timeout:** If an incident remains open for more than N minutes, **the system will automatically close it** (this applies to all new incidents in the space). Incidents closed due to timeout **will also receive a corresponding closure notification** (the notification channel depends on the [dispatch strategy](/conf/escalate_rule) configuration).
- If you have not yet planned how to dispatch incidents in the space, you can **skip setting the dispatch strategy**. You can configure it after the space is created.
- The integration type connected during creation **is an exclusive integration** and only applies to this space. You can also ignore this and configure it after creation.

## Managing a Collaboration Space
### Space Overview
- Account members can see all collaboration spaces but can only operate the spaces they are responsible for.
- Hover over a collaboration space and click the star to **favorite or unfavorite** it.
- By default, you see all collaboration spaces. You can **view spaces related to "me" through "My Management" and "My Favorites"**.
- When there are many collaboration spaces and the ones you are interested in are ranked lower, you can **use the sorting function in the upper right corner to move your favorite spaces to the top**.
- Sorting can be freely arranged and **only affects the current user, not other users**.

### Changing Information
- Space name, description, automatic shutdown after timeout, and management team support changes can be modified in Space Details -> Basic Settings.
- When a collaboration space is disabled, it will no longer receive alerts, but you can still manage incidents and related configurations in the space.
- Deleting a space will not delete the incident data connected to it, but the space cannot be recovered after deletion. Please proceed with caution.

### Incident List
- Displays all incidents connected to the space. By default, only unclosed incidents are shown. You can filter by **processing progress**.
- The filter conditions can be based on incident status, handler, time, title, and other criteria.
- Select multiple **incidents with the same status** to perform batch operations such as closing or claiming.
- **Merge** means combining multiple incidents into one for processing, supporting cross-collaboration space incident merging.
- **For more details, please refer to [Search and View Incidents](/alter/view_incidents)**.

### Integrated Data
- Integrations created under a collaboration space are **exclusive integrations, meaning they only apply to this space**.
- After each type of integration is created, a corresponding webhook address is generated. **Different types of integrations are incompatible with each other**.
- Exclusion rules discard events that meet certain conditions and can be configured based on integration type, severity, and other criteria.
- When there are multiple exclusion rules, they are matched in order of priority from high to low. Matching stops as soon as a rule is matched, even if other rules are not.
- The excluded events **will not be displayed anywhere in the system** and are imperceptible. If you are not receiving alerts, check if any exclusion rules are configured.

### Dispatch Strategy
- Manage incident notification rules, notification channels, and escalation rules.
- Incident notifications will be matched sequentially according to the order of each policy, and no further matching will be performed after a match.
- When there are multiple policies, you can freely drag and adjust the order of dispatch strategies. Ensure that the notification rules meet business needs before making adjustments.
- For more information on **dispatch strategies**, please refer to the [Dispatch Strategies](/conf/escalate_rule) section.

### Noise Reduction Configuration
- Aggregation noise reduction combines similar or related alerts into a single incident.
- Aggregation can be configured based on alert title, alert level, and label dimensions.
- Incident convergence can automatically suppress notifications for the same incident within a certain period of time.
- For more information on **noise reduction configuration**, please refer to the [Noise Reduction Configuration](/conf/noise_reduction) section.