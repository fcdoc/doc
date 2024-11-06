---
brief: Learn about the most common issues when using Flashduty
---

# Frequently Asked Questions

|+| What is Flashduty?

    Flashduty is a one-stop alert response platform. We provide IT professionals with on-call, alert noise reduction, escalation, and automation capabilities to accelerate enterprise incident response and minimize losses.

|+| Am I a good fit for Flashduty?

    You should use Flashduty if your organization or team:

    - Needs a centralized place to collect alerts from all sources within the company, and to process, track, and analyze them uniformly.
    - Needs to prioritize alerts and notify key personnel dynamically through different channels, and automate the escalation process to avoid unattended alerts.
    - Spends most of its energy on daily alert processing and needs alert noise reduction to address alert fatigue.

|+| What notification methods does Flashduty support?

    | Channels |  Private chat  | Group chat |
    | --- | -------- | ---- |
    | Voice    | ✅   |    |
    | SMS    | ✅   |    |
    | Email    | ✅   |    |
    | Feishu Application | ✅   |  ✅  |
    | DingTalk Application | ✅   |  ✅  |
    | WeChat Work application | ✅   |    |
    | Slack Application| ✅   |  ✅  |
    | Microsoft Teams Application| ✅   |  ✅  |
    | Feishu Robot only supports sending plain text messages    |    |  ✅  |
    | DingTalk Robot    |    |  ✅  |
    | WeChat Work bot    |    |  ✅  |
    | Zoom Bot    |    |  ✅  |
    | Telegram Bot    |    |  ✅  |

|+| Does Flashduty use a fixed number for voice notifications?

    - Mainland China: **( 010 ) 21364727** and **( 021 ) 3201 7538** , more numbers can download and import the link file to your phone: [http://donwloads.flashcat.cloud/phone.vcf](http://donwloads.flashcat.cloud/phone.vcf)
    - United States, Canada: **12087959989**
    - Indonesia, Germany, Malaysia, Australia, Singapore, Thailand, Russia, South Korea, Saudi Arabia, Vietnam, Japan, Hong Kong, Taiwan: **Random number**
    - Other regions do not currently support voice notifications. If you have a need, please contact us: contact-us@flashcat.cloud

|+| How can I ensure Flashduty notifies me?

    Flashduty strives to ensure the availability of every channel.

    - Voice, SMS, and email: We use high-availability services provided by multiple cloud vendors and can quickly switch to another if one fails.
    - IM application messages: If the IM application single chat message fails to send, the system will use SMS and email as a fallback.
    - Dispatch policy settings: It is recommended to set up circular notifications. If the incident is not claimed, the system will loop through multiple notifications. Or set up an escalation process. If the person in the current step does not handle it in time, the incident will be escalated to the next step.

|+| Why can't I receive voice notifications?

    Voice calls depend heavily on the terminal signal and settings. If you consistently cannot receive voice notifications, it is recommended to try the following operations:

    1. If you are using a mobile phone number registered outside mainland China, please check the geographical range we support.
    2. First, check the phone's blacklist or call history to see if numbers around the time of the call were blocked, usually fixed-line numbers such as 010xxx or 021xx. If so, remove the number from the blacklist and add it to the whitelist.
    3. If the phone does not show the number in the blacklist, it may be that the phone number has activated interception services or similar features: For mobile numbers, you can check if incoming landline calls were blocked through the WeChat official account "China Mobile High-Frequency Harassment Call Protection"; for telecom numbers, you can check through the official account "Tianyi Anti-Harassment"; for China Unicom, you can check through the official account "Wo Assistant" or contact customer service.
    4. Please note that if your phone number has been ported, you should check the blocking status with multiple operators.
    5. Try restarting the phone, reinserting the SIM card, and inserting the SIM card into another phone to troubleshoot terminal or SIM card issues

    If you still cannot find the reason, please contact us.

|+| Why can't I receive email notifications?

    It is recommended to try the following:

    1. Check the spam folder in your email client. If the email is there, move it to the inbox to maintain normal reception
    2. Check if the email client is set to automatically delete emails. If so, modify the settings
    3. Contact your company's corporate email administrator and check if the email was blocked in the backend (corporate email systems like Gmail have strict restrictions, and sending too many emails can lead to blocking). If so, set up a whitelist for the email source.

    If you still cannot find the reason, please contact us.

|+| Can Flashduty set routing for alert fields?

    Yes, Flashduty supports matching alert events based on multiple dimensions such as labels, severity, titles, and descriptions, and routing them to different collaboration spaces. For details, see Integration Center - Integration Details - Routing Configuration.

|+| What alert systems does Flashduty support?

    - Universal integration: email alerts (almost applicable to all alert systems); custom event standards (for self-developed monitoring systems).
    - Open-source integration: Zabbix, Prometheus, Nightingale, and other common open-source monitoring systems.
    - Commercial integration: Alibaba Cloud, Tencent Cloud, Huawei Cloud, AWS, Azure, and other commercial cloud monitoring systems.

    If you have other needs, feel free to contact us.

|+| How does Flashduty charge?

    We charge according to active users and provide three different versions: free version, standard version and commercial version. For detailed comparison, please visit: https://flashcat.cloud/flashduty/price/

    - We define users who use commercial features in the current month as active users, and these users must obtain a license to use the service.
    - At the end of each monthly cycle, the licenses held by active users will be released and must be reacquired in the next cycle.
    - When a member is deleted, their license is automatically released.
    - Viewing alerts requires a license, but passively receiving notifications does not.

|+| How does Flashduty ensure its stability?

    -  Flashduty SLA:

    1. Functional availability: Ensure that core functions are available 99.95% of the time
    2. Delivery timeliness: Ensure that 99.95% of alerts are delivered within 5 minutes after being triggered

    -  How Flashduty ensures SLA:

    1. Multi-active in the same city: The infrastructure is built on multiple data centers, and stateful components are multi-active in the same city
    2. Asynchronous processing: After an alert is reported, it immediately enters an asynchronous process with retries to reduce the risk of alert loss
    3. Redundant alerts: For important alerts, a redundant notification mechanism is provided. Customers can choose multiple channels to ensure notifications are received
    4. Global acceleration: Global acceleration has been enabled for the api.flashcat.cloud domain name to ensure stable reporting links in various locations;
    5. Continuous monitoring: Comprehensive collection of system metrics, regular stress testing, and timely or preemptive discovery of system issues.

|+| How does Flashduty ensure data security?

    1. Full-stack HTTPS ensures secure data transmission
    2. Sensitive information is encrypted and stored, and logs are desensitized before being written to disk
    3. Important data modifications require MFA verification and support operation auditing
    4. Regular participation in third-party security certification audits by internationally and domestically recognized organizations (ISO27001, ISO9001)
    5. For customers with specific needs, a confidentiality agreement can be signed
    6. Privacy Agreement: https://docs.flashcat.cloud/docs/privacy-policy

|+| Does Flashduty support private deployment?

    Yes, Flashduty provides a private deployment version that is almost identical to the SaaS service. However, due to the high maintenance costs, the pricing model for private deployment is different from that of SaaS services. If not necessary, we recommend using cloud services.

    If you need a private version, please contact us.

|+| What advantages does Flashduty have over other platforms?

    1. We provide more flexible and user-friendly features
    2. We offer more professional and considerate services
    3. We provide more reasonable product pricing

    Feel free to contact us to get a professional purchasing guide.