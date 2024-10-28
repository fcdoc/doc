---
brief: Synchronize Tencent Cloud Monitoring CM alarm events to Kuaimao Xingyun via webhook to automate noise reduction processing of the alarm events
---

# Tencent Cloud Monitoring CM Integration

Synchronize Tencent Cloud Monitoring CM alarm events to Flashduty via webhook to automate noise reduction processing of the alarm events.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Tencent Cloud Monitoring CM** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Tencent Cloud Monitoring CM** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

## In Tencent Cloud Monitoring CM

1. Log in to your Tencent Cloud console and select the Cloud Monitoring service
2. Proceed to Alarm Management > Notification Templates, click the "Create" button to begin editing a new notification template
3. Enter the callback address as the integrated push address, and select "English" for the notification language
4. Click the "Save" button to preserve the template

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/Mx0ptF5_sB39VvPufOJofjlLXjqmecyBt8CYNIPXM3c.avif" />

5. Access the Alarm Configuration > Alarm Policies page, choose the alarm policy for all events you wish to send, click into the details, and add the notification template you created in the previous step

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/wmSUn2CyyOZJ-kktoTUMQ3jtGgD2GqNx51IVcZdafIk.avif" />

6. Return to the integration list. If the latest event timestamp is displayed, this indicates that the configuration is successful and events are being received
7. Completion

## Status Comparison

All indicator alarms in Tencent Cloud Monitoring correspond to Flashduty "warning" level alarms.