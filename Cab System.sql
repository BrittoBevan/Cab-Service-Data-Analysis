use cab;
CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  gender ENUM('M','F','O') DEFAULT 'O',
  phone VARCHAR(15),
  email VARCHAR(100),
  join_date DATE);

CREATE TABLE drivers (
  driver_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  phone VARCHAR(15),
  join_date DATE,
  vehicle_pref VARCHAR(50),
  active ENUM('Y','N') DEFAULT 'Y');

CREATE TABLE cabs (
  cab_id INT AUTO_INCREMENT PRIMARY KEY,
  vehicle_type ENUM('Sedan','SUV','Hatchback','Minivan') NOT NULL,
  vehicle_number VARCHAR(20) UNIQUE,
  capacity INT DEFAULT 4,
  status ENUM('Active','Inactive') DEFAULT 'Active');

CREATE TABLE bookings (
  booking_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  driver_id INT NOT NULL,
  cab_id INT NOT NULL,
  pickup_location VARCHAR(100),
  dropoff_location VARCHAR(100),
  booking_time DATETIME,        -- when booking was made
  trip_start_time DATETIME,     -- NULL if not started (cancelled)
  trip_end_time DATETIME,       -- NULL if not completed
  status ENUM('Completed','Ongoing','Cancelled','NoShow') DEFAULT 'Completed',
  fare DECIMAL(8,2) DEFAULT 0.00,
  distance_km DECIMAL(6,2) DEFAULT 0.00,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
  FOREIGN KEY (driver_id) REFERENCES drivers(driver_id) ON DELETE CASCADE,
  FOREIGN KEY (cab_id) REFERENCES cabs(cab_id) ON DELETE CASCADE
);

CREATE TABLE feedback (
  feedback_id INT AUTO_INCREMENT PRIMARY KEY,
  booking_id INT NOT NULL,
  customer_id INT NOT NULL,
  driver_id INT NOT NULL,
  rating TINYINT UNSIGNED CHECK (rating BETWEEN 1 AND 5),
  comment VARCHAR(500)
);
drop table feedback;
-- ---------------------------
-- Insert sample customers (30 rows)
-- ---------------------------
INSERT INTO customers (name, gender, phone, email, join_date) VALUES
('Alice Brown','F','9876500001','alice.brown@example.com','2023-02-11'),
('Bob Smith','M','9876500002','bob.smith@example.com','2023-05-09'),
('Carol Jones','F','9876500003','carol.jones@example.com','2023-08-17'),
('David Lee','M','9876500004','david.lee@example.com','2024-01-20'),
('Emma White','F','9876500005','emma.white@example.com','2024-03-05'),
('Faiz Khan','M','9876500006','faiz.khan@example.com','2024-04-18'),
('Gina Patel','F','9876500007','gina.patel@example.com','2024-05-14'),
('Harish Rao','M','9876500008','harish.rao@example.com','2024-06-02'),
('Isha Verma','F','9876500009','isha.verma@example.com','2024-06-25'),
('Jatin Desai','M','9876500010','jatin.desai@example.com','2024-07-08'),
('Kavita Nair','F','9876500011','kavita.nair@example.com','2024-07-20'),
('Lucky Singh','M','9876500012','lucky.singh@example.com','2024-08-01'),
('Meera Das','F','9876500013','meera.das@example.com','2024-08-15'),
('Nikhil Gupta','M','9876500014','nikhil.gupta@example.com','2024-09-05'),
('Olivia Brown','F','9876500015','olivia.brown@example.com','2024-09-22'),
('Pranav Sharma','M','9876500016','pranav.sharma@example.com','2024-10-03'),
('Qiara Roy','F','9876500017','qiara.roy@example.com','2024-10-19'),
('Ramesh Pillai','M','9876500018','ramesh.pillai@example.com','2024-11-02'),
('Sunita Kapoor','F','9876500019','sunita.kapoor@example.com','2024-11-21'),
('Tahir Ahmed','M','9876500020','tahir.ahmed@example.com','2024-12-05'),
('Uma Menon','F','9876500021','uma.menon@example.com','2025-01-10'),
('Vikram Joshi','M','9876500022','vikram.joshi@example.com','2025-01-28'),
('Wafa Begum','F','9876500023','wafa.begum@example.com','2025-02-14'),
('Xavier D''Costa','M','9876500024','xavier.dcosta@example.com','2025-03-01'),
('Yash Chauhan','M','9876500025','yash.chauhan@example.com','2025-03-20'),
('Zara Khan','F','9876500026','zara.khan@example.com','2025-04-05'),
('Aman Verma','M','9876500027','aman.verma@example.com','2025-04-18'),
('Bina Rai','F','9876500028','bina.rai@example.com','2025-05-02'),
('Chetan Iyer','M','9876500029','chetan.iyer@example.com','2025-05-19'),
('Deepti Shah','F','9876500030','deepti.shah@example.com','2025-06-03');

-- ---------------------------
-- Insert sample drivers (30 rows)
-- ---------------------------
INSERT INTO drivers (name, phone, join_date, vehicle_pref, active) VALUES
('Rahul Sharma','9810000001','2022-06-15','Sedan','Y'),
('Sunil Kumar','9810000002','2023-01-20','SUV','Y'),
('Neha Patel','9810000003','2023-09-10','Hatchback','Y'),
('Arjun Mehta','9810000004','2024-02-18','Sedan','Y'),
('Priya Singh','9810000005','2024-05-05','SUV','Y'),
('Ravi Gupta','9810000006','2022-11-11','Sedan','Y'),
('Sonal Iyer','9810000007','2023-03-03','Hatchback','Y'),
('Ankit Verma','9810000008','2023-07-07','SUV','Y'),
('Bhavna Joshi','9810000009','2023-08-21','Sedan','Y'),
('Chirag Patel','9810000010','2023-10-10','SUV','Y'),
('Deepa Rao','9810000011','2024-01-05','Hatchback','Y'),
('Eshan Khan','9810000012','2024-02-02','SUV','Y'),
('Farah Ali','9810000013','2024-03-15','Sedan','Y'),
('Gautam Nair','9810000014','2024-04-12','SUV','Y'),
('Hema Roy','9810000015','2024-05-22','Hatchback','Y'),
('Irfan Sheikh','9810000016','2024-06-18','Sedan','Y'),
('Jaya Menon','9810000017','2024-07-25','SUV','Y'),
('Karan Malhotra','9810000018','2024-08-30','Sedan','Y'),
('Lata Kumari','9810000019','2024-09-11','Hatchback','Y'),
('Mohit Agarwal','9810000020','2024-10-16','SUV','Y'),
('Naveen Reddy','9810000021','2024-11-05','Sedan','Y'),
('Ojas Mehta','9810000022','2024-11-28','SUV','Y'),
('Priti Desai','9810000023','2024-12-20','Hatchback','Y'),
('Qadir Khan','9810000024','2025-01-18','Sedan','Y'),
('Ritu Sharma','9810000025','2025-02-14','SUV','Y'),
('Sameer K','9810000026','2025-03-08','Sedan','Y'),
('Tanvi Joshi','9810000027','2025-03-29','Hatchback','Y'),
('Uday Bansal','9810000028','2025-04-10','SUV','Y'),
('Vandana Pillai','9810000029','2025-05-04','Sedan','Y'),
('Waqar Hussain','9810000030','2025-06-06','SUV','Y');

-- ---------------------------
-- Insert sample cabs (30 rows)
-- ---------------------------
INSERT INTO cabs (vehicle_type, vehicle_number, capacity, status) VALUES
('Sedan','MH12AB1001',4,'Active'),
('SUV','MH12AB1002',6,'Active'),
('Hatchback','MH12AB1003',4,'Active'),
('Sedan','MH12AB1004',4,'Active'),
('SUV','MH12AB1005',6,'Active'),
('Hatchback','MH12AB1006',4,'Active'),
('Sedan','MH12AB1007',4,'Active'),
('SUV','MH12AB1008',6,'Active'),
('Hatchback','MH12AB1009',4,'Active'),
('Sedan','MH12AB1010',4,'Active'),
('SUV','MH12AB1011',6,'Active'),
('Hatchback','MH12AB1012',4,'Active'),
('Sedan','MH12AB1013',4,'Active'),
('SUV','MH12AB1014',6,'Active'),
('Hatchback','MH12AB1015',4,'Active'),
('Sedan','MH12AB1016',4,'Active'),
('SUV','MH12AB1017',6,'Active'),
('Hatchback','MH12AB1018',4,'Active'),
('Sedan','MH12AB1019',4,'Active'),
('SUV','MH12AB1020',6,'Active'),
('Hatchback','MH12AB1021',4,'Active'),
('Sedan','MH12AB1022',4,'Active'),
('SUV','MH12AB1023',6,'Active'),
('Hatchback','MH12AB1024',4,'Active'),
('Sedan','MH12AB1025',4,'Active'),
('SUV','MH12AB1026',6,'Active'),
('Hatchback','MH12AB1027',4,'Active'),
('Sedan','MH12AB1028',4,'Active'),
('SUV','MH12AB1029',6,'Active'),
('Hatchback','MH12AB1030',4,'Active');

-- ---------------------------
-- Insert sample bookings (40 rows)
-- ---------------------------
-- For realism: some bookings are Cancelled (NULL trip times), some Completed
INSERT INTO bookings (customer_id, driver_id, cab_id, pickup_location, dropoff_location, booking_time, trip_start_time, trip_end_time, status, fare, distance_km) VALUES
(1,1,1,'Andheri','Bandra','2025-04-01 08:05:00','2025-04-01 08:15:00','2025-04-01 08:45:00','Completed',320.00,12.00),
(2,2,2,'Powai','Dadar','2025-04-02 09:30:00',NULL,NULL,'Cancelled',0.00,0.00),
(3,3,3,'Borivali','Malad','2025-04-03 07:45:00','2025-04-03 07:55:00','2025-04-03 08:20:00','Completed',280.00,10.00),
(1,4,4,'Andheri','Vile Parle','2025-04-05 18:20:00','2025-04-05 18:35:00','2025-04-05 18:50:00','Completed',180.00,5.00),
(4,2,2,'Thane','Kurla','2025-04-06 11:00:00','2025-04-06 11:20:00','2025-04-06 11:50:00','Completed',350.00,14.00),
(5,5,5,'Bandra','Juhu','2025-04-07 17:10:00','2025-04-07 17:25:00','2025-04-07 17:50:00','Completed',210.00,8.00),
(3,1,1,'Malad','Borivali','2025-04-08 08:45:00','2025-04-08 09:00:00','2025-04-08 09:20:00','Completed',200.00,7.00),
(2,3,3,'Powai','BKC','2025-04-09 09:00:00','2025-04-09 09:20:00','2025-04-09 09:55:00','Completed',340.00,13.00),
(4,4,4,'Kurla','Thane','2025-04-10 21:10:00',NULL,NULL,'Cancelled',0.00,0.00),
(1,5,5,'Andheri','Bandra','2025-04-12 07:50:00','2025-04-12 08:00:00','2025-04-12 08:25:00','Completed',290.00,9.00),
(6,6,6,'Goregaon','Andheri','2025-04-13 10:00:00','2025-04-13 10:15:00','2025-04-13 10:40:00','Completed',220.00,9.50),
(7,7,7,'Powai','Vikhroli','2025-04-14 08:30:00','2025-04-14 08:45:00','2025-04-14 09:10:00','Completed',240.00,11.00),
(8,8,8,'Dadar','Marine Lines','2025-04-15 19:00:00','2025-04-15 19:20:00','2025-04-15 19:50:00','Completed',330.00,13.50),
(9,9,9,'Bandra','Lower Parel','2025-04-16 07:00:00','2025-04-16 07:18:00','2025-04-16 07:40:00','Completed',260.00,10.00),
(10,10,10,'Kurla','Sion','2025-04-17 12:10:00','2025-04-17 12:25:00','2025-04-17 12:45:00','Completed',180.00,6.00),
(11,11,11,'Thane','Mulund','2025-04-18 06:50:00','2025-04-18 07:05:00','2025-04-18 07:40:00','Completed',360.00,15.00),
(12,12,12,'Andheri','Jogeshwari','2025-04-19 09:10:00','2025-04-19 09:25:00','2025-04-19 09:55:00','Completed',230.00,9.00),
(13,13,13,'Vile Parle','Santacruz','2025-04-20 14:00:00','2025-04-20 14:10:00','2025-04-20 14:30:00','Completed',150.00,5.00),
(14,14,14,'Borivali','Goregaon','2025-04-21 17:40:00','2025-04-21 17:55:00','2025-04-21 18:35:00','Completed',300.00,12.00),
(15,15,15,'BKC','Powai','2025-04-22 08:20:00','2025-04-22 08:35:00','2025-04-22 09:05:00','Completed',280.00,10.50),
(16,16,16,'Malad','Dahisar','2025-04-23 06:30:00',NULL,NULL,'Cancelled',0.00,0.00),
(17,17,17,'Juhu','Bandra','2025-04-24 18:00:00','2025-04-24 18:15:00','2025-04-24 18:40:00','Completed',210.00,8.00),
(18,18,18,'Dadar','Bandra','2025-04-25 20:10:00','2025-04-25 20:30:00','2025-04-25 20:55:00','Completed',240.00,9.50),
(19,19,19,'Kurla','Ghatkopar','2025-04-26 07:45:00','2025-04-26 07:55:00','2025-04-26 08:30:00','Completed',195.00,7.50),
(20,20,20,'Andheri','Versova','2025-04-27 09:00:00','2025-04-27 09:10:00','2025-04-27 09:40:00','Completed',200.00,7.00),
(21,21,21,'Thane','Kalyan','2025-04-28 05:50:00','2025-04-28 06:20:00','2025-04-28 07:10:00','Completed',520.00,28.00),
(22,22,22,'Vikhroli','Bandra','2025-04-29 11:25:00','2025-04-29 11:40:00','2025-04-29 12:00:00','Completed',180.00,6.50),
(23,23,23,'Bandra','Juhu','2025-04-30 13:40:00','2025-04-30 13:55:00','2025-04-30 14:20:00','Completed',190.00,7.50),
(24,24,24,'Dadar','Andheri','2025-05-01 07:30:00','2025-05-01 07:50:00','2025-05-01 08:10:00','Completed',210.00,8.00),
(25,25,25,'Kurla','Vashi','2025-05-02 15:00:00','2025-05-02 15:20:00','2025-05-02 15:55:00','Completed',360.00,16.00),
(26,26,26,'Bandra','Santacruz','2025-05-03 18:35:00',NULL,NULL,'Cancelled',0.00,0.00),
(27,27,27,'Andheri','Powai','2025-05-04 08:05:00','2025-05-04 08:20:00','2025-05-04 08:50:00','Completed',260.00,10.00),
(28,28,28,'Goregaon','Borivali','2025-05-05 09:10:00','2025-05-05 09:30:00','2025-05-05 10:00:00','Completed',240.00,11.00),
(29,29,29,'Malad','Andheri','2025-05-06 07:55:00','2025-05-06 08:10:00','2025-05-06 08:40:00','Completed',230.00,9.50),
(30,30,30,'Thane','Borivali','2025-05-07 06:30:00','2025-05-07 07:00:00','2025-05-07 07:50:00','Completed',480.00,24.00),
(5,2,2,'Powai','Dadar','2025-05-08 09:00:00','2025-05-08 09:10:00','2025-05-08 09:35:00','Completed',280.00,10.00),
(12,4,4,'Andheri','Vile Parle','2025-05-09 12:00:00','2025-05-09 12:15:00','2025-05-09 12:35:00','Completed',160.00,4.50),
(2,2,2,'Powai','BKC','2025-05-10 08:00:00',NULL,NULL,'NoShow',0.00,0.00);

-- ---------------------------
-- Insert sample feedback (40 rows)
-- ---------------------------
-- Many feedback rows relate to completed bookings, some refer to cancellations with comments.
SET FOREIGN_KEY_CHECKS = 0;

-- (Run all your INSERT INTO feedback ... statements here)

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO feedback (booking_id, customer_id, driver_id, rating, comment) VALUES
(1,1,1,5,'Smooth and on-time'),
(2,2,2,1,'Driver canceled without notice'),
(3,3,3,4,'Good ride experience'),
(4,1,4,4,'Nice short ride'),
(5,4,2,3,'Slight delay'),
(6,5,5,5,'Excellent service'),
(7,3,1,5,'Friendly driver'),
(8,2,3,4,'Comfortable journey'),
(9,4,4,1,'Driver didn''t arrive'),
(10,1,5,5,'Great ride'),
(11,6,6,4,'Reached on time'),
(12,7,7,5,'Clean car, polite driver'),
(13,8,8,4,'Good trip'),
(14,9,9,4,'Driver knew the route well'),
(15,10,10,3,'Average, AC was not cold'),
(16,11,11,5,'Long ride but comfortable'),
(17,12,12,4,'Driver arrived early'),
(18,13,13,5,'Very friendly'),
(19,14,14,4,'Good driving'),
(20,15,15,5,'Punctual and safe'),
(21,16,16,2,'Vehicle was not clean'),
(22,17,17,4,'Nice experience'),
(23,18,18,4,'Good behavior'),
(24,19,19,3,'Driver took longer route once'),
(25,20,20,4,'Good service'),
(26,21,21,5,'Excellent long trip service'),
(27,22,22,4,'Driver waited when I was late'),
(28,23,23,5,'Fast pickup'),
(29,24,24,4,'Smooth ride'),
(30,25,25,4,'Good for intercity'),
(31,26,26,1,'Driver canceled at pickup point'),
(32,27,27,5,'Comfortable and friendly'),
(33,28,28,4,'Good service overall'),
(34,29,29,4,'Nice ride'),
(35,30,30,5,'Great driver and music'),
(36,5,2,4,'Driver was polite after initial delay'),
(37,12,4,5,'Quick and efficient'),
(38,2,2,1,'No show and no call'),
(39,1,5,5,'Trusted driver'),
(40,2,2,2,'Frequent cancellations by this driver');

-- Optional: simple indexes to speed common queries
CREATE INDEX idx_bookings_customer ON bookings(customer_id);
CREATE INDEX idx_bookings_driver ON bookings(driver_id);
CREATE INDEX idx_bookings_status ON bookings(status);
CREATE INDEX idx_feedback_driver ON feedback(driver_id);
CREATE INDEX idx_feedback_customer ON feedback(customer_id);

#Q1
SELECT c.*, COUNT(*) AS total_bookings FROM bookings b
join customers c on c.customer_id=b.customer_id
WHERE status='Completed'
GROUP BY customer_id 
ORDER BY total_bookings DESC
limit 1;

#Q2
SELECT f.comment,c.name,count(*)as no_of_trips, sum(status='Cancelled')as No_of_canceled_trips, SUM(status='Cancelled')/COUNT(*)*100 AS cancel_rate FROM bookings b
join customers c on c.customer_id=b.customer_id
join feedback f on f.customer_id=b.customer_id
GROUP BY b.customer_id 
HAVING cancel_rate > 30;

#Q3
SELECT DAYNAME(booking_time) AS day, COUNT(*) AS total FROM bookings
GROUP BY day
ORDER BY total Desc 
LIMIT 1;

#Q4
SELECT driver_id,count(*), AVG(rating) AS avg_rating FROM feedback
GROUP BY driver_id 
HAVING avg_rating < 3.0;

#Q5
SELECT b.driver_id,d.name,count(*), SUM(distance_km) AS total_distance FROM bookings b
join drivers d on d.driver_id=b.driver_id
WHERE status='Completed' 
GROUP BY b.driver_id 
ORDER BY total_distance DESC
limit 5;

#Q6
SELECT b.driver_id,d.name, SUM(status='Cancelled')/COUNT(*)*100 AS cancel_rate FROM bookings b
join drivers d on d.driver_id=b.driver_id
GROUP BY driver_id 
HAVING cancel_rate > 25;

#Q7
SELECT SUM(fare) AS total_revenue FROM bookings 
WHERE status='Completed' AND booking_time >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

#Q8
SELECT pickup_location, dropoff_location, COUNT(*) AS frequency FROM bookings 
GROUP BY pickup_location, dropoff_location 
ORDER BY frequency DESC 
LIMIT 3;

#Q9
SELECT d.driver_id, AVG(f.rating) AS avg_rating, COUNT(b.booking_id) AS total_trips, SUM(b.fare) AS total_earnings FROM drivers d 
JOIN bookings b ON d.driver_id=b.driver_id 
JOIN feedback f ON b.booking_id=f.booking_id 
WHERE b.status='Completed' 
GROUP BY d.driver_id
order by total_trips DESC,avg_rating DESC;

#Q10
SELECT pickup_location, AVG(TIMESTAMPDIFF(MINUTE, booking_time, trip_start_time)) AS avg_wait_time FROM bookings 
WHERE status='Completed' 
GROUP BY pickup_location
order by avg_wait_time DESC;

#Q11
SELECT comment, COUNT(*) AS count FROM feedback f 
JOIN bookings b ON f.booking_id=b.booking_id 
WHERE b.status='Cancelled' 
GROUP BY comment 
ORDER BY count DESC 
LIMIT 5;

#Q12
SELECT CASE WHEN distance_km <= 8 THEN 'Short' ELSE 'Long' END AS trip_type, SUM(fare) AS total_revenue FROM bookings 
WHERE status='Completed' 
GROUP BY trip_type;

#Q13
SELECT 
    c.vehicle_type,
    SUM(b.fare) AS total_revenue,
    sum(b.fare)/(select sum(b.fare) from bookings b )*100 as total_percentage
FROM bookings b
JOIN cabs c ON b.cab_id = c.cab_id
WHERE b.status = 'Completed'
GROUP BY c.vehicle_type;

#Q14
SELECT b.customer_id,c.name, MAX(b.booking_time) AS last_booking, COUNT(*) AS total_bookings FROM bookings b
join customers c on c.customer_id=b.customer_id
GROUP BY customer_id 
HAVING DATEDIFF(CURDATE(), last_booking) > 60
order by total_bookings;

#Q15
SELECT CASE WHEN DAYOFWEEK(booking_time) IN (1,7) THEN 'Weekend' ELSE 'Weekday' END AS day_type, COUNT(*) AS total_bookings FROM bookings 
GROUP BY day_type;