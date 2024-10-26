---
brief: Understand the difference between feature permissions and data permissions
---

# Permissions, Roles

Flashduty employs two types of permissions: functional permissions and data permissions, which are utilized in conjunction across different functional scenarios.

> [!WARN]
> You must possess both functional and data permissions to manipulate certain data objects.

## Function Permissions
> [!NOTE]
> Function permissions, also known as operational permissions, determine which system features or operations a user can access.

Flashduty **manages functional permissions based on (RBAC) roles**. The system comes with several predefined roles (and you can also create custom roles):

- **Account.Admin**: Account administrator, with full operational rights except for modifying entity information, capable of assisting with the daily management of the entity account.
- **Tech.Admin**: Technical administrator, with access control, operational auditing, and all functional permissions not listed in the table below.
- **Fin.Admin**: Financial administrator, with the authority to place orders in the fee center and all functional permissions not listed in the table below.

The following table lists the functional permissions that can currently be controlled:

| Permission Point | Account.Admin | Teah.Admin | Fin.Admin |
| ------------ | :--------: | :--------:  | :--------: |
| **API Key Management**    | ✔️       |            |            |
| **Operation Audit Read**     | ✔️ | ✔️ |  |
| **Monitoring System Event Management**    | ✔️ |  |  |
| **Custom Field Management**    | ✔️ | ✔️ |  |
| **Access Control**<br>- Member Management<br>- Role Management<br>- Single Sign-On Management     | ✔️ | ✔️ |  |
| **Subscription Management**<br>- Subscription Management<br>- Balance Insufficient Reminder<br>- Change Expiration Policy for Version<br>- Enable Monitoring Management Function    | ✔️ |  | ✔️ |
| **All Other Features** | ✔️ | ✔️ | ✔️ |

> [!WARN]
> Note that **all other functions** not listed in the table *(such as managing collaboration spaces)* are permissions that all users have by default (even if a user is not assigned a role) and do not require manual control.

## Data Permissions
> [!NOTE]
> Data permissions, also known as access permissions, control the scope of data that a user can access or view.

Flashduty **controls data permissions based on teams** and applies to the following scenarios:

- **Team Management**: Creators, main accounts, and team members can modify team information and manage team members.
- **Collaboration Space**: Creators, main accounts, and team members responsible for the collaboration space can modify the space's basic information, noise reduction settings, and assignment policies.
- **Duty Management**: Creators, main accounts, and team members responsible for duty can modify the basic information and rotation rules of the duty.
- **Template Management**: Creators, main accounts, and team members responsible for templates can modify the basic information and channel template configurations.
- **Service Calendar**: Creators, main accounts, and team members responsible for the service calendar can modify the calendar's basic information and holiday settings.

If you lack data permissions for a corresponding resource, the system will provide the following prompt:

![](https://fcdoc.github.io/img/dCWMN_bb4xQtkzwoFjba1jqNWm_4J0RjzhIubwbGtCw.avif)

## FAQs

|+| I am already an account administrator; why can't I modify the collaboration space settings?

    Because the collaboration space operates under data permissions, you must be the creator, the main account, or one of the responsible team members to modify the information of the respective collaboration space.

    If there is no designated responsible team for the space, you can request that the space creator or main account set up a team for the collaboration space and invite you to join, which will grant you administrative privileges for that space.

|+| Why can a member without any role address issues?

    Because it's not uncommon to encounter issues that require the collaboration of multiple teams to resolve. Therefore, Flashduty does not impose permission controls on alarm handling. All personnel on the platform can view and manage all alarms under the account.

    However, we do not exclude the possibility of implementing permission controls for handling issues in the future.