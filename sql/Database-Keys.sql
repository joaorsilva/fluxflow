SET UNIQUE_CHECKS=0;
SET FOREIGN_KEY_CHECKS=0;

--
-- Schema
--
USE `fluxflow`;

--
-- PRIMARY KEYS
--

ALTER TABLE `geo_countries` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier' ,
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id` ASC);

ALTER TABLE `geo_provinces` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier' ,
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `geo_cities` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier' ,
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `unit_organization_types` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `unit_organizations` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `cnt_contact_types` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier' ,
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `cnt_contacts` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier' ,
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `cnt_emails` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier' ,
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `cnt_phones` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier' ,
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `cnt_addresses` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier' ,
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `app_modules` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier' ,
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `app_controllers` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier' ,
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `app_actions` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `flux_boards` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `flux_event_types` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `flux_events` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `flux_field_types` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `flux_flows` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `flux_fluxes` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `flux_messages` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `flux_origins` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `flux_priorities` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `flux_status` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `flux_step_field_values` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `flux_step_fields` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `flux_steps` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `flux_subjects` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `unit_organization_hierarchy` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `user_assigned_organizations` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `user_assingned_roles` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `user_role_permissions` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `user_roles` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

ALTER TABLE `user_users` 
CHANGE COLUMN `id` `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tables unique identifier',
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `id_UNIQUE` (`id`);

--
-- Indexes for table geo_countries
--
-- UNIQUE
ALTER TABLE `geo_countries` 
ADD UNIQUE INDEX `idx_geo_countries_UNIQUE` (`name`);

-- ACTIVE AND DELETE
ALTER TABLE `geo_countries` 
ADD INDEX `idx_geo_countries_deleted` (`deleted`);

ALTER TABLE `geo_countries` 
ADD INDEX `idx_geo_countries_active` (`active`);

--
-- Indexes for table geo_provinces
--

-- UNIQUE
ALTER TABLE `geo_provinces` 
ADD UNIQUE INDEX `idx_geo_provinces_UNIQUE` (`geo_countries_id`,`name`,`type`);

-- ACTIVE AND DELETE
ALTER TABLE `geo_provinces` 
ADD INDEX `idx_geo_provinces_deleted` (`deleted`);

ALTER TABLE `geo_provinces` 
ADD INDEX `idx_geo_provinces_active` (`active`);

ALTER TABLE `geo_provinces` 
ADD INDEX `fk_geo_provinces_countries` (`geo_countries_id` ASC);

-- FOREIGN KEY
ALTER TABLE `geo_provinces` 
ADD CONSTRAINT `fk_geo_provinces_countries`
  FOREIGN KEY (`geo_countries_id`)
  REFERENCES `geo_countries` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table geo_cities
--
-- ACTIVE AND DELETE
ALTER TABLE `geo_cities` 
ADD INDEX `idx_geo_cities_deleted` (`deleted`);

ALTER TABLE `geo_cities` 
ADD INDEX `idx_geo_cities_active` (`active`);

-- UNIQUE
ALTER TABLE `geo_cities` 
ADD UNIQUE INDEX `idx_geo_cities_UNIQUE` (`geo_countries_id`,`geo_provinces_id`,`name`);

-- FOREIGN KEY
ALTER TABLE `geo_cities` 
ADD INDEX `fk_geo_cities_countries_idx` (`geo_countries_id`);
ALTER TABLE `geo_cities` 
ADD CONSTRAINT `fk_geo_cities_country`
  FOREIGN KEY (`geo_countries_id`)
  REFERENCES `geo_countries` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


ALTER TABLE `geo_cities` 
ADD INDEX `fk_geo_cities_provinces_idx` (`geo_provinces_id`);
ALTER TABLE `geo_cities` 
ADD CONSTRAINT `fk_geo_cities_provinces`
  FOREIGN KEY (`geo_provinces_id`)
  REFERENCES `geo_cities_provinces` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table cnt_contact_types
--

-- ACTIVE AND DELETE
ALTER TABLE `cnt_contact_types` 
ADD INDEX `idx_cnt_contact_types_deleted` (`deleted`);

ALTER TABLE `cnt_contact_types` 
ADD INDEX `idx_cnt_contact_types_active` (`active`);

-- UNIQUE
ALTER TABLE `cnt_contact_types` 
ADD UNIQUE INDEX `idx_cnt_contact_types_UNIQUE` (`unit_organizations_id`,`name`);

-- FOREIGN KEY
ALTER TABLE `cnt_contact_types` 
ADD INDEX `fk_cnt_contact_types_unit_idx` (`unit_organizations_id`);
ALTER TABLE `cnt_contact_types` 
ADD CONSTRAINT `fk_cnt_contact_types_unit`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table cnt_contacts
--
-- ACTIVE AND DELETE
ALTER TABLE `cnt_contacts` 
ADD INDEX `idx_cnt_contacts_deleted` (`deleted`);

ALTER TABLE `cnt_contacts` 
ADD INDEX `idx_cnt_contacts_active` (`active`);

-- UNIQUE
ALTER TABLE `cnt_contacts` 
ADD UNIQUE INDEX `idx_cnt_contacts_UNIQUE` (`unit_organizations_id`,`company_name`,`name`,`surename`);

-- FOREIGN KEY
ALTER TABLE `cnt_contacts` 
ADD INDEX `fk_cnt_contacts_unit_idx` (`unit_organizations_id`);
ALTER TABLE `cnt_contacts` 
ADD CONSTRAINT `fk_cnt_contacts_unit`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table cnt_emails
--
-- ACTIVE AND DELETE
ALTER TABLE `cnt_emails` 
ADD INDEX `idx_cnt_emails_deleted` (`deleted`);

ALTER TABLE `cnt_emails` 
ADD INDEX `idx_cnt_emails_active` (`active`);

-- UNIQUE
ALTER TABLE `cnt_emails` 
ADD UNIQUE INDEX `idx_cnt_emails_UNIQUE` (`unit_organizations_id`,`cnt_contact_types_id`,`cnt_contacts_id`,`email`);

-- FOREIGN KEY
ALTER TABLE `cnt_emails` 
ADD INDEX `fk_cnt_emails_unit_idx` (`unit_organizations_id`);
ALTER TABLE `cnt_emails` 
ADD CONSTRAINT `fk_cnt_emails_unit`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `cnt_emails` 
ADD INDEX `fk_cnt_emails_contacts_idx` (`cnt_contacts_id`);
ALTER TABLE `cnt_emails` 
ADD CONSTRAINT `fk_cnt_emails_contacts`
  FOREIGN KEY (`cnt_contacts_id`)
  REFERENCES `cnt_contacts` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `cnt_emails` 
ADD INDEX `fk_cnt_emails_contact_types_idx` (`cnt_contact_types_id`);
ALTER TABLE `cnt_emails` 
ADD CONSTRAINT `fk_cnt_emails_contact_types`
  FOREIGN KEY (`cnt_contact_types_id`)
  REFERENCES `cnt_contact_types` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table cnt_phones
--
-- ACTIVE AND DELETE
ALTER TABLE `cnt_phones` 
ADD INDEX `idx_cnt_phones_deleted` (`deleted`);

ALTER TABLE `cnt_phones` 
ADD INDEX `idx_cnt_phones_active` (`active`);

-- UNIQUE
ALTER TABLE `cnt_phones` 
ADD UNIQUE INDEX `idx_cnt_phones_UNIQUE` (`unit_organizations_id`,`cnt_contact_types_id`,`cnt_contacts_id`,`phone`);

-- FOREIGN KEY
ALTER TABLE `cnt_phones` 
ADD INDEX `fk_cnt_phones_contact_types_idx` (`cnt_contact_types_id`);
ALTER TABLE `cnt_phones` 
ADD CONSTRAINT `fk_cnt_phones_contact_types`
  FOREIGN KEY (`cnt_contact_types_id`)
  REFERENCES `cnt_contact_types` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `cnt_phones` 
ADD INDEX `fk_cnt_phones_contacts_idx` (`cnt_contacts_id`);
ALTER TABLE `cnt_phones` 
ADD CONSTRAINT `fk_cnt_phones_contacts`
  FOREIGN KEY (`cnt_contacts_id`)
  REFERENCES `cnt_contacts` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `cnt_phones` 
ADD INDEX `fk_cnt_phones_country_idx` (`geo_country_id`);
ALTER TABLE `cnt_phones` 
ADD CONSTRAINT `fk_cnt_phones_country`
  FOREIGN KEY (`geo_country_id`)
  REFERENCES `geo_countries` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `cnt_phones` 
ADD INDEX `fk_cnt_phones_unit_idx` (`unit_organizations_id`);
ALTER TABLE `cnt_phones` 
ADD CONSTRAINT `fk_cnt_phones_unit`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table cnt_addresses
--
-- ACTIVE AND DELETE
ALTER TABLE `cnt_addresses` 
ADD INDEX `idx_cnt_addresses_deleted` (`deleted`);

ALTER TABLE `cnt_addresses` 
ADD INDEX `idx_cnt_addresses_active` (`active`);

-- UNIQUE
ALTER TABLE `cnt_addresses` 
ADD UNIQUE INDEX `idx_cnt_addresses_UNIQUE` (`unit_organizations_id`,`cnt_contacts_id`,`cnt_contact_types_id`,`geo_countries_id`,`geo_provinces_id`,`geo_cities_id`,`neigborhood`,`zip_code`,`street_address`,`door_number`,`room`);

-- FOREIGN KEY
ALTER TABLE `cnt_addresses`
ADD INDEX `fk_cnt_addresses_cities_idx` (`geo_cities_id`);
ALTER TABLE `cnt_addresses` 
ADD CONSTRAINT `fk_cnt_addresses_cities`
  FOREIGN KEY (`geo_cities_id`)
  REFERENCES `geo_cities` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `cnt_addresses`
ADD INDEX `fk_cnt_addresses_contact_types_idx` (`cnt_contact_types_id`);
ALTER TABLE `cnt_addresses` 
ADD CONSTRAINT `fk_cnt_addresses_contact_types`
  FOREIGN KEY (`cnt_contact_types_id`)
  REFERENCES `cnt_contact_types` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `cnt_addresses`
ADD INDEX `fk_cnt_addresses_contacts_idx` (`cnt_contacts_id`);
ALTER TABLE `cnt_addresses` 
ADD CONSTRAINT `fk_cnt_addresses_contacts`
  FOREIGN KEY (`cnt_contacts_id`)
  REFERENCES `cnt_contacts` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `cnt_addresses`
ADD INDEX `fk_cnt_addresses_countries_idx` (`geo_countries_id`);
ALTER TABLE `cnt_addresses` 
ADD CONSTRAINT `fk_cnt_addresses_countries`
  FOREIGN KEY (`geo_countries_id`)
  REFERENCES `geo_countries` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `cnt_addresses`
ADD INDEX `fk_cnt_addresses_provinces_idx` (`geo_provinces_id`);
ALTER TABLE `cnt_addresses` 
ADD CONSTRAINT `fk_cnt_addresses_provinces`
  FOREIGN KEY (`geo_provinces_id`)
  REFERENCES `geo_provinces` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `cnt_addresses`
ADD INDEX `fk_cnt_addresses_unit_idx` (`unit_organizations_id`);
ALTER TABLE `cnt_addresses` 
ADD CONSTRAINT `fk_cnt_addresses_unit`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table app_modules
--

-- ACTIVE AND DELETE
ALTER TABLE `app_modules` 
ADD INDEX `idx_app_modules_deleted` (`deleted`);

ALTER TABLE `app_modules` 
ADD INDEX `idx_app_modules_active` (`active`);

-- UNIQUE
ALTER TABLE `app_modules` 
ADD UNIQUE INDEX `idx_app_modules_UNIQUE` (`name`);


--
-- Indexes for table app_controllers
--
-- ACTIVE AND DELETE
ALTER TABLE `app_controllers` 
ADD INDEX `idx_app_controllers_deleted` (`deleted`);

ALTER TABLE `app_controllers` 
ADD INDEX `idx_app_controllers_active` (`active`);

-- UNIQUE
ALTER TABLE `app_controllers` 
ADD UNIQUE INDEX `idx_app_controllers_UNIQUE` (`app_modules_id`,`name`);

-- FOREIGN KEY
ALTER TABLE `app_controllers`
ADD INDEX `fk_app_controllers_modules_idx` (`app_modules_id`);
ALTER TABLE `app_controllers` 
ADD CONSTRAINT `fk_app_controllers_modules`
  FOREIGN KEY (`app_modules_id`)
  REFERENCES `app_modules` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table app_actions
--
-- ACTIVE AND DELETE
ALTER TABLE `app_actions` 
ADD INDEX `idx_app_actions_deleted` (`deleted`);

ALTER TABLE `app_actions` 
ADD INDEX `idx_app_actions_active` (`active`);

-- UNIQUE
ALTER TABLE `app_actions` 
ADD UNIQUE INDEX `idx_app_actions_UNIQUE` (`app_modules_id`,`app_controllers_id`,`name`);

-- FOREIGN KEY
ALTER TABLE `app_actions`
ADD INDEX `fk_app_actions_controllers_idx` (`app_controllers_id`);
ALTER TABLE `app_actions` 
ADD CONSTRAINT `fk_app_actions_controllers`
  FOREIGN KEY (`app_controllers_id`)
  REFERENCES `app_controllers` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `app_actions`
ADD INDEX `fk_app_actions_modules_idx` (`app_modules_id`);
ALTER TABLE `app_actions` 
ADD CONSTRAINT `fk_app_actions_modules`
  FOREIGN KEY (`app_modules_id`)
  REFERENCES `app_modules` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table flux_boards
--
-- ACTIVE AND DELETE
ALTER TABLE `flux_boards` 
ADD INDEX `idx_flux_boards_deleted` (`deleted`);

ALTER TABLE `flux_boards` 
ADD INDEX `idx_flux_boards_active` (`active`);

-- UNIQUE
ALTER TABLE `flux_boards` 
ADD UNIQUE INDEX `idx_flux_boards_UNIQUE` (`unit_organizations_id`,`name`);

-- FOREIGN KEY
ALTER TABLE `flux_boards`
ADD INDEX `fk_flux_boards_unit_idx` (`unit_organizations_id`);
ALTER TABLE `flux_boards` 
ADD CONSTRAINT `fk_flux_boards_unit`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table flux_event_types
--
-- ACTIVE AND DELETE
ALTER TABLE `flux_event_types` 
ADD INDEX `idx_flux_event_types_deleted` (`deleted`);

ALTER TABLE `flux_event_types` 
ADD INDEX `idx_flux_event_types_active` (`active`);

-- UNIQUE
ALTER TABLE `flux_event_types` 
ADD UNIQUE INDEX `idx_flux_event_types_UNIQUE` (`unit_organizations_id`,`name`);

-- FOREIGN KEY
ALTER TABLE `flux_event_types`
ADD INDEX `idx_flux_event_types_unit_idx` (`unit_organizations_id`);
ALTER TABLE `flux_event_types` 
ADD CONSTRAINT `idx_flux_event_types_unit`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table flux_events
--
-- ACTIVE AND DELETE
ALTER TABLE `flux_events` 
ADD INDEX `idx_flux_events_deleted` (`deleted`);

ALTER TABLE `flux_events` 
ADD INDEX `idx_flux_events_active` (`active`);

-- FOREIGN KEY
ALTER TABLE `flux_events`
ADD INDEX `fk_flux_events_event_types_idx` (`flux_event_types_id`);
ALTER TABLE `flux_events` 
ADD CONSTRAINT `fk_flux_events_event_types`
  FOREIGN KEY (`flux_event_types_id`)
  REFERENCES `flux_event_types` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_events`
ADD INDEX `fk_flux_events_fluxs_idx` (`flux_fluxes_id`);
ALTER TABLE `flux_events` 
ADD CONSTRAINT `fk_flux_events_fluxs`
  FOREIGN KEY (`flux_fluxes_id`)
  REFERENCES `flux_fluxes` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_events`
ADD INDEX `fk_flux_events_messages_idx` (`flux_messages_id`);
ALTER TABLE `flux_events` 
ADD CONSTRAINT `fk_flux_events_messages`
  FOREIGN KEY (`flux_messages_id`)
  REFERENCES `flux_messages` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table flux_field_types
--
-- ACTIVE AND DELETE
ALTER TABLE `flux_field_types` 
ADD INDEX `idx_flux_field_types_deleted` (`deleted`);

ALTER TABLE `flux_field_types` 
ADD INDEX `idx_flux_field_types_active` (`active`);

-- UNIQUE
ALTER TABLE `flux_field_types` 
ADD UNIQUE INDEX `idx_flux_field_types_UNIQUE` (`unit_organizations_id`,`name`);

-- FOREIGN KEY
ALTER TABLE `flux_field_types`
ADD INDEX `fk_flux_field_types_unit_idx` (`unit_organizations_id`);
ALTER TABLE `flux_field_types` 
ADD CONSTRAINT `fk_flux_field_types_unit`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table flux_flows
--
-- ACTIVE AND DELETE
ALTER TABLE `flux_flows` 
ADD INDEX `idx_flux_flows_deleted` (`deleted`);

ALTER TABLE `flux_flows` 
ADD INDEX `idx_flux_flows_active` (`active`);

-- UNIQUE
ALTER TABLE `flux_flows` 
ADD UNIQUE INDEX `idx_flux_flows_UNIQUE` (`unit_organizations_id`,`flux_boards_id`,`flux_steps_id`,`destination_organizations_id`,`deatination_boards_id`,`destination_steps_id`);

-- FOREIGN KEY
ALTER TABLE `flux_flows`
ADD INDEX `fk_flux_flows_boards_idx` (`flux_boards_id`);
ALTER TABLE `flux_flows` 
ADD CONSTRAINT `fk_flux_flows_boards`
  FOREIGN KEY (`flux_boards_id`)
  REFERENCES `flux_boards` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_flows`
ADD INDEX `fk_flux_flows_boards1_idx` (`deatination_boards_id`);
ALTER TABLE `flux_flows` 
ADD CONSTRAINT `fk_flux_flows_boards1`
  FOREIGN KEY (`deatination_boards_id`)
  REFERENCES `deatination_boards` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_flows`
ADD INDEX `fk_flux_flows_steps_idx` (`flux_steps_id`);
ALTER TABLE `flux_flows` 
ADD CONSTRAINT `fk_flux_flows_steps`
  FOREIGN KEY (`flux_steps_id`)
  REFERENCES `flux_steps` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_flows`
ADD INDEX `fk_flux_flows_unit_idx` (`unit_organizations_id`);
ALTER TABLE `flux_flows` 
ADD CONSTRAINT `fk_flux_flows_unit`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_flows`
ADD INDEX `fk_flux_flows_units1_idx` (`destination_organizations_id`);
ALTER TABLE `flux_flows` 
ADD CONSTRAINT `fk_flux_flows_units1`
  FOREIGN KEY (`destination_organizations_id`)
  REFERENCES `unitorganizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table flux_fluxes
--
-- ACTIVE AND DELETE
ALTER TABLE `flux_fluxes` 
ADD INDEX `idx_flux_fluxes_deleted` (`deleted`);

ALTER TABLE `flux_fluxes` 
ADD INDEX `idx_flux_fluxes_active` (`active`);

-- FOREIGN KEY
ALTER TABLE `flux_fluxes`
ADD INDEX `fk_flux_fluxes_unit_idx` (`unit_organizations_id`);
ALTER TABLE `flux_fluxes` 
ADD CONSTRAINT `fk_flux_fluxes_unit`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_fluxes`
ADD INDEX `fk_flux_fluxes_origin_idx` (`flux_origins_id`);
ALTER TABLE `flux_fluxes` 
ADD CONSTRAINT `fk_flux_fluxes_origin`
  FOREIGN KEY (`flux_origins_id`)
  REFERENCES `flux_origins` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_fluxes`
ADD INDEX `fk_flux_fluxes_status_idx` (`flux_status_id`);
ALTER TABLE `flux_fluxes` 
ADD CONSTRAINT `fk_flux_fluxes_status`
  FOREIGN KEY (`flux_status_id`)
  REFERENCES `flux_status` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_fluxes`
ADD INDEX `fk_flux_fluxes_subject_idx` (`flux_subjects_id`);
ALTER TABLE `flux_fluxes` 
ADD CONSTRAINT `fk_flux_fluxes_subject`
  FOREIGN KEY (`flux_subjects_id`)
  REFERENCES `flux_subjects` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_fluxes`
ADD INDEX `fk_flux_fluxes_board_idx` (`flux_boards_id`);
ALTER TABLE `flux_fluxes` 
ADD CONSTRAINT `fk_flux_fluxes_board`
  FOREIGN KEY (`flux_boards_id`)
  REFERENCES `flux_boards` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_fluxes`
ADD INDEX `fk_flux_fluxes_step_idx` (`flux_steps_id`);
ALTER TABLE `flux_fluxes` 
ADD CONSTRAINT `fk_flux_fluxes_step`
  FOREIGN KEY (`flux_steps_id`)
  REFERENCES `flux_steps` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_fluxes`
ADD INDEX `fk_flux_fluxes_user_idx` (`owner_id`);
ALTER TABLE `flux_fluxes` 
ADD CONSTRAINT `fk_flux_fluxes_user`
  FOREIGN KEY (`owner_id`)
  REFERENCES `user_users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_fluxes`
ADD INDEX `fk_flux_fluxes_priority_idx` (`flux_priorities_id`);
ALTER TABLE `flux_fluxes` 
ADD CONSTRAINT `fk_flux_fluxes_priority`
  FOREIGN KEY (`flux_priorities_id`)
  REFERENCES `flux_priorities` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table flux_messages
--
-- ACTIVE AND DELETE
ALTER TABLE `flux_messages` 
ADD INDEX `idx_flux_messages_deleted` (`deleted`);

ALTER TABLE `flux_messages` 
ADD INDEX `idx_flux_messages_active` (`active`);

-- FOREIGN KEY
ALTER TABLE `flux_messages`
ADD INDEX `fk_flux_messages_unit_idx` (`unit_organizations_id`);
ALTER TABLE `flux_messages` 
ADD CONSTRAINT `fk_flux_messages_unit`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_messages`
ADD INDEX `fk_flux_messages_flux_idx` (`flux_fluxes_id`);
ALTER TABLE `flux_messages` 
ADD CONSTRAINT `fk_flux_messages_flux`
  FOREIGN KEY (`flux_fluxes_id`)
  REFERENCES `flux_fluxes` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_messages`
ADD INDEX `fk_flux_messages_contacts_idx` (`origin_id`);
ALTER TABLE `flux_messages` 
ADD CONSTRAINT `fk_flux_messages_contacts`
  FOREIGN KEY (`origin_id`)
  REFERENCES `cnt_contacts` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_messages`
ADD INDEX `fk_flux_messages_contacts1_idx` (`destination_id`);
ALTER TABLE `flux_messages` 
ADD CONSTRAINT `fk_flux_messages_contacts1`
  FOREIGN KEY (`destination_id`)
  REFERENCES `cnt_contacts` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table flux_origins
--
-- ACTIVE AND DELETE
ALTER TABLE `flux_origins` 
ADD INDEX `idx_flux_origins_deleted` (`deleted`);

ALTER TABLE `flux_origins` 
ADD INDEX `idx_flux_origins_active` (`active`);

-- UNIQUE
ALTER TABLE `flux_origins` 
ADD UNIQUE INDEX `idx_flux_origins_UNIQUE` (`unit_organizations_id`,`name`);

-- FOREIGN KEY
ALTER TABLE `flux_origins`
ADD INDEX `fk_flux_origins_units_idx` (`unit_organizations_id`);
ALTER TABLE `flux_origins` 
ADD CONSTRAINT `fk_flux_origins_units`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table flux_priorities
--
-- ACTIVE AND DELETE
ALTER TABLE `flux_priorities` 
ADD INDEX `idx_flux_priorities_deleted` (`deleted`);

ALTER TABLE `flux_priorities` 
ADD INDEX `idx_flux_priorities_active` (`active`);

-- UNIQUE
ALTER TABLE `flux_priorities` 
ADD UNIQUE INDEX `idx_flux_priorities_UNIQUE` (`unit_organizations_id`,`name`);

ALTER TABLE `flux_priorities` 
ADD UNIQUE INDEX `idx_flux_priorities_UNIQUE2` (`unit_organizations_id`,`priority_order`);

-- FOREIGN KEY
ALTER TABLE `flux_priorities`
ADD INDEX `flux_priorities_units_idx` (`unit_organizations_id`);
ALTER TABLE `flux_priorities` 
ADD CONSTRAINT `flux_priorities_units`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table flux_status
--
-- ACTIVE AND DELETE
ALTER TABLE `flux_status` 
ADD INDEX `idx_flux_status_deleted` (`deleted`);

ALTER TABLE `flux_status` 
ADD INDEX `idx_flux_status_active` (`active`);

-- UNIQUE
ALTER TABLE `flux_status` 
ADD UNIQUE INDEX `idx_flux_status_UNIQUE` (`unit_organizations_id`,`name`);

-- FOREIGN KEY
ALTER TABLE `flux_status`
ADD INDEX `flux_status_units_idx` (`unit_organizations_id`);
ALTER TABLE `flux_status` 
ADD CONSTRAINT `flux_status_units`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table flux_step_field_values
--
-- ACTIVE AND DELETE
ALTER TABLE `flux_step_field_values` 
ADD INDEX `idx_flux_step_field_values_deleted` (`deleted`);

ALTER TABLE `flux_step_field_values` 
ADD INDEX `idx_flux_step_field_values_active` (`active`);

-- UNIQUE
ALTER TABLE `flux_step_field_values` 
ADD UNIQUE INDEX `flux_step_field_values_UNIQUE` (`flux_fluxes_id`,`flux_step_fields_id`);

-- FOREIGN KEY
ALTER TABLE `flux_step_field_values`
ADD INDEX `fk_flux_step_field_values_flux_idx` (`flux_fluxes_id`);
ALTER TABLE `flux_step_field_values` 
ADD CONSTRAINT `fk_flux_step_field_values_flux`
  FOREIGN KEY (`flux_fluxes_id`)
  REFERENCES `flux_fluxes` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_step_field_values`
ADD INDEX `fk_flux_step_field_values_step_idx` (`flux_step_fields_id`);
ALTER TABLE `flux_step_field_values` 
ADD CONSTRAINT `fk_flux_step_field_values_step`
  FOREIGN KEY (`flux_step_fields_id`)
  REFERENCES `flux_step_fields` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table flux_step_fields
--
-- ACTIVE AND DELETE
ALTER TABLE `flux_step_fields` 
ADD INDEX `idx_flux_step_fields_deleted` (`deleted`);

ALTER TABLE `flux_step_fields` 
ADD INDEX `idx_flux_step_fields_active` (`active`);

-- UNIQUE
ALTER TABLE `flux_step_fields` 
ADD UNIQUE INDEX `idx_flux_step_fields_UNIQUE` (`parent_id`,`flux_field_types_id`,`unit_organizations_id`,`flux_subjects_id`,`flux_steps_id`,`field_name`);

-- FOREIGN KEY
ALTER TABLE `flux_step_fields`
ADD INDEX `fk_flux_step_fields_parent_idx` (`parent_id`);
ALTER TABLE `flux_step_fields` 
ADD CONSTRAINT `fk_flux_step_fields_parent`
  FOREIGN KEY (`parent_id`)
  REFERENCES `flux_step_fields` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_step_fields`
ADD INDEX `fk_flux_step_fields_steps_idx` (`flux_steps_id`);
ALTER TABLE `flux_step_fields` 
ADD CONSTRAINT `fk_flux_step_fields_steps`
  FOREIGN KEY (`flux_steps_id`)
  REFERENCES `flux_steps` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_step_fields`
ADD INDEX `fk_flux_step_fields_type_idx` (`flux_field_types_id`);
ALTER TABLE `flux_step_fields` 
ADD CONSTRAINT `fk_flux_step_fields_type`
  FOREIGN KEY (`flux_field_types_id`)
  REFERENCES `flux_field_types` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_step_fields`
ADD INDEX `fk_flux_step_fields_unit_idx` (`unit_organizations_id`);
ALTER TABLE `flux_step_fields` 
ADD CONSTRAINT `fk_flux_step_fields_unit`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_step_fields`
ADD INDEX `fl_flux_step_fields_subjects_idx` (`flux_subjects_id`);
ALTER TABLE `flux_step_fields` 
ADD CONSTRAINT `fl_flux_step_fields_subjects`
  FOREIGN KEY (`flux_subjects_id`)
  REFERENCES `flux_subjects` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table flux_steps
--
-- ACTIVE AND DELETE
ALTER TABLE `flux_steps` 
ADD INDEX `idx_flux_steps_deleted` (`deleted`);

ALTER TABLE `flux_steps` 
ADD INDEX `idx_flux_steps_active` (`active`);

-- UNIQUE
ALTER TABLE `flux_steps` 
ADD UNIQUE INDEX `idx_flux_steps_UNIQUE` (`unit_organizations_id`,`flux_boards_id`,`flux_subjects_id`,`name`);

ALTER TABLE `flux_steps` 
ADD UNIQUE INDEX `idx_flux_steps_UNIQUE2` (`unit_organizations_id`,`flux_boards_id`,`flux_subjects_id`,`step_order`);

-- FOREIGN KEY
ALTER TABLE `flux_steps`
ADD INDEX `fk_flux_steps_units_idx` (`unit_organizations_id`);
ALTER TABLE `flux_steps` 
ADD CONSTRAINT `fk_flux_steps_units`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_steps`
ADD INDEX `fk_flux_steps_boards_idx` (`flux_boards_id`);
ALTER TABLE `flux_steps` 
ADD CONSTRAINT `fk_flux_steps_boards`
  FOREIGN KEY (`flux_boards_id`)
  REFERENCES `flux_boards` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `flux_steps`
ADD INDEX `fk_flux_steps_subjects_idx` (`flux_subjects_id`);
ALTER TABLE `flux_steps` 
ADD CONSTRAINT `fk_flux_steps_subjects`
  FOREIGN KEY (`flux_subjects_id`)
  REFERENCES `flux_subjects` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table flux_subjects
--
-- ACTIVE AND DELETE
ALTER TABLE `flux_subjects` 
ADD INDEX `idx_flux_subjects_deleted` (`deleted`);

ALTER TABLE `flux_subjects` 
ADD INDEX `idx_flux_subjects_active` (`active`);

-- UNIQUE
ALTER TABLE `flux_subjects` 
ADD UNIQUE INDEX `idx_flux_subjects_UNIQUE` (`unit_organizations_id`,`name`);


-- FOREIGN KEY
ALTER TABLE `flux_subjects`
ADD INDEX `fk_flux_subjects_unit_idx` (`unit_organizations_id`);
ALTER TABLE `flux_subjects` 
ADD CONSTRAINT `fk_flux_subjects_unit`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


--
-- Indexes for table unit_organization_hierarchy
--
-- ACTIVE AND DELETE
ALTER TABLE `unit_organization_hierarchy` 
ADD INDEX `idx_unit_organization_hierarchy_deleted` (`deleted`);

ALTER TABLE `unit_organization_hierarchy` 
ADD INDEX `idx_unit_organization_hierarchy_active` (`active`);

-- UNIQUE
ALTER TABLE `unit_organization_hierarchy` 
ADD UNIQUE INDEX `idx_unit_organization_hierarchy_UNIQUE` (`unit_organizations_id`,`unit_parent_child_id`);

-- FOREIGN KEY
ALTER TABLE `unit_organization_hierarchy`
ADD INDEX `fk_unit_organization_hierarchy_unit_idx` (`unit_organizations_id`);
ALTER TABLE `unit_organization_hierarchy` 
ADD CONSTRAINT `fk_unit_organization_hierarchy_unit`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `unit_organization_hierarchy`
ADD INDEX `fk_unit_organization_hierarchy_pc_idx` (`unit_parent_child_id`);
ALTER TABLE `unit_organization_hierarchy` 
ADD CONSTRAINT `fk_unit_organization_hierarchy_pc`
  FOREIGN KEY (`unit_parent_child_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table unit_organization_types
--
-- ACTIVE AND DELETE
ALTER TABLE `unit_organization_types` 
ADD INDEX `idx_unit_organization_types_deleted` (`deleted`);

ALTER TABLE `unit_organization_types` 
ADD INDEX `idx_unit_organization_types_active` (`active`);

-- UNIQUE
ALTER TABLE `unit_organization_types` 
ADD UNIQUE INDEX `idx_unit_organization_types_UNIQUE` (`name`);

--
-- Indexes for table unit_organization_types
--
-- ACTIVE AND DELETE
ALTER TABLE `unit_organizations` 
ADD INDEX `idx_unit_organizations_deleted` (`deleted`);

ALTER TABLE `unit_organizations` 
ADD INDEX `idx_unit_organizations_active` (`active`);

-- UNIQUE
ALTER TABLE `unit_organizations` 
ADD UNIQUE INDEX `idx_unit_organizations_UNIQUE` (`parent_id`,`unit_organization_types_id`,`name`);

-- FOREIGN KEY
ALTER TABLE `unit_organizations`
ADD INDEX `fk_flux_subjects_unit_idx` (`parent_id`);
ALTER TABLE `unit_organizations` 
ADD CONSTRAINT `fk_unit_organizations_parent`
  FOREIGN KEY (`parent_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `unit_organizations`
ADD INDEX `fk_unit_organizations_types_idx` (`unit_organization_types_id`);
ALTER TABLE `unit_organizations` 
ADD CONSTRAINT `fk_unit_organizations_types`
  FOREIGN KEY (`unit_organization_types_id`)
  REFERENCES `unit_organization_types` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `unit_organizations`
ADD INDEX `fk_unit_organizations_contacts_idx` (`cnt_contacts_id`);
ALTER TABLE `unit_organizations` 
ADD CONSTRAINT `fk_unit_organizations_contacts`
  FOREIGN KEY (`cnt_contacts_id`)
  REFERENCES `cnt_contacts` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table user_assigned_organizations
--
-- ACTIVE AND DELETE
ALTER TABLE `user_assigned_organizations` 
ADD INDEX `idx_user_assigned_organizations_deleted` (`deleted`);

ALTER TABLE `user_assigned_organizations` 
ADD INDEX `idx_user_assigned_organizations_active` (`active`);

-- UNIQUE
ALTER TABLE `user_assigned_organizations` 
ADD UNIQUE INDEX `idx_user_assigned_organizations_UNIQUE` (`unit_organizations_id`,`user_users_id`);

-- FOREIGN KEY
ALTER TABLE `user_assigned_organizations`
ADD INDEX `fk_user_assigned_organizations_unit_idx` (`unit_organizations_id`);
ALTER TABLE `user_assigned_organizations` 
ADD CONSTRAINT `fk_user_assigned_organizations_unit`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `user_assigned_organizations`
ADD INDEX `fk_user_assigned_organizations_users_idx` (`user_users_id`);
ALTER TABLE `user_assigned_organizations` 
ADD CONSTRAINT `fk_user_assigned_organizations_users`
  FOREIGN KEY (`user_users_id`)
  REFERENCES `user_users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table user_assingned_roles
--
-- ACTIVE AND DELETE
ALTER TABLE `user_assingned_roles` 
ADD INDEX `idx_user_assingned_roles_deleted` (`deleted`);

ALTER TABLE `user_assingned_roles` 
ADD INDEX `idx_user_assingned_roles_active` (`active`);

-- UNIQUE
ALTER TABLE `user_assingned_roles` 
ADD UNIQUE INDEX `idx_user_assingned_roles_UNIQUE` (`user_roles_id`,`user_users_id`,`unit_organizations_id`);

-- FOREIGN KEY
ALTER TABLE `user_assingned_roles`
ADD INDEX `fk_user_assingned_roles_roles_idx` (`user_roles_id`);
ALTER TABLE `user_assingned_roles` 
ADD CONSTRAINT `fk_user_assingned_roles_roles`
  FOREIGN KEY (`user_roles_id`)
  REFERENCES `user_roles` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `user_assingned_roles`
ADD INDEX `fk_user_assingned_roles_users_idx` (`user_users_id`);
ALTER TABLE `user_assingned_roles` 
ADD CONSTRAINT `fk_user_assingned_roles_users`
  FOREIGN KEY (`user_users_id`)
  REFERENCES `user_users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `user_assingned_roles`
ADD INDEX `fk_user_assingned_roles_unit_idx` (`unit_organizations_id`);
ALTER TABLE `user_assingned_roles` 
ADD CONSTRAINT `fk_user_assingned_roles_unit`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table user_role_permissions
--
-- ACTIVE AND DELETE
ALTER TABLE `user_role_permissions` 
ADD INDEX `idx_user_role_permissions_deleted` (`deleted`);

ALTER TABLE `user_role_permissions` 
ADD INDEX `idx_user_role_permissions_active` (`active`);

-- UNIQUE
ALTER TABLE `user_role_permissions` 
ADD UNIQUE INDEX `idx_user_role_permissions_UNIQUE` (`app_modules_id`,`app_controllers_id`,`app_actions_id`,`user_roles_id`,`name`);

-- FOREIGN KEY
ALTER TABLE `user_role_permissions`
ADD INDEX `fk_user_role_permissions_modules_idx` (`app_modules_id`);
ALTER TABLE `user_role_permissions` 
ADD CONSTRAINT `fk_user_role_permissions_modules`
  FOREIGN KEY (`app_modules_id`)
  REFERENCES `app_modules` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `user_role_permissions`
ADD INDEX `fk_user_role_permissions_controllers_idx` (`app_controllers_id`);
ALTER TABLE `user_role_permissions` 
ADD CONSTRAINT `fk_user_role_permissions_controllers`
  FOREIGN KEY (`app_controllers_id`)
  REFERENCES `app_controllers` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `user_role_permissions`
ADD INDEX `fk_user_role_permissions_actions_idx` (`app_actions_id`);
ALTER TABLE `user_role_permissions` 
ADD CONSTRAINT `fk_user_role_permissions_actions`
  FOREIGN KEY (`app_actions_id`)
  REFERENCES `app_actions` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `user_role_permissions`
ADD INDEX `fk_user_role_permissions_roles_idx` (`user_roles_id`);
ALTER TABLE `user_role_permissions` 
ADD CONSTRAINT `fk_user_role_permissions_roles`
  FOREIGN KEY (`user_roles_id`)
  REFERENCES `user_roles` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table user_roles
--
-- ACTIVE AND DELETE
ALTER TABLE `user_roles` 
ADD INDEX `idx_user_roles_deleted` (`deleted`);

ALTER TABLE `user_roles` 
ADD INDEX `idx_user_roles_active` (`active`);

-- UNIQUE
ALTER TABLE `user_roles` 
ADD UNIQUE INDEX `idx_user_roles_UNIQUE` (`unit_organizations_id`,`name`);

-- FOREIGN KEY
ALTER TABLE `user_roles`
ADD INDEX `fk_user_roles_unit_idx` (`unit_organizations_id`);
ALTER TABLE `user_roles` 
ADD CONSTRAINT `fk_user_roles_unit`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--
-- Indexes for table user_roles
--
-- ACTIVE AND DELETE
ALTER TABLE `user_users` 
ADD INDEX `idx_user_users_deleted` (`deleted`);

ALTER TABLE `user_users` 
ADD INDEX `idx_user_users_active` (`active`);

-- UNIQUE
ALTER TABLE `user_users` 
ADD UNIQUE INDEX `idx_user_users_UNIQUE` (`unit_organizations_id`,`email`);

-- FOREIGN KEY
ALTER TABLE `user_users`
ADD INDEX `fk_user_users_unit_idx` (`unit_organizations_id`);
ALTER TABLE `user_users` 
ADD CONSTRAINT `fk_user_users_unit`
  FOREIGN KEY (`unit_organizations_id`)
  REFERENCES `unit_organizations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET FOREIGN_KEY_CHECKS=1;
SET UNIQUE_CHECKS=1;


