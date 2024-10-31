---
brief: What Tags Do and How to Configure Tag Enhancements
---

# Configure Tag Enhancements

FlashDuty incident details include an incident tag that presents various source data information of alerts in a key:value format. These tag details originate from various alert events connected to FlashDuty. **When the tags automatically generated from the source data do not suffice for business needs, additional tag information can be enriched for alerts through tag enhancement** to improve incident handling efficiency.

## Tag Uses
In FlashDuty, tags are fundamental to the data model for alert events and incident management. The applications of tags are extensive and include, but are not limited to:

- **Incident List:** The incident list supports rapid filtering by tags, enabling users to easily view and manage all records with identical tags, thereby enhancing the efficiency and specificity of incident handling
- **Configure Routing:** When matching collaboration spaces according to routing rules, tags can be used as conditions to route events with the same tags to one or more collaboration spaces
- **Exclusion Rules:** When specific alerts should not be received, exclusion rules can be set to match against tags
- **Dispatch Notifications:** Tags can be employed in dispatch conditions to achieve more precise and flexible notification distribution strategies
- **Alert Aggregation:** By utilizing similar or different tags as dimensions during the aggregation process, alert events can be effectively categorized and noise reduced, improving the clarity and handling efficiency of incidents
- **Silence Rules:** Tags can be incorporated into silence condition configurations as a basis for judgment, allowing for precise filtering and silencing of alert events associated with specific tags, thus achieving advanced customization and noise control
- **Suppression Rules:** By introducing tags as critical conditions, suppression rules can more accurately identify and prevent alert events that meet certain criteria (including specific tag matches), optimizing system efficiency and reducing false positives
- **Tag Enhancement:** The tag enhancement feature allows for the automatic extraction or derivation of new tags from existing source tags during the configuration process, optimizing and refining the tag structure, and further enhancing the flexibility and intelligence of resource classification and management

## Configure Tag Enhancements

Each alert event in the integration center has an option for tag enhancement configuration, which can be set after creating the alert event
### Types of Tag Enhancement
- **Extraction:** Information required can be extracted from alert titles, detailed descriptions, and existing tag fields using regular expressions, and additional tags can be automatically generated.
- **Combination:** Combination rules can construct new tags using Go language template syntax, extracting tag values in the format {{.Labels.Field}} or generating new tags with fixed values.
- **Mapping:** New key-value pairs can be generated from the system's source key values through mapping relationships. This requires预先 creating a schema [mapping relationship](https://developer.flashcat.cloud/api-142409927) and [uploading metadata](https://developer.flashcat.cloud/api-145679479) before configuration, with specific settings referred to in the configuration examples below.
- **Deletion:** Deleting a specified tag will be ineffective if the tag does not exist.

![](https://fcdoc.github.io/img/zh/flashduty/conf/label_enrichment/1.avif)

### Configuration Instructions

- **Restrictions:** During label enhancement, you can set up conditional rules to determine whether to generate or remove corresponding labels (disabled by default). If these conditions are in place and not met, labels will not be created or deleted. You can visit [Configure Filter Conditions](/conf/how_to_filter) to understand how to set up these restrictions.
- **Overwrite:** When generating a new tag based on specified conditions, you can choose whether to overwrite the original tag (disabled by default). For instance, if a new tag named "host" with a value of "A" is created according to rules, and the tag "host" already exists in the original alert, it will replace the original label.

- **Preview:** After completing the rule configuration, a preview is supported, allowing for a visual observation of the configuration effect.

![](https://fcdoc.github.io/img/zh/flashduty/conf/label_enrichment/2.avif)

> [!NOTE]
> When multiple tag rules are configured, they will be executed in top-to-bottom order. If a rule does not match, the corresponding tag will not be generated/deleted, and no prompt message will be displayed.

## Configuration Example
### 1. **Tag Extraction**
**Scenario:** When alert events come from email integration, key information needs to be extracted from the description and applied as tags in other scenarios, such as extracting the IP and trigger values as separate tags.
#### 1.1 Alert Original Text

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/label_enrichment/3.avif" style="display: block; margin: 0 auto;" width="500">

#### 1.2 Extraction Rules

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/label_enrichment/4.avif" style="display: block; margin: 0 auto;"  width="500">

#### 1.3 Extraction Effect
<img src="https://fcdoc.github.io/img/zh/flashduty/conf/label_enrichment/5.avif" style="display: block; margin: 0 auto;" width="500">

### 2. **Tag Combination**
**Scenario:** The company's log platform can access log details directly using the domain name + event ID + timestamp, but since the alert information only contains event ID and timestamp tags, an access address must be constructed based on this information.
#### 2.1 Alert Original Text
<img src="https://fcdoc.github.io/img/zh/flashduty/conf/label_enrichment/6.avif" style="display: block; margin: 0 auto;" width="500">

#### 2.2 Combination Rules

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/label_enrichment/7.avif" style="display: block; margin: 0 auto;" width="500">

#### 2.3 Combination Effect

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/label_enrichment/8.avif" style="display: block; margin: 0 auto;" width="500">

### 3. **Tag Mapping**
**Scenario:** When the tag values in the source alert information are not fixed and their meanings are not immediately clear, source tags can be mapped to new defined tags and values through mapping; for example, if the source alert only contains resource type ID information, but you want to reflect the corresponding resource type names for each ID, this can be achieved through mapping.

#### 3.1 Create Schema Mapping Relationship
The source alert information only contains the resource type ID and the alert level represented by numbers. The required mapping tags are: ID->Type, Level->DLevel.

| Source Tag 01 | Target Tag 01 | Source Tag 02 | Target Tag 02|
| :---: | :---: | :---: | :---: |
| ID | Type | Level |Dlevel|

Create a schema where source_labels and result_labels parameters represent the source and target tag names, respectively ([more creation methods](https://developer.flashcat.cloud/api-142409927))

```
curl --location --request POST 'https://api.flashcat.cloud/enrichment/mapping/schema/create?app_key={}' \
--header 'User-Agent: Apifox/1.0.0 (https://apifox.com)' \
--header 'Content-Type: application/json' \
--data-raw '{
"schema_name": "zabbix mapping",
"description": "Mapping test",
"source_labels": [
"ID",
"Level"
],
"result_labels": [
"Type",
"Dlevel"
]
}'

```

#### 3.2 Upload Mapping Table (CSV format required)

| ID | Type | Level |Dlevel|
| :---: | :---: | :---: | :---: |
| A | server | 1 |Service Suspension|
| B | router | 2 |Danger|
| C | gateway | 3 |warn|
| D | database | 4 |Notice|
| E | MQ | 5 |remind|

```
curl --location --request POST 'https://api.flashcat.cloud/enrichment/mapping/data/upload?schema_id={}&app_key={}' \
--header 'User-Agent: Apifox/1.0.0 (https://apifox.com)' \
--header 'Content-Type: multipart/form-data' \
--form 'file=@"./test.csv"'

```

#### 3.3 Configure Mapping Relationship

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/label_enrichment/9.avif" style="display: block; margin: 0 auto;"  width="500">

##### 3.3.1 Alert Original Text

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/label_enrichment/10.avif" style="display: block; margin: 0 auto;" width="500">

##### 3.3.2 Mapping Effect

<img src="https://fcdoc.github.io/img/zh/flashduty/conf/label_enrichment/11.avif" style="display: block; margin: 0 auto;" width="500">

> [!NOTE]
> If you do not want the source tag to still exist, you can achieve this through a deletion rule.