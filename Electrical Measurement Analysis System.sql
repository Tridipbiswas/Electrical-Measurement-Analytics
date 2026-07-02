DROP TABLE IF EXISTS transformer;


CREATE TABLE transformer(
"Time" TIME,
"Voltage (V)"	NUMERIC(10,2),
"Current (A)"	NUMERIC(10,2),
"PF"	NUMERIC(10,2),
"Power (kW)"	NUMERIC(10,2),
"Energy (kWh)"	NUMERIC(10,2),
"Temp (°C)"	NUMERIC(10,2)
);

SELECT * FROM transformer;

COPY transformer
FROM 'E:\\New SQL Projects\\electrical sql peoject\\ELECTRICAL DATA.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM transformer;

-- Find Average Voltage
SELECT ROUND(AVG("Voltage (V)"),2) FROM transformer;
-- Maximum Current
SELECT MAX("Current (A)") FROM transformer;

-- High Temperature Alarm
SELECT "Temp (°C)" FROM transformer ORDER BY "Temp (°C)" DESC LIMIT 1;

-- Low Power Factor
SELECT "PF" FROM transformer ORDER BY "PF" ASC LIMIT 1;
 
-- Voltage Drop
SELECT * FROM transformer;
SELECT "Voltage (V)" FROM transformer ORDER BY "Voltage (V)" ASC LIMIT 1;
-- Find Peak Load
SELECT "Time","Power (kW)" FROM transformer ORDER BY "Power (kW)" DESC LIMIT 1;

-- Total Energy
SELECT MAX("Energy (kWh)")-MIN("Energy (kWh)")AS daily_energy FROM transformer;
-- Calculate Transformer Loading
-- Assume the transformer is 200 kVA.
SELECT "Time",ROUND(("Power (kW)"/200*"PF"),2)*100 AS TRANS_FORMER_LOADING FROM transformer;

-- Daily Summary Report

SELECT DATE("Time") AS DATE FROM transformer

SELECT CURRENT_DATE AS DATE ,ROUND(AVG("Voltage (V)"),2)AS AVG_VOLTAGE,MAX("Current (A)")
AS MAXIMUM_CURRENT,MAX("Temp (°C)") AS MAXIMUN_TEMPARETURE,
MAX("Energy (kWh)")-MIN("Energy (kWh)")AS daily_energy
FROM transformer GROUP BY DATE;






