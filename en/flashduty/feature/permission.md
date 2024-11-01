---
brief: Understand the Difference Between Feature Permissions and Data Permissions
---

# Permissions, Roles

Flashduty uses two types of permissions: feature permissions and data permissions, which are used together in different functional scenarios.

> [!WARN]
> You must have both feature permissions and data permissions to operate on certain data objects.

## Feature Permissions
> [!NOTE]
> Feature permissions: Also known as operation permissions, these determine which functions or operations a user can perform in the system.

Flashduty **controls feature permissions based on (RBAC) roles**. The system has the following preset roles (you can also customize roles):

- **Account.Admin**: Account administrator, has all operational permissions except for modifying the main account information, and can assist the main account in managing daily affairs.
- **Tech.Admin**: Technical administrator, has access control, operation auditing, and all feature permissions not listed in the table below.
- **Fin.Admin**: Financial administrator, has the authority to place orders in the fee center and all feature permissions not listed in the table below.

The feature permissions that can currently be controlled are shown in the following table:

| Permission Point | Account.Admin | Teah.Admin | Fin.Admin |
| ------------ | :--------: | :--------:  | :--------: |
| **API Key Management**    | ✔️       |            |            |
| **Operation Audit Reading**     | ✔️ | ✔️ |  |
| **Monitoring System Event Management**    | ✔️ |  |  |
| **Custom Field Management**    | ✔️ | ✔️ |  |
| **Access Control** <br> - Member Management<br> - Role Management<br> - Single Sign-On Management     | ✔️ | ✔️ |  |
| **Subscription Management** <br> - Subscription Management<br> - Set Low Balance Alerts<br> - Change Version Expiration Policy<br> - Enable Monitoring Management Functions    | ✔️ |  | ✔️ |
| **All Other Features** * | ✔️ | ✔️ | ✔️ |

> [!WARN]
> Note that **all other features** not listed in the table * (such as managing collaboration spaces) are permissions that all users have by default (even if the user is not assigned a role) and do not need to be controlled.

## Data Permissions
> [!NOTE]
> Data permissions: Also known as access permissions, these control the scope of data that a user can access or view.

Flashduty **controls data permissions based on teams** and applies to the following scenarios:

- **Team Management**: The creator, main account, and team members can modify team information and manage team members.
- **Collaboration Space**: The creator, main account, and team members responsible for the collaboration space can modify the basic information of the space, noise reduction configuration, dispatch strategy, etc.
- **Duty Management**: The creator, main account, and team members responsible for duty can modify the basic information of duty, rotation rules, etc.
- **Template Management**: The creator, main account, and team members responsible for the template can modify the basic information of the template, template configuration for each channel, etc.
- **Service Calendar**: The creator, main account, and team members responsible for the service calendar can modify the basic information of the calendar, holiday settings, etc.

When you do not have data permissions for the corresponding resource, the system will display the following message:

![](https://fcdoc.github.io/img/zh/flashduty/feature/permission/1.avif)

## Frequently Asked Questions

|+| I am already an account administrator, why can’t I modify the collaboration space settings?

    Because the collaboration space applies data permissions, you must be the creator, the main account, or one of the responsible team members to modify the information of the corresponding collaboration space.

    If the space does not have a responsible team, you can request the creator or main account to set up a team for the collaboration space and invite you to join. Then you will have management rights for the space.

|+| Why can a member without any role handle incidents?

    Because incidents often require the cooperation of multiple teams to handle. Therefore, Flashduty does not control access to handling alerts. All personnel on the platform can view all alerts under the account and process them.

    However, we do not rule out the possibility of implementing access control for handling incidents in the future.