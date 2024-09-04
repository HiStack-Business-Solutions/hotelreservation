ALTER TABLE `resort`.`ht_bookings` 
ADD COLUMN `room_num_reduced` TINYINT NOT NULL DEFAULT 0 AFTER `is_dp_payment_emailed`;
