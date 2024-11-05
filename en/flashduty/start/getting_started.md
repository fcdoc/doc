---
brief: Learn how to get started quickly with Flashduty
---

# Quick Start

## Demo Video

<video controls src="https://fcdoc.github.io/img/zh/flashduty/start/getting_started/1.mp4"></video>

## Start for Free

1. Visit the [Flashduty Console](https://console.flashcat.cloud/) in your browser, enter your **mobile phone number** or **work email**, read and agree to our [Terms of Service](/license/user) and [Privacy Policy](/license/privacy_policy), click Next, and the system will send a verification code to your mobile phone or email.
2. Enter the **company or organization** name and the verification code obtained in the previous step, click Next to complete the registration.
3. The system will guide you through completing the information and will send you a custom alert event to experience voice, text message, or email alerts.

> [!NOTE]
> For security reasons, the system only allows registration through a work email. This means that if you use an email with a suffix such as qq.com, gmail.com, 163.com, etc., you will be refused registration.

## Basic Process

![](https://fcdoc.github.io/img/zh/flashduty/start/getting_started/2.avif)

### Create a Collaboration Space

A collaboration space is a container for related incidents. We generally create a collaboration space for the services owned, managed, and monitored by a team, such as order systems, recommendation services, MySQL components, Client A, etc.

Go to the [Collaboration Space](https://console.flashcat.cloud/channel) list page, click **Create Collaboration Space**, enter an intuitive and concise name and description. Associate a management team with the collaboration space to facilitate future multi-person management.

> [!WARN]
> Collaboration spaces are managed using data permissions rather than role-based controls.
>
> **Only the account owner, collaboration space creator, and management team members** have the permission to modify the configuration of the collaboration space. Others can only view it. This means that anyone can create a collaboration space, but can only modify the collaboration spaces they manage.
>
> **Even if you are an account administrator, you cannot modify the configuration of collaboration spaces that you do not manage.**

### Integrate Alert Events

A collaboration space can only store incidents. To receive alert events, we need to integrate external systems.

1. Go to the collaboration space details, click **Integrate Data**, choose **Add a New Integration**, select the alert system used by your company, and save.
2. The new integration will generate an independent push address. Any alerts reported to this address will directly enter the current collaboration space. Follow the documentation in the integration details to complete the alert push configuration.

- Want to route alerts to different collaboration spaces based on conditions? Go to **Integration Center - Alert Events**, add a shared integration, and set up routing rules based on conditions. This method is especially suitable for Zabbix, Prometheus, and other integrations where it is inconvenient to manage webhook pushes by policy.

3. If this integration receives an alert event, the integration card will display the **latest event time**; otherwise, it will display **no alert events received yet**. You can check whether the monitoring system has generated new alerts and whether the network is functioning properly.

> [!NOTE]
> Flashduty is compatible with most commonly used monitoring systems, allowing you to use it out of the box. If you have a self-developed alert system, please use **Custom Events** or **Email Integration**. If you have other monitoring system requirements, feel free to contact us.

### Configure Notification Methods

When an incident occurs, how will you be notified?

1. Go to the collaboration space details, click **Dispatch Strategy**, and add or modify the dispatch strategy.
2. In step 1, specify the dispatch personnel, i.e., the responders when the incident is triggered. Set the notification methods for the assigned personnel.
- Choose a shift, team, or individual as the dispatch target. We recommend using shifts. When an incident is triggered, the system will only notify the current on-duty personnel.
- Single chat means one-to-one notification, such as text messages, voice calls, or emails. IM applications like Feishu and DingTalk also support one-to-one chat push.
- Group chat means pushing to an IM group and @mentioning the assigned personnel.
4. To ensure that incidents are handled, you can add an escalation step. For example, if the incident has not been resolved after 30 minutes, it will be escalated to the Team Leader.

> [!NOTE]
> How to configure incident notifications according to personal preferences?
> Go to the **Account Settings => Notification Settings** page to set how you are notified when assigned and when duty rotation occurs. Note that this setting only takes effect when dispatching directly or when dispatching by policy and specifying personal preferences.

## Official Subscription

> [!NOTE]
> People with **subscription management** rights can perform this action.

Newly registered businesses will automatically receive a 2-week free trial. After the trial, you can go to the **Billing Center** and choose the Professional or Standard Edition to upgrade.

- You can compare the functional differences between different versions at the bottom of the page.
- Only members who handle daily incidents need a license. If you only passively receive alert notifications, you do not need to purchase a license.
- If the license is insufficient, members without a license cannot view or handle incidents. You can go to the console to purchase additional licenses at any time, which will take effect immediately.
- Each license includes a certain amount of free communication quota, which is shared among all members.
- Five days before the subscription expires, the system will send a daily SMS reminder to the main account. Please renew in time to avoid affecting alert reception.