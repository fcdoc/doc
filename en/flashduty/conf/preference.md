---
brief: You can personalize your account and configure personal notification methods
---

# Personal Preferences

## Account Center
- Access the Account Center: Hover over the user icon in the upper right corner and select Account Settings.
- Displays the personalized settings of your account and allows you to set personal contact information, account password, APP Key, notification method, etc.
- You can configure the following items in your account settings:
- Basic Information: such as nickname, email, password, etc.
- APP Key: Create or delete an APP key.
- Notification Method: Configure according to personal preferences.

![](https://fcdoc.github.io/img/zh/flashduty/conf/preference/1.avif)

## Account Information
- There are two types of account identities: main account and member account.
- The account nickname supports Chinese and English and is primarily used for name display.
- Verification code is required when modifying your email or mobile phone number.
- The regions currently supported by mobile phone numbers: Mainland China, the United States, Canada, Indonesia, Germany, Malaysia, Australia, Singapore, Thailand, Russia, South Korea, Saudi Arabia, Vietnam, and Japan.

## APP key
- An APP key is important credential information for making API requests.
- Each account can create up to 5 APP keys. Deleting them will release the quota. Please allocate and use them reasonably.
- The value of the APP key will only be displayed when the creation is successful. Please save it properly.

> [!WARN]
> - Each APP key has full API operation permissions. Please be sure to save the created APP key to avoid leakage.
> - When deleting an APP key, please ensure that no business is using the key. Once deleted, the businesses that previously referenced the key will become invalid.

## Notification Method
- You can configure different notification methods according to different alert levels.
- Notifications will be sent according to the personally configured notification method only **if the incident is directly assigned to the individual, or assigned to the individual according to the assignment policy and has set up private chat and follows personal preferences**.
- When IM applications such as DingTalk, WeChat, and Feishu are configured, you need to associate the application first to receive the corresponding notification.

## Frequently Asked Questions

|+| I have set my personal preference notification method, why is the notification not triggered?

    How Flashduty dispatches people and notifies them depends solely on the settings of the dispatch policy. This means that if you do not set a dispatch policy, there will be no notification when an incident is triggered.

    Secondly, the dispatch strategy single chat notification channel supports two settings: one is "follow personal preference" and the other is "follow unified settings". Only in the "Follow personal preferences" setting will notifications be personalized according to your settings. If you select "Follow unified settings", everyone will be notified according to this setting, rather than each person's preference.

    Go to Collaboration Space Details => Dispatch Strategy to view your specific settings.