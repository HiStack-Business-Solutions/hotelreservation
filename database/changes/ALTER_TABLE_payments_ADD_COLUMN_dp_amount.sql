ALTER TABLE `resort`.`payments` 
ADD COLUMN `dp_amount` DECIMAL(15,2) NOT NULL DEFAULT 0 AFTER `amount`;
