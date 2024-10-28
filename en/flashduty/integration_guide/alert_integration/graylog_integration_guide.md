---
brief: Synchronize Graylog alert events to Kuaimao Nebula via webhook to automate noise reduction processing for these alerts
---

# Graylog Alert Event

Synchronize Graylog alert events to Kuaimao Nebula via webhook to automate noise reduction processing for these alerts.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Graylog** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Graylog** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

## In Graylog
<div id="!"><h2>Graylog Alarm push configuration</h2><h3> Step 1: Configure alarm channel</h3><ol><li> Login to Graylog .</li><li> Find Alerts in the menu and select Notifications .</li><li> created Create Notification .</li><li> Enter Title and Description .</li><li> Notification Type Select **HTTP Notification** , as shown below.</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/eWI2dwAH-u6NiXImb2P94U6PLQwwqJ874Z-9dTEnG8U.avif"><ol start="6"><li> Input FlashDuty The obtained URL (you need to whiten URL for the first input).</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/lkx7VzY3ZZqF9K-qUu469azcTPzOeOevMdLD1b5Q9cU.avif"><ol start="7"><li> Click Save to save the whitened URL</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/99FRplZHwxawFUPjKweW08evg86CU7O26tKNkjuwANk.avif"><ol start="8"><li> After saving, commit Create .</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/LWGvCpNBZ1fE2ILfxZ9-COnwvCXk806KviB6KQ_B4fg.avif"><h3> Step 2: Use FlashDuty alarm channels in alarm events</h3><ol><li> Create or edit an existing Event Definition .</li><li> Other alarm configurations are omitted here (configure alarm conditions according to business requirements).</li><li> Configure channels in Notifications .</li><li> Add Notifition channel FlashDuty .</li><li> Click Done .</li><li> Just complete the next step.</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/FBEZ5WZwmS1KOXauhVJ_PCxKzhnwgCfeWVriVNKUqsA.avif"></div>

## Status Comparison

<div class="md-block">

|Graylog|Kuaimao Nebula|state|
|---|---|---|
|3|Critical|serious|
|2|Warning|warn|
|1|Info|remind|

</div>