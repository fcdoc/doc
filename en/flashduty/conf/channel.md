---
brief: What is a Collaboration Space, What Functions Does It Have, and How Is It Managed?
---

# Collaboration Space

A collaboration space serves as a core vehicle for organizing and managing incident investigations. It aims to manage alerts from different teams, different business systems, or different service modules separately. Each collaboration space typically corresponds to a specific scope of a team's daily operations and maintenance.

## Creating a Collaboration Space

### Space Planning Essentials

&check; It is recommended to create collaboration spaces based on a specific dimension, such as business systems or team responsibilities. For example, creating a collaboration space for an order management system that receives incident events related to the order processing workflow. This ensures focused information and efficient collaboration, allowing team members to quickly access information directly related to their work, improving processing efficiency, and reducing cross-domain interference. This helps clarify responsibilities and track tasks, promoting the timeliness of project management and problem-solving.

&cross; Avoid connecting different types or unrelated alerts to the same collaboration space. For example, a space that receives both order-related alerts and hardware resource or network-related alerts. This can lead to confusion during processing, dispatching, and analysis, making it difficult for teams to accurately identify and prioritize issues, thereby reducing productivity.

### Starting Creation
Log in to the console to create a collaboration space. Path: **Incident Management => Collaboration Space => Create Collaboration Space**.

- **Space Name:** It is recommended to name and plan the space based on departments, groups, or business types to provide a clear understanding of its purpose.
- **Description Information:** It is recommended to briefly outline the business services the space will handle and the types of alerts it will receive.
- **Management Team:** When creating the space, you can set the management team. **Team members have full operation permissions for the space**, while non-creators have read-only access to the space's configuration.
- **Automatic Closure After Timeout:** If an incident remains open for more than N minutes, **the system will automatically close it** (this applies to all new incidents in the space). Incidents closed due to timeout **will also receive a corresponding closure notification** (the notification channel depends on the [dispatch strategy](/conf/escalate_rule) configuration).
- If you have not planned how to dispatch incidents in the space, you can **skip setting the dispatch strategy**. You can configure the dispatch strategy after the space is created.
- The integration type connected during creation **is an exclusive integration** and only applies to this space. You can also ignore this and configure it after the space is created.

## Managing a Collaboration Space
### Space Overview
- Account members can see all collaboration spaces but can only operate the spaces they are responsible for.
- Hover over a collaboration space and click the star to **favorite or unfavorite** it.
- By default, you see all collaboration spaces. You can **view spaces related to "me" through "My Management" and "My Favorites"**.
- When there are many collaboration spaces and the ones you are interested in are ranked lower, you can **use the sorting function in the upper right corner to move the spaces you are interested in to the top**.
- Sorting can be freely arranged and **only affects the current user, not other users**.

### Changing Information
- Space name, description, automatic shutdown on timeout, and management team support changes can be modified in Space Details -> Basic Settings.
- When a collaboration space is disabled, it no longer receives alerts, but you can still operate the incidents and related configurations in the space.
- Deleting a space will not delete the incident data connected to it, but the space cannot be restored after deletion, so please proceed with caution.

### Incident List
- The list displays all incidents connected to the space. By default, only unclosed incidents are shown. You can filter by **processing progress**.
- The filter conditions can be based on incident status, handler, time, title, and other criteria.
- Select multiple **incidents in the same status** to perform batch operations such as closing or claiming.
- **Merging** means combining multiple incidents into one for processing, and supports merging incidents across collaboration spaces.
- **For more details, please refer to [Searching and Viewing Incidents](/alter/view_incidents)**.

### Integrated Data
- Integrations created under a collaboration space are **exclusive integrations, meaning they only apply to this space**.
- After each type of integration is created, a corresponding webhook address is generated. **Different types of integrations are incompatible with each other**.
- Exclusion rules discard events that meet certain conditions and can be configured based on integration type, severity, and other criteria.
- When there are multiple exclusion rules, they are matched in order of priority from high to low. Matching stops as soon as a rule is matched, even if other rules are not.
- The excluded events **will not be displayed anywhere in the system** and are imperceptible. If you do not receive alerts, check if any exclusion rules are configured.

### Dispatch Strategy
- You can manage incident notification rules, notification channels, escalation rules, and more.
- Incident notifications are matched sequentially according to the order of each policy, and no further matching occurs once a match is found.
- When there are multiple policies, you can freely drag and adjust the order of dispatch strategies. Before adjusting, ensure that the notification rules meet business needs.
- For more information on **dispatch strategies**, please refer to the [Dispatch Strategies](/conf/escalate_rule) section.

### Noise Reduction Configuration
- Aggregation noise reduction combines similar or related alerts into a single incident.
- Aggregation can be configured based on alert title, alert level, and label dimensions.
- Incident convergence can automatically suppress notifications for the same incident within a certain period of time.
- For more information on **noise reduction configuration**, please refer to the [Noise Reduction Configuration](/conf/noise_reduction) section.