CREATE TABLE `ht_booking_status` (
  `status_id` varchar(10) NOT NULL,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`status_id`)
);

INSERT INTO ht_booking_status (status_id, name) VALUES
('pending', 'Pending'),
('processing', 'Processing'),
('completed', 'Completed'),
('lunas', 'Lunas'),
('checkin', 'Check-In'),
('checkout', 'Check-Out'),
('cancelled', 'Cancelled');

CREATE TABLE `payment_status` (
  `status_id` varchar(10) NOT NULL,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`status_id`)
);

INSERT INTO payment_status (status_id, name) VALUES
('pending', 'Pending'),
('completed', 'Completed'),
('refunding', 'Refunding'),
('refunded', 'Refunded'),
('fraud', 'Fraud'),
('failed', 'Failed');

update payments
set status = 'lunas'
where status = 'completed';