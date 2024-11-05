---
brief: Flashduty’s dispatch strategies, silencing, suppression, routing, and label enhancement features heavily use conditional matching to filter specific alerts or incidents. This article introduces how to configure these conditions
---

# Configure Filter Conditions

Filter conditions in Flashduty are used to match different alerts, incidents, or events. Through filter conditions, we can filter and operate on specific objects. This article introduces you to the design and configuration methods of filter conditions.

## Where to Use Filter Conditions?

Filter conditions apply to the following scenarios:

1. **Dispatch Strategies**: The same collaboration space allows the creation of multiple dispatch strategies, and each dispatch strategy can set different filter conditions. You can set different dispatch objects for different incidents.
2. **Silencing Rules**: Set filter conditions to match specific incidents. Incidents that meet the conditions will be silenced.
3. **Suppression Rules**: Set filter conditions to match newly triggered incidents and existing active incidents. When a new incident meets the conditions, it will be suppressed.
4. **Alert Aggregation**: Alert aggregation supports default aggregation dimensions, but when you need fine-grained control, you need to set filter conditions to match specific alerts and set new aggregation dimensions for these incidents.
5. **Routing Rules**: When using the integration center's alert integration, you can set global routing matching rules. Use different filter conditions to match different alerts and route them to specific collaboration spaces.
6. **Label Enhancement**: Set filter conditions to match specific alerts. Alerts that meet the conditions will generate tags according to the rules.

## How to Configure Filter Conditions?

### Design of Rules

Flashduty abstracts the entire filtering condition to minimize configuration and meet the needs of most scenarios.

The overall judgment logic is divided into multiple sets of conditions:
- Conditions within a group have an **`and`** relationship, meaning all conditions within the group must match for the entire group to match.
- Groups have an **`or`** relationship, meaning if any group of conditions matches, the entire set of conditions is a match.

Each condition is divided into fields, operators and target values. Among them, there are only two situations for operators:
- **Matching** : The target can have multiple value if any value satisfies the condition, then the condition matches.
- **Unmatched** : The target can have multiple value if all value do not meet the condition, then the condition matches.

> [!NOTE]
> The target values in the conditions are all strings and support multiple matching methods such as **exact**, **regular**, **wildcard**, **IP segment**, and **numerical size**.

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/how_to_filter/1.avif" style="display: block; margin: 0 auto;" height="300">

As shown in the figure above, we have two sets of conditions, each set containing two conditions, and each condition has multiple matching values. If the severity is "Critical" or "Warning" and the check label is equal to "Binlog synchronization delay," the overall condition is met. Otherwise, if the check tag contains any of the words "cpu," "io," or "disk," and the value of the value tag is greater than 90, the overall condition is also met. We can also use an expression to describe the filter conditions intuitively:

```i18n
( severity == Critical|Warning && labels.check == BinlogSync delay)
or
( labels.check == /cpu/|/io/|/disk/ && labels.value == num:gt:90 )
```

### Filter by Regular Expression

When the value string is prefixed and suffixed with `/`, the entire value will be recognized as a __regular expression__. At this time, the target value must meet this regular expression to be considered a match.

Examples are as follows:
- labels.check: /Downtime/, when the check label contains "Downtime", it matches.

> [!NOTE]
> Flashduty uses the `RE2` regular expression specification across all platforms, and some `Perl` syntax may not match. You can use an AI Chatbot to generate an expression and go to [RE2 Playground](https://re2js.leopard.in.ua/) to verify it.

### Filter by Wildcard

When the value string contains `*` or `?` without the `/` prefix and suffix, the entire value will be recognized as a __wildcard__. Note that currently only `*` and `?` are supported, where `*` can match zero or more any characters, and `?` can match a single any character. The target value must meet this wildcard string to be considered a match.

Examples are as follows:
- labels.check : Downtime * , the check tag is prefixed with "Downtime", that is, matching.

> [!NOTE]
> You can use `*` to determine if a field __exists (Exist)__ or __does not exist (NotExist)__.
>
> If a field __matches *__, it means you need the field to exist. If a field __does not match *__, it means you need the field to not exist.

### Filter by IP Range

When the value is prefixed with `cidr`, the entire value will be recognized as an __IP segment__.

Examples are as follows:
- labels.host: cidr:10.0.0.206/24, the ip label is within the IP segment "10.0.0.206/24", that is, it matches.

### Filter by Numerical Value

When the value starts with `num:[gt|ge|lt|le]:` as a prefix, the entire value will be recognized as __numeric size matching__. The size comparison rules are as follows:
- **ge**: Greater than or equal to
- **lt**: Less than
- **le**: Less than or equal to
- **le**: Less than or equal to

Examples are as follows:
- Filter by Exact Value

### Filter by exact value

When the value does not match any of the above formats, it is considered an __exact match__. In this case, the match is only successful when the strings are exactly equal.

## Faq

|+| Why doesn't the system prompt me with optional tags?

    Flashduty receives a large amount of data. To ensure system stability, the system only searches for and deduplicates tags from the most recent 500 alert events within the past 24 hours. Therefore, the range of extracted tags may change dynamically, and no tags may be extracted if there is no new data in the past 24 hours.

    In this case, **you can manually enter the tag**.

|+| My regular expression has passed offline validation, why can't it match in the system?

    Flashduty uses the `RE2` regular expression specification across all platforms, and some `Perl` syntax may not be supported. You can use an AI chatbot to generate the expression and verify it in the RE2 Playground.