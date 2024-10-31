---
brief: What is a collaboration space, what are its features, and how is it managed?
---

# Collaborative space

As a core vehicle for organizing and managing incident troubleshooting, the collaboration space aims to separately manage alerts from different teams, business systems, or service modules. Each collaboration space typically corresponds to a specific range of the team's daily operations and maintenance activities.

## Create a Collaboration Space

### Principles of Space Planning

✓ It is recommended to create collaboration spaces logically based on dimensions such as business systems or team responsibilities. For instance, establishing a collaboration space for an order management system to handle incidents related to the order processing workflow ensures focused information and efficient collaboration. This enables team members to swiftly obtain information directly related to their work, enhancing processing efficiency while minimizing cross-domain interference. It also clarifies responsibilities, facilitates task tracking, and boosts the timeliness of project management and problem resolution.

✗ It should be avoided to integrate alerts of different types or unrelated nature into the same collaboration space. For example, a space that receives both order-related alerts and alerts concerning hardware resources or network issues will lead to confusion in processing, dispatching, and analysis, making it difficult for teams to accurately identify and prioritize issues, thus reducing work efficiency.

### Begin Creation
Log in to the console to create, path: **Incident Management => Collaboration Space => Create Collaboration Space**.

- **Space Name:** It is suggested to name and plan based on departments, teams, or business types to gain a clearer understanding of the space's purpose.
- **Description information:** It is suggested to provide a simple overview of the business scope handled by this space and the type of alerts it receives.
- **Management Team:** The management team for the space can be set upon creation. **Team members have full operational permissions for the space**, while non-creators have read-only access to the space's configuration.
- **Automatically close after timeout:** that is, if it has not been closed for more than N minutes incident **the system will automatically close it** (effective for all new incident in this space), and incident that is closed overtime **will also have a corresponding shutdown notification** (the notification channel depends on the configuration of [the dispatch strategy](/conf/escalate_rule) ) .
- If there is no plan in place for incident allocation within this space, you can **skip setting the dispatch strategy**. After creation, you can continue to configure the dispatch strategy as needed.
- During creation, the type of integration connected is **exclusive to that space** and only effective within it. It can also be overlooked and configured after creation.

## Manage Collaboration Space
### Space Overview
- Account members can view all collaboration spaces but can only operate the ones they are responsible for.
- by hovering over a collaboration space and clicking the star icon, you can **favorite or unfavorite** it.
- By default, all collaboration spaces are displayed. You can **view collaboration spaces related to "me" by selecting "Managed by Me" or "My Favorites"**.
- When there are many collaboration spaces and the ones you are interested in are ranked low, you can **use the sorting feature in the upper right corner to bring your preferred collaboration spaces to the forefront**.
- Sorting can be freely arranged and **will only affect the current user, not others**.

### Change Information
- The space name, description, automatic timeout closure, and management team can be changed, which can be modified in the Space Details -> Basic Settings section.
- After a collaboration space is disabled, it will no longer receive alerts, but you can still operate on the incidents and related configurations within the space.
- Deleting a space will not delete the incident data that has been connected to it, but the space cannot be restored once deleted, so please proceed with caution.

### Incident List
- Displays all incidents connected to this space. By default, only unclosed incidents are shown, and you can filter by **processing progress**.
- Filter conditions can be set based on incident status, handler, time, title, and other criteria.
- Select multiple **incidents with the same status** to perform batch operations such as closing or claiming.
- **Merge** allows for the consolidation of multiple incidents into one for processing, supporting incidents across different collaboration spaces.
- **For more detailed information, please refer to [Search and View Incidents](/alter/view_incidents)**.

### Integrated Data
- Integrations created under a collaboration space are **exclusive to that space**.
- Each type of integration, once created, generates a corresponding webhook address, and **different types of integrations are not compatible with each other**.
- Exclusion rules are used to discard events that meet certain criteria and can be configured based on integration type, severity, and other conditions.
- When multiple exclusion rules are present, they are matched in order of priority from highest to lowest, and matching stops once a rule is triggered.
- Excluded events **will not be displayed anywhere by the system**, making them imperceptible. If alerts are not received, you may first want to check if there are any exclusion rules configured.

### Distribution Strategy
- You can manage incident notification rules, notification channels, and escalation rules.
- Incident notifications will be matched sequentially according to the order of each policy, and no further matching will occur after a match is found.
- When multiple policies exist, you can freely drag and adjust the order of the distribution policies, ensuring that notification rules align with business needs before making changes.
- For more details on **Dispatch Policies**, please refer to the [Dispatch Policies](/conf/escalate_rule) section.

### Noise Reduction Configuration
- Aggregation noise reduction involves merging similar or related alerts into a single incident.
- Aggregation can be configured based on alert title, alert level, and label dimensions.
- Incident convergence automatically suppresses notifications for the same incident within a certain time frame.
- For further information on **Noise Reduction Configuration**, please refer to the [Noise Reduction Configuration](/conf/noise_reduction) section.