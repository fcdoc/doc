---
brief: Team Operations and Member Management
---

# Teams and Members

## Team Introduction
A team is a collection of members, which can also be understood as a group. Members with different responsibilities or projects can be grouped into a team for managing **collaboration spaces, dispatching notifications, duty schedules, and service calendars** and other scenarios.

## Team Management

### Team Search

- By default, all teams are displayed. You can choose to display only the teams you belong to.
- Fuzzy search by team name is supported, but search by member is not supported.

### Create and Edit

- Team Number Limit: Currently unlimited.
- Number of Users in a Team: Currently unlimited.
- The same member can belong to multiple teams.
- The name, description, and members of a created team can be modified.
- When modifying team members, ensure that the member actually belongs to the team.

### Delete Team

> [!WARN]
> Before deleting, confirm whether there are any collaboration spaces, dispatch policies, or other areas associated with the team.
> After deletion, any related paths will immediately become invalid and cannot be recovered. Please proceed with caution.

## Member Management

### Invitation Methods

- The console only supports email invitations. The user nickname defaults to the email prefix and can be modified in the account settings page after activation
- You can invite members through [Open API](https://developer.flashcat.cloud/api-110655699), which supports mobile phone number invitations
- The system will send SMS or email notifications to invited colleagues. The maximum number of invitations per day is 200, and a maximum of 10 people can be invited at a time
- In addition to the above methods, you can also contact the organization administrator to configure single sign-on, so that new members' accounts are automatically created upon login
- After inviting someone, the invitee can activate their account by logging in. The account will not receive alert-related notifications until it is activated

### Invite Members

- When inviting a member, you can directly assign a role to the member; [learn about permission design](/feature/permission).
- When inviting via email, the invited member will receive a notification email and can directly log in and verify from the email.
- When inviting via SMS, the invited member will receive a corresponding SMS reminder.
- Invited members can log in using the verification method provided during the invitation, such as email or mobile phone number.

### Change Role

- Account administrators can change members' roles.
- Members can downgrade their own roles but cannot upgrade them.

### Delete Member
> [!WARN]
> Once a member is deleted, they cannot be restored, so please proceed with caution.
> After a member is deleted, their data will not be deleted.

## Frequently Asked Questions

|+| Why didn't the invited member receive the verification email?

    Please confirm that the email address is correct, check the spam folder, and ensure that no email blocking policies are in place. If everything is normal, ask the inviter to resend the invitation or contact official technical support.

|+| Why didn't the invited member receive the verification SMS?

    Please confirm that the mobile phone number is correct and that no SMS blocking policies are in place. If everything is normal, ask the inviter to resend the invitation or contact official technical support.

|+| Can the same member belong to multiple principal tenants?

    Yes, for example, if member A belongs to multiple tenants, member A will be prompted to choose the tenant to log in to when logging in.

|+| Can members under the same account have duplicate mobile phone numbers or emails?

    No, mobile phone numbers or emails must be unique.

|+| Why can't the administrator modify other members' email addresses or mobile phone numbers?

    Mobile phone numbers or emails are important channels for incident notifications and console login. To prevent unauthorized changes that could lead to unexpected issues, only the member themselves can modify this information, and verification is required during the modification process.