---
brief: What is a Collaboration Space, What Functions Does It Have, and How Is It Managed?
---

# Collaborative Space

As a core tool for organizing and managing incident investigations, a collaboration space is designed to manage alerts from different teams, business systems, or service modules separately. Each collaboration space typically corresponds to a specific scope of a team's daily operations and maintenance.

## Creating a Collaboration Space

### Key Points for Space Planning

&check; It is recommended to create collaboration spaces based on a specific dimension, such as business systems or team responsibilities. For example, creating a collaboration space for an order management system that receives incidents related to the order processing flow. This ensures focused information and efficient collaboration, allowing relevant team members to quickly access information directly related to their work, improving handling efficiency, and reducing cross-domain interference. This promotes clear responsibilities and task tracking, enhancing the timeliness of project management and problem-solving.

&cross; Avoid connecting different types or unrelated alerts to the same collaboration space. For instance, a space that handles both order-related alerts and hardware or network-related alerts will become cluttered during processing, dispatching, and analysis, making it difficult for teams to accurately identify and prioritize issues, thus reducing productivity.

### Start Creating
Log in to the console to create a collaboration space. Path: **Incident Management => Collaboration Space => Create Collaboration Space**.

- **Space Name:** It is recommended to name and plan the space based on departments, teams, or business types to more intuitively understand its purpose.
- **Description Information:** It is recommended to briefly outline the business the space handles and the types of alerts it receives.
- **Management Team:** When creating the space, you can set the management team. **Team members have full operational permissions for the space**, while non-creators have read-only access to the space's configuration.
- **Automatic Closure After Timeout:** If an incident remains open for more than N minutes, **the system will automatically close it** (this applies to all new incidents in the space). Incidents closed due to timeout **will also receive a corresponding closure notification** (the notification channel depends on the [dispatch strategy](/conf/escalate_rule) configuration).
- If you have not planned how to dispatch incidents in the space, you can **skip setting the dispatch strategy**. You can configure the dispatch strategy after creation.
- The integration type connected during creation **is an exclusive integration** and only applies to this space. You can also ignore this and configure it after creation.

## Managing Collaboration Spaces
### Space Overview
- Account members can see all collaboration spaces but can only operate the ones they are responsible for.
- Hover over a collaboration space and click the star to **favorite or unfavorite** it.
- By default, you see all collaboration spaces. You can **view the collaboration spaces related to "me" through "My Management" and "My Favorites"**.
- When there are many collaboration spaces and the ones you are interested in are ranked lower, you can **use the sorting function in the upper right corner to move the spaces you are interested in to the top**.
- Sorting can be freely arranged and **only affects the current user, not others**.

### Changing Information
- Space name, description, automatic shutdown on timeout, and management team support can be modified in Space Details -> Basic Settings.
- When a collaboration space is disabled, it no longer receives alerts, but you can still operate the incidents and related configurations in the space.
- Deleting a space will not delete the incident data connected to it, but the space cannot be recovered after deletion. Please proceed with caution.

### Incident List
- Displays all incidents connected to the space. By default, only unclosed incidents are displayed. You can filter by **processing progress**.
- The filter conditions can be based on incident status, handler, time, title, and other criteria.
- Select multiple **incidents in the same status** to perform batch operations such as closing or claiming.
- **Merging** means combining multiple incidents into one for processing, and supports merging incidents across collaboration spaces.
- **For more details, please refer to [Searching and Viewing Incidents](/alter/view_incidents)**.

### Integrated Data
- Integrations created under a collaboration space are **exclusive integrations, meaning they only apply to this space**.
- After each type of integration is created, a corresponding webhook address will be generated. **Different types of integrations are incompatible with each other**.
- Exclusion rules discard events that meet certain conditions and can be configured based on integration type, severity, and other criteria.
- When there are multiple exclusion rules, they are matched in order of priority from high to low. Matching stops as soon as a rule is matched, even if other rules remain unmatched.
- Excluded events **will not be displayed anywhere by the system** and are imperceptible. If you are not receiving alerts, check if any exclusion rules are configured.

### Dispatch Strategy
- You can manage incident notification rules, notification channels, and escalation rules.
- Incident notifications will be matched sequentially according to the order of each policy. Matching stops as soon as a policy is matched.
- When there are multiple policies, you can freely drag and adjust the order of dispatch strategies. Ensure the notification rules meet business needs before adjusting.
- For more information on **dispatch strategies**, please refer to the [Dispatch Strategies](/conf/escalate_rule) section.

### Noise Reduction Configuration
- Aggregation noise reduction combines similar or related alerts into a single incident.
- Aggregation can be configured based on alert title, alert level, and label dimensions.
- Incident convergence can automatically block notifications for the same incident within a certain period.
- For more information on **noise reduction configuration**, please refer to the [Noise Reduction Configuration](/conf/noise_reduction) section.