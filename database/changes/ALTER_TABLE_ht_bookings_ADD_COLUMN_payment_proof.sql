ALTER TABLE `resort`.`ht_bookings` 
ADD COLUMN `payment_proof` VARCHAR(65) NULL AFTER `is_order_emailed`;
