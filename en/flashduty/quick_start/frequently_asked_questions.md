---
brief: Understand the most common issues when using Flashduty
---

# FAQs

|+| What is FlashDuty?

    FlashDuty is positioned as a one-stop alarm response platform. We offer IT professionals on-duty services, alarm noise reduction, upgrading, and automation capabilities to accelerate enterprise fault response and minimize losses.

|+| Am I suitable for using FlashDuty?

    You should use FlashDuty if your organization or team experiences the following:

    - A centralized location is needed to collect and uniformly process, track, and analyze alarms from all sources within the company.
    - Alarms need to be categorized and critical personnel should be dynamically notified through different channels, with an automatic escalation process to prevent alarms from going unhandled.
    - Daily alarm handling consumes a significant amount of time, and alarm noise reduction is required to address alarm fatigue.

|+| What notification methods does FlashDuty support?

    | Channels |  Private Chat  | Group Chat |
    | --- | -------- | ---- |
    | Voice    | ✅   |    |
    | Short Message    | ✅   |    |
    | Mail    | ✅   |    |
    | Feishu Application | ✅   |  ✅  |
    | DingTalk Application | ✅   |  ✅  |
    | WeChat Work App | ✅   |    |
    | Slack App| ✅   |  ✅  |
    | Microsoft Teams App| ✅   |  ✅  |
    | Feishu Robot    |    |  ✅  |
    | DingTalk Robot    |    |  ✅  |
    | WeChat Work Robot    |    |  ✅  |
    | Zoom Robot    |    |  ✅  |
    | Telegram Bot    |    |  ✅  |

|+| Does FlashDuty use a fixed number for voice notifications?

    - Mainland China: **( 010 ) 21364727** and **( 021 ) 3201 7538** , more numbers can download and import the link file to your phone: [http://donwloads.flashcat.cloud/phone.vcf](http://donwloads.flashcat.cloud/phone.vcf)
    - United States, Canada: **12087959989**
    - Indonesia, Germany, Malaysia, Australia, Singapore, Thailand, Russia, South Korea, Saudi Arabia, Vietnam, Japan, Hong Kong, Taiwan: **random number**
    - Other regions currently do not support voice notifications. If you have a need, please contact us: contact-us@flashcat.cloud

|+| How can I ensure that FlashDuty notifies me?

    FlashDuty strives to ensure the availability of each notification channel.

    - Voice, SMS, and email: We use high-availability services from multiple cloud providers, and can quickly switch to another provider if one encounters issues.
    - IM application messages: If an IM application message fails to send, the system will use SMS and email as fallback reminders.
    - Notification dispatch policy settings: It is recommended to set up circular notifications. If a fault is not claimed, the system will send multiple notifications. Alternatively, set up an escalation process where if the current personnel do not handle it promptly, the fault will be escalated to the next level.

|+| Why am I not receiving voice notifications?

    Voice calls are highly dependent on terminal signals and settings. If you continue to experience issues with voice notifications, consider the following steps:

    1. If you are using a mobile number registered outside of Mainland China, please check the supported regions.
    2. First, check if your phone's blacklist or call history has blocked numbers around the time of the call, typically fixed-line numbers like 010xxx or 021xx. If so, please remove them from the blacklist and add them to the whitelist.
    3. If your phone does not show a blacklist, the phone number may have activated call blocking services. Mobile users can check if incoming landline calls are blocked through the "China Mobile High Frequency Harassment Call Protection" WeChat account; Telecom users can check through the "Tianyi Anti-Harassment" WeChat account; China Unicom users can check through the "Wo Assistant" WeChat account, or contact customer service.
    4. Please note that if your phone number has participated in number portability, check the blocking status with multiple carriers.
    5. Try restarting your phone, reinserting the SIM card, or using the SIM card in another phone to rule out terminal or SIM card issues

    If you still cannot find the reason, please contact us.

|+| Why am I not receiving email notifications?

    Consider the following steps:

    1. Check your email client's spam folder. If any notifications are there, please move them to your inbox to ensure normal reception
    2. Check if your email client has an automatic deletion setting and modify the rules if necessary
    3. Contact your company's email administrator to check if the emails have been blocked in the background (corporate mailboxes like Gmail have strict restrictions, and sending too many emails may result in blocking). If so, set up a whitelist for the email source.

    If you still cannot find the reason, please contact us.

|+| Can FlashDuty set up routing based on alarm fields?

    Yes, FlashDuty supports matching alarm events based on various dimensions such as tags, severity, titles, and descriptions, and routing them to different collaboration spaces. See the Integration Center-Integration Details-Routing Configuration for more information.

|+| What alarm systems does FlashDuty support?

    - General integration: Email alerts (suitable for almost all alarm systems); custom event standards (using proprietary monitoring systems).
    - Open-source integration: Zabbix, Prometheus, Nightingale, and other common open-source monitoring tools.
    - Commercial integration: Alibaba Cloud, Tencent Cloud, Huawei Cloud, AWS, Azure, and other commercial cloud monitoring services.

    If you have other needs, please feel free to contact us.

|+| How does FlashDuty charge for its services?

    We charge according to active users and provide three different versions: free version, standard version and commercial version. For detailed comparison, please visit: https://flashcat.cloud/flashduty/price/

    - We define users who use commercial features in a given month as active users, and these users must have a license to use the service.
    - At the end of each monthly cycle, the licenses held by active users are released and must be reacquired in the next cycle.
    - When a member is removed, their license is automatically released.
    - Viewing alarms requires a license, but passively receiving notifications does not.

|+| How does FlashDuty ensure its own stability?

    -  FlashDuty SLA:

    1. Function availability: Ensure that core functions are available 99.95% of the time
    2. Delivery timeliness: Ensure that 99.95% of alarms are delivered within 5 minutes of being triggered

    -  How does FlashDuty guarantee its SLA:

    1. Multi-active in the same city: Infrastructure is built across multiple data centers, with stateful components operating in multi-active mode within the same city
    2. Asynchronous processing: After an alarm is reported, it immediately enters an asynchronous process, with retries in case of errors to reduce the risk of alarm loss
    3. Redundant alarms: For critical alarms, a redundant notification mechanism is provided, allowing customers to set up multiple channels for circular notifications to ensure reachability
    4. Global acceleration: Global acceleration is enabled for the api.flashcat.cloud domain to ensure stable reporting links worldwide
    5. Continuous monitoring: Comprehensive system metrics are collected, and regular stress tests are conducted to promptly or proactively identify system issues.

|+| How does FlashDuty ensure data security?

    1. Full stack HTTPS ensures secure data transmission
    2. Sensitive information is encrypted in storage, and logs are desensitized before being saved
    3. Important data modifications require MFA verification and support for operation auditing
    4. FlashDuty regularly participates in third-party security certification audits (ISO27001, ISO9001)
    5. For clients with specific needs, confidentiality agreements can be signed
    6. Privacy Agreement: https://docs.flashcat.cloud/docs/privacy-policy

|+| Does FlashDuty support private deployment?

    Yes, FlashDuty offers a private deployment version that is almost identical to the SaaS service. However, due to the high maintenance costs, the pricing model for private deployment differs from that of SaaS services. We recommend using cloud services unless necessary.

    If you require a private deployment version, please contact us.

|+| What are FlashDuty's advantages over other platforms?

    1. We offer more flexible and user-friendly features
    2. We provide more professional and considerate services
    3. We offer more reasonable product pricing

    You are welcome to contact us for a professional purchasing guide.