---
brief: Configure routing rules to distribute alert events of the same type or related business to the corresponding collaboration space for information classification, processing, and analysis
---

# Configure Routing Rules

When integrating alert events through shared integration, you can configure routing rules to distribute alert events of the same type or related business to the corresponding collaboration space for information classification, processing, and analysis.

## How to Configure
Configuration path: **Integration Center => Alert Events => Specific Integration Type => Create Route**

**1. Add Routes:** You can add multiple routes. There is currently no limit, but it is recommended to keep them simple. Too many rules can reduce readability.
**2. Adjust Order:** When there are two or more routing rules, you can use the up and down arrows to adjust the order in which the rules take effect.
**3. Routing Rules:** Supports multiple conditions and rules for logical operations (both matching and non-matching operations). Multiple matching modes are available when conditions match, such as exact match, wildcards, regular expressions, etc. You can visit [Configure Filter Conditions](/conf/how_to_filter) to learn how to configure restrictions.
**4. Process Control:** When there are two or more routing rules, you can choose to **Stop or Continue** matching the next rule. The default is **Continue Matching**, which means the following routes will continue to take effect. If you choose **Stop**, the following rules will not take effect.
**5. Preview Rules:** After configuring the rules, you can view the configuration expression.
**6. Insert Routes:** When there are two or more routing rules, you can insert new routes before or after a specific route, eliminating the need to adjust the order.
**7. Default Route:** Shared integration must have at least one routing rule to receive alert events, so a default routing rule is provided. When no routing rule is configured or the configured routing rule does not match, the default route will distribute the alert to the corresponding collaboration space.
**8. Delivery Space:** You can choose to deliver matching alerts to multiple collaboration spaces.

<img src="https://fc.3ti.site/zh/flashduty/conf/alert_routings/1.avif"  width="800">

## Configuration Examples

### 1. Same Business Group Distributed to the Same Space
**Scenario:** Distribute alerts from the same business group in the FlashCat monitoring platform to a unified collaboration space.
**Rules:** Match based on Labels.group_name tag.

<img src="https://fc.3ti.site/zh/flashduty/conf/alert_routings/2.avif"  width="800">

## Frequently Asked Questions

|+| Routing rules not taking effect?

    Please check if the alert event matches the rule and if the rule configuration is correct.

|+| When multiple routing rules are the same and deliver to the same collaboration space, how will it be handled?

    A corresponding incident will be generated for each collaboration space. It is recommended to select multiple collaboration spaces in the same rule.

|+| No alerts received after configuring routing rules?

    Please confirm if the reported alert events can match the configured routing rules. It is recommended to configure a default fallback route to receive unmatched alert events.

|+| Will the default route be matched when "Stop" is selected for routing rule flow control?

    Yes, it will match. The default route is a fallback route and is not subject to process control restrictions.