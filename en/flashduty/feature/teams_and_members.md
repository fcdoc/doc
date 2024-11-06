---
brief: Team Operations and Member Management
---

# Teams and Members

## Team Introduction
A team is a collection of members and can also be understood as a group. Members with different responsibilities or projects can be grouped into a team for managing **collaboration spaces, assignment notifications, duty schedules, and service calendars** and other scenarios.

## Team Management

### Team Search

- By default, all teams are displayed. You can choose to display only the teams you belong to.
- Fuzzy search by team name is supported, but search by member is not supported.

### Create and Edit

- Team quantity limit: Currently unlimited.
- Number of users that can be added to a team: Currently unlimited.
- The same member can belong to multiple teams.
- The name, description, and members of a created team can be modified.
- When modifying team members, ensure that the member actually belongs to the team.

### Delete Team

> [!WARN]
> Before deleting, please confirm whether there are any collaboration spaces, assignment policies, or other areas associated with the team.
> After deletion, any related paths will immediately become invalid and cannot be recovered, so please proceed with caution.

## Member Management

### Invitation Methods

- The console only supports email invitations. The user nickname defaults to the email prefix and can be modified in the account settings page after activation
- You can invite members through [Open API](https://developer.flashcat.cloud/api-110655699), which supports mobile phone number invitations
- The system will send text messages or emails to invited colleagues. The maximum number of invitations per day is 200, and a maximum of 10 people can be invited at a time
- In addition to the above methods, you can also contact the organization administrator to configure single sign-on, and new members will automatically create accounts upon logging in
- After inviting someone, the invitee can activate their account by logging in. The account cannot receive alert-related notifications until it is activated

### Invite Members

- When inviting a member, you can directly assign a role to the member; [learn about permission design](/feature/permission).
- When inviting via email, the invited member will receive a notification email and can directly jump to the login verification page from the email.
- When inviting via SMS, the invited member will receive a corresponding SMS reminder.
- Invited members can log in using the verification method used during the invitation, such as email or mobile phone number.

### Change Role

- Account administrators can change members' roles.
- Members can downgrade their own roles but cannot upgrade them.

### Delete Member
> [!WARN]
> Once a member is deleted, they cannot be restored, so please proceed with caution.
> After a member is deleted, their data will not be deleted.

## Frequently Asked Questions

|+| Why didn't the invited member receive the verification email?

    Please confirm whether the email address is correct, whether the email is in the spam folder, and whether the email has any blocking settings. If everything is normal, you can ask the inviter to resend the invitation or contact official technical support.

|+| Why didn't the invited member receive the verification SMS?

    Please confirm whether the mobile phone number is correct and whether the phone has any blocking settings. If everything is normal, you can ask the inviter to resend the invitation or contact official technical support.

|+| Can the same member belong to multiple principal tenants?

    Yes, for example, if member A belongs to multiple subjects, member A will be prompted to choose the subject to log in when logging in.

|+| Can members' mobile phone numbers or emails under the same account be repeated?

    No, the mobile phone number or email address must be unique.

|+| Why can't the administrator modify other members' email addresses or mobile phone numbers?

    Mobile phone numbers and email addresses are important channels for incident notifications and console login. To prevent these details from being modified without the member's knowledge, which could lead to unexpected issues, only the member themselves can modify this information, and verification is required during the modification process.