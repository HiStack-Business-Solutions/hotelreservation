-- Backup the existing data
CREATE TABLE ht_room_dates_backup AS SELECT * FROM ht_room_dates;

-- Modify the column type
ALTER TABLE ht_room_dates MODIFY COLUMN discount decimal(20,17);

-- Verify the data conversion
SELECT id, discount FROM ht_room_dates WHERE discount > 0 LIMIT 5;

-- If everything looks good, you can drop the backup table
-- DROP TABLE ht_room_dates_backup; 