ALTER TABLE `resort`.`ht_bookings` 
ADD COLUMN `is_order_emailed` TINYINT NOT NULL DEFAULT 0 AFTER `discount`;
