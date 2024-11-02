---
brief: Flashduty’s dispatch strategies, silencing, suppression, routing, label enhancement, and other functions heavily rely on conditional matching to filter specific alerts or incidents. This article introduces how to configure these conditions
---

# Configure Filter Conditions

Filter conditions in Flashduty are used to match different alerts, incidents, or events. By using filter conditions, we can selectively filter and operate on specific objects. This article introduces you to the design and configuration methods for filter conditions.

## Where to Use Filters?

Filter conditions apply to the following scenarios:

1. **Dispatch Strategy**: The same collaboration space allows the creation of multiple dispatch strategies, and each strategy can set different filter conditions. You can set different dispatch targets for different incidents.
2. **Silencing Rules**: Set filter conditions to match specific incidents. Incidents that meet the conditions will be silenced.
3. **Suppression Rules**: Set filter conditions to match newly triggered incidents and existing active incidents. When a new incident meets the conditions, it will be suppressed.
4. **Alert Aggregation**: Alert aggregation supports default aggregation dimensions, but when you need fine-grained control, you need to set filter conditions to match specific alerts and set new aggregation dimensions for these incidents.
5. **Routing Rules**: When using the integration center's alert integration, you can set global routing matching rules. Use different filter conditions to match different alerts and route them to specific collaboration spaces.
6. **Label Enhancement**: Set filter conditions to match specific alerts. Alerts that meet the conditions will generate tags according to the rules.

## How to Configure Filter Conditions?

### Design of Rules

Flashduty abstracts the entire filtering condition to minimize configuration while meeting the needs of most scenarios.

The overall judgment logic is divided into multiple sets of conditions:
- Conditions within a set have an **`and`** relationship, meaning all conditions in the set must match for the entire set to match.
- Sets have an **`or`** relationship, meaning if any set of conditions matches, the overall condition is met.

Each condition is divided into fields, operators and target values. Among them, there are only two situations for operators:
- **Matching** : The target can have multiple value if any value satisfies the condition, then the condition matches.
- **Unmatched** : The target can have multiple value if all value do not meet the condition, then the condition matches.

> [!NOTE]
> The target values in the conditions are all strings and support multiple matching methods such as **exact**, **regular expression**, **wildcard**, **IP segment**, and **numerical size**.

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/how_to_filter/1.avif" style="display: block; margin: 0 auto;" height="300">

As shown in the figure above, we have two sets of conditions, each with two conditions, and each condition has multiple matching values. If the severity is "Critical" or "Warning" and the check label is equal to "Binlog synchronization delay," the overall condition is met. Otherwise, if the check label contains any of the words "cpu," "io," or "disk," and the value of the value label is greater than 90, the overall condition is also met. We can also use an expression to describe the filter conditions intuitively:

```i18n
( severity == Critical|Warning && labels.check == Binlog1	Synchronization delay)
or
( labels.check == /cpu/|/io/|/disk/ && labels.value == num:gt:90 )
```

### Filter by Regular Expression

When the value string is prefixed and suffixed with `/` , the entire value will be recognized as __ regular __ . At this time, the target value must meet this regular rule to be considered a match.

Examples are as follows:
- labels.check: /Downtime/, when the check label contains "Downtime," it matches.

> [!NOTE]
> Flashduty uses the `RE2` regular expression specification across all platforms, and some `Perl` syntax may not match. You can use an AI Chatbot to generate an expression and verify it at [RE2 Playground](https://re2js.leopard.in.ua/).

### Filter by Wildcard

When the value string contains `*` or `?` without the `/` prefix and suffix, the entire value will be recognized as a __ wildcard __ . Note that currently only `*` and `?` are supported, `*` can match zero or more any characters, and `?` can match a single any Character. The target value must meet this wildcard string to be considered a match.

Examples are as follows:
- labels.check: Downtime*, when the check label starts with "Downtime," it matches.

> [!NOTE]
> You can use `*` to determine if a field __ exists ( Exist ) **or __ does not exist ( NotExsit )** .
>
> If a field __ matches * **, you need that field to exist. If a field __ does not match *** , it means the field you require does not exist.

### Filter by IP Range

When value is prefixed with `cidr` , the entire value will be recognized as __IP segment __ .

Examples are as follows:
- labels.host: cidr:10.0.0.206/24, when the IP label is within the IP segment "10.0.0.206/24," it matches.

### Filter by Numerical Value

When value ends with ` num: [ gt|ge|lt|le ] : `As a prefix, the entire value will be recognized __ numeric size matching __ . The size judgment rules are as follows:
- **ge**: Greater than or equal to
- **lt**: Less than
- **le**: Less than or equal to
- **le** : Less than or equal to

Examples are as follows:
- Filter by Exact Value

### Filter by Exact Value

When value does not meet any of the above formats, it is regarded as an __ match __ . At this time, only when the strings are completely equal, the match is passed.

## Frequently Asked Questions

|+| Why am I not prompted for optional tags?

    Flashduty accepts a large amount of data reporting. In order to ensure the stability of the system, the system only searches up to 500 alert events in the past 24 hours to deduplicate labels. Therefore, the range of extracted tags may change dynamically, and no tags may even be extracted when there is no new data in the past 24 hours.

    In this case, **you can enter the tag manually** .

|+| My regular expression has passed offline verification, why can't it be matched in the system?

    Flashduty All platforms use `RE2` regular specifications, and some `Perl` syntax may not match. You can use AI Chatbot to generate an expression and go to RE2 Playground to verify it.