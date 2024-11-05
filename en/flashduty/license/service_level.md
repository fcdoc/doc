---
brief: Learn about Flashcat Technology Co., Ltd.'s Flashduty SLA Commitments
---

# Flashduty Service Level Aggrement

Last updated: 2024-04-28

This Service Level Agreement (hereinafter referred to as "SLA") sets forth the service availability level indicators and compensation plan for the Flashduty service provided by Flashcat to you.

Special Note: Unless otherwise agreed, this Agreement does not apply to the public beta, invited beta, free features and versions of Flashduty, nor does it apply to the privatized version of Flashduty.

## How We Ensure SLA

1. **Multi-active in the Same City**: The infrastructure is built on multiple data centers, and stateful components are multi-active within the same city
2. **Asynchronous Processing**: After an alert is reported, it immediately enters an asynchronous process. Errors are retried to reduce the risk of alert loss
3. **Redundant Alerts**: For important alerts, a redundant notification mechanism is provided. You can choose multiple channels for cyclic notifications to ensure that notifications are delivered
4. **Global acceleration** : Global acceleration has been enabled for the api.flashcat.cloud domain name to ensure the stability of reported links in various places;
5. **Continuous Monitoring**: Comprehensive collection of system metrics, regular stress testing, and timely or preemptive discovery of system issues.

## Our SLA Commitments

- **Functionality Availability (Error Rate)**: Core functionalities are available 99.9% of the time
- **Delivery Timeliness (Delay Rate)**: 99.9% of alerts are delivered within 5 minutes of being triggered

### Calculation Method

**Each 5-minute Cycle**: If the error rate or delay rate in any 5-minute cycle reaches 0.1%, it is considered that the cycle did not meet the availability commitment

Specific Definitions:

- **Service Cycle**: A complete service cycle is 30 days (not a calendar month).
- **Total Minutes in Service Cycle**: Total days in the service cycle * 24 (hours) * 60 (minutes).
- **Monthly Service Fee**: The total service fee you pay for Flashduty services under a specific Flashcat account in one cycle. If you pay for multiple months of service at one time, the monthly service fee will be amortized according to the number of months purchased or usage.
- **Failed Requests**: Failed requests include the following scenarios:
- Requests to the Flashduty API that return status codes 500/502 due to Flashduty system issues.
- Requests that fail to reach the Flashduty API server due to a Flashduty incident. When the Flashduty service incident fails to obtain the number of failed requests, the average number of calls to the Flashduty API service per minute in the previous 7 natural days will be calculated and multiplied by the incident duration to determine the number of failed requests in this case.
- **Valid Total Requests**: All requests received by the Flashduty API server are considered valid total requests.
- **Failed Notifications**: Failed notifications include the following scenarios:
- Incident notifications not delivered due to Flashduty system issues
- Incident notifications delayed due to Flashduty system issues, with the delay exceeding 5 minutes.
- **Valid Total Notifications**: All incidents triggered by Flashduty are considered valid total notifications.
- **Error Rate**: Number of failed requests every 5 minutes / Total number of valid requests every 5 minutes × 100%
- **Delay Rate**: Number of failed notifications every 5 minutes / Total number of valid notifications every 5 minutes × 100%

### Exclusions

The duration of service unavailability caused by the following reasons will not be counted as service unavailability time:

- System maintenance carried out by Flashcat after notifying you in advance, including cutover, repair, upgrade, and simulated incident drills
- Any network or device incident or configuration adjustment outside of Flashcat's equipment
- Hacker attacks on your applications or data information
- Improper maintenance or confidentiality leading to the loss or leakage of data, passwords, etc
- Negligence or operations authorized by you
- Failure to follow Flashcat product usage documentation or usage recommendations
- Delayed push due to operator or terminal signal issues
- Force majeure.

## How to Apply for Compensation

### Compensation Standards

Based on the service availability of Flashduty under one of your Flashcat accounts, the compensation amount is calculated according to the standards in the table below. The compensation method is limited to gift money used to purchase Flashduty products, and the total compensation does not exceed the monthly payment you made in the month when the service availability commitment was not met (excluding fees deducted with gift money).

```
赔偿赠送金金额 = 未达到SLA的分钟数 * 月度服务费用每分钟金额 * 10
```

### Application Time Limit

You may file a claim for compensation after the fifth (5th) working day of each calendar month for Flashduty's failure to meet its service availability commitments in the previous month.

Claims for compensation must be made no later than two (2) months after the end of the relevant month in which Flashduty failed to meet its service availability commitments.

## Other Instructions

Flashcat has the right to modify the terms of this SLA.

If there are any modifications to the terms of this SLA, Flashcat will notify you 30 days in advance by posting on the website or sending an email. If you do not agree with Flashcat's modifications to the SLA, you have the right to stop using Flashduty. If you continue to use Flashduty, you will be deemed to have accepted the modified SLA.