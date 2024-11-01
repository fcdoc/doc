---
brief: Team Operations and Member Management
---

# Teams and Members

## Team Introduction
A team is a collection of members and can also be understood as a group. Members with different responsibilities or projects can be grouped into a team for managing **collaboration spaces, assignment notifications, duty schedules, and service calendars** among other scenarios.

## Team Management

### Team Search

- By default, all teams are displayed. You can choose to view only the teams you belong to.
- Fuzzy search by team name is supported, but search by member is not.

### Creation and Editing

- Team quantity limit: Currently unlimited.
- Number of users that can be added to a team: Currently unlimited.
- The same member can belong to multiple teams.
- The name, description, and members of a created team can be modified.
- When modifying team members, ensure that the member indeed belongs to the team.

### Deleting a Team

> [!WARN]
> Before deleting, please confirm whether there are any collaboration spaces, assignment policies, or other related settings associated with the team.
> After deletion, any related settings will immediately become invalid and cannot be recovered. Please proceed with caution.

## Member Management

### Invitation Methods

- The console only supports email invitations. The user nickname defaults to the email prefix and can be modified in the account settings page after activation
- You can invite members through [Open API](https://developer.flashcat.cloud/api-110655699), which supports mobile phone number invitations
- The system will send text messages or emails to invited colleagues. The maximum number of invitations per day is 200, and a maximum of 10 people can be invited at a time
- In addition to the above methods, you can also contact the organization administrator to configure single sign-on, and new members will automatically create accounts after logging in
- After inviting a member, they can activate their account by logging in. The account will not receive alert-related notifications until it is activated

### Inviting Members

- When inviting a member, you can directly assign them a role; [learn about permission design](/feature/permission_overview).
- When inviting via email, the invited member will receive a notification email and can directly log in and verify through the email.
- When inviting via SMS, the invited member will receive a corresponding SMS reminder.
- Invited members can log in using the verification method provided during the invitation, such as email or mobile phone number.

### Changing Roles

- Account administrators can change members' roles.
- Members can downgrade their own roles but cannot upgrade them.

### Deleting Members
> [!WARN]
> Once a member is deleted, they cannot be restored. Please proceed with caution.
> After a member is deleted, their data will not be deleted.

## Frequently Asked Questions

|+| Email Invitation Members Did Not Receive the Verification Email?

    Please confirm that the email address is correct, check the spam folder, and ensure that no interception policies are set in the email. If everything is normal, you can ask the inviter to resend the invitation or contact official technical support.

|+| SMS Invitation Members Did Not Receive the Verification SMS?

    Please confirm that the mobile phone number is correct and that no interception policies are set on the mobile phone. If everything is normal, you can ask the inviter to resend the invitation or contact official technical support.

|+| Can the Same Member Belong to Multiple Principal Tenants?

    Yes, for example, if member A belongs to multiple entities, member A will be prompted to choose the entity to log in when logging in.

|+| Can Members' Mobile Phone Numbers or Email Addresses Under the Same Account Be Repeated?

    No, the mobile phone number or email address must be unique.

|+| Why Can't the Administrator Modify Other Members' Email Addresses or Mobile Phone Numbers?

    The mobile phone number or email address is an important channel for incident notifications and logging into the console. To prevent these details from being modified without the member's knowledge, which could lead to unexpected issues, only the member can modify them and must verify the changes.