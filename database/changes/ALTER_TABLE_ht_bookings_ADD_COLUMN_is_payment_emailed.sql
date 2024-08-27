ALTER TABLE `resort`.`ht_bookings` 
ADD COLUMN `is_payment_emailed` TINYINT NOT NULL DEFAULT 0 AFTER `payment_proof`;
