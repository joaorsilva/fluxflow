SET UNIQUE_CHECKS=0;
SET FOREIGN_KEY_CHECKS=0;

--
-- Create schema
--
DROP SCHEMA IF EXISTS `fluxflow`;
CREATE SCHEMA `fluxflow` DEFAULT CHARACTER SET utf8 ;
USE `fluxflow`;
--
-- Table structure for table `geo_countries`
--
DROP TABLE IF EXISTS `geo_countries`;
CREATE TABLE `geo_countries` (
  `id` 			int(10)		unsigned	NOT NULL                        COMMENT 'Tables unique identifier',
  `name` 		varchar(128) 			NOT NULL 			COMMENT 'Country name (Unique table key)',
  `code_1` 		char(2) 					DEFAULT NULL 	COMMENT 'Country code 2 character code',
  `code_2` 		varchar(3) 					DEFAULT NULL 	COMMENT 'Country code 3 character code',
  `phone_code` 		varchar(4) 					DEFAULT NULL 	COMMENT 'Country phone code',
  `active` 		tinyint(1) 	unsigned 	NOT NULL 	DEFAULT '0'	COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by` 		int(10) 	unsigned 	NOT NULL 			COMMENT 'user_users_id that created the record',
  `created_date` 	datetime 			NOT NULL 			COMMENT 'Record creation date/time',
  `updated_by` 		int(10) 	unsigned 	NOT NULL 			COMMENT 'user_users_id that updated the record last time',
  `updated_date` 	datetime 			NOT NULL 			COMMENT 'Record last time updated date/time',
  `deleted_by` 		int(10) 	unsigned 			DEFAULT NULL 	COMMENT 'user_users_id that deleted the record last time',
  `deleted_date` 	datetime 					DEFAULT NULL 	COMMENT 'Record last time deleted date/time',
  `deleted` 		tinyint(1) 	unsigned 	NOT NULL 	DEFAULT '0' 	COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with country information';

--
-- Table structure for table `geo_provinces`
--
DROP TABLE IF EXISTS `geo_provinces`;
CREATE TABLE `geo_provinces` (
  `id` 			int(10) 	unsigned 	NOT NULL                        COMMENT 'Tables unique identifier',
  `geo_countries_id` 	int(10) 	unsigned 	NOT NULL			COMMENT 'Country id (Foreign key, Unique table key)',
  `name` 		varchar(128) 			NOT NULL			COMMENT 'Province name (Unique table key)',
  `code` 		varchar(45) 			NOT NULL			COMMENT 'Province code',
  `type` 		varchar(45) 					DEFAULT NULL	COMMENT 'Province type (Unique table key)',
  `active` 		tinyint(1) 	unsigned 	NOT NULL 	DEFAULT '0'	COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by` 		int(10) 	unsigned 	NOT NULL 			COMMENT 'user_users_id that created the record',
  `created_date` 	datetime 			NOT NULL 			COMMENT 'Record creation date/time',
  `updated_by` 		int(10) 	unsigned 	NOT NULL 			COMMENT 'user_users_id that updated the record last time',
  `updated_date` 	datetime 			NOT NULL 			COMMENT 'Record last time updated date/time',
  `deleted_by` 		int(10) 	unsigned 			DEFAULT NULL 	COMMENT 'user_users_id that deleted the record last time',
  `deleted_date` 	datetime 					DEFAULT NULL 	COMMENT 'Record last time deleted date/time',
  `deleted` 		tinyint(1) 	unsigned 	NOT NULL 	DEFAULT '0' 	COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with state/province/territory information';

--
-- Table structure for table `geo_cities`
--
DROP TABLE IF EXISTS `geo_cities`;
CREATE TABLE `geo_cities` (
  `id` 			int(10) 	unsigned 	NOT NULL                        COMMENT 'Tables unique identifier',
  `geo_countries_id` 	int(10) 	unsigned 	NOT NULL			COMMENT 'Country id (Foreign key, Unique table key)',
  `geo_provinces_id` 	int(10) 	unsigned 			DEFAULT NULL	COMMENT 'Province id (Foreign key, Unique table key)',
  `name` 		varchar(255) 			NOT NULL			COMMENT 'City name (Unique table key)',
  `latitude` 		varchar(10) 					DEFAULT NULL	COMMENT 'Citys latitude',
  `longitude` 		varchar(10) 					DEFAULT NULL	COMMENT 'Citys longitude',
  `active` 		tinyint(1) 	unsigned 	NOT NULL	DEFAULT '0'	COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by` 		int(10) 	unsigned 	NOT NULL			COMMENT 'user_users_id that created the record',
  `created_date` 	datetime 			NOT NULL			COMMENT 'Record creation date/time',
  `updated_by` 		int(10) 	unsigned 	NOT NULL			COMMENT 'user_users_id that updated the record last time',
  `updated_date` 	datetime 			NOT NULL			COMMENT 'Record last time updated date/time',
  `deleted_by` 		int(10) 	unsigned 			DEFAULT NULL	COMMENT 'user_users_id that deleted the record last time',
  `deleted_date` 	datetime 					DEFAULT NULL	COMMENT 'Record last time deleted date/time',
  `deleted` 		tinyint(1) 	unsigned 	NOT NULL	DEFAULT '0'	COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with cities information';

--
-- Table structure for table `cnt_contact_types`
--
DROP TABLE IF EXISTS `cnt_contact_types`;
CREATE TABLE `cnt_contact_types` (
  `id` 				int(10) 	unsigned 	NOT NULL                	COMMENT 'Tables unique identifier',
  `unit_organizations_id` 	int(10) 	unsigned 	NOT NULL			COMMENT 'Organizations id (Foreign key, Unique table key)',
  `name` 			varchar(128) 			NOT NULL			COMMENT 'Contact type name (Unique table key)',
  `description_key` 		varchar(45) 			NOT NULL			COMMENT 'Description key (Translation not in use)',
  `active` 			tinyint(1) 	unsigned 	NOT NULL 	DEFAULT '0'	COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by` 			int(10) 	unsigned 	NOT NULL			COMMENT 'user_users_id that created the record',
  `created_date` 		datetime 			NOT NULL			COMMENT 'Record creation date/time',
  `updated_by` 			int(10) 	unsigned 	NOT NULL			COMMENT 'user_users_id that updated the record last time',
  `updated_date` 		datetime 			NOT NULL			COMMENT 'Record last time updated date/time',
  `deleted_by` 			int(10) 	unsigned 			DEFAULT NULL	COMMENT 'user_users_id that deleted the record last time',
  `deleted_date` 		datetime 					DEFAULT NULL	COMMENT 'Record last time deleted date/time',
  `deleted` 			tinyint(1) 			NOT NULL 	DEFAULT '0'	COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with type of contact information';

--
-- Table structure for table `cnt_contacts`
--
DROP TABLE IF EXISTS `cnt_contacts`;
CREATE TABLE `cnt_contacts` (
  `id` 				int(10) 	unsigned 	NOT NULL                	COMMENT 'Tables unique identifier',
  `unit_organizations_id` 	int(10) 	unsigned 	NOT NULL			COMMENT 'Organizations id (Foreign key, Unique table key)',
  `company_name` 		varchar(128) 					DEFAULT NULL	COMMENT 'Contact company name (Unique table key)',
  `name` 			varchar(45) 			NOT NULL			COMMENT 'Contact first name (Unique table key)',
  `surename` 			varchar(128) 			NOT NULL			COMMENT 'Contact surename (Unique table key)',
  `active` 			tinyint(1) 	unsigned 	NOT NULL 	DEFAULT '0'	COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by` 			int(10) 	unsigned 	NOT NULL			COMMENT 'user_users_id that created the record',
  `created_date` 		datetime 			NOT NULL			COMMENT 'Record creation date/time',
  `updated_by` 			int(11) 			NOT NULL			COMMENT 'user_users_id that updated the record last time',
  `updated_date` 		datetime 			NOT NULL			COMMENT 'Record last time updated date/time',
  `deleted_by` 			int(10) 	unsigned 			DEFAULT NULL	COMMENT 'user_users_id that deleted the record last time',
  `deleted_date` 		datetime 					DEFAULT NULL	COMMENT 'Record last time deleted date/time',
  `deleted` 			tinyint(1) 	unsigned 	NOT NULL 	DEFAULT '0'	COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with the basic contact information';

--
-- Table structure for table `cnt_emails`
--
DROP TABLE IF EXISTS `cnt_emails`;
CREATE TABLE `cnt_emails` (
`id` 				int(10) 	unsigned 	NOT NULL                	COMMENT 'Tables unique identifier',
  `unit_organizations_id` 	int(10) 	unsigned 	NOT NULL			COMMENT 'Organizations id (Foreign key, Unique table key)',
  `cnt_contact_types_id` 	int(10) 	unsigned 	NOT NULL			COMMENT 'Type of contact (Foreign key, Unique table key)',
  `cnt_contacts_id` 		int(10) 	unsigned 	NOT NULL			COMMENT 'Contact record (Foreign key, Unique table key)',
  `email` 			varchar(255) 			NOT NULL			COMMENT 'email (Unique table key)',	
  `active` 			tinyint(1) 	unsigned 	NOT NULL 	DEFAULT '0'	COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by` 			int(10) 	unsigned 	NOT NULL			COMMENT 'user_users_id that created the record',
  `created_date` 		datetime 			NOT NULL			COMMENT 'Record creation date/time',
  `updated_by` 			int(10) 	unsigned 	NOT NULL			COMMENT 'user_users_id that updated the record last time',
  `updated_date` 		datetime 			NOT NULL			COMMENT 'Record last time updated date/time',
  `deleted_by` 			int(10) 	unsigned 			DEFAULT NULL	COMMENT 'user_users_id that deleted the record last time',
  `deleted_date` 		datetime 					DEFAULT NULL	COMMENT 'Record last time deleted date/time',
  `deleted` 			tinyint(1) 	unsigned 	NOT NULL 	DEFAULT '0'	COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with the email contact information';

--
-- Table structure for table `cnt_phones`
--
DROP TABLE IF EXISTS `cnt_phones`;
CREATE TABLE `cnt_phones` (
`id` 				int(10) 	unsigned	NOT NULL                	COMMENT 'Tables unique identifier',
  `unit_organizations_id` 	int(10) 	unsigned 	NOT NULL			COMMENT 'Organizations id (Foreign key, Unique table key)',
  `cnt_contact_types_id` 	int(10) 	unsigned 	NOT NULL			COMMENT 'Type of contact (Foreign key, Unique table key)',
  `cnt_contacts_id` 		int(10) 	unsigned 	NOT NULL			COMMENT 'Contact record (Foreign key, Unique table key)',
  `geo_country_id` 		int(10) 	unsigned 	NOT NULL			COMMENT 'Phone country (Foreign key, Unique table key)',
  `phone` 			varchar(20) 			NOT NULL			COMMENT 'Phone information (Unique table key)',
  `active` 			tinyint(1) 	unsigned 	NOT NULL 	DEFAULT '0'	COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by` 			int(10) 	unsigned 	NOT NULL			COMMENT 'user_users_id that created the record',
  `created_date` 		datetime 			NOT NULL			COMMENT 'Record creation date/time',
  `updated_by` 			int(10) 	unsigned 	NOT NULL			COMMENT 'user_users_id that updated the record last time',
  `updated_date` 		datetime 			NOT NULL			COMMENT 'Record last time updated date/time',
  `deleted_by` 			int(10) 	unsigned 			DEFAULT NULL	COMMENT 'user_users_id that deleted the record last time',
  `deleted_date` 		datetime 					DEFAULT NULL	COMMENT 'Record last time deleted date/time',
  `deleted` 			tinyint(1) 	unsigned 	NOT NULL	DEFAULT '0'	COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with the phone contact information';

--
-- Table structure for table `cnt_addresses`
--
DROP TABLE IF EXISTS `cnt_addresses`;
CREATE TABLE `cnt_addresses` (
`id`                      int(10)     unsigned    NOT NULL                      COMMENT 'Tables unique identifier',
  `unit_organizations_id`   int(10)     unsigned    NOT NULL                    COMMENT 'Organizations id (Foreign key, Unique table key)',
  `cnt_contacts_id`         int(10)     unsigned    NOT NULL                    COMMENT 'Contact record (Foreign key, Unique table key)',
  `cnt_contact_types_id`    int(10)     unsigned    NOT NULL                    COMMENT 'Type of contact (Foreign key, Unique table key)',
  `geo_countries_id`        int(10)     unsigned    NOT NULL                    COMMENT 'Address country (Foreign key, Unique table key)',
  `geo_provinces_id`        int(10)     unsigned                DEFAULT NULL    COMMENT 'Address province if exists (Foreign key, Unique table key)',
  `geo_cities_id`           int(10)     unsigned    NOT NULL                    COMMENT 'Address city (Foreign key, Unique table key)',
  `neigborhood`             varchar(128)                        DEFAULT NULL    COMMENT 'Address neigborhood (Unique table key)',
  `zip_code`                varchar(45)                         DEFAULT NULL    COMMENT 'Address zip code (Unique table key)',
  `street_address`          varchar(255)            NOT NULL                    COMMENT 'Address line (Unique table key)',
  `door_number`             varchar(12)                         DEFAULT NULL    COMMENT 'Address door number (Unique table key)',
  `room`                    varchar(45)                         DEFAULT NULL    COMMENT 'Address room (Unique table key)',
  `active`                  tinyint(1)  unsigned    NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`            datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`            datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`              int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`            datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`                 tinyint(1) unsigned     NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with the address contact information';

--
-- Table structure for table `app_modules`
--
DROP TABLE IF EXISTS `app_modules`;
CREATE TABLE `app_modules` (
  `id`              int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `name`            varchar(128)            NOT NULL                    COMMENT 'Modules name (Unique table key)',
  `key`             varchar(32)             NOT NULL                    COMMENT 'MD5 of the module name',
  `active`          tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`      int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`    datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`      int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`    datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`      int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`    datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`         tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with module names for user access permissions';

--
-- Table structure for table `app_controllers`
--
DROP TABLE IF EXISTS `app_controllers`;
CREATE TABLE `app_controllers` (
  `id`              int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `app_modules_id`  int(10)     unsigned    NOT NULL                    COMMENT 'Module id (Foreign key, Unique table key)',
  `name`            varchar(128)            NOT NULL                    COMMENT 'Controller name (Unique table key)',
  `key`             varchar(32)             NOT NULL                    COMMENT 'MD5 of the controller name',
  `active`          tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`      int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`    datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`      int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`    datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`      int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`    datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`         tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with module->controller names for user access permissions';

--
-- Table structure for table `app_actions`
--
DROP TABLE IF EXISTS `app_actions`;
CREATE TABLE `app_actions` (
  `id`                  int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `app_modules_id`      int(10)     unsigned    NOT NULL                    COMMENT 'Module id (Foreign key, Unique table key)',
  `app_controllers_id`  int(10)     unsigned    NOT NULL                    COMMENT 'Controller id (Foreign key, Unique table key)',
  `name`                varchar(128)            NOT NULL                    COMMENT 'Action name (Unique table key)',
  `key`                 varchar(32)             NOT NULL                    COMMENT 'MD5 of the action name',
  `active`              tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`          int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`        datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`          int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`        datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`          int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`        datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`             tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with module->controller->action names for user access permissions';

--
-- Table structure for table `flux_boards`
--
DROP TABLE IF EXISTS `flux_boards`;
CREATE TABLE `flux_boards` (
  `id`                      int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `unit_organizations_id`   int(10)     unsigned    NOT NULL                    COMMENT 'Organizations id (Foreign key, Unique table key)',
  `name`                    varchar(128)            NOT NULL                    COMMENT 'Board name (Unique table key)',
  `description_key`         varchar(45)             NOT NULL                    COMMENT 'Board key for translation purposes (Not yet implemented!)',
  `active`                  tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`            datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`            datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`              int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`            datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`                 tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with flux boards information';

--
-- Table structure for table `flux_event_types`
--
DROP TABLE IF EXISTS `flux_event_types`;
CREATE TABLE `flux_event_types` (
  `id`                      int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `unit_organizations_id`   int(10)     unsigned    NOT NULL                    COMMENT 'Organizations id (Foreign key, Unique table key)',
  `name`                    varchar(64)             NOT NULL                    COMMENT 'Event name (Unique table key)',
  `description_key`         varchar(45)             NOT NULL                    COMMENT 'Event type key for translation purposes (Not yet implemented!)',
  `active`                  tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`            datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`            datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`              int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`            datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`                 tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with the information about types of flux events';

--
-- Table structure for table `flux_events`
--
DROP TABLE IF EXISTS `flux_events`;
CREATE TABLE `flux_events` (
  `id`                      int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `flux_event_types_id`     int(10)     unsigned    NOT NULL                    COMMENT 'Lead event type id (Foreign key)',
  `flux_fluxes_id`          int(10)     unsigned    NOT NULL                    COMMENT 'Lead id (Foreign key)',
  `flux_messages_id`        int(10)     unsigned    NOT NULL                    COMMENT 'Lead message id (Foreign key)',
  `active`                  tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`            datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`            datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`              int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`            datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`                 tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with the information about the events that occured on a flux message';

--
-- Table structure for table `flux_field_types`
--
DROP TABLE IF EXISTS `flux_field_types`;
CREATE TABLE `flux_field_types` (
  `id`                      int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `unit_organizations_id`   int(10)     unsigned    NOT NULL                    COMMENT 'Organizations id (Foreign key, Unique table key)',
  `name`                    varchar(64)             NOT NULL                    COMMENT 'Lead type name (Unique table key)',
  `description_key`         varchar(45)             NOT NULL                    COMMENT 'Field key for translation purposes (Not yet implemented!)',
  `active`                  tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`            datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`            datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`              int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`            datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`                 tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with the information about the type of fields possible to use inthin a flux';

--
-- Table structure for table `flux_flows`
--
--
DROP TABLE IF EXISTS `flux_flows`;
CREATE TABLE `flux_flows` (
  `id`                              int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `unit_organizations_id`           int(10)     unsigned    NOT NULL                    COMMENT 'Origin Organizations id (Foreign key, Unique table key)',
  `flux_boards_id`                  int(10)     unsigned    NOT NULL                    COMMENT 'Origin Board id (Foreign key, Unique table key)',
  `flux_steps_id`                   int(10)     unsigned    NOT NULL                    COMMENT 'Origin Step id (Foreign key, Unique table key)',
  `destination_organizations_id`    int(10)     unsigned    NOT NULL                    COMMENT 'Destination Organizations id (Foreign key, Unique table key)',
  `deatination_boards_id`           int(10)     unsigned    NOT NULL                    COMMENT 'Destination Board id (Foreign key, Unique table key)',
  `destination_steps_id`            int(10)     unsigned    NOT NULL                    COMMENT 'Destination Step id (Foreign key, Unique table key)',
  `active`                          tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`                      int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`                    datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`                      int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`                    datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`                      int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`                    datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`                         tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with the information that defines the flow of a flux';

--
-- Table structure for table `flux_fluxes`
--
DROP TABLE IF EXISTS `flux_fluxes`;
CREATE TABLE `flux_fluxes` (
  `id`                      int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `unit_organizations_id`   int(10)     unsigned    NOT NULL                    COMMENT 'Origin Organizations id (Foreign key)',
  `flux_origins_id`         int(10)     unsigned    NOT NULL                    COMMENT 'Lead origin id (Foreign key)',
  `flux_status_id`          int(10)     unsigned    NOT NULL                    COMMENT 'Lead current status id (Foreign key)',
  `flux_subjects_id`        int(10)     unsigned    NOT NULL                    COMMENT 'Lead subject id (Foreign key)',
  `flux_boards_id`          int(10)     unsigned    NOT NULL                    COMMENT 'Lead current board id (Foreign key)',
  `flux_steps_id`           int(10)     unsigned    NOT NULL                    COMMENT 'Lead current step id (Foreign key)',
  `owner_id`                int(10)     unsigned                DEFAULT NULL    COMMENT 'Lead current owner id (Foreign key)',
  `flux_priorities_id`      int(10)     unsigned    NOT NULL                    COMMENT 'Lead current priority id (Foreign key)',
  `cnt_contact_id`          int(10)     unsigned                DEFAULT NULL    COMMENT 'Lead origin contact id (Foreign key)',
  `email`                   varchar(255)                        DEFAULT NULL    COMMENT 'Lead email address if exists',
  `phone`                   varchar(20)                         DEFAULT NULL    COMMENT 'Lead phone if exists',
  `other`                   varchar(255)                        DEFAULT NULL    COMMENT 'Lead other contact information if exists',
  `active`                  tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`            datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`            datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`              int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`            datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`                 tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with the information about a specific flux';

--
-- Table structure for table `flux_messages`
--
DROP TABLE IF EXISTS `flux_messages`;
CREATE TABLE `flux_messages` (
  `id`                      int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `unit_organizations_id`   int(10)     unsigned    NOT NULL                    COMMENT 'Origin Organizations id (Foreign key)',
  `flux_fluxes_id`           int(10)     unsigned    NOT NULL                    COMMENT 'Lead id (Foreign key)',
  `origin_id`               int(10)     unsigned    NOT NULL                    COMMENT 'Origin contact id (Foreign key)',
  `destination_id`          int(10)     unsigned    NOT NULL                    COMMENT 'Destination contact id (Foreign key)',
  `subject`                 varchar(255)                        DEFAULT NULL    COMMENT 'Message subject',
  `message`                 text                    NOT NULL                    COMMENT 'Message text',
  `active`                  tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`            datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`            datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`              int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`            datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`                 tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with the information about a specific flux message';

--
-- Table structure for table `flux_origins`
--
DROP TABLE IF EXISTS `flux_origins`;
CREATE TABLE `flux_origins` (
  `id`                      int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `unit_organizations_id`   int(10)     unsigned    NOT NULL                    COMMENT 'Organizations id (Foreign key, Unique table key)',
  `name`                    varchar(64)             NOT NULL                    COMMENT 'Origin name (Unique table key)',
  `description_key`         varchar(45)             NOT NULL                    COMMENT 'Field key for translation purposes (Not yet implemented!)',
  `active`                  tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`            datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`            datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`              int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`            datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`                 tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with the information about the possible origins for a flux to enter the system';

--
-- Table structure for table `flux_priorities`
--
DROP TABLE IF EXISTS `flux_priorities`;
CREATE TABLE `flux_priorities` (
  `id`                      int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `unit_organizations_id`   int(10)     unsigned    NOT NULL                    COMMENT 'Organizations id (Foreign key, Unique table key, Second unique table key)',
  `name`                    varchar(64)             NOT NULL                    COMMENT 'Priority name (Unique table key)',
  `description_key`         varchar(45)             NOT NULL                    COMMENT 'Field key for translation purposes (Not yet implemented!)',
  `priority_order`          int(11)                 NOT NULL    DEFAULT '0'     COMMENT 'Priority order value for priority sort (Second unique table key)',
  `active`                  tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`            datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`            datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`              int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`            datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`                 tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with the information about the possible flux priorities';

--
-- Table structure for table `flux_status`
--
DROP TABLE IF EXISTS `flux_status`;
CREATE TABLE `flux_status` (
  `id`                      int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `unit_organizations_id`   int(10)     unsigned    NOT NULL                    COMMENT 'Organizations id (Foreign key, Unique table key)',
  `name`                    varchar(64)             NOT NULL                    COMMENT 'Status name (Unique table key)',
  `description_key`         varchar(45)             NOT NULL                    COMMENT 'Field key for translation purposes (Not yet implemented!)',
  `active`                  tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`            datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`            datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`              int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`            datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`                 tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB DEFAULT 
CHARSET=utf8
COMMENT='Table with the information about the possible flux status';

--
-- Table structure for table `flux_step_field_values`
--
DROP TABLE IF EXISTS `flux_step_field_values`;
CREATE TABLE `flux_step_field_values` (
  `id`                  int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `flux_fluxes_id`       int(10)     unsigned    NOT NULL                    COMMENT 'Lead id to which the value belongs to (Foreign key, Unique table key)',
  `flux_step_fields_id` int(10)     unsigned    NOT NULL                    COMMENT 'Lead step id that generated the value (Foreign key, Unique table key)',
  `val_int`             int(11)                             DEFAULT NULL    COMMENT 'Integer value',
  `val_char`            varchar(255)                        DEFAULT NULL    COMMENT 'Char value',
  `val_text`            text                                DEFAULT NULL    COMMENT 'Text value',
  `val_bool`            tinyint(1)                          DEFAULT NULL    COMMENT 'Boolean value',
  `val_decimal`         decimal(15,3)                       DEFAULT NULL    COMMENT 'Decimal value',
  `active`              tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`          int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`        datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`          int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`        datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`          int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`        datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`             tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with the information about the flux step field values';

--
-- Table structure for table `flux_step_fields`
--
DROP TABLE IF EXISTS `flux_step_fields`;
CREATE TABLE `flux_step_fields` (
  `id`                      int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `parent_id`               int(10)     unsigned                DEFAULT NULL    COMMENT 'Parent field id (Foreign key, Unique table key)',
  `flux_field_types_id`     int(10)     unsigned    NOT NULL                    COMMENT 'Field type id (Foreign key, Unique table key)',
  `unit_organizations_id`   int(10)     unsigned    NOT NULL                    COMMENT 'Organization id (Foreign key, Unique table key)',
  `flux_subjects_id`        int(10)     unsigned    NOT NULL                    COMMENT 'Lead subject id (Foreign key, Unique table key)',
  `flux_steps_id`           int(10)     unsigned    NOT NULL                    COMMENT 'Lead step id (Foreign key, Unique table key)',
  `val_type`                int(10)     unsigned    NOT NULL                    COMMENT 'Field type (0=Int, 1=Char, 2=Text, 3=Boolean, 4=Decimal)',
  `field_caption`           varchar(128)            NOT NULL                    COMMENT 'Field screen caption',
  `description_key`         varchar(45)             NOT NULL                    COMMENT 'Field key for translation purposes (Not yet implemented!)',
  `field_name`              varchar(128)            NOT NULL                    COMMENT 'Actual name of the field',
  `active`                  tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`            datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`            datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`              int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`            datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`                 tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with the information about the fields for every flux step in the flux flow';

--
-- Table structure for table `flux_steps`
--
DROP TABLE IF EXISTS `flux_steps`;
CREATE TABLE `flux_steps` (
  `id`                      int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `unit_organizations_id`   int(10)     unsigned    NOT NULL                    COMMENT 'Origanization id (Foreign key, Unique table key, Second unique table key)',
  `flux_boards_id`          int(10)     unsigned    NOT NULL                    COMMENT 'Board id (Foreign key, Unique table key, Second unique table key)',
  `flux_subjects_id`        int(10)     unsigned    NOT NULL                    COMMENT 'Lead subject id (Foreign key, Unique table key, Second unique table key)',
  `name`                    varchar(64)             NOT NULL                    COMMENT 'Step name (Unique table key)',
  `description_key`         varchar(45)             NOT NULL                    COMMENT 'Field key for translation purposes (Not yet implemented!)',
  `step_order`              int(10)     unsigned    NOT NULL                    COMMENT 'Step order (Second unique table key)',
  `active`                  tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`            datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`            datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`              int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`            datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`                 tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with the information about the fields for every flux step in the flux flow';

--
-- Table structure for table `flux_subjects`
--
DROP TABLE IF EXISTS `flux_subjects`;
CREATE TABLE `flux_subjects` (
  `id`                      int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `unit_organizations_id`   int(10)     unsigned    NOT NULL                    COMMENT 'Origanization id (Foreign key, Unique table key)',
  `name`                    varchar(64)             NOT NULL                    COMMENT 'Subject name (Unique table key)',
  `description_key`         varchar(45)             NOT NULL                    COMMENT 'Field key for translation purposes (Not yet implemented!)',
  `active`                  tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`            datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`            datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`              int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`            datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`                 tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with the information about the flux predifined subjects';

--
-- Table structure for table `unit_organization_types`
--
DROP TABLE IF EXISTS `unit_organization_types`;
CREATE TABLE `unit_organization_types` (
  `id`              int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `name`            varchar(128)            NOT NULL                    COMMENT 'Origanization type name (Unique table key)',
  `description_key` varchar(45)             NOT NULL                    COMMENT 'Field key for translation purposes (Not yet implemented!)',
  `active`          tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`      int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`    datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`      int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`    datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`      int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`    datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`         tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with the information about the organizations types (Companies, Cost Centers, Directories, Departments, etc)';

LOCK TABLES `unit_organization_types` WRITE;
INSERT INTO `unit_organization_types` VALUES 
(1,'Company','',1,1,'2016-06-26 00:00:00',1,'2016-06-26 00:00:00',NULL,NULL,0);
UNLOCK TABLES;

--
-- Table structure for table `unit_organizations`
--
DROP TABLE IF EXISTS `unit_organizations`;
CREATE TABLE `unit_organizations` (
  `id`                          int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `parent_id`                   int(10)     unsigned                DEFAULT NULL    COMMENT 'Origanization id (Foreign key, Unique table key)',
  `unit_organization_types_id`  int(10)     unsigned    NOT NULL                    COMMENT 'Origanization type id (Foreign key, Unique table key)',
  `cnt_contacts_id`             int(10)     unsigned                DEFAULT NULL    COMMENT 'Origanization contact information',
  `name`                        varchar(128)            NOT NULL                    COMMENT 'Origanization name (Unique table key)',
  `active`                      tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`                  int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`                datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`                  int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`                datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`                  int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`                datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`                     tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB DEFAULT 
CHARSET=utf8
COMMENT='Table with the information about the organizations';

LOCK TABLES `unit_organizations` WRITE;
INSERT INTO `unit_organizations` VALUES 
(1,NULL,1,NULL,'System',1,1,'2016-06-26 00:00:00',1,'2016-06-26 00:00:00',NULL,NULL,0);
UNLOCK TABLES;

--
-- Table structure for table `unit_organization_hierarchy`
--
DROP TABLE IF EXISTS `unit_organization_hierarchy`;
CREATE TABLE `unit_organization_hierarchy` (
  `id`                          int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `unit_organizations_id`       int(10)     unsigned    NOT NULL                    COMMENT 'Origanization id (Foreign key, Unique table key)',
  `unit_parent_child_id`        int(10)     unsigned    NOT NULL                    COMMENT 'Descent or Ascend organization id',
  `direction`                   tinyint(1)              NOT NULL                    COMMENT 'Upwards (parent) = 0, Dowards (child) = 1',
  `active`                      tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`                  int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`                datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`                  int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`                datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`                  int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`                datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`                     tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB DEFAULT 
CHARSET=utf8
COMMENT='Table with the information about all descent or ascent organizations in an organization tree';

--
-- Table structure for table `user_assigned_organizations`
--
DROP TABLE IF EXISTS `user_assigned_organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_assigned_organizations` (
  `id`                      int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `unit_organizations_id`   int(10)     unsigned    NOT NULL                    COMMENT 'Origanization id (Foreign key, Unique table key)',
  `user_users_id`           int(10)     unsigned    NOT NULL                    COMMENT 'User id (Foreign key, Unique table key)',
  `active`                  tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`            datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`            datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`              int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`            datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`                 tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8 
COMMENT='Table with the information about the organizations a user is assigned to';

--
-- Table structure for table `user_assingned_roles`
--
DROP TABLE IF EXISTS `user_assingned_roles`;
CREATE TABLE `user_assingned_roles` (
  `id`                      int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `unit_organizations_id`   int(10)     unsigned    NOT NULL                    COMMENT 'Origanization id (Foreign key, Unique table key)',
  `user_roles_id`           int(10)     unsigned    NOT NULL                    COMMENT 'Role id (Foreign key, Unique table key)',
  `user_users_id`           int(10)     unsigned    NOT NULL                    COMMENT 'User id (Foreign key, Unique table key)',
  `active`                  tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`            datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`            datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`              int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`            datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`                 tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with the information about the roles a user is assigned to';

--
-- Table structure for table `user_role_permissions`
--
DROP TABLE IF EXISTS `user_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role_permissions` (
  `id`                      int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `app_modules_id`          int(10)     unsigned    NOT NULL                    COMMENT 'Module id (Foreign key, Unique table key)',
  `app_controllers_id`      int(10)     unsigned    NOT NULL                    COMMENT 'Controller id (Foreign key, Unique table key)',
  `app_actions_id`          int(10)     unsigned    NOT NULL                    COMMENT 'Action id (Foreign key, Unique table key)',
  `user_roles_id`           int(10)     unsigned    NOT NULL                    COMMENT 'Role id (Foreign key, Unique table key)',
  `name`                    varchar(128)            NOT NULL                    COMMENT 'Permission name (Unique table key)',
  `active`                  tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`            datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`            datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`              int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`            datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`                 tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with the information about the the access permission a role has';

--
-- Table structure for table `user_roles`
--
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `id`                      int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `unit_organizations_id`   int(10)     unsigned    NOT NULL                    COMMENT 'Origanization id (Foreign key, Unique table key)',
  `name`                    varchar(128)            NOT NULL                    COMMENT 'Role name (Unique table key)',
  `description`             varchar(255)            NOT NULL                    COMMENT 'Role description',
  `description_key`         varchar(45)             NOT NULL                    COMMENT 'Field key for translation purposes (Not yet implemented!)',
  `active`                  tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`            datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`            datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`              int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`            datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`                 tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with the information about the the user roles';

--
-- Table structure for table `user_users`
--
DROP TABLE IF EXISTS `user_users`;
CREATE TABLE `user_users` (
  `id`                      int(10)     unsigned    NOT NULL                    COMMENT 'Tables unique identifier',
  `unit_organizations_id`   int(10)     unsigned                DEFAULT NULL    COMMENT 'Origanization id (Foreign key) Head of organization',
  `first_name`              varchar(64)             NOT NULL                    COMMENT 'User first name',
  `surename`                varchar(128)            NOT NULL                    COMMENT 'User surename',
  `email`                   varchar(255)            NOT NULL                    COMMENT 'User email address for login',
  `password`                varchar(255)            NOT NULL                    COMMENT 'User encrypted password',
  `last_login`              datetime                NOT NULL                    COMMENT 'Date and Time of the user last login',
  `last_operation`          datetime                NOT NULL                    COMMENT 'Date and Time of the user last operation',
  `active`                  tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is active 0 = No, 1 = Yes',
  `created_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that created the record',
  `created_date`            datetime                NOT NULL                    COMMENT 'Record creation date/time',
  `updated_by`              int(10)     unsigned    NOT NULL                    COMMENT 'user_users_id that updated the record last time',
  `updated_date`            datetime                NOT NULL                    COMMENT 'Record last time updated date/time',
  `deleted_by`              int(10)     unsigned                DEFAULT NULL    COMMENT 'user_users_id that deleted the record last time',
  `deleted_date`            datetime                            DEFAULT NULL    COMMENT 'Record last time deleted date/time',
  `deleted`                 tinyint(1)              NOT NULL    DEFAULT '0'     COMMENT 'Record is deleted 0 = No, 1 = Yes'
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8
COMMENT='Table with the information about the the users'
;

--
-- Dumping data for table `user_users`
--

LOCK TABLES `user_users` WRITE;
INSERT INTO `user_users` VALUES 
(1,1,'The','System','root@spagiweb.com.br','','2017-01-01 00:00:00','2017-01-01 00:00:00',0,1,'2016-06-26 00:00:00',1,'2016-06-26 00:00:00',NULL,NULL,0),
(2,1,'João','Ribeiro da Silva','joao.r.silva@gmail.com','46bc3d91430f90d44b68b1334b9a978e','2017-02-09 17:32:56','2017-02-09 17:32:56',1,1,'2016-06-26 00:00:00',1,'2017-02-04 12:39:25',NULL,NULL,0);
UNLOCK TABLES;

SET FOREIGN_KEY_CHECKS=1;
SET UNIQUE_CHECKS=1;

