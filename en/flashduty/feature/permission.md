---
brief: Understand the difference between feature permissions and data permissions
---

# Permissions, Roles

Flashduty uses two types of permissions: feature permissions and data permissions, and they are used in conjunction in different functional scenarios.

> [!WARN]
> You must have both feature permissions and data permissions to operate on certain data objects.

## Feature Permissions
> [!NOTE]
> Feature permissions: Also known as operation permissions, these determine which functions or operations of the system a user can use.

Flashduty **controls feature permissions based on (RBAC) roles**. The system comes with several preset roles (you can also customize roles):

- **Account.Admin**: Account administrator, has all operation permissions except for modifying the main account information, and can assist the main account in managing daily affairs.
- **Tech.Admin**: Technical administrator, has access control, operation auditing, and all feature permissions not listed in the table below.
- **Fin.Admin**: Financial administrator, has the authority to place orders in the fee center and all feature permissions not listed in the table below.

The feature permissions that can currently be controlled are shown in the following table:

| Permission Point | Account.Admin | Teah.Admin | Fin.Admin |
| ------------ | :--------: | :--------:  | :--------: |
| **API Key Management**    | ✔️       |            |            |
| **Operation Audit Read**     | ✔️ | ✔️ |  |
| **Monitoring System Event Management**    | ✔️ |  |  |
| **Custom Field Management**    | ✔️ | ✔️ |  |
| **Access Control** <br> - Member Management<br> - Role Management<br> - Single Sign-On Management     | ✔️ | ✔️ |  |
| **Subscription Management** <br> - Subscription Management<br> - Set Low Balance Alerts<br> - Change Version Expiration Policy<br> - Enable Monitoring and Management Functions    | ✔️ |  | ✔️ |
| **All Other Features** | ✔️ | ✔️ | ✔️ |

> [!WARN]
> Note that **all other features** not listed in the table * (such as managing collaboration spaces) are permissions that all users have by default (even if the user is not assigned a role) and do not need to be controlled.

## Data Permissions
> [!NOTE]
> Data permissions: Also known as access permissions, these control the scope of data that a user can access or view.

Flashduty **controls data permissions based on teams** and applies them to the following scenarios:

- **Team Management**: The creator, main account, and team members can modify team information and manage team members.
- **Collaboration Space**: The creator, main account, and team members responsible for the collaboration space can modify the basic information, noise reduction configuration, dispatch strategy, etc., of the space.
- **Duty Management**: The creator, main account, and team members responsible for duty can modify the basic information, rotation rules, etc., of the duty.
- **Template Management**: The creator, main account, and team members responsible for the template can modify the basic information, template configuration of each channel, etc., of the template.
- **Service Calendar**: The creator, main account, and team members responsible for the service calendar can modify the basic information, holiday settings, etc., of the calendar.

When you do not have data permissions for the corresponding resource, the system will display the following prompt:

![](https://fcdoc.github.io/img/zh/flashduty/feature/permission/1.avif)

## Frequently Asked Questions

|+| I am already an account administrator, why can’t I modify the collaboration space settings?

    Because the collaboration space applies data permissions, you must be the creator, the main account, or one of the responsible team members to modify the information of the corresponding collaboration space.

    If the space does not have a responsible team, you can request the space creator or main account to set up a team for the collaboration space and invite you to join. Then you will have management rights for the space.

|+| Why can a member without any role handle incidents?

    Because incidents often require the cooperation of multiple teams to handle. Therefore, Flashduty does not control permissions for handling alerts. All personnel on the platform can view all alerts under the account and process them.

    However, we do not rule out the possibility of implementing permission control for handling incidents in the future.