---
brief: Team Operations and Member Management
---

# Team and Members

## Team Introduction
A team is a collection of members, also conceptualized as a group, where members with varying responsibilities or from different projects are aggregated to facilitate the management of **collaboration spaces, task assignments, duty schedules, and service calendars** among other scenarios.

## Team Management

### Team Search

- By default, all teams are displayed, with an option to filter for only 'my' team.
- Search by team name is supported with fuzzy matching; however, searching by member is not available.

### Create and Edit

- Team limit: Currently, there is no restriction on the number of teams.
- User limit per team: Currently, there is no restriction on the number of users that can be added.
- A single member can be part of multiple teams.
- The name, description, and membership of an existing team can be modified.
- When changing team members, ensure that the member indeed belongs to the team.

### Delete Team

> [!WARN]
> Before deletion, confirm whether any collaboration spaces, assignment policies, or other related items are linked to the team.
> After deletion, all associated paths will immediately become invalid and cannot be restored; please proceed with caution.

## Member Management

### Invitation Method

- The console supports only email invitations, with the user nickname set to the email prefix by default, which can be changed in the account settings after activation
- Invitations can also be sent via [Open API](https://developer.flashcat.cloud/api-110655699), which supports inviting via mobile phone numbers
- The system will send either an SMS or email to the invited colleagues, with a daily limit of 200 invitations and a maximum of 10 people per invitation
- Besides the above methods, you can contact the organization administrator to set up single sign-on, where new members will automatically have an account created upon login
- After sending an invitation, the recipient can activate their account upon login; accounts that are not activated will not receive alert notifications

### Invite Members

- When inviting a member, you can directly assign them a role; [understand the permission design](/platform_features/permission_overview).
- For email invitations, the invited member will receive a notification email and can directly jump to the login verification from within the email.
- For SMS invitations, the invited member will receive a corresponding SMS notification.
- Invited members can log in using the verification method provided during the invitation, such as email or mobile phone number.

### Change Role

- Account administrators can change the roles of members.
- Members can demote their own roles but cannot promote them.

### Delete Member
> [!WARN]
> Once a member is deleted, they cannot be restored, so please exercise caution.
> Deleting a member does not remove their data.

## FAQs

|+| Have the members not received the verification email after being invited via email?

    Please verify that the email address was entered correctly, check if the email was received in the spam folder, and ensure no blocking policy is set for the email. If all is well, you may ask the inviter to resend the invitation or contact the official technical support team.

|+| Didn’t the member invited via SMS receive the verification text message?

    Please confirm that the mobile number was entered correctly and that no blocking policy is in place on the phone. If everything is in order, you can ask the inviter to resend the invitation or reach out to the official technical support team.

|+| Can the same member belong to multiple principal tenants?

    Yes, for instance, if member A is part of multiple entities, member A will be prompted to select the entity to log into upon signing in.

|+| Can the mobile numbers or email addresses of members under the same account be duplicated?

    No, they cannot be duplicated; the mobile number or email address must remain unique.

|+| Why can’t the administrator change other members’ email addresses or mobile numbers?

    The mobile number or email address is a crucial channel for fault notifications and console logins. To prevent unexpected incidents due to changes made without the individual's knowledge, only the account owner can modify this information, and it requires verification upon changes.