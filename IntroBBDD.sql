--------------------------------------------------
-- EJERCICIO 1
--------------------------------------------------
-- Escribe una consulta que recupere los vuelos (flights) y su identificador que figuren con status "On Time".

SELECT flight_id
FROM flights
WHERE status = 'On Time';

--------------------------------------------------
-- EJERCICIO 2
--------------------------------------------------
-- Escribe una consulta que extraiga todas las columnas de la tabla bookings y refleje todas las reservas que han supuesto una cantidad total mayor a 
-- 1.000.000 (Unidades monetarias).

SELECT *
FROM bookings
WHERE total_amount > 1000000;

--------------------------------------------------
-- EJERCICIO 3
--------------------------------------------------
-- Escribe una consulta que extraiga todas las columnas de los datos de los modelos de aviones disponibles (aircraft_data). Puede que os aparezca en 
-- alguna actualización como "aircrafts_data", revisad las tablas y elegid la que corresponda.

SELECT *
FROM aircrafts_data;

--------------------------------------------------
-- EJERCICIO 4
--------------------------------------------------
-- Con el resultado anterior visualizado previamente, escribe una consulta que extraiga los identificadores de vuelo que han volado con un Boeing 737. 
-- (Código Modelo Avión = 733)

SELECT flight_id 
FROM flights 
WHERE aircraft_code = '733';

--------------------------------------------------
-- EJERCICIO 5
--------------------------------------------------
-- Escribe una consulta que te muestre la información detallada de los tickets que han comprado las personas que se llaman Irina.

SELECT * 
FROM tickets 
WHERE passenger_name LIKE '%Irina%';

--------------------------------------------------
-- EJERCICIO 6
--------------------------------------------------
-- Mostrar las ciudades con más de un aeropuerto.

SELECT city, COUNT(*) AS num_airports
FROM airports
GROUP BY city
HAVING COUNT(*) > 1;

--------------------------------------------------
-- EJERCICIO 7
--------------------------------------------------
-- Mostrar el número de vuelos por modelo de avión.

SELECT aircraft_code, COUNT(*) AS num_flights
FROM flights
GROUP BY aircraft_code
ORDER BY num_flights DESC;

--------------------------------------------------
-- EJERCICIO 8
--------------------------------------------------
-- Reservas con más de un billete (varios pasajeros).

SELECT book_ref, COUNT(*) AS num_tickets
FROM tickets
GROUP BY book_ref
HAVING COUNT(*) > 1;

--------------------------------------------------
-- EJERCICIO 9
--------------------------------------------------
-- Vuelos con retraso de salida superior a una hora.

SELECT 
    flight_id,
    flight_no,
    actual_departure,
    scheduled_departure,
    actual_departure - scheduled_departure AS retraso
FROM flights
WHERE actual_departure IS NOT NULL
  AND actual_departure - scheduled_departure > INTERVAL '1 hour'
ORDER BY retraso DESC;

