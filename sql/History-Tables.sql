SET UNIQUE_CHECKS=0;
SET FOREIGN_KEY_CHECKS=0;

--
-- Schema
--
USE `fluxflow`;

--
-- Table structure for table `zhist_geo_countries`
--
DROP TABLE IF EXISTS `zhist_geo_countries`;
CREATE TABLE `zhist_geo_countries` (
  `id` 			int(10)		unsigned    NOT NULL AUTO_INCREMENT,
  `original_id`		int(10)		unsigned    DEFAULT NULL,
  `name` 		varchar(128)                DEFAULT NULL,
  `code_1` 		char(2)                     DEFAULT NULL,
  `code_2` 		varchar(3)                  DEFAULT NULL,
  `phone_code` 		varchar(4)                  DEFAULT NULL,
  `active` 		tinyint(1) 	unsigned    DEFAULT NULL,
  `created_by` 		int(10) 	unsigned    DEFAULT NULL,
  `created_date` 	datetime                    DEFAULT NULL,
  `updated_by` 		int(10) 	unsigned    DEFAULT NULL,
  `updated_date` 	datetime                    DEFAULT NULL,
  `deleted_by` 		int(10) 	unsigned    DEFAULT NULL,
  `deleted_date` 	datetime                    DEFAULT NULL,
  `deleted` 		tinyint(1) 	unsigned    DEFAULT NULL,
  PRIMARY	KEY (`id`),
  UNIQUE 	KEY `id_UNIQUE` (`id`),
                KEY `idx_zhist_geo_countries_original` (`original_id`)
) 
ENGINE=MyISAM 
DEFAULT CHARSET=utf8
COMMENT='History table for geo_countries table';

--
-- Table structure for table `zhist_geo_provinces`
--
DROP TABLE IF EXISTS `zhist_geo_provinces`;
CREATE TABLE `zhist_geo_provinces` (
  `id` 			int(10) 	unsigned 	NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
  `original_id`		int(10)		unsigned	DEFAULT NULL,
  `geo_countries_id` 	int(10) 	unsigned 	DEFAULT NULL,
  `name` 		varchar(128) 			DEFAULT NULL,
  `code` 		varchar(45) 			DEFAULT NULL,
  `type` 		varchar(45) 			DEFAULT NULL,
  `active` 		tinyint(1) 	unsigned 	DEFAULT NULL,
  `created_by` 		int(10) 	unsigned 	DEFAULT NULL,
  `created_date` 	datetime 			DEFAULT NULL,
  `updated_by` 		int(10) 	unsigned 	DEFAULT NULL,
  `updated_date` 	datetime 			DEFAULT NULL,
  `deleted_by` 		int(10) 	unsigned 	DEFAULT NULL,
  `deleted_date` 	datetime 			DEFAULT NULL,
  `deleted` 		tinyint(1) 	unsigned 	DEFAULT NULL,
  PRIMARY 	KEY (`id`),
  UNIQUE 	KEY `id_UNIQUE` (`id`),
                KEY `idx_zhist_geo_provinces_original` (`original_id`)
) 
ENGINE=MyISAM 
DEFAULT CHARSET=utf8
COMMENT='History table for geo_provinces table';
;

--
-- Table structure for table `zhist_geo_cities`
--
DROP TABLE IF EXISTS `zhist_geo_cities`;
CREATE TABLE `zhist_geo_cities` (
  `id` 			int(10) 	unsigned 	NOT NULL AUTO_INCREMENT	COMMENT 'Tables unique identifier',
  `original_id`		int(10)		unsigned	DEFAULT NULL,
  `geo_countries_id` 	int(10) 	unsigned 	DEFAULT NULL,
  `geo_provinces_id` 	int(10) 	unsigned 	DEFAULT NULL,
  `name` 		varchar(255) 			DEFAULT NULL,
  `latitude` 		varchar(10) 			DEFAULT NULL,
  `longitude` 		varchar(10) 			DEFAULT NULL,
  `active` 		tinyint(1) 	unsigned 	DEFAULT NULL,
  `created_by` 		int(10) 	unsigned 	DEFAULT NULL,
  `created_date` 	datetime 			DEFAULT NULL,
  `updated_by` 		int(10) 	unsigned 	DEFAULT NULL,
  `updated_date` 	datetime 			DEFAULT NULL,
  `deleted_by` 		int(10) 	unsigned 	DEFAULT NULL,
  `deleted_date` 	datetime 			DEFAULT NULL,
  `deleted` 		tinyint(1) 	unsigned 	DEFAULT NULL,
  PRIMARY 	KEY (`id`),
  UNIQUE 	KEY `id_UNIQUE` (`id`),
                KEY `idx_zhist_geo_cities_original` (`original_id`)
) 
ENGINE=MyISAM 
DEFAULT CHARSET=utf8
COMMENT='History table for geo_cities table';

--
-- Table structure for table `zhist_cnt_contact_types`
--
DROP TABLE IF EXISTS `zhist_cnt_contact_types`;
CREATE TABLE `zhist_cnt_contact_types` (
  `id` 				int(10) 	unsigned 	NOT NULL AUTO_INCREMENT	COMMENT 'Tables unique identifier',
  `original_id`                 int(10)		unsigned	DEFAULT NULL,
  `unit_organizations_id` 	int(10) 	unsigned 	DEFAULT NULL,
  `name` 			varchar(128) 			DEFAULT NULL,
  `description_key` 		varchar(45) 			DEFAULT NULL,
  `active` 			tinyint(1) 	unsigned 	DEFAULT NULL,
  `created_by` 			int(10) 	unsigned 	DEFAULT NULL,
  `created_date` 		datetime 			DEFAULT NULL,
  `updated_by` 			int(10) 	unsigned 	DEFAULT NULL,
  `updated_date` 		datetime 			DEFAULT NULL,
  `deleted_by` 			int(10) 	unsigned 	DEFAULT NULL,
  `deleted_date` 		datetime 			DEFAULT NULL,
  `deleted` 			tinyint(1) 			DEFAULT NULL,
  PRIMARY 	KEY (`id`),
  UNIQUE 	KEY `id_UNIQUE` (`id`),
                KEY `idx_zhist_cnt_contact_types_original` (`original_id`)
) 
ENGINE=MyISAM 
DEFAULT CHARSET=utf8
COMMENT='History table for cnt_contact_types table';

--
-- Table structure for table `zhist_cnt_contacts`
--
DROP TABLE IF EXISTS `zhist_cnt_contacts`;
CREATE TABLE `zhist_cnt_contacts` (
  `id` 				int(10) 	unsigned 	NOT NULL AUTO_INCREMENT	COMMENT 'Tables unique identifier',
  `original_id`                 int(10)		unsigned	DEFAULT NULL,
  `unit_organizations_id` 	int(10) 	unsigned 	DEFAULT NULL,
  `company_name` 		varchar(128) 			DEFAULT NULL,
  `name` 			varchar(45) 			DEFAULT NULL,
  `surename` 			varchar(128) 			DEFAULT NULL,
  `active` 			tinyint(1) 	unsigned 	DEFAULT NULL,
  `created_by` 			int(10) 	unsigned 	DEFAULT NULL,
  `created_date` 		datetime 			DEFAULT NULL,
  `updated_by` 			int(11) 			DEFAULT NULL,
  `updated_date` 		datetime 			DEFAULT NULL,
  `deleted_by` 			int(10) 	unsigned 	DEFAULT NULL,
  `deleted_date` 		datetime 			DEFAULT NULL,
  `deleted` 			tinyint(1) 	unsigned 	DEFAULT NULL,
  PRIMARY 	KEY (`id`),
  UNIQUE 	KEY `id_UNIQUE` (`id`),
                KEY `idx_zhist_cnt_contacts_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for cnt_contacts table';

--
-- Table structure for table `zhist_cnt_emails`
--
DROP TABLE IF EXISTS `zhist_cnt_emails`;
CREATE TABLE `zhist_cnt_emails` (
  `id` 				int(10) 	unsigned 	NOT NULL AUTO_INCREMENT	COMMENT 'Tables unique identifier',
  `original_id`                 int(10)		unsigned	DEFAULT NULL,
  `unit_organizations_id` 	int(10) 	unsigned 	DEFAULT NULL,
  `cnt_contact_types_id` 	int(10) 	unsigned 	DEFAULT NULL,
  `cnt_contacts_id` 		int(10) 	unsigned 	DEFAULT NULL,
  `email` 			varchar(255) 			DEFAULT NULL,
  `active` 			tinyint(1) 	unsigned 	DEFAULT NULL,
  `created_by` 			int(10) 	unsigned 	DEFAULT NULL,
  `created_date` 		datetime 			DEFAULT NULL,
  `updated_by` 			int(10) 	unsigned 	DEFAULT NULL,
  `updated_date` 		datetime 			DEFAULT NULL,
  `deleted_by` 			int(10) 	unsigned 	DEFAULT NULL,
  `deleted_date` 		datetime 			DEFAULT NULL,
  `deleted` 			tinyint(1) 	unsigned 	DEFAULT NULL,
  PRIMARY 	KEY (`id`),
  UNIQUE 	KEY `cnt_emails_UNIQUE` (`id`),
                KEY `idx_zhist_cnt_emails_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for cnt_emails table';

--
-- Table structure for table `zhist_cnt_phones`
--
DROP TABLE IF EXISTS `zhist_cnt_phones`;
CREATE TABLE `zhist_cnt_phones` (
  `id` 				int(10) 	unsigned	NOT NULL	AUTO_INCREMENT	COMMENT 'Tables unique identifier',
  `original_id`                 int(10)		unsigned	DEFAULT NULL,
  `unit_organizations_id` 	int(10) 	unsigned 	DEFAULT NULL,
  `cnt_contact_types_id` 	int(10) 	unsigned 	DEFAULT NULL,
  `cnt_contacts_id` 		int(10) 	unsigned 	DEFAULT NULL,
  `geo_country_id` 		int(10) 	unsigned 	DEFAULT NULL,
  `phone` 			varchar(20) 			DEFAULT NULL,
  `active` 			tinyint(1) 	unsigned 	DEFAULT NULL,
  `created_by` 			int(10) 	unsigned 	DEFAULT NULL,
  `created_date` 		datetime 			DEFAULT NULL,
  `updated_by` 			int(10) 	unsigned 	DEFAULT NULL,
  `updated_date` 		datetime 			DEFAULT NULL,
  `deleted_by` 			int(10) 	unsigned 	DEFAULT NULL,
  `deleted_date` 		datetime 			DEFAULT NULL,
  `deleted` 			tinyint(1) 	unsigned 	DEFAULT NULL,
  PRIMARY 	KEY (`id`),
  UNIQUE 	KEY `id_UNIQUE` (`id`),
                KEY `idx_zhist_cnt_phones_original` (`original_id`)

) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for cnt_phones table';

--
-- Table structure for table `zhist_cnt_addresses`
--
DROP TABLE IF EXISTS `zhist_cnt_addresses`;
CREATE TABLE `zhist_cnt_addresses` (
  `id`                      int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`             int(10)	unsigned    DEFAULT NULL,
  `unit_organizations_id`   int(10)     unsigned    DEFAULT NULL,
  `cnt_contacts_id`         int(10)     unsigned    DEFAULT NULL,
  `cnt_contact_types_id`    int(10)     unsigned    DEFAULT NULL,
  `geo_countries_id`        int(10)     unsigned    DEFAULT NULL,
  `geo_provinces_id`        int(10)     unsigned    DEFAULT NULL,
  `geo_cities_id`           int(10)     unsigned    DEFAULT NULL,
  `neigborhood`             varchar(128)            DEFAULT NULL,
  `zip_code`                varchar(45)             DEFAULT NULL,
  `street_address`          varchar(255)            DEFAULT NULL,
  `door_number`             varchar(12)             DEFAULT NULL,
  `room`                    varchar(45)             DEFAULT NULL,
  `active`                  tinyint(1)  unsigned    DEFAULT NULL,
  `created_by`              int(10)     unsigned    DEFAULT NULL,
  `created_date`            datetime                DEFAULT NULL,
  `updated_by`              int(10)     unsigned    DEFAULT NULL,
  `updated_date`            datetime                DEFAULT NULL,
  `deleted_by`              int(10)     unsigned    DEFAULT NULL,
  `deleted_date`            datetime                DEFAULT NULL,
  `deleted`                 tinyint(1)  unsigned    DEFAULT NULL,
  PRIMARY   KEY (`id`),
  UNIQUE    KEY `id_UNIQUE` (`id`),
            KEY `idx_zhist_cnt_addresses_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for cnt_addresses table';

--
-- Table structure for table `zhist_app_actions`
--
DROP TABLE IF EXISTS `zhist_app_actions`;
CREATE TABLE `zhist_app_actions` (
  `id`                  int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`         int(10)     unsigned    DEFAULT NULL,
  `app_modules_id`      int(10)     unsigned    DEFAULT NULL,
  `app_controllers_id`  int(10)     unsigned    DEFAULT NULL,
  `name`                varchar(128)            DEFAULT NULL,
  `key`                 varchar(32)             DEFAULT NULL,
  `active`              tinyint(1)              DEFAULT NULL,
  `created_by`          int(10)     unsigned    DEFAULT NULL,
  `created_date`        datetime                DEFAULT NULL,
  `updated_by`          int(10)     unsigned    DEFAULT NULL,
  `updated_date`        datetime                DEFAULT NULL,
  `deleted_by`          int(10)     unsigned    DEFAULT NULL,
  `deleted_date`        datetime                DEFAULT NULL,
  `deleted`             tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY (`id`),
  UNIQUE    KEY `id_UNIQUE` (`id`),
            KEY `idx_zhist_app_actions_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for app_actions table';

--
-- Table structure for table `zhist_app_controllers`
--
DROP TABLE IF EXISTS `zhist_app_controllers`;
CREATE TABLE `zhist_app_controllers` (
  `id`              int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`     int(10)     unsigned    DEFAULT NULL,
  `app_modules_id`  int(11)                 DEFAULT NULL,
  `name`            varchar(128)            DEFAULT NULL,
  `key`             varchar(32)             DEFAULT NULL,
  `active`          tinyint(1)              DEFAULT NULL,
  `created_by`      int(10)     unsigned    DEFAULT NULL,
  `created_date`    datetime                DEFAULT NULL,
  `updated_by`      int(10)     unsigned    DEFAULT NULL,
  `updated_date`    datetime                DEFAULT NULL,
  `deleted_by`      int(10)     unsigned    DEFAULT NULL,
  `deleted_date`    datetime                DEFAULT NULL,
  `deleted`         tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY (`id`),
  UNIQUE    KEY `id_UNIQUE` (`id`),
            KEY `idx_zhist_app_controllers_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for app_controllers table';

--
-- Table structure for table `zhist_app_modules`
--
DROP TABLE IF EXISTS `zhist_app_modules`;
CREATE TABLE `zhist_app_modules` (
  `id`              int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`     int(10)     unsigned    DEFAULT NULL,
  `name`            varchar(128)            DEFAULT NULL,
  `key`             varchar(32)             DEFAULT NULL,
  `active`          tinyint(1)              DEFAULT NULL,
  `created_by`      int(10)     unsigned    DEFAULT NULL,
  `created_date`    datetime                DEFAULT NULL,
  `updated_by`      int(10)     unsigned    DEFAULT NULL,
  `updated_date`    datetime                DEFAULT NULL,
  `deleted_by`      int(10)     unsigned    DEFAULT NULL,
  `deleted_date`    datetime                DEFAULT NULL,
  `deleted`         tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                             (`id`),
  UNIQUE    KEY `id_UNIQUE`                 (`id`),
            KEY `idx_zhist_app_modules_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for app_modules table';

--
-- Table structure for table `zhist_flux_boards`
--
DROP TABLE IF EXISTS `zhist_flux_boards`;
CREATE TABLE `zhist_flux_boards` (
  `id`                      int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`             int(10)     unsigned    DEFAULT NULL,
  `unit_organizations_id`   int(10)     unsigned    DEFAULT NULL,
  `name`                    varchar(128)            DEFAULT NULL,
  `description_key`         varchar(45)             DEFAULT NULL,
  `active`                  tinyint(1)              DEFAULT NULL,
  `created_by`              int(10)     unsigned    DEFAULT NULL,
  `created_date`            datetime                DEFAULT NULL,
  `updated_by`              int(10)     unsigned    DEFAULT NULL,
  `updated_date`            datetime                DEFAULT NULL,
  `deleted_by`              int(10)     unsigned    DEFAULT NULL,
  `deleted_date`            datetime                DEFAULT NULL,
  `deleted`                 tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                             (`id`),
  UNIQUE    KEY `id_UNIQUE`                 (`id`),
            KEY `idx_zhist_flux_boards_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for flux_boards table';

--
-- Table structure for table `zhist_flux_event_types`
--
DROP TABLE IF EXISTS `zhist_flux_event_types`;
CREATE TABLE `zhist_flux_event_types` (
  `id`                      int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`             int(10)     unsigned    DEFAULT NULL,
  `unit_organizations_id`   int(10)     unsigned    DEFAULT NULL,
  `name`                    varchar(64)             DEFAULT NULL,
  `description_key`         varchar(45)             DEFAULT NULL,
  `active`                  tinyint(1)              DEFAULT NULL,
  `created_by`              int(10)     unsigned    DEFAULT NULL,
  `created_date`            datetime                DEFAULT NULL,
  `updated_by`              int(10)     unsigned    DEFAULT NULL,
  `updated_date`            datetime                DEFAULT NULL,
  `deleted_by`              int(10)     unsigned    DEFAULT NULL,
  `deleted_date`            datetime                DEFAULT NULL,
  `deleted`                 tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                                 (`id`),
  UNIQUE    KEY `id_UNIQUE`                     (`id`),
            KEY `idx_zhist_flux_event_types_original` (`original_id`)
  
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for flux_event_types table';

--
-- Table structure for table `zhist_flux_events`
--
DROP TABLE IF EXISTS `zhist_flux_events`;
CREATE TABLE `zhist_flux_events` (
  `id`                      int(10)     unsigned    NOT NULL        AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`             int(10)     unsigned    DEFAULT NULL,
  `flux_event_types_id`     int(10)     unsigned    DEFAULT NULL,
  `flux_fluxes_id`           int(10)    unsigned    DEFAULT NULL,
  `flux_messages_id`        int(10)     unsigned    DEFAULT NULL,
  `active`                  tinyint(1)              DEFAULT NULL,
  `created_by`              int(10)     unsigned    DEFAULT NULL,
  `created_date`            datetime                DEFAULT NULL,
  `updated_by`              int(10)     unsigned    DEFAULT NULL,
  `updated_date`            datetime                DEFAULT NULL,
  `deleted_by`              int(10)     unsigned    DEFAULT NULL,
  `deleted_date`            datetime                DEFAULT NULL,
  `deleted`                 tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                                     (`id`),
  UNIQUE    KEY `id_UNIQUE`                         (`id`),
            KEY `idx_zhist_flux_events_original` (`original_id`)
  
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for flux_events table';

--
-- Table structure for table `zhist_flux_field_types`
--
DROP TABLE IF EXISTS `zhist_flux_field_types`;
CREATE TABLE `zhist_flux_field_types` (
  `id`                      int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`             int(10)     unsigned    DEFAULT NULL,
  `unit_organizations_id`   int(10)     unsigned    DEFAULT NULL,
  `name`                    varchar(64)             DEFAULT NULL,
  `description_key`         varchar(45)             DEFAULT NULL,
  `active`                  tinyint(1)              DEFAULT NULL,
  `created_by`              int(10)     unsigned    DEFAULT NULL,
  `created_date`            datetime                DEFAULT NULL,
  `updated_by`              int(10)     unsigned    DEFAULT NULL,
  `updated_date`            datetime                DEFAULT NULL,
  `deleted_by`              int(10)     unsigned    DEFAULT NULL,
  `deleted_date`            datetime                DEFAULT NULL,
  `deleted`                 tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                                 (`id`),
  UNIQUE    KEY `id_UNIQUE`                     (`id`),
            KEY `idx_zhist_flux_field_types_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for flux_field_types table';

--
-- Table structure for table `zhist_flux_flows`
--
--
DROP TABLE IF EXISTS `zhist_flux_flows`;
CREATE TABLE `zhist_flux_flows` (
  `id`                              int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`                     int(10)     unsigned    DEFAULT NULL,
  `unit_organizations_id`           int(10)     unsigned    DEFAULT NULL,
  `flux_boards_id`                  int(10)     unsigned    DEFAULT NULL,
  `flux_steps_id`                   int(10)     unsigned    DEFAULT NULL,
  `destination_organizations_id`    int(10)     unsigned    DEFAULT NULL,
  `deatination_boards_id`           int(10)     unsigned    DEFAULT NULL,
  `destination_steps_id`            int(10)     unsigned    DEFAULT NULL,
  `active`                          tinyint(1)              DEFAULT NULL,
  `created_by`                      int(10)     unsigned    DEFAULT NULL,
  `created_date`                    datetime                DEFAULT NULL,
  `updated_by`                      int(10)     unsigned    DEFAULT NULL,
  `updated_date`                    datetime                DEFAULT NULL,
  `deleted_by`                      int(10)     unsigned    DEFAULT NULL,
  `deleted_date`                    datetime                DEFAULT NULL,
  `deleted`                         tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                                 (`id`),
  UNIQUE    KEY `id_UNIQUE`                     (`id`),
            KEY `idx_zhist_flux_flows_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for flux_flows table';

--
-- Table structure for table `zhist_flux_fluxes`
--
DROP TABLE IF EXISTS `zhist_flux_fluxes`;
CREATE TABLE `zhist_flux_fluxes` (
  `id`                      int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`             int(10)     unsigned    DEFAULT NULL,
  `unit_organizations_id`   int(10)     unsigned    DEFAULT NULL,
  `flux_origins_id`         int(10)     unsigned    DEFAULT NULL,
  `flux_status_id`          int(10)     unsigned    DEFAULT NULL,
  `flux_subjects_id`        int(10)     unsigned    DEFAULT NULL,
  `flux_boards_id`          int(10)     unsigned    DEFAULT NULL,
  `flux_steps_id`           int(10)     unsigned    DEFAULT NULL,
  `owner_id`                int(10)     unsigned    DEFAULT NULL,
  `flux_priorities_id`      int(10)     unsigned    DEFAULT NULL,
  `cnt_contact_id`          int(10)     unsigned    DEFAULT NULL,
  `email`                   varchar(255)            DEFAULT NULL,
  `phone`                   varchar(20)             DEFAULT NULL,
  `other`                   varchar(255)            DEFAULT NULL,
  `active`                  tinyint(1)              DEFAULT NULL,
  `created_by`              int(10)     unsigned    DEFAULT NULL,
  `created_date`            datetime                DEFAULT NULL,
  `updated_by`              int(10)     unsigned    DEFAULT NULL,
  `updated_date`            datetime                DEFAULT NULL,
  `deleted_by`              int(10)     unsigned    DEFAULT NULL,
  `deleted_date`            datetime                DEFAULT NULL,
  `deleted`                 tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                                 (`id`),
  UNIQUE    KEY `id_UNIQUE`                     (`id`),
            KEY `idx_zhist_flux_fluxes_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for flux_fluxes table';

--
-- Table structure for table `zhist_flux_messages`
--
DROP TABLE IF EXISTS `zhist_flux_messages`;
CREATE TABLE `zhist_flux_messages` (
  `id`                      int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`             int(10)     unsigned    DEFAULT NULL,
  `unit_organizations_id`   int(10)     unsigned    DEFAULT NULL,
  `flux_fluxes_id`           int(10)    unsigned    DEFAULT NULL,
  `origin_id`               int(10)     unsigned    DEFAULT NULL,
  `destination_id`          int(10)     unsigned    DEFAULT NULL,
  `subject`                 varchar(255)            DEFAULT NULL,
  `message`                 text                    DEFAULT NULL,
  `active`                  tinyint(1)              DEFAULT NULL,
  `created_by`              int(10)     unsigned    DEFAULT NULL,
  `created_date`            datetime                DEFAULT NULL,
  `updated_by`              int(10)     unsigned    DEFAULT NULL,
  `updated_date`            datetime                DEFAULT NULL,
  `deleted_by`              int(10)     unsigned    DEFAULT NULL,
  `deleted_date`            datetime                DEFAULT NULL,
  `deleted`                 tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                                     (`id`),
  UNIQUE    KEY `id_UNIQUE`                         (`id`),
            KEY `idx_zhist_flux_fluxes_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for flux_fluxes table';

--
-- Table structure for table `zhist_flux_origins`
--
DROP TABLE IF EXISTS `zhist_flux_origins`;
CREATE TABLE `zhist_flux_origins` (
  `id`                      int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`             int(10)     unsigned    DEFAULT NULL,
  `unit_organizations_id`   int(10)     unsigned    DEFAULT NULL,
  `name`                    varchar(64)             DEFAULT NULL,
  `description_key`         varchar(45)             DEFAULT NULL,
  `active`                  tinyint(1)              DEFAULT NULL,
  `created_by`              int(10)     unsigned    DEFAULT NULL,
  `created_date`            datetime                DEFAULT NULL,
  `updated_by`              int(10)     unsigned    DEFAULT NULL,
  `updated_date`            datetime                DEFAULT NULL,
  `deleted_by`              int(10)     unsigned    DEFAULT NULL,
  `deleted_date`            datetime                DEFAULT NULL,
  `deleted`                 tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                                 (`id`),
  UNIQUE    KEY `id_UNIQUE`                     (`id`),
            KEY `idx_zhist_flux_origins_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for flux_origins table';

--
-- Table structure for table `zhist_flux_priorities`
--
DROP TABLE IF EXISTS `zhist_flux_priorities`;
CREATE TABLE `zhist_flux_priorities` (
  `id`                      int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`             int(10)     unsigned    DEFAULT NULL,
  `unit_orgazinations_id`   int(10)     unsigned    DEFAULT NULL,
  `name`                    varchar(64)             DEFAULT NULL,
  `description_key`         varchar(45)             DEFAULT NULL,
  `priority_order`          int(11)                 DEFAULT NULL,
  `active`                  tinyint(1)              DEFAULT NULL,
  `created_by`              int(10)     unsigned    DEFAULT NULL,
  `created_date`            datetime                DEFAULT NULL,
  `updated_by`              int(10)     unsigned    DEFAULT NULL,
  `updated_date`            datetime                DEFAULT NULL,
  `deleted_by`              int(10)     unsigned    DEFAULT NULL,
  `deleted_date`            datetime                DEFAULT NULL,
  `deleted`                 tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                                 (`id`),
  UNIQUE    KEY `id_UNIQUE`                     (`id`),
            KEY `idx_zhist_flux_priorities_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for flux_priorities table';

--
-- Table structure for table `zhist_flux_status`
--
DROP TABLE IF EXISTS `zhist_flux_status`;
CREATE TABLE `zhist_flux_status` (
  `id`                      int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`             int(10)     unsigned    DEFAULT NULL,
  `unit_organizations_id`   int(10)     unsigned    DEFAULT NULL,
  `name`                    varchar(64)             DEFAULT NULL,
  `description_key`         varchar(45)             DEFAULT NULL,
  `active`                  tinyint(1)              DEFAULT NULL,
  `created_by`              int(10)     unsigned    DEFAULT NULL,
  `created_date`            datetime                DEFAULT NULL,
  `updated_by`              int(10)     unsigned    DEFAULT NULL,
  `updated_date`            datetime                DEFAULT NULL,
  `deleted_by`              int(10)     unsigned    DEFAULT NULL,
  `deleted_date`            datetime                DEFAULT NULL,
  `deleted`                 tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                             (`id`),
  UNIQUE    KEY `id_UNIQUE`                 (`id`),
            KEY `idx_zhist_flux_priorities_original` (`original_id`)
)
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for flux_status table';

--
-- Table structure for table `zhist_flux_step_field_values`
--
DROP TABLE IF EXISTS `zhist_flux_step_field_values`;
CREATE TABLE `zhist_flux_step_field_values` (
  `id`                  int(10)     unsigned    NOT NULL   AUTO_INCREMENT   COMMENT 'Tables unique identifier',
  `original_id`         int(10)     unsigned    DEFAULT NULL,
  `flux_fluxes_id`       int(10)    unsigned    DEFAULT NULL,
  `flux_step_fields_id` int(10)     unsigned    DEFAULT NULL,
  `val_int`             int(11)                 DEFAULT NULL,
  `val_char`            varchar(255)            DEFAULT NULL,
  `val_text`            text                    DEFAULT NULL,
  `val_bool`            tinyint(1)              DEFAULT NULL,
  `val_decimal`         decimal(15,3)           DEFAULT NULL,
  `active`              tinyint(1)              DEFAULT NULL,
  `created_by`          int(10)     unsigned    DEFAULT NULL,
  `created_date`        datetime                DEFAULT NULL,
  `updated_by`          int(10)     unsigned    DEFAULT NULL,
  `updated_date`        datetime                DEFAULT NULL,
  `deleted_by`          int(10)     unsigned    DEFAULT NULL,
  `deleted_date`        datetime                DEFAULT NULL,
  `deleted`             tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                                         (`id`),
  UNIQUE    KEY `id_UNIQUE`                             (`id`),
            KEY `idx_zhist_flux_priorities_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for flux_step_field_values table';

--
-- Table structure for table `zhist_flux_step_fields`
--
DROP TABLE IF EXISTS `zhist_flux_step_fields`;
CREATE TABLE `zhist_flux_step_fields` (
  `id`                      int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`             int(10)     unsigned    DEFAULT NULL,
  `parent_id`               int(10)     unsigned    DEFAULT NULL,
  `flux_field_types_id`     int(10)     unsigned    DEFAULT NULL,
  `unit_organizations_id`   int(10)     unsigned    DEFAULT NULL,
  `flux_subjects_id`        int(10)     unsigned    DEFAULT NULL,
  `flux_steps_id`           int(10)     unsigned    DEFAULT NULL,
  `val_type`                int(10)     unsigned    DEFAULT NULL,
  `field_caption`           varchar(128)            DEFAULT NULL,
  `description_key`         varchar(45)             DEFAULT NULL,
  `field_name`              varchar(128)            DEFAULT NULL,
  `active`                  tinyint(1)              DEFAULT NULL,
  `created_by`              int(10)     unsigned    DEFAULT NULL,
  `created_date`            datetime                DEFAULT NULL,
  `updated_by`              int(10)     unsigned    DEFAULT NULL,
  `updated_date`            datetime                DEFAULT NULL,
  `deleted_by`              int(10)     unsigned    DEFAULT NULL,
  `deleted_date`            datetime                DEFAULT NULL,
  `deleted`                 tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                                     (`id`),
  UNIQUE    KEY `id_UNIQUE`                         (`id`),
            KEY `idx_zhist_flux_step_fields_original` (`original_id`)
  
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for flux_step_fields table';

--
-- Table structure for table `zhist_flux_steps`
--
DROP TABLE IF EXISTS `zhist_flux_steps`;
CREATE TABLE `zhist_flux_steps` (
  `id`                      int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`             int(10)     unsigned    DEFAULT NULL,
  `unit_organizations_id`   int(10)     unsigned    DEFAULT NULL,
  `flux_boards_id`          int(10)     unsigned    DEFAULT NULL,
  `flux_subjects_id`        int(10)     unsigned    DEFAULT NULL,
  `name`                    varchar(64)             DEFAULT NULL,
  `description_key`         varchar(45)             DEFAULT NULL,
  `step_order`              int(10)     unsigned    DEFAULT NULL,
  `active`                  tinyint(1)              DEFAULT NULL,
  `created_by`              int(10)     unsigned    DEFAULT NULL,
  `created_date`            datetime                DEFAULT NULL,
  `updated_by`              int(10)     unsigned    DEFAULT NULL,
  `updated_date`            datetime                DEFAULT NULL,
  `deleted_by`              int(10)     unsigned    DEFAULT NULL,
  `deleted_date`            datetime                DEFAULT NULL,
  `deleted`                 tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                                 (`id`),
  UNIQUE    KEY `id_UNIQUE`                     (`id`),
            KEY `idx_zhist_flux_steps_original` (`original_id`)
)
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for flux_flux_steps table';

--
-- Table structure for table `zhist_flux_subjects`
--
DROP TABLE IF EXISTS `zhist_flux_subjects`;
CREATE TABLE `zhist_flux_subjects` (
  `id`                      int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`             int(10)     unsigned    DEFAULT NULL,
  `unit_organizations_id`   int(10)     unsigned    DEFAULT NULL,
  `name`                    varchar(64)             DEFAULT NULL,
  `description_key`         varchar(45)             DEFAULT NULL,
  `active`                  tinyint(1)              DEFAULT NULL,
  `created_by`              int(10)     unsigned    DEFAULT NULL,
  `created_date`            datetime                DEFAULT NULL,
  `updated_by`              int(10)     unsigned    DEFAULT NULL,
  `updated_date`            datetime                DEFAULT NULL,
  `deleted_by`              int(10)     unsigned    DEFAULT NULL,
  `deleted_date`            datetime                DEFAULT NULL,
  `deleted`                 tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                                 (`id`),
  UNIQUE    KEY `id_UNIQUE`                     (`id`),
            KEY `idx_zhist_flux_subjects_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for flux_subjects table';

--
-- Table structure for table `zhist_unit_organization_types`
--
DROP TABLE IF EXISTS `zhist_unit_organization_types`;
CREATE TABLE `zhist_unit_organization_types` (
  `id`              int(10)     unsigned    NOT NULL    AUTO_INCREMENT,
  `original_id`     int(10)     unsigned    DEFAULT NULL,
  `name`            varchar(128)            DEFAULT NULL,
  `description_key` varchar(45)             DEFAULT NULL,
  `active`          tinyint(1)              DEFAULT NULL,
  `created_by`      int(10)     unsigned    DEFAULT NULL,
  `created_date`    datetime                DEFAULT NULL,
  `updated_by`      int(10)     unsigned    DEFAULT NULL,
  `updated_date`    datetime                DEFAULT NULL,
  `deleted_by`      int(10)     unsigned    DEFAULT NULL,
  `deleted_date`    datetime                DEFAULT NULL,
  `deleted`         tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY (`id`),
  UNIQUE    KEY `id_UNIQUE` (`id`),
            KEY `idx_zhist_unit_org_t_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for unit_organization_types table';

--
-- Table structure for table `zhist_unit_organizations`
--
DROP TABLE IF EXISTS `zhist_unit_organizations`;
CREATE TABLE `zhist_unit_organizations` (
  `id`                          int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`                 int(10)     unsigned    DEFAULT NULL,
  `parent_id`                   int(10)     unsigned    DEFAULT NULL,
  `unit_organization_types_id`  int(10)     unsigned    DEFAULT NULL,
  `cnt_contacts_id`             int(10)     unsigned    DEFAULT NULL,
  `name`                        varchar(128)            DEFAULT NULL,
  `active`                      tinyint(1)              DEFAULT NULL,
  `created_by`                  int(10)     unsigned    DEFAULT NULL,
  `created_date`                datetime                DEFAULT NULL,
  `updated_by`                  int(10)     unsigned    DEFAULT NULL,
  `updated_date`                datetime                DEFAULT NULL,
  `deleted_by`                  int(10)     unsigned    DEFAULT NULL,
  `deleted_date`                datetime                DEFAULT NULL,
  `deleted`                     tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                                         (`id`),
  UNIQUE    KEY `id_UNIQUE`                             (`id`),
            KEY `idx_zhist_unit_organizations_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for unit_organizations table';

--
-- Table structure for table `zhist_unit_organization_hierarchy`
--
DROP TABLE IF EXISTS `zhist_unit_organization_hierarchy`;
CREATE TABLE `zhist_unit_organization_hierarchy` (
  `id`                          int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`                 int(10)     unsigned    DEFAULT NULL,
  `unit_organizations_id`       int(10)     unsigned    DEFAULT NULL,
  `unit_parent_child_id`        int(10)     unsigned    DEFAULT NULL,
  `direction`                   tinyint(1)              DEFAULT NULL,
  `active`                      tinyint(1)              DEFAULT NULL,
  `created_by`                  int(10)     unsigned    DEFAULT NULL,
  `created_date`                datetime                DEFAULT NULL,
  `updated_by`                  int(10)     unsigned    DEFAULT NULL,
  `updated_date`                datetime                DEFAULT NULL,
  `deleted_by`                  int(10)     unsigned    DEFAULT NULL,
  `deleted_date`                datetime                DEFAULT NULL,
  `deleted`                     tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                                             (`id`),
  UNIQUE    KEY `id_UNIQUE`                                 (`id`),
            KEY `idx_zhist_unit_organization_hierarchy_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for unit_organization_hierarchy table';

--
-- Table structure for table `zhist_user_assigned_organizations`
--
DROP TABLE IF EXISTS `zhist_user_assigned_organizations`;
CREATE TABLE `zhist_user_assigned_organizations` (
  `id`                      int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`             int(10)     unsigned    DEFAULT NULL,
  `unit_organizations_id`   int(10)     unsigned    DEFAULT NULL,
  `user_users_id`           int(10)     unsigned    DEFAULT NULL,
  `active`                  tinyint(1)              DEFAULT NULL,
  `created_by`              int(10)     unsigned    DEFAULT NULL,
  `created_date`            datetime                DEFAULT NULL,
  `updated_by`              int(10)     unsigned    DEFAULT NULL,
  `updated_date`            datetime                DEFAULT NULL,
  `deleted_by`              int(10)     unsigned    DEFAULT NULL,
  `deleted_date`            datetime                DEFAULT NULL,
  `deleted`                 tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                                             (`id`),
  UNIQUE    KEY `id_UNIQUE`                                 (`id`),
            KEY `idx_zhist_user_assigned_organizations_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for user_assigned_organizations table';

--
-- Table structure for table `zhist_user_assingned_roles`
--
DROP TABLE IF EXISTS `zhist_user_assingned_roles`;
CREATE TABLE `zhist_user_assingned_roles` (
  `id`                      int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`             int(10)     unsigned    DEFAULT NULL,
  `unit_organizations_id`   int(10)     unsigned    DEFAULT NULL,
  `user_roles_id`           int(10)     unsigned    DEFAULT NULL,
  `user_users_id`           int(10)     unsigned    DEFAULT NULL,
  `active`                  tinyint(1)              DEFAULT NULL,
  `created_by`              int(10)     unsigned    DEFAULT NULL,
  `created_date`            datetime                DEFAULT NULL,
  `updated_by`              int(10)     unsigned    DEFAULT NULL,
  `updated_date`            datetime                DEFAULT NULL,
  `deleted_by`              int(10)     unsigned    DEFAULT NULL,
  `deleted_date`            datetime                DEFAULT NULL,
  `deleted`                 tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                                         (`id`),
  UNIQUE    KEY `id_UNIQUE`                             (`id`),
            KEY `idx_zhist_user_assingned_roles_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for user_assingned_roles table';

--
-- Table structure for table `zhist_user_role_permissions`
--
DROP TABLE IF EXISTS `zhist_user_role_permissions`;
CREATE TABLE `zhist_user_role_permissions` (
  `id`                      int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`             int(10)     unsigned    DEFAULT NULL,
  `app_modules_id`          int(10)     unsigned    DEFAULT NULL,
  `app_controllers_id`      int(10)     unsigned    DEFAULT NULL,
  `app_actions_id`          int(10)     unsigned    DEFAULT NULL,
  `user_roles_id`           int(10)     unsigned    DEFAULT NULL,
  `name`                    varchar(128)            DEFAULT NULL,
  `active`                  tinyint(1)              DEFAULT NULL,
  `created_by`              int(10)     unsigned    DEFAULT NULL,
  `created_date`            datetime                DEFAULT NULL,
  `updated_by`              int(10)     unsigned    DEFAULT NULL,
  `updated_date`            datetime                DEFAULT NULL,
  `deleted_by`              int(10)     unsigned    DEFAULT NULL,
  `deleted_date`            datetime                DEFAULT NULL,
  `deleted`                 tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                                             (`id`),
  UNIQUE    KEY `id_UNIQUE`                                 (`id`),
            KEY `idx_zhist_user_role_permissions_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for user_role_permissions table';

--
-- Table structure for table `zhist_user_roles`
--
DROP TABLE IF EXISTS `zhist_user_roles`;
CREATE TABLE `zhist_user_roles` (
  `id`                      int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`             int(10)     unsigned    DEFAULT NULL,
  `unit_organizations_id`   int(10)     unsigned    DEFAULT NULL,
  `name`                    varchar(128)            DEFAULT NULL,
  `description`             varchar(255)            DEFAULT NULL,
  `description_key`         varchar(45)             DEFAULT NULL,
  `active`                  tinyint(1)              DEFAULT NULL,
  `created_by`              int(10)     unsigned    DEFAULT NULL,
  `created_date`            datetime                DEFAULT NULL,
  `updated_by`              int(10)     unsigned    DEFAULT NULL,
  `updated_date`            datetime                DEFAULT NULL,
  `deleted_by`              int(10)     unsigned    DEFAULT NULL,
  `deleted_date`            datetime                DEFAULT NULL,
  `deleted`                 tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                                         (`id`),
  UNIQUE    KEY `id_UNIQUE`                             (`id`),
            KEY `idx_zhist_user_roles_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for user_roles table';

--
-- Table structure for table `zhist_user_users`
--
DROP TABLE IF EXISTS `zhist_user_users`;
CREATE TABLE `zhist_user_users` (
  `id`                      int(10)     unsigned    NOT NULL    AUTO_INCREMENT  COMMENT 'Tables unique identifier',
  `original_id`             int(10)     unsigned    DEFAULT NULL,
  `unit_organizations_id`   int(10)     unsigned    DEFAULT NULL,
  `first_name`              varchar(64)             DEFAULT NULL,
  `surename`                varchar(128)            DEFAULT NULL,
  `email`                   varchar(255)            DEFAULT NULL,
  `password`                varchar(255)            DEFAULT NULL,
  `last_login`              datetime                DEFAULT NULL,
  `last_operation`          datetime                DEFAULT NULL,
  `active`                  tinyint(1)              DEFAULT NULL,
  `created_by`              int(10)     unsigned    DEFAULT NULL,
  `created_date`            datetime                DEFAULT NULL,
  `updated_by`              int(10)     unsigned    DEFAULT NULL,
  `updated_date`            datetime                DEFAULT NULL,
  `deleted_by`              int(10)     unsigned    DEFAULT NULL,
  `deleted_date`            datetime                DEFAULT NULL,
  `deleted`                 tinyint(1)              DEFAULT NULL,
  PRIMARY   KEY                             (`id`),
  UNIQUE    KEY `id_UNIQUE`                 (`id`),
            KEY `idx_zhist_user_users_original` (`original_id`)
) 
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='History table for user_users table';

SET FOREIGN_KEY_CHECKS=1;
SET UNIQUE_CHECKS=1;
