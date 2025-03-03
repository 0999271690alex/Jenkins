CREATE VIEW horizontal_view AS
SELECT 
    c.client_id,
    c.full_name AS client_name,
    c.email AS client_email,
    c.telephone_number AS client_phone,
    h.hotel_name,
    r.room_number,
    r.room_type,
    b.check_in_date,
    b.check_out_date,
    ca.car_number,
    ca.brand AS car_brand,
    ca.rental_price
FROM clients c
LEFT JOIN bookings b ON c.client_id = b.client_id
LEFT JOIN rooms r ON b.room_id = r.room_id
LEFT JOIN hotels h ON r.hotel_id = h.hotel_id
LEFT JOIN rental_agreements ra ON c.client_id = ra.client_id
LEFT JOIN cars ca ON ra.car_id = ca.car_id;



SELECT * FROM horizontal_view;

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

