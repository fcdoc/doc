---
brief: Alert events can be pushed to Flashcat through the PagerDuty protocol, enabling automated noise reduction processing of alert events
---

# PagerDuty Integration

Synchronization via Webhook

Flashduty implements the PagerDuty Events API, ensuring full compatibility in inputs and responses. Therefore, you can push alert events to Flashduty using the PagerDuty protocol to enable automated noise reduction processing of alert events.

Similarly, for alert systems that already support pushing events to PagerDuty (such as ElastAlert), you only need to modify the destination push address to push events to Flashduty using the PagerDuty protocol.

## In Flashduty
You can obtain an integration push address through the following two methods; either one will suffice.

### Use Proprietary Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select **PagerDuty** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **push address**, copy it for later use, and you are done.

### Use Shared Integration

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and go to the integration selection page.
    2. Choose **PagerDuty** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust it as needed.
    5. Complete.

## In PagerDuty
### Request Address

```
{api_host}/event/push/alert/pagerduty
```

This address supports both PagerDuty V1 and V2 Events API. **You must modify the PagerDuty address to this address.**

### Pagerduty V2 Events

#### Reference Documentation:

[PagerDuty V2 Events](https://developer.pagerduty.com/api-reference/368ae3d938c9e-send-an-event-to-pager-duty)

#### Authentication Method:

Choose one of the following two methods:

- Method 1: Include parameters in QueryString integration_key
- Method 2: Pass integration_key as the routing_key parameter into Payload

### Pagerduty V1 Events

#### Reference Documentation:

[PagerDuty V1 Events](https://developer.pagerduty.com/api-reference/f0037990796c8-send-an-event-to-pager-duty)

#### Authentication Method:

Choose one of the following two methods:

- Method 1: Include parameters in QueryString integration_key
- Method 2: Pass integration_key as the service_key parameter into Payload

### Configuration Example

Taking [ElastAlert2](https://github.com/jertel/elastalert2) as an example:

1. Step 1: Obtain the Push Address

Fill in the integration name on the current page and save it. Reopen the integration details and copy the push address, such as:

```
{api_host}/event/push/alert/pagerduty?integration_key=xxx
```

2. Step 2: Modify the Push Address

Modify the source code of the deployed ElastAlert instance, [view diff](https://github.com/jertel/elastalert2/commit/e815a62a6b1eecef6e1fef13afd99d905b67fc34):

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/pagerduty/1.avif" />

3. Step 3: Report the Alert Event

Follow the [ElastAlert PagerDuty Push Configuration Document](https://elastalert2.readthedocs.io/en/latest/ruletypes.html#pagerduty) steps to configure the alert:

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

4. Step 4: Restart ElastAlert and wait for the alert to trigger