CREATE VIEW valid_bookings AS
SELECT booking_id, client_id, room_id, check_in_date, check_out_date, discount
FROM bookings
WHERE check_in_date >= CURRENT_DATE
AND discount <= 30.00
WITH CHECK OPTION;

INSERT INTO valid_bookings (client_id, room_id, check_in_date, check_out_date, discount) 
VALUES (1, 5, '2025-03-15', '2025-03-20', 25.00);

INSERT INTO valid_bookings (client_id, room_id, check_in_date, check_out_date, discount) 
VALUES (2, 3, '2025-04-10', '2025-04-15', 35.00);

SELECT * FROM valid_bookings;

