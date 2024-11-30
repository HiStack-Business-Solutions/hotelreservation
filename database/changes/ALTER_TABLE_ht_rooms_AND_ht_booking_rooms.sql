ALTER TABLE `resort`.`ht_rooms` 
ADD COLUMN `max_extra_beds` int NOT NULL DEFAULT 0 AFTER `number_of_beds`;
ALTER TABLE `resort`.`ht_booking_rooms` 
ADD COLUMN `extra_beds` int NOT NULL DEFAULT 0 AFTER `number_of_rooms`;
ALTER TABLE `resort`.`ht_rooms` 
ADD COLUMN `extra_bed_price` decimal(15,0) unsigned NOT NULL DEFAULT 0 AFTER `max_extra_beds`;

UPDATE `resort`.`ht_rooms`
SET max_extra_beds = number_of_beds
where number_of_beds is not null;