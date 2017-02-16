SET UNIQUE_CHECKS=0;
SET FOREIGN_KEY_CHECKS=0;

--
-- Schema
--
USE `fluxflow`;

--
-- Trigger for geo_countries history table
--
DROP TRIGGER IF EXISTS geo_countries_bu;
delimiter $$
CREATE TRIGGER geo_countries_bu BEFORE UPDATE ON geo_countries
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_geo_countries (
            `original_id`,
            `name`,
            `code_1`,
            `code_2`,
            `phone_code`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`code_1`,
            OLD.`code_2`,
            OLD.`phone_code`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for geo_provinces history table
--
DROP TRIGGER IF EXISTS geo_provinces_bu;
delimiter $$
CREATE TRIGGER geo_provinces_bu BEFORE UPDATE ON geo_provinces
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_geo_provinces (
            `original_id`,
            `geo_countries_id`,
            `code`,
            `type`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`geo_countries_id`,
            OLD.`code`,
            OLD.`type`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for geo_cities history table
--
DROP TRIGGER IF EXISTS geo_cities_bu;
delimiter $$
CREATE TRIGGER geo_cities_bu BEFORE UPDATE ON geo_cities
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_geo_cities (
            `original_id`,
            `geo_countries_id`,
            `geo_provinces_id`,
            `name`,
            `latitude`,
            `longitude`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`geo_countries_id`,
            OLD.`geo_provinces_id`,
            OLD.`name`,
            OLD.`latitude`,
            OLD.`longitude`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for cnt_contact_types history table
--
DROP TRIGGER IF EXISTS cnt_contact_types_bu;
delimiter $$
CREATE TRIGGER cnt_contact_types_bu BEFORE UPDATE ON cnt_contact_types
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_cnt_contact_types (
            `original_id`,
            `unit_organizations_id`,
            `name`,
            `description_key`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`name`,
            OLD.`description_key`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for cnt_contacts history table
--
DROP TRIGGER IF EXISTS cnt_contacts_bu;
delimiter $$
CREATE TRIGGER cnt_contacts_bu BEFORE UPDATE ON cnt_contacts
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_cnt_contacts (
            `original_id`,
            `unit_organizations_id`,
            `company_name`,
            `name`,
            `surename`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`company_name`,
            OLD.`name`,
            OLD.`surename`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for cnt_contacts history table
--
DROP TRIGGER IF EXISTS cnt_contacts_bu;
delimiter $$
CREATE TRIGGER cnt_contacts_bu BEFORE UPDATE ON cnt_contacts
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_cnt_contacts (
            `original_id`,
            `unit_organizations_id`,
            `company_name`,
            `name`,
            `surename`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`company_name`,
            OLD.`name`,
            OLD.`surename`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for cnt_emails history table
--
DROP TRIGGER IF EXISTS cnt_emails_bu;
delimiter $$
CREATE TRIGGER cnt_emails_bu BEFORE UPDATE ON cnt_emails
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_cnt_emails (
            `original_id`,
            `unit_organizations_id`,
            `cnt_contact_types_id`,
            `cnt_contacts_id`,
            `email`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`cnt_contact_types_id`,
            OLD.`cnt_contacts_id`,
            OLD.`email`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for cnt_emails history table
--
DROP TRIGGER IF EXISTS cnt_phones_bu;
delimiter $$
CREATE TRIGGER cnt_phones_bu BEFORE UPDATE ON cnt_phones
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_cnt_phones (
            `original_id`,
            `unit_organizations_id`,
            `cnt_contact_types_id`,
            `cnt_contacts_id`,
            `phone`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`cnt_contact_types_id`,
            OLD.`cnt_contacts_id`,
            OLD.`phone`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for cnt_emails history table
--
DROP TRIGGER IF EXISTS cnt_addresses_bu;
delimiter $$
CREATE TRIGGER cnt_addresses_bu BEFORE UPDATE ON cnt_addresses
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_cnt_addresses (
            `original_id`,
            `unit_organizations_id`,
            `cnt_contact_types_id`,
            `cnt_contacts_id`,
            `geo_countries_id`,
            `geo_provinces_id`,
            `neigborhood`,
            `zip_code`,
            `street_address`,
            `door_number`,
            `room`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`cnt_contact_types_id`,
            OLD.`cnt_contacts_id`,
            OLD.`geo_countries_id`,
            OLD.`geo_provinces_id`,
            OLD.`neigborhood`,
            OLD.`zip_code`,
            OLD.`street_address`,
            OLD.`door_number`,
            OLD.`room`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for app_actions history table
--
DROP TRIGGER IF EXISTS app_actions_bu;
delimiter $$
CREATE TRIGGER app_actions_bu BEFORE UPDATE ON app_actions
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_app_actions (
            `original_id`,
            `app_modules_id`,
            `app_controllers_id`,
            `name`,
            `key`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`app_modules_id`,
            OLD.`app_controllers_id`,
            OLD.`name`,
            OLD.`key`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for app_controllers history table
--
DROP TRIGGER IF EXISTS app_controllers_bu;
delimiter $$
CREATE TRIGGER app_controllers_bu BEFORE UPDATE ON app_controllers
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_app_controllers (
            `original_id`,
            `app_modules_id`,
            `name`,
            `key`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`app_modules_id`,
            OLD.`name`,
            OLD.`key`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for app_modules history table
--
DROP TRIGGER IF EXISTS app_modules_bu;
delimiter $$
CREATE TRIGGER app_modules_bu BEFORE UPDATE ON app_modules
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_app_modules (
            `original_id`,
            `name`,
            `key`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`name`,
            OLD.`key`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for flux_boards history table
--
DROP TRIGGER IF EXISTS flux_boards_bu;
delimiter $$
CREATE TRIGGER flux_boards_bu BEFORE UPDATE ON flux_boards
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_flux_boards (
            `original_id`,
            `unit_organizations_id`,
            `name`,
            `description_key`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`name`,
            OLD.`description_key`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for flux_event_types history table
--
DROP TRIGGER IF EXISTS flux_event_types_bu;
delimiter $$
CREATE TRIGGER flux_event_types_bu BEFORE UPDATE ON flux_event_types
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_flux_event_types (
            `original_id`,
            `unit_organizations_id`,
            `name`,
            `description_key`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`name`,
            OLD.`description_key`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for flux_events history table
--
DROP TRIGGER IF EXISTS flux_events_bu;
delimiter $$
CREATE TRIGGER flux_events_bu BEFORE UPDATE ON flux_events
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_flux_events (
            `original_id`,
            `flux_event_types_id`,
            `flux_fluxes_id`,
            `flux_messages_id`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`flux_event_types_id`,
            OLD.`flux_fluxes_id`,
            OLD.`flux_messages_id`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for flux_field_types history table
--
DROP TRIGGER IF EXISTS flux_field_types_bu;
delimiter $$
CREATE TRIGGER flux_field_types_bu BEFORE UPDATE ON flux_field_types
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_flux_field_types (
            `original_id`,
            `unit_organizations_id`,
            `name`,
            `description_key`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`name`,
            OLD.`description_key`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for flux_flows history table
--
DROP TRIGGER IF EXISTS flux_flows_bu;
delimiter $$
CREATE TRIGGER flux_flows_bu BEFORE UPDATE ON flux_flows
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_flux_flows (
            `original_id`,
            `unit_organizations_id`,
            `flux_boards_id`,
            `flux_steps_id`,
            `destination_organizations_id`,
            `deatination_boards_id`,
            `destination_steps_id`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`flux_boards_id`,
            OLD.`flux_steps_id`,
            OLD.`destination_organizations_id`,
            OLD.`deatination_boards_id`,
            OLD.`destination_steps_id`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for flux_fluxes history table
--
DROP TRIGGER IF EXISTS flux_fluxes_bu;
delimiter $$
CREATE TRIGGER flux_fluxes_bu BEFORE UPDATE ON flux_fluxes
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_flux_fluxes (
            `original_id`,
            `unit_organizations_id`,
            `flux_origins_id`,
            `flux_status_id`,
            `flux_subjects_id`,
            `flux_boards_id`,
            `flux_steps_id`,
            `owner_id`,
            `flux_priorities_id`,
            `cnt_contact_id`,
            `email`,
            `phone`,
            `other`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`flux_origins_id`,
            OLD.`flux_status_id`,
            OLD.`flux_subjects_id`,
            OLD.`flux_boards_id`,
            OLD.`flux_steps_id`,
            OLD.`owner_id`,
            OLD.`flux_priorities_id`,
            OLD.`cnt_contact_id`,
            OLD.`email`,
            OLD.`phone`,
            OLD.`other`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for flux_messages history table
--
DROP TRIGGER IF EXISTS flux_messages_bu;
delimiter $$
CREATE TRIGGER flux_messages_bu BEFORE UPDATE ON flux_messages
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_flux_messages (
            `original_id`,
            `unit_organizations_id`,
            `flux_fluxes_id`,
            `origin_id`,
            `destination_id`,
            `subject`,
            `message`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`flux_fluxes_id`,
            OLD.`origin_id`,
            OLD.`destination_id`,
            OLD.`subject`,
            OLD.`message`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for flux_origins history table
--
DROP TRIGGER IF EXISTS flux_origins_bu;
delimiter $$
CREATE TRIGGER flux_origins_bu BEFORE UPDATE ON flux_origins
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_flux_origins (
            `original_id`,
            `unit_organizations_id`,
            `name`,
            `description_key`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`name`,
            OLD.`description_key`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for flux_priorities history table
--
DROP TRIGGER IF EXISTS flux_priorities_bu;
delimiter $$
CREATE TRIGGER flux_priorities_bu BEFORE UPDATE ON flux_priorities
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_flux_priorities (
            `original_id`,
            `unit_organizations_id`,
            `name`,
            `description_key`,
            `priority_order`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`name`,
            OLD.`description_key`,
            OLD.`priority_order`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for flux_status history table
--
DROP TRIGGER IF EXISTS flux_status_bu;
delimiter $$
CREATE TRIGGER flux_status_bu BEFORE UPDATE ON flux_status
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_flux_status (
            `original_id`,
            `unit_organizations_id`,
            `name`,
            `description_key`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`name`,
            OLD.`description_key`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for flux_step_field_values history table
--
DROP TRIGGER IF EXISTS flux_step_field_values_bu;
delimiter $$
CREATE TRIGGER flux_step_field_values_bu BEFORE UPDATE ON flux_step_field_values
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_flux_step_field_values (
            `original_id`,
            `flux_fluxes_id`,
            `flux_step_fields_id`,
            `val_int`,
            `val_char`,
            `val_text`,
            `val_bool`,
            `val_decimal`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`flux_fluxes_id`,
            OLD.`flux_step_fields_id`,
            OLD.`val_int`,
            OLD.`val_char`,
            OLD.`val_text`,
            OLD.`val_bool`,
            OLD.`val_decimal`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for flux_step_fields history table
--
DROP TRIGGER IF EXISTS flux_step_fields_bu;
delimiter $$
CREATE TRIGGER flux_step_fields_bu BEFORE UPDATE ON flux_step_fields
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_flux_step_fields (
            `original_id`,
            `parent_id`,
            `flux_field_types_id`,
            `unit_organizations_id`,
            `flux_subjects_id`,
            `flux_steps_id`,
            `val_type`,
            `field_caption`,
            `description_key`,
            `field_name`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`parent_id`,
            OLD.`flux_field_types_id`,
            OLD.`unit_organizations_id`,
            OLD.`flux_subjects_id`,
            OLD.`flux_steps_id`,
            OLD.`val_type`,
            OLD.`field_caption`,
            OLD.`description_key`,
            OLD.`field_name`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for flux_steps history table
--
DROP TRIGGER IF EXISTS flux_steps_bu;
delimiter $$
CREATE TRIGGER flux_steps_bu BEFORE UPDATE ON flux_steps
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_flux_steps (
            `original_id`,
            `unit_organizations_id`,
            `flux_boards_id`,
            `flux_subjects_id`,
            `name`,
            `description_key`,
            `step_order`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`flux_boards_id`,
            OLD.`flux_subjects_id`,
            OLD.`name`,
            OLD.`description_key`,
            OLD.`step_order`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for flux_subjects history table
--
DROP TRIGGER IF EXISTS flux_subjects_bu;
delimiter $$
CREATE TRIGGER flux_subjects_bu BEFORE UPDATE ON flux_subjects
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_flux_subjects (
            `original_id`,
            `unit_organizations_id`,
            `name`,
            `description_key`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`name`,
            OLD.`description_key`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for unit_organization_types history table
--
DROP TRIGGER IF EXISTS unit_organization_types_bu;
delimiter $$
CREATE TRIGGER unit_organization_types_bu BEFORE UPDATE ON unit_organization_types
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_flux_subjects (
            `original_id`,
            `name`,
            `description_key`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`name`,
            OLD.`description_key`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for unit_organizations history table
--
DROP TRIGGER IF EXISTS unit_organizations_bu;
delimiter $$
CREATE TRIGGER unit_organizations_bu BEFORE UPDATE ON unit_organizations
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_unit_organizations (
            `original_id`,
            `parent_id`,
            `unit_organization_types_id`,
            `cnt_contacts_id`,
            `name`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`parent_id`,
            OLD.`unit_organization_types_id`,
            OLD.`cnt_contacts_id`,
            OLD.`name`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for unit_organization_hierarchy history table
--
DROP TRIGGER IF EXISTS unit_organization_hierarchy_bu;
delimiter $$
CREATE TRIGGER unit_organization_hierarchy_bu BEFORE UPDATE ON unit_organization_hierarchy
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_unit_organizations (
            `original_id`,
            `unit_organizations_id`,
            `unit_parent_child_id`,
            `direction`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`unit_parent_child_id`,
            OLD.`direction`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for user_assigned_organizations history table
--
DROP TRIGGER IF EXISTS user_assigned_organizations_bu;
delimiter $$
CREATE TRIGGER user_assigned_organizations_bu BEFORE UPDATE ON user_assigned_organizations
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_user_assigned_organizations (
            `original_id`,
            `unit_organizations_id`,
            `user_users_id`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`user_users_id`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for user_assingned_roles history table
--
DROP TRIGGER IF EXISTS user_assingned_roles_bu;
delimiter $$
CREATE TRIGGER user_assingned_roles_bu BEFORE UPDATE ON user_assingned_roles
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_user_assingned_roles (
            `original_id`,
            `unit_organizations_id`,
            `user_roles_id`,
            `user_users_id`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`user_roles_id`,
            OLD.`user_users_id`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for user_role_permissions history table
--
DROP TRIGGER IF EXISTS user_role_permissions_bu;
delimiter $$
CREATE TRIGGER user_role_permissions_bu BEFORE UPDATE ON user_role_permissions
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_user_role_permissions (
            `original_id`,
            `app_modules_id`,
            `app_controllers_id`,
            `app_actions_id`,
            `user_roles_id`,
            `name`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`app_modules_id`,
            OLD.`app_controllers_id`,
            OLD.`app_actions_id`,
            OLD.`user_roles_id`,
            OLD.`name`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for user_roles history table
--
DROP TRIGGER IF EXISTS user_roles_bu;
delimiter $$
CREATE TRIGGER user_roles_bu BEFORE UPDATE ON user_roles
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_user_roles (
            `original_id`,
            `unit_organizations_id`,
            `name`,
            `description`,
            `description_key`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`name`,
            OLD.`description`,
            OLD.`description_key`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

--
-- Trigger for user_roles history table
--
DROP TRIGGER IF EXISTS user_users_bu;
delimiter $$
CREATE TRIGGER user_users_bu BEFORE UPDATE ON user_users
FOR EACH ROW
    BEGIN
        INSERT INTO zhist_user_users (
            `original_id`,
            `unit_organizations_id`,
            `first_name`,
            `surename`,
            `email`,
            `password`,
            `last_login`,
            `last_operation`,
            `active`,
            `created_by`,
            `created_date`,
            `updated_by`,
            `updated_date`,
            `deleted_by`,
            `deleted_date`,
            `deleted`
	) VALUES (
            OLD.`id`,
            OLD.`unit_organizations_id`,
            OLD.`first_name`,
            OLD.`surename`,
            OLD.`email`,
            OLD.`password`,
            OLD.`last_login`,
            OLD.`last_operation`,
            OLD.`active`,
            OLD.`created_by`,
            OLD.`created_date`,
            OLD.`updated_by`,
            OLD.`updated_date`,
            OLD.`deleted_by`,
            OLD.`deleted_date`,
            OLD.`deleted`
	);
    END;$$
delimiter ;

SET FOREIGN_KEY_CHECKS=1;
SET UNIQUE_CHECKS=1;
