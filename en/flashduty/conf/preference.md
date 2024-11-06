---
brief: You can personalize your account and configure personal notification methods
---

# Personal Preferences

## Account Center
- Access the Account Center: Hover over the user icon in the upper right corner and select Account Settings.
- Displays the personalized configuration of your account, and allows you to set personal contact information, account password, APP Key, notification method, etc.
- You can configure the following items in your account settings:
- Basic Information: such as nickname, email, password, etc.
- APP Key: Create or delete an APP Key.
- Notification Method: Configure according to personal preferences.

![](https://fcimg.3ti.site/zh/flashduty/conf/preference/1.avif)

## Account Information
- There are two types of account identities: main account and member account.
- The account nickname supports Chinese and English and is primarily used for name display.
- Verification code is required when modifying your email or mobile phone number.
- The regions currently supported by mobile phone numbers: Mainland China, the United States, Canada, Indonesia, Germany, Malaysia, Australia, Singapore, Thailand, Russia, South Korea, Saudi Arabia, Vietnam, and Japan.

## APP key
- An APP Key is an important credential for API requests.
- Each account can create up to 5 APP Keys. Deleting them will release the quota. Please allocate and use them reasonably.
- The value of the APP Key will only be displayed when the creation is successful. Please save it properly.

> [!WARN]
> - Each APP Key has full API operation permissions. Please be sure to save the created APP Key to avoid leakage.
> - When deleting an APP Key, please ensure that no business is using the key. Once deleted, the businesses that previously referenced the key will become invalid.

## Notification Method
- You can configure different notification methods according to different alert levels.
- Notifications will be made according to the notification method configured by the individual only **when the incident is assigned directly to the individual, or assigned to the individual according to the assignment policy and has set up private chat and follows personal preferences**.
- When IM applications such as DingTalk, WeChat, and Feishu are configured, you need to associate the application first to receive the corresponding notification.

## Frequently Asked Questions

|+| I have set my personal preference notification method, why is the notification not triggered?

    Flashduty dispatches people and notifies them based solely on the settings of the dispatch policy. This means that if you do not set a dispatch policy, there will be no notification when an incident occurs.

    Secondly, the dispatch policy single chat notification channel supports two settings: one is "follow personal preference" and the other is "follow unified settings". Only in the "Follow personal preferences" setting will notifications be personalized according to your settings. If you select "Follow unified settings", everyone will be notified according to this setting, rather than each person's preference.

    Go to Collaboration Space Details => Dispatch Strategy to view your specific settings.