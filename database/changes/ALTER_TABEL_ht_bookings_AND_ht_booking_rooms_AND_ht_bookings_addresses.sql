ALTER TABLE `resort`.`ht_bookings` 
ADD COLUMN `discount_amount` DECIMAL(15,2) NOT NULL DEFAULT 0 AFTER `discount`;

ALTER TABLE `resort`.`ht_booking_rooms` 
ADD COLUMN `discount_amount` DECIMAL(15,2) NOT NULL DEFAULT 0 AFTER `price`;

ALTER TABLE `resort`.`ht_booking_rooms` 
ADD COLUMN `tax_amount` DECIMAL(15,2) NOT NULL DEFAULT 0 AFTER `discount_amount`;

ALTER TABLE `resort`.`ht_booking_addresses` 
ADD COLUMN `nik` VARCHAR(25) NOT NULL AFTER `id`;

ALTER TABLE `ht_rooms` ADD `max_extrabed` INT(100) NOT NULL AFTER `max_adults`;
INSERT INTO `settings`(`id`, `key`, `value`, `created_at`, `updated_at`) VALUES ('','theme--payment_description','test',null, null)