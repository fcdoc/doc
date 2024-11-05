---
brief: You can personalize your account and configure personal notification methods
---

# Personal Preferences

## Account Center
- Access the Account Center: Hover over the user icon in the upper right corner and select Account Settings.
- The Account Center displays the personalized configuration of your account and allows you to set personal contact information, account password, APP Key, notification methods, etc.
- In the Account Settings, you can configure the following items:
- Basic Information: such as nickname, email, password, etc.
- APP Key: Create or delete an APP Key.
- Notification Methods: Configure according to personal preferences.

![](https://fcdoc.github.io/img/zh/flashduty/conf/preference/1.avif)

## Account Information
- There are two types of account identities: main account and member account.
- The account nickname supports Chinese and English and is primarily used for display purposes.
- Verification is required when modifying your email or mobile phone number.
- The regions currently supported for mobile phone numbers: Mainland China, the United States, Canada, Indonesia, Germany, Malaysia, Australia, Singapore, Thailand, Russia, South Korea, Saudi Arabia, Vietnam, and Japan.

## APP key
- An APP Key is important credential information for API requests.
- Each account can create up to 5 APP Keys. Deleting an APP Key will release the quota, so please allocate and use them reasonably.
- The value of the APP Key is only displayed when creation is successful. Please save it properly.

> [!WARN]
> - Each APP Key has full API operation permissions. Please ensure you save the created APP Key to avoid leakage.
> - When deleting an APP Key, please ensure that no business is using the key. Once deleted, the services that previously referenced the key will become invalid.

## Notification Methods
- You can configure different notification methods based on different alert levels.
- Notifications will be sent according to the individual's configured notification method only **if the incident is directly assigned to the individual, or assigned to the individual according to the assignment policy and single chat is set up and follows personal preferences**.
- When IM applications such as DingTalk, WeChat, and Feishu are configured, you need to associate the application first to receive the corresponding notifications.

## Frequently Asked Questions

|+| I have set my personal preference notification method, but why is the notification not triggered?

    Flashduty dispatches personnel and sends notifications based solely on the settings of the dispatch policy. This means that if you do not set a dispatch policy, there will be no notification when an incident is triggered.

    Secondly, the dispatch strategy for single chat notifications supports two settings: "Follow Personal Preferences" and "Follow Unified Settings." Only in the "Follow Personal Preferences" setting will notifications be personalized according to your settings. If you select "Follow Unified Settings," everyone will be notified according to this setting, rather than each person's preference.

    Go to Collaboration Space Details = > Assignment Policy to view your specific settings.