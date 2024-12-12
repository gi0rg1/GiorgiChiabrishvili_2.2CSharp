--1
SELECT model, speed, hd FROM PC
WHERE price < 500

--2
SELECT DISTINCT maker FROM Product
WHERE type = 'printer'

--3
SELECT model, ram, screen FROM Laptop
WHERE price > 1000
ORDER BY price

--4
SELECT * FROM Printer
WHERE color = 'y'

--5
SELECT model, speed, hd FROM PC
WHERE price < 600
AND (cd = '12x' OR cd = '24x')

--6
SELECT DISTINCT Product.maker, Laptop.speed 
FROM Product
JOIN Laptop ON Product.model = Laptop.model
WHERE Laptop.hd >= 10

--7
--vera..

--8
SELECT maker FROM Product
WHERE type = 'PC' 
GROUP BY maker 
HAVING maker NOT IN (SELECT maker FROM Product WHERE type = 'Laptop')

--9
SELECT DISTINCT maker FROM Product
JOIN PC ON Product.model = PC.model 
WHERE PC.speed >= 450

--10
SELECT model, price FROM Printer
WHERE price = (SELECT MAX(price) FROM Printer)

--11