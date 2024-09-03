ALTER TABLE `resort`.`payments` 
ADD COLUMN `payment_proof` VARCHAR(65) NULL AFTER `customer_type`;

ALTER TABLE `resort`.`ht_bookings` 
DROP COLUMN `payment_proof`;

ALTER TABLE `resort`.`ht_bookings` 
ADD COLUMN `is_dp_payment_emailed` TINYINT NOT NULL DEFAULT 0 AFTER `is_payment_emailed`;
