---
brief: Configure routing rules to route alert events of the same type or related businesses to the appropriate collaboration spaces for categorized information processing and analysis
---

# Configure Routing Rules

When integrating alert events via shared access, routing rules can be set to distribute alert events of the same type or related businesses to the corresponding collaboration spaces for categorized processing and analysis.

## How to Configure
Configuration path: **Integration Center => Alert Events => Specific Integration Type => Create Route**

**1. Add Route:** Multiple routes can be added without a current limit, but it's advisable to keep them concise to maintain readability.
**2. Adjust Order:** With two or more routing rules, you can adjust the activation order using the up and down arrows.
**3. Routing rules:** Supports multiple conditions and rules for logical operations (matching or non-matching operations can be distinguished at the same time). Multiple matching modes are pointed out when matching conditions, such as exact matching, wildcards, regular expressions, etc. You can go to [Configure filters](/conf/how_to_filter) to learn how to configure restrictions.
**4. Process Control:** In the presence of two or more routing rules, the option to **terminate or proceed** with the matching of subsequent rules is available. By default, the system **continues matching**, ensuring that subsequent routes remain active. Conversely, selecting **termination** will deactivate any subsequent rules.
**5. Preview Rules:** After configuring the rules, you can view the configuration expressions.
**6. Insert Route:** When there are two or more routing rules, you can insert a new route before or after an existing one, saving the need to reorder.
**7. Default Routing:** Shared integration requires at least one routing rule to receive alert events; therefore, a default routing rule is provided. If no routing rules are configured or the configured rules do not match, the alert events will be routed to the corresponding collaboration spaces via the default route.
**8. Delivery Spaces:** You can select multiple collaboration spaces to deliver matching alert events to.

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/alert_routings/1.avif"  width="800">

## Configuration Example

### 1. Distribute the Same Business Group to the Same Space
**Scenario:** Integrate alert events from the same business group in the FlashCat monitoring platform into a unified collaboration space.
**Rule:** Match based on the Labels.group_name tag.

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/alert_routings/2.avif"  width="800">

## FAQs

|+| Routing rules not taking effect?

    Please verify whether the alert events match the rules and whether the rule configurations are correct.

|+| What happens when multiple routing rules are identical and delivered to the same collaboration space?

    An incident will be generated for each collaboration space. It is recommended to choose multiple collaboration spaces within the same rule for better coordination.

|+| Are you not receiving alerts after configuring routing rules?

    Please ensure that the reported alert events correspond to the configured routing rules. It is advisable to set up a default catch-all route to receive any alert events that do not match the existing rules.

|+| Does the default route get matched when the routing rule's flow control is set to Stop?

    It will match. The default route serves as a fallback and is not restricted by flow control settings.