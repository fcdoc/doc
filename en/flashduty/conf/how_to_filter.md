---
brief: Flashduty's dispatch strategy, silence, suppression, routing, and label enhancement features extensively utilize conditional matching to filter specific alerts or incidents. This article explains how to configure these conditions
---

# Configure Filter Conditions

Filter conditions in Flashduty are used to match various alerts, incidents, or events. By applying these conditions, we can selectively target and manipulate specific items. This article will guide you through the design and configuration of filter conditions.

## Where to Use Filter Conditions?

Filter conditions are applied in the following scenarios:

1. **Distribution Strategy**: Multiple dispatch strategies can be created within the same collaboration space, each with its own set of filter conditions. You can assign different dispatch targets for various incidents.
2. **Silence Rules**: Set filter conditions to match specific incidents; those that meet the criteria will be silenced.
3. **Suppression Rules**: Establish filter conditions to match both newly triggered incidents and existing active incidents. New incidents that meet the conditions will be suppressed.
4. **Alert Aggregation**: Alert aggregation supports default dimensions, but for more granular control, you need to set filter conditions to match specific alerts and define new aggregation dimensions for these incidents.
5. **Routing Rules**: When using the alert integration of the integration center, global routing matching rules can be set. Different filter conditions are used to match different alerts and route them to specific collaboration spaces.
6. **Tag Enhancement**: Set filter conditions to match specific alerts; those that meet the criteria will have tags generated according to the rules.

## How to Configure Filter Conditions?

### Design of Rules

Flashduty abstracts the entire filtering conditions to achieve minimal configuration while meeting the needs of most scenarios.

The overall judgment logic is divided into multiple sets of conditions:
- Conditions within a group are in an **`AND`** relationship, meaning that all conditions must be met for the group to be considered a match.
- Groups of conditions are in an **`OR`** relationship, meaning that if any group matches, the entire set is considered a match.

Each condition is divided into fields, operators and target values. Among them, there are only two situations for operators:
- **Matching** : The target can have multiple value if any value satisfies the condition, then the condition matches.
- **Unmatched** : The target can have multiple value if all value do not meet the condition, then the condition matches.

> [!NOTE]
> Condition target values are all strings and support various matching methods, including **Exact**, **Regular**, **Wildcard**, **IP Range**, and **Numerical Size**.

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/how_to_filter/1.avif" style="display: block; margin: 0 auto;" height="300">

As shown in the diagram above, there are two sets of conditions, each with two conditions and multiple matching values. If the severity is "Critical" or "Warning" and the check label equals "Binlog Synchronization Delay", the overall condition is met. Otherwise, if the check label contains "cpu", "io", or "disk" and the value label's numerical value is greater than 90, the overall condition is also met. The filter conditions can also be described intuitively using an expression:

```
( severity == Critical|Warning && labels.check == Binlog同步延迟 )
or
( labels.check == /cpu/|/io/|/disk/ && labels.value == num:gt:90 )
```

### Filter by Regular Expression

When the value string is both prefixed and suffixed with `/`, the entire value is recognized as a __regular expression__. At this point, the target value must conform to this regular expression to be deemed a match.

For example:
- labels.check:/Downtime/, which matches when the check label contains "Downtime".

> [!NOTE]
> Flashduty uses the `RE2` regular expression specification across all platforms, and some `Perl` syntax may not be compatible. You can use an AI Chatbot to generate expressions and verify them at [RE2 Playground](https://re2js.leopard.in.ua/).

### Filter by Wildcard

When the value string contains `*` or `?` but lacks the `/` prefix and suffix, the entire value is recognized as a __wildcard__. Note that currently, only `*` and `?` are supported; `*` can match zero or more any characters, and `?` can match a single any character. The target value must match this wildcard string to be considered a match.

For example:
- labels.check: Downtime*, which matches when the check label starts with "Downtime".

> [!NOTE]
> You can use `*` to determine whether a field __exists (Exists)__ or __does not exist (DoesNotExist)__.
>
> If a field is said to __match__, it indicates that you require the field to be present. If a field is said to __not match__, it signifies that you require the field to be absent.

### Filter by IP Range

When the value is prefixed with `cidr`, the entire value is recognized as a __CIDR block__.

For example:
- labels.host: cidr:10.0.0.206/24, which matches if the IP label is within the "10.0.0.206/24" IP range.

### Filter by Numerical Value

When the value is prefixed with `num: [gt|ge|lt|le ] : `As a prefix, the entire value will be recognized __ numeric size matching __ . The size judgment rules are as follows:
- **ge**: Greater than or equal to
- **lt**: Less than
- **le**: Less than or equal to
- **le**: Less than or equal to

For example:
- Filter by Exact Value

### Filtering by Exact Value

When the value does not conform to any of the above formats, it is considered an __exact match__. In this case, only a complete string match is considered a successful match.

## FAQs

|+| Why isn't the system prompting me with optional tags?

    Flashduty handles a large volume of data reports. To ensure system stability, the system only searches for up to 500 alert events within the past 24 hours to perform deduplication of labels. Consequently, the range of extracted tags may change dynamically, and no tags may be extracted if there is no new data within the past 24 hours.

    In this scenario, **you can enter tags manually**.

|+| My regular expression was validated offline, so why isn't it matching in the system?

    Flashduty's entire platform adheres to the `RE2` regular expression specification, and some `Perl` syntax may not be compatible. You can use the AI Chatbot to generate expressions and visit the RE2 Playground for verification.