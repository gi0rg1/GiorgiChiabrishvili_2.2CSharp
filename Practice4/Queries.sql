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
Select PC.model, PC.price FROM PC
JOIN PRODUCT P
ON P.model = PC.model
WHERE P.maker = 'B'
UNION
SELECT L.model, L.price FROM Laptop L
JOIN PRODUCT P
ON P.model = L.model
WHERE P.maker = 'B'
UNION
SELECT Pr.model, Pr.price FROM Printer Pr
JOIN PRODUCT P
ON P.model = Pr.model
WHERE P.maker = 'B'

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
SELECT AVG(speed) AS Avg_speed FROM PC

--12
SELECT AVG(speed) AS Avg_speed From Laptop
WHERE PRICE > 1000

--13
SELECT AVG(speed) AS Avg_speed From PC
JOIN PRODUCT P
ON P.model = PC.model
WHERE P.maker = 'A'

--14
SELECT S.class, S.name, C.country FROM SHIPS S
JOIN CLASSES C
ON S.class = C.class
WHERE C.numGuns > 9

--15
SELECT hd FROM PC
GROUP BY hd
HAVING COUNT(hd) >= 2

--16
SELECT DISTINCT(pc1.model), pc2.model, pc1.speed, pc1.ram 
FROM PC AS pc1
JOIN PC AS pc2
on pc1.ram = pc2.ram
AND pc1.speed = pc2.speed
WHERE pc1.model > pc2.model

--17
SELECT DISTINCT P.type AS Type, L.model AS Model, L.speed As speed
FROM Laptop L, Product AS p
WHERE L.speed < ALL (SELECT speed FROM PC) AND P.type = 'laptop'

--18
SELECT DISTINCT P.maker, Pr.price FROM Printer Pr
JOIN PRODUCT P
ON P.model = Pr.model
WHERE Pr.Color = 'Y'
AND Pr.Price = (SELECT MIN(price) FROM Printer WHERE Color = 'Y')

--19
SELECT P.maker, AVG(L.screen) AS Avg_screen FROM Laptop L
JOIN Product P
ON L.model = P.model
Group BY P.maker

--20
SELECT P.maker, COUNT(DISTINCT P.model) AS Count_Model
FROM Product P
WHERE type = 'PC'
GROUP BY P.maker
HAVING COUNT(DISTINCT P.model) >= 3