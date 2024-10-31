---
brief: Alert events can be pushed to the Kuaimao Nebula via the PagerDuty protocol, enabling automated noise reduction for alert events
---

# PagerDuty Integration

Synchronization via webhook

Flashduty has implemented the PagerDuty Events API, ensuring full compatibility with inputs and responses. Thus, you can push alert events to Flashduty using the PagerDuty protocol to automate noise reduction processing.

likewise, for alert systems that already support event forwarding to PagerDuty (such as ElastAlert), simply modify the destination push address to forward events to Flashduty using the PagerDuty protocol.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When there is no need to route alert events to different collaboration spaces, this method is preferable as it is more straightforward.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **PagerDuty** integration and click **Save** to generate a card.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When routing alert events to different collaboration spaces based on the payload information of the alert events is required, this method should be prioritized.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and proceed to the integration selection page.
    2. Select the **PagerDuty** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, to be adjusted as needed later.
    5. Completed.

## In PagerDuty
### Request Address

```
{api_host}/event/push/alert/pagerduty
```

This address supports both the PagerDuty V1 and V2 Events API. **You must update the PagerDuty address to this one.**

### Pagerduty V2 Events

#### Reference Documentation:

[PagerDuty V2 Events](https://developer.pagerduty.com/api-reference/368ae3d938c9e-send-an-event-to-pager-duty)

#### Authentication Method:

Select either of the two methods:

- Method 1: Include parameters in QueryString integration_key
- Method 2: Pass integration_key as the routing_key parameter into Payload

### Pagerduty V1 Events

#### Reference Documentation:

[PagerDuty V1 Events](https://developer.pagerduty.com/api-reference/f0037990796c8-send-an-event-to-pager-duty)

#### Authentication Method:

Select either of the two methods:

- Method 1: Include parameters in QueryString integration_key
- Method 2: Pass integration_key as the service_key parameter into Payload

### Configuration Example

Take [ElastAlert2](https://github.com/jertel/elastalert2) as an example:

1. Step 1: Obtain the push address

Enter the integration name on the current page and save it. Then, reopen the integration details and copy the push address, for example:

```
{api_host}/event/push/alert/pagerduty?integration_key=xxx
```

2. Step 2: Modify the push address

Revise the source code for the deployed ElastAlert instance, [view the diff](https://github.com/jertel/elastalert2/commit/e815a62a6b1eecef6e1fef13afd99d905b67fc34)

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/pagerduty/1.avif" />

3. Step 3: Report the alert event

Follow the steps outlined in the [ElastAlert PagerDuty Push Configuration Document](https://elastalert2.readthedocs.io/en/latest/ruletypes.html#pagerduty) to configure the alert:

```
name: "b"
type: "frequency"
index: "pgy_audit*"
is_enabled: true
num_events: 1
realert:
minutes: 1
terms_size: 50
scan_entire_timeframe: true
timeframe:
minutes: 60
timestamp_field: "created_at"
timestamp_type: "unix_ms"
use_strftime_index: false
alert_subject: "Test {0} 123 aa☃ {1}"
alert_subject_args:
- "account_id"
- "operation"
alert_text: "Test {0}  123 bb☃ {1}"
alert_text_args:
- "request_id"
- "operation_name"
filter:
- query:
query_string:
query: "created_at:*"

# ------- FlashDuty ----------------
alert: pagerduty
pagerduty_service_key: xxx
pagerduty_client_name: wahaha
pagerduty_api_version: v2
pagerduty_v2_payload_class: ping failure
pagerduty_v2_payload_component: mysql
pagerduty_v2_payload_group: app-stack
pagerduty_v2_payload_severity: error
pagerduty_v2_payload_source: mysql.host.name
# ------- FlashDuty ----------------
```

4. Step 4: Restart ElastAlert and await the triggering of the alert