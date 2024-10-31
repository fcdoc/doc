---
brief: By modifying push parameters, you can customize the severity level and title of the incident
---

# Customize the title and severity of the incident

By adjusting push parameters, you can tailor the severity and title, among other details, of the incident.

## Customize severity levels

**Incorporate the Query parameter 'severity' into the push URL to override the incident's severity level.**

> [!NOTE]
> Compatible with all integrations reporting alerts via webhooks.

Some alert integrations (such as AWS CloudWatch) do not support severity differentiation. In this case, we can specify it in the integration push address. Different alert policies are configured with different push addresses to differentiate the severity of the alert.

Example: The following URL includes the 'severity' parameter set to 'Info' ( **note the capitalization of the first letter** ). Alerts pushed through this URL will have their severity level overridden to 'Info'.
```
https://api.flashcat.cloud/event/push/alert/aws/cloudwatch?integration_key=your-integration-key?severity=Info
```

## Customize the incident title

> [!NOTE]
> Compatible with all integrations reporting alerts via webhooks.

**Introduce the Query parameter 'title_rule' in the push URL to dynamically generate the incident title.**

### Generated using simplified syntax

Use '::' to separate substrings, where each substring can be a fixed string or a variable prefixed with '$'. The variable content will be extracted from the tags; if extraction fails, no variable substitution will occur.

Example:

| rule | tag value | generated content |
| --- | ---| ---- |
|\$resource::\$check | {"resource": "127.0.0.1", "check": "cpu idle low"} | 127.0.0.1 / cpu idle low |
|\$resource::\$check | {"resource": "127.0.0.1"} | 127.0.0.1 / \$check |
|$resource:: Host Down | {"resource": "127.0.0.1"} | 127.0.0.1 / Host Down |

### Referencing tags to generate content using ${var}

Use '[TPL]' as the prefix and '${}' to reference variables. The variable content will be extracted from the tags; if extraction fails, use '<no value\>' as a substitute.

Example:

| rule | tag value | generated content |
| --- | ---| ---- |
|[TPL]\${resource} / \${check}| {"resource": "127.0.0.1", "check": "cpu idle low"} | 127.0.0.1 / cpu idle low |
|[TPL]\${resource} / \${check} | {"resource": "127.0.0.1"} | 127.0.0.1 / \<no value\> |
|[TPL]${resource} / Host Down | {"resource": "127.0.0.1"} | 127.0.0.1 / Host Down |

### Generated using Golang template syntax

Use [TPL] as a prefix and {{}} to reference variables (including labels and other variables). If a variable cannot be extracted, use <no value\> as a substitute. Refer to the [Alert Event Definition](#AlertEvent) for the scope of variables.

Example:

| rule | tag value | generated content |
| --- | ---| ---- |
|[TPL]{{.Labels.resource}} / {{.Labels.check}}| {"resource": "127.0.0.1", "check": "cpu idle low"} | 127.0.0.1 / cpu idle low |
|[TPL]{{.Labels.resource}} / {{.Labels.check}} | {"resource": "127.0.0.1"} | 127.0.0.1 / \<no value\> |
|[TPL]{{.Labels.resource}} / Host Down | {"resource": "127.0.0.1"} | 127.0.0.1 / Host Down |

## FAQs

|+| Utilize tags to dynamically generate titles; what should be done if the tags are absent?

    Depending on the variable retrieval method used, the title may retain the original variable information or use '<no value\>' as a substitute.

    Even if variables are not retrieved, the alert generation process will not be affected, allowing for confident debugging.