CREATE TABLE ComenziRestaurant (
    ID NUMBER(5) PRIMARY KEY,
    ID_Client NUMBER(3),
    CONSTRAINT fk_comenzi_client FOREIGN KEY (ID_Client) REFERENCES ClientiRestaurant(ID),
    ID_Produs NUMBER(3),
    CONSTRAINT fk_comenzi_produs FOREIGN KEY (ID_Produs) REFERENCES ProduseRestaurant(ID),
    Cantitate NUMERIC(7,2),
    CONSTRAINT pozitiv_cantitate CHECK (Cantitate > 0),
    Status_Comanda VARCHAR2(20),
    Numar_Comanda NUMBER(15)
);
CREATE TABLE ProduseRestaurant (
    ID NUMBER(3) PRIMARY KEY,
    nume VARCHAR2(50) NOT NULL,
    categorie VARCHAR2(50),
    pret NUMERIC(10,2) NOT NULL,
    CONSTRAINT pozitiv_pret CHECK (pret > 0)
);
CREATE TABLE ClientiRestaurant (
    id NUMBER(3) PRIMARY KEY,
    nume VARCHAR2(50) NOT NULL,
    adresa VARCHAR2(100) NOT NULL,
    telefon VARCHAR2(15) CHECK (LENGTH(telefon) = 10 AND telefon LIKE '07%' AND telefon NOT LIKE '%[^0-9]%'),
    CONSTRAINT uq_telefon UNIQUE(telefon),
    email VARCHAR2(100) CHECK ((email LIKE '%@gmail.com' OR email LIKE '%@yahoo.com') AND email NOT LIKE '%[^a-zA-Z0-9@.]%'),
    CONSTRAINT uq_email UNIQUE(email)
);
CREATE TABLE FurnizoriRestaurant (
    ID NUMBER(3) PRIMARY KEY,
    nume VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) CHECK ((email LIKE '%@gmail.com' OR email LIKE '%@yahoo.com') AND email NOT LIKE '%[^a-zA-Z0-9@.]%'),
    CONSTRAINT uq_email_furnizori UNIQUE (email),
    telefon VARCHAR2(10) CHECK (LENGTH(telefon) = 10 AND telefon LIKE '07%' AND telefon NOT LIKE '%[^0-9]%'),
    CONSTRAINT uq_telefon_furnizori UNIQUE (telefon)
);
CREATE TABLE StocuriRestaurant (
    ID NUMBER(3) PRIMARY KEY,
    nume VARCHAR2(50) NOT NULL,
    cantitate_disponibila NUMERIC(10,2) NOT NULL,
    CONSTRAINT disp CHECK (cantitate_disponibila > 0),
    unitate_masura VARCHAR2(25) NOT NULL,
    ID_furnizor NUMBER(3),
    CONSTRAINT Fk_stocuri_producator FOREIGN KEY (ID_furnizor) REFERENCES FurnizoriRestaurant (ID)
);


DROP TABLE ProduseRestaurant CASCADE CONSTRAINTS;
INSERT INTO ProduseRestaurant (ID, nume, categorie, pret) VALUES (1, 'Pizza Margherita', 'Pranz', 25.99);
INSERT INTO ProduseRestaurant (ID, nume, categorie, pret) VALUES (2, 'Salata Caesar', 'Cina', 12.50);
INSERT INTO ProduseRestaurant (ID, nume, categorie, pret) VALUES  (3, 'Paste Bolognese', 'Pranz', 18.75);
INSERT INTO ProduseRestaurant (ID, nume, categorie, pret) VALUES  (4, 'Burger Classic', 'Burger', 15.99);
INSERT INTO ProduseRestaurant (ID, nume, categorie, pret) VALUES  (5, 'Supa de Legume', 'Pranz', 8.99);
INSERT INTO ProduseRestaurant (ID, nume, categorie, pret) VALUES (6, 'File de Somon', 'Mic dejun', 22.50);
INSERT INTO ProduseRestaurant (ID, nume, categorie, pret) VALUES  (7, 'Tiramisu', 'Desert', 10.99);
INSERT INTO ProduseRestaurant (ID, nume, categorie, pret) VALUES  (8, 'Chicken Wings', 'Aperitiv', 14.25);
INSERT INTO ProduseRestaurant (ID, nume, categorie, pret) VALUES  (9, 'Sushi Mix', 'Mic dejun', 30.50);
INSERT INTO ProduseRestaurant (ID, nume, categorie, pret) VALUES  (10, 'Cheesecake', 'Desert', 11.75);

INSERT INTO StocuriRestaurant (ID, nume, cantitate_disponibila, unitate_masura, ID_furnizor) VALUES (1, 'Faina', 50.0, 'kg', 1);
INSERT INTO StocuriRestaurant (ID, nume, cantitate_disponibila, unitate_masura, ID_furnizor) VALUES  (2, 'Salata verde', 20.5, 'buc', 2);
INSERT INTO StocuriRestaurant (ID, nume, cantitate_disponibila, unitate_masura, ID_furnizor) VALUES  (3, 'Carne de vita', 30.2, 'kg', 3);
INSERT INTO StocuriRestaurant (ID, nume, cantitate_disponibila, unitate_masura, ID_furnizor) VALUES  (4, 'Cheddar Cheese', 15.0, 'kg', 4);
INSERT INTO StocuriRestaurant (ID, nume, cantitate_disponibila, unitate_masura, ID_furnizor) VALUES  (5, 'Rosii', 25.5, 'kg', 1);
INSERT INTO StocuriRestaurant (ID, nume, cantitate_disponibila, unitate_masura, ID_furnizor) VALUES  (6, 'Somon file', 18.8, 'kg', 3);
INSERT INTO StocuriRestaurant (ID, nume, cantitate_disponibila, unitate_masura, ID_furnizor) VALUES  (7, 'Zahar', 40.0, 'kg', 2);
INSERT INTO StocuriRestaurant (ID, nume, cantitate_disponibila, unitate_masura, ID_furnizor) VALUES  (8, 'Pui', 22.3, 'kg', 4);
INSERT INTO StocuriRestaurant (ID, nume, cantitate_disponibila, unitate_masura, ID_furnizor) VALUES  (9, 'Orez sushi', 10.0, 'kg', 5);
INSERT INTO StocuriRestaurant (ID, nume, cantitate_disponibila, unitate_masura, ID_furnizor) VALUES  (10, 'Frisca', 8.5, 'l', 1);

select * from StocuriRestaurant;


select * from ProduseRestaurant order by id;
select * from FurnizoriRestaurant;
INSERT INTO FurnizoriRestaurant (ID, nume, email, telefon) VALUES (1, 'Furnizor Faina', 'faina.supplier@gmail.com', '0720123456');
INSERT INTO FurnizoriRestaurant (ID, nume, email, telefon) VALUES  (2, 'Salata Verde SRL', 'salata.verde@yahoo.com', '0730456789');
INSERT INTO FurnizoriRestaurant (ID, nume, email, telefon) VALUES  (3, 'Carne Premium', 'premium.meat@gmail.com', '0710234567');
INSERT INTO FurnizoriRestaurant (ID, nume, email, telefon) VALUES  (4, 'Cheese Co.', 'cheese.co@yahoo.com', '0720345678');
INSERT INTO FurnizoriRestaurant (ID, nume, email, telefon) VALUES  (5, 'Tomato Farms', 'tomato.farms@gmail.com', '0710456789');
INSERT INTO FurnizoriRestaurant (ID, nume, email, telefon) VALUES  (6, 'Fresh Fish Suppliers', 'fresh.fish@yahoo.com', '0730567890');
INSERT INTO FurnizoriRestaurant (ID, nume, email, telefon) VALUES (7, 'Sugar Distributors', 'sugar.distributors@gmail.com', '0710678901');
INSERT INTO FurnizoriRestaurant (ID, nume, email, telefon) VALUES (8, 'Chicken Suppliers', 'chicken.suppliers@yahoo.com', '0720789012');
INSERT INTO FurnizoriRestaurant (ID, nume, email, telefon) VALUES (9, 'Sushi Essentials', 'sushi.essentials@gmail.com', '0730890123');
INSERT INTO FurnizoriRestaurant (ID, nume, email, telefon) VALUES  (10, 'Dessert Delights', 'dessert.delights@yahoo.com', '0710012345');


INSERT INTO ComenziRestaurant (ID, ID_Client, ID_Produs, Cantitate, Status_Comanda, Numar_Comanda) VALUES (1, 1, 1, 2, 'In procesare', 12345);
INSERT INTO ComenziRestaurant (ID, ID_Client, ID_Produs, Cantitate, Status_Comanda, Numar_Comanda) VALUES(2, 2, 3, 1, 'Finalizata', 54321);
INSERT INTO ComenziRestaurant (ID, ID_Client, ID_Produs, Cantitate, Status_Comanda, Numar_Comanda) VALUES(3, 3, 2, 3, 'In procesare', 98765);
INSERT INTO ComenziRestaurant (ID, ID_Client, ID_Produs, Cantitate, Status_Comanda, Numar_Comanda) VALUES(4, 4, 1, 1, 'In asteptare', 56789);
INSERT INTO ComenziRestaurant (ID, ID_Client, ID_Produs, Cantitate, Status_Comanda, Numar_Comanda) VALUES(5, 5, 4, 2, 'Finalizata', 34567);
INSERT INTO ComenziRestaurant (ID, ID_Client, ID_Produs, Cantitate, Status_Comanda, Numar_Comanda) VALUES (6, 6, 2, 1, 'In procesare', 87654);
INSERT INTO ComenziRestaurant (ID, ID_Client, ID_Produs, Cantitate, Status_Comanda, Numar_Comanda) VALUES (7, 7, 3, 2, 'Finalizata', 23456);
INSERT INTO ComenziRestaurant (ID, ID_Client, ID_Produs, Cantitate, Status_Comanda, Numar_Comanda) VALUES (8, 8, 4, 3, 'In asteptare', 78901);
INSERT INTO ComenziRestaurant (ID, ID_Client, ID_Produs, Cantitate, Status_Comanda, Numar_Comanda) VALUES (9, 9, 1, 2, 'Finalizata', 45678);
INSERT INTO ComenziRestaurant (ID, ID_Client, ID_Produs, Cantitate, Status_Comanda, Numar_Comanda) VALsnUES (10, 10, 3, 1, 'In asteptare', 01234);

select * from ClientiRestaurant ORDER by ID;
INSERT INTO ClientiRestaurant (id, nume, adresa, telefon, email) VALUES
  (1, 'John Doe', 'Strada 123', '0720123456', 'john.doe@gmail.com');
INSERT INTO ClientiRestaurant (id, nume, adresa, telefon, email) VALUES
  (2, 'Jane Smith', 'Strada 456', '0730456789', 'jane.smith@yahoo.com');
INSERT INTO ClientiRestaurant (id, nume, adresa, telefon, email) VALUES
  (3, 'Alice Johnson', 'Strada 789', '0710234567', 'alice.j@gmail.com');
INSERT INTO ClientiRestaurant (id, nume, adresa, telefon, email) VALUES
  (4, 'Bob Williams', 'Strada 321', '0720345678', 'bob.w@yahoo.com');
INSERT INTO ClientiRestaurant (id, nume, adresa, telefon, email) VALUES
  (5, 'Eva Brown', 'Strada 654', '0710456789', 'eva.b@gmail.com');
INSERT INTO ClientiRestaurant (id, nume, adresa, telefon, email) VALUES
  (6, 'Michael Davis', 'Strada 987', '0730567890', 'michael.d@yahoo.com');
INSERT INTO ClientiRestaurant (id, nume, adresa, telefon, email) VALUES
  (7, 'Olivia Taylor', 'Strada 234', '0710678901', 'olivia.t@gmail.com');
INSERT INTO ClientiRestaurant (id, nume, adresa, telefon, email) VALUES
  (8, 'Daniel Wilson', 'Strada 567', '0720789012', 'daniel.w@yahoo.com');
INSERT INTO ClientiRestaurant (id, nume, adresa, telefon, email) VALUES
  (9, 'Sophia White', 'Strada 876', '0730890123', 'sophia.w@gmail.com');
INSERT INTO ClientiRestaurant (id, nume, adresa, telefon, email) VALUES
  (10, 'Matthew Hall', 'Strada 109', '0710012345', 'matthew.h@yahoo.com');

CREATE TABLE ProduseStocuri (
    ID_Produs NUMBER(3),
    ID_Stoc NUMBER(3),
    Cantitate NUMERIC(7,2) NOT NULL,
    PRIMARY KEY (ID_Produs, ID_Stoc),
    FOREIGN KEY (ID_Produs) REFERENCES ProduseRestaurant(ID),
    FOREIGN KEY (ID_Stoc) REFERENCES StocuriRestaurant(ID),
    CONSTRAINT pozitiv_cantitate_legatura CHECK (Cantitate > 0)
);
SELECT * FROM ProduseStocuri ORDER BY ID_produs;
INSERT INTO ProduseStocuri (ID_Produs, ID_Stoc, Cantitate) VALUES  (1, 1, 5.5);
INSERT INTO ProduseStocuri (ID_Produs, ID_Stoc, Cantitate) VALUES  (2, 2, 2);
INSERT INTO ProduseStocuri (ID_Produs, ID_Stoc, Cantitate) VALUES  (3, 3, 3.5);
INSERT INTO ProduseStocuri (ID_Produs, ID_Stoc, Cantitate) VALUES  (4, 4, 1.8);
INSERT INTO ProduseStocuri (ID_Produs, ID_Stoc, Cantitate) VALUES  (5, 5, 4);
INSERT INTO ProduseStocuri (ID_Produs, ID_Stoc, Cantitate) VALUES  (6, 6, 2.2);
INSERT INTO ProduseStocuri (ID_Produs, ID_Stoc, Cantitate) VALUES  (7, 7, 1.5);
INSERT INTO ProduseStocuri (ID_Produs, ID_Stoc, Cantitate) VALUES  (8, 8, 3);
INSERT INTO ProduseStocuri (ID_Produs, ID_Stoc, Cantitate) VALUES  (9, 9, 1.2);
INSERT INTO ProduseStocuri (ID_Produs, ID_Stoc, Cantitate) VALUES  (10, 10, 0.8);
INSERT INTO ProduseStocuri (ID_Produs, ID_Stoc, Cantitate) VALUES  (1, 2, 1.5);  -- Adaugare adi?ional? pentru combina?ie diferit?
INSERT INTO ProduseStocuri (ID_Produs, ID_Stoc, Cantitate) VALUES  (2, 3, 2.8);  -- Adaugare adi?ional? pentru combina?ie diferit?


--1.Sa se adauge o noua coloana DataComanda in tabela ComenziRestaurant
ALTER TABLE ComenziRestaurant ADD DataInregistrare DATE;
--2.Sa se stearga coloana adaugata anterior(DataComanda) din tabela ComenziRestaurant
ALTER TABLE COmenziRestaurant DROP COLUMN DataInregistrare;
--3.Sa se adauge coloana Discount in tabela ProdusRestaurant
ALTER TABLE ProduseRestaurant ADD (Discount NUMERIC(3,2));
select* from ProduseRestaurant;
--4.Sa se modifice tipul de data pentru coloana Discount in NUMBER(7,2)
ALTER TABLE ProduseRestaurant MODIFY (Discount NUMBER(7,2));
--5.Sa se modifice tipul de data pentru coloana Pret din tabela ProduseRestaurant din NUMERIC(10,2) in NUMBER(7,2)
--NU putem sa aplicam asta direct ALTER TABLE ProduseRestaurant MODIFY (Pret NUMBER(7,2));
-- pentru ca trebuie sa fie tabela goala asa ca urmarim urmatorii pasi:
--5.1 Facem o coloana noua denumita Pret2 de tipul dorit
ALTER TABLE ProduseRestaurant ADD Pret2 NUMBER(7,2)
CONSTRAINT pozitiv_pret2 CHECK (Pret2 > 0);
--5.2 Coloana noua ia valorile coloanei vechi
UPDATE ProduseRestaurant SET Pret2=Pret;
--5.3 Coloana veche se sterge (Pret)
ALTER TABLE ProduseRestaurant DROP COLUMN Pret;
--5.4 Coloana noua se redenumeste din Pret2 in Pret
ALTER TABLE PRoduseRestaurant RENAME COLUMN Pret2 TO Pret;
--5.5 Constraint-ul pozititv_pret2 s redenumeste in pozitiv_pret
ALTER TABLE ProduseRestaurant DROP CONSTRAINT pozitiv_pret2;
ALTER TABLE ProduseRestaurant ADD CONSTRAINT pozitiv_pret CHECK(Pret>0);
--6 Sa se modifice in tabela ComenziRestaurant astfel incat Statusul comenzii sa
--poata la numai valorile: Finalizata, In procesare, In asteptare
ALTER TABLE ComenziRestaurant ADD CONSTRAINT ComandaStatus
CHECK (Status_Comanda IN ('Finalizata','In procesare','In asteptare'));
--8 Sa se modifice in tabela ProduseRestaurant astfel incat Statusul comenzii sa
--poata la numai valorile: Mic dejun, Pranz, Cina, Desert, Aperitiv
ALTER TABLE ProduseRestaurant ADD CONSTRAINT ProduseCategorie
CHECK (categorie IN ('Mic dejun','Pranz','Cina','Desert','Aperitiv'));

--7 Sa se modifice in ProduseRestaurant categoria in Pranz pentru inregistrarea cu categoria Burger
UPDATE ProduseRestaurant SET categorie='Pranz' WHERE categorie='Burger';
ROLLBACK;
--9 Sa se stearga toti furnizorii din tabela de furnizori care nu aprovizioneaza deloc cu stocuri
DELETE FROM FurnizoriRestaurant WHERE 
NOT EXISTS (SELECT 1 FROM StocuriRestaurant   WHERE FurnizoriRestaurant.id=StocuriRestaurant.ID_furnizor);

--10 Sa se stearga toti clientii din tabela de clienti care nu au nicio comanda plasata in tabla de comenzi
DELETE FROM ClientiRestaurant  
WHERE NOT EXISTS (SELECT 1 FROM ComenziRestaurant c  WHERE ClientiRestaurant.ID = c.ID_client);

--11 Afi?eaz? toate comenzile împreun? cu numele clien?ilor care le-au plasat.
SELECT c.ID AS IDComanda, cl.nume AS NumeClient FROM ComenziRestaurant c
INNER JOIN ClientiRestaurant cl ON c.ID_Client = cl.ID;



--13Afi?eaz? toate produsele din comenzile nefinalizate (status 'In procesare' sau 'In asteptare') împreun? cu numele clien?ilor care le-au plasat.
SELECT c.ID AS IDComanda, p.nume AS NumeProdus, cl.nume AS NumeClient, c.Status_comanda
FROM ComenziRestaurant c
INNER JOIN ProduseRestaurant p ON c.ID_Produs = p.ID
INNER JOIN ClientiRestaurant cl ON c.ID_Client = cl.ID
WHERE c.Status_Comanda = 'In procesare' OR c.Status_Comanda = 'In asteptare' ORDER BY c.ID; 
--Afi?eaz? furnizorii care furnizeaz? produsele aflate în stoc
-- ?i cantitatea disponibil? pentru fiecare produs furnizat
SELECT f.nume AS Furnizor, pr.nume AS Produs, s.cantitate_disponibila
FROM FurnizoriRestaurant f
JOIN StocuriRestaurant s ON f.ID = s.ID_furnizor
JOIN ProduseStocuri ps ON s.ID = ps.ID_Stoc
JOIN ProduseRestaurant pr ON ps.ID_Produs = pr.ID
WHERE s.cantitate_disponibila > 0;
--15.1 Sa se insereze in Comenzi restaurant mai multe comenzi pentru clientii deja existenti
INSERT INTO ComenziRestaurant (ID, ID_Client, ID_Produs, Cantitate, Status_Comanda, Numar_Comanda)
VALUES (31, 1, 2, 2, 'In procesare', 11234);
INSERT INTO ComenziRestaurant (ID, ID_Client, ID_Produs, Cantitate, Status_Comanda, Numar_Comanda)
VALUES (32, 2, 4, 1, 'Finalizata', 12134);
INSERT INTO ComenziRestaurant (ID, ID_Client, ID_Produs, Cantitate, Status_Comanda, Numar_Comanda)
VALUES (33, 3, 1, 3, 'In procesare', 13234);
INSERT INTO ComenziRestaurant (ID, ID_Client, ID_Produs, Cantitate, Status_Comanda, Numar_Comanda)
VALUES (34, 4, 3, 1, 'In asteptare', 14345);
INSERT INTO ComenziRestaurant (ID, ID_Client, ID_Produs, Cantitate, Status_Comanda, Numar_Comanda)
VALUES (35, 5, 2, 2, 'Finalizata', 15456);

select * from ComenziRestaurant order by id desc;

--15Stiind ca un client poate avea mai multe comenzi plasate afiseaza ID-urile comenzilor in dreptul numelui Fiecarui Client
SELECT cl.ID AS ID_Client, cl.nume AS Nume_Client, LISTAGG(co.ID, ', ') 
WITHIN GROUP (ORDER BY co.ID) AS ID_Comenzi
FROM ClientiRestaurant cl 
LEFT JOIN ComenziRestaurant co 
ON cl.ID = co.ID_Client
GROUP BY cl.ID, cl.nume;

--16Sa se afiseze numele produselor si numele ingredientelor de care au nevoie pentru a fi preparate
SELECT pr.nume AS NumeProdus, LISTAGG(s.nume,', ') WITHIN GROUP (ORDER BY s.ID) AS NumeStocuri
FROM ProduseRestaurant pr
INNER JOIN ProduseStocuri ps ON pr.ID=ps.ID_Produs
INNER JOIN StocuriRestaurant s ON ps.ID_Stoc=s.ID
GROUP BY pr.nume; 

SELECT pr.nume AS NumeProdus, LISTAGG(s.nume,', ') WITHIN GROUP (ORDER BY s.ID) AS NumeStocuri
FROM ProduseRestaurant pr,ProduseStocuri ps,StocuriRestaurant s 
WHERE pr.ID=ps.ID_Produs AND ps.ID_Stoc=s.ID
GROUP BY pr.nume;

--17Afiseaza ce cantitate de produse poate fi realizata din fiecare tip, in functie de stocurile disponibile 
SELECT pr.nume AS NumeProdus, FLOOR(MIN(s.cantitate_disponibila/ps.Cantitate)) AS CantitateMinima
FROM ProduseRestaurant pr
INNER JOIN ProduseStocuri ps ON pr.ID = ps.ID_Produs
INNER JOIN StocuriRestaurant s ON ps.ID_Stoc = s.ID
GROUP BY pr.nume;

SELECT * FROM ProduseRestaurant ORDER BY id;
--19 Sa se afiseze numarul total de produse pentru fiecare categorie
SELECT categorie, COUNT(*) AS NumarProduse
FROM ProduseRestaurant
GROUP BY categorie;
--20 Sa se afiseze suma totala pe care a cheltuit-o fiecare client
SELECT cl.nume, SUM(p.pret*c.cantitate) AS VanzariTotale
FROM ComenziRestaurant c, ClientiRestaurant cl, ProduseRestaurant p
WHERE cl.ID=c.ID_Client AND p.ID=c.ID_Produs
GROUP BY cl.nume,c.ID_Client;

SELECT cl.nume, SUM(p.pret * c.cantitate) AS VanzariTotale
FROM ComenziRestaurant c
JOIN ClientiRestaurant cl ON cl.ID = c.ID_Client
JOIN ProduseRestaurant p ON p.ID = c.ID_Produs
GROUP BY cl.nume, c.ID_Client;

--21 Sa se afiseze pretul mediu pentru fiecare categorie de produse
SELECT categorie, AVG(pret) AS PretMediu 
FROM ProduseRestaurant
GROUP BY categorie
ORDER BY PretMediu;

--22Afi?eaz? cea mai mare comand? din punct de vedere al sumei plasat? de fiecare client


SELECT cl.nume, MIN(p.pret * c.cantitate) AS CeaMaiMareComanda
FROM ComenziRestaurant c
JOIN ClientiRestaurant cl ON cl.ID = c.ID_Client
JOIN ProduseRestaurant p ON p.ID = c.ID_Produs
GROUP BY cl.nume, c.ID_Client;

--23Sa se afiseze clienti care au comenzi atat din categoria 'pranz' cat si 'cina'
SELECT cl.nume
FROM ClientiRestaurant cl
JOIN ComenziRestaurant co ON cl.ID = co.ID_Client
JOIN ProduseRestaurant pr ON co.ID_Produs = pr.ID
WHERE pr.categorie IN ('Pranz', 'Cina')
AND (SELECT COUNT(DISTINCT pr.categorie) FROM ProduseRestaurant pr) = 2;
--24Sa se afseze furnizorii precum si numarl de ingrediente furnizate de fiecare fornizor
SELECT s.ID_furnizor, f.nume,COUNT(DISTINCT s.nume)
FROM FurnizoriRestaurant f
JOIN StocuriRestaurant s ON f.ID = s.ID_furnizor
GROUP BY s.ID_furnizor, f.nume;
--25Sa se afiseze produsele care au o cantitate disponibila in stoc mai mica de 10 unitati

SELECT pr.nume AS NumeProdus, FLOOR(s.cantitate_disponibila/ps.cantitate) AS CantitateDisponibila
FROM ProduseRestaurant pr
JOIN ProduseStocuri ps ON pr.ID = ps.ID_Produs
JOIN StocuriRestaurant s ON ps.ID_Stoc = s.ID
WHERE FLOOR(s.cantitate_disponibila/ps.cantitate) < 10;

--Daca un client are totalul comenzilor peste 1000 de lei atunci primeste o reducere de 50, daca are doar peste 500 de lei atunci primeste de 30%
--iar daca are peste 150 de lei primeste reducere de 10%
--si sa se introduca o coloana in tabela de clienti cu DiscountCupon


--26Concateneaza numele ?i adresa clientilor din tabelul ClientiRestaurant într-un singur ?ir, iar adresa sa fie scrisa cu litere mici iar numele cu initiala mare.
SELECT INITCAP(nume) || ' - ' || LOWER(adresa) AS NumeAdresaConcatenated
FROM ClientiRestaurant;

SELECT CONCAT(INITCAP(nume), LOWER(adresa)) AS NumeAdresaConcatenated -- nu e spatiu intre nume si adresa 
FROM ClientiRestaurant;
--27Sa se afiseze numele oglindit al furnizorilo concat de numele original
SELECT UPPER(nume) || ' - ' || REVERSE(UPPER(nume)) AS NumeReversedConcatenated
FROM FurnizoriRestaurant;
--28 Sa se extraga din numele produselor primele 2 litere transformate in majuscule
SELECT nume, UPPER(SUBSTR(nume, 1, 2)) AS PrimeleLitere
FROM ProduseRestaurant;

UPDATE ComenziRestaurant SET DataComanda = TO_DATE('23-12-2023', 'DD-MM-YYYY') WHERE ID=1;
UPDATE ComenziRestaurant SET DataComanda=NULL;
SELECT * FROM ComenziRestaurant order by datacomanda;

--29 Sa se genereze niste date random din anul 2023 care se vor afisa pe ecran 
SELECT TO_DATE('01-01-2023', 'DD-MM-YYYY') + DBMS_RANDOM.VALUE * (TO_DATE('31-12-2023', 'DD-MM-YYYY') - TO_DATE('01-01-2023', 'DD-MM-YYYY')) AS RandomDate
FROM dual
CONNECT BY level <= 9;

--30 Sa se genereze date pentru Comenzile Restaurantului din anul 2023
UPDATE ComenziRestaurant 
SET DataComanda = TO_DATE('01-01-2023', 'DD-MM-YYYY') + DBMS_RANDOM.VALUE * (TO_DATE('31-12-2023', 'DD-MM-YYYY') - TO_DATE('01-01-2023', 'DD-MM-YYYY'));

--31 Sa se grupeze comenzile in functie de data, impartita in 4 trimestre(sau quatrestre)
SELECT datacomanda,perioada from COmenziRestaurant order by perioada;
SELECT   
    CASE
        WHEN DataComanda BETWEEN TO_DATE('01-01-2023', 'DD-MM-YYYY') AND TO_DATE('31-03-2023', 'DD-MM-YYYY') THEN 'Trimestrul 1'
        WHEN DataComanda BETWEEN TO_DATE('01-04-2023', 'DD-MM-YYYY') AND TO_DATE('30-06-2023', 'DD-MM-YYYY') THEN 'Trimestrul 2'
        WHEN DataComanda BETWEEN TO_DATE('01-07-2023', 'DD-MM-YYYY') AND TO_DATE('30-09-2023', 'DD-MM-YYYY') THEN 'Trimestrul 3'
        WHEN DataComanda BETWEEN TO_DATE('01-10-2023', 'DD-MM-YYYY') AND TO_DATE('31-12-2023', 'DD-MM-YYYY') THEN 'Trimestrul 4'
        ELSE 'Alta perioada'
    END AS Perioada,
    COUNT(*) AS NumarComenzi
FROM ComenziRestaurant
GROUP BY 
    CASE
        WHEN DataComanda BETWEEN TO_DATE('01-01-2023', 'DD-MM-YYYY') AND TO_DATE('31-03-2023', 'DD-MM-YYYY') THEN 'Trimestrul 1'
        WHEN DataComanda BETWEEN TO_DATE('01-04-2023', 'DD-MM-YYYY') AND TO_DATE('30-06-2023', 'DD-MM-YYYY') THEN 'Trimestrul 2'
        WHEN DataComanda BETWEEN TO_DATE('01-07-2023', 'DD-MM-YYYY') AND TO_DATE('30-09-2023', 'DD-MM-YYYY') THEN 'Trimestrul 3'
        WHEN DataComanda BETWEEN TO_DATE('01-10-2023', 'DD-MM-YYYY') AND TO_DATE('31-12-2023', 'DD-MM-YYYY') THEN 'Trimestrul 4'
        ELSE 'Alta perioada'
    END
ORDER BY perioada;---AICI DE CLARIFICAT
--sau mai simplu e daca adaugam o coloana, dar avem 3 comenzi sql si facem coloana noua:
ALTER TABLE ComenziRestaurant ADD Perioada varchar2(25);

UPDATE ComenziRestaurant SET Perioada= 
    CASE
        WHEN DataComanda BETWEEN TO_DATE('01-01-2023', 'DD-MM-YYYY') AND TO_DATE('31-03-2023', 'DD-MM-YYYY') THEN'Trimestrul 1'
        WHEN DataComanda BETWEEN TO_DATE('01-04-2023', 'DD-MM-YYYY') AND TO_DATE('30-06-2023', 'DD-MM-YYYY') THEN'Trimestrul 2'
        WHEN DataComanda BETWEEN TO_DATE('01-07-2023', 'DD-MM-YYYY') AND TO_DATE('30-09-2023', 'DD-MM-YYYY') THEN'Trimestrul 3'
        WHEN DataComanda BETWEEN TO_DATE('01-10-2023', 'DD-MM-YYYY') AND TO_DATE('31-12-2023', 'DD-MM-YYYY') THEN'Trimestrul 4'
        ELSE 'Alta perioada'
    END;

SELECT  Perioada, COUNT(*) AS NumarComenzi
FROM ComenziRestaurant
GROUP BY perioada
ORDER BY perioada;
--32 Sa se afiseze numele clientilor care au plasat comenzi in trimestrele 2,3 si 4
SELECT cl.nume,co.perioada
FROM ClientiRestaurant cl, ComenziRestaurant co
WHERE co.ID_Client IN (
    SELECT ID_Client FROM ComenziRestaurant
    MINUS
    SELECT ID_Client FROM ComenziRestaurant
    WHERE EXTRACT(MONTH FROM DataComanda) BETWEEN 1 AND 3
    ) AND co.ID_Client=cl.ID;

--33 Sa se afiseze clientii care au cel putin o comanda si care nu au comandat cate un produs din toate categoriile
SELECT CR.Id, CR.Nume
FROM ClientiRestaurant CR
JOIN ComenziRestaurant C ON CR.Id = C.Id_Client
LEFT JOIN ProduseRestaurant P ON C.Id_Comanda = P.Id_Comanda  
GROUP BY CR.Id, CR.Nume
HAVING COUNT(DISTINCT P.Categorie) < (SELECT COUNT(DISTINCT Categorie) FROM ProduseRestaurant);

SELECT Id, Nume
FROM ClientiRestaurant
WHERE Id IN (
    SELECT ID_Client
    FROM ComenziRestaurant
)
MINUS
SELECT ID, Nume
FROM ClientiRestaurant
WHERE ID IN (
    SELECT ID_Client
    FROM ProduseRestaurant
    GROUP BY ID_Client
    HAVING COUNT(DISTINCT Categorie) = (
        SELECT COUNT(DISTINCT Categorie)
        FROM ProduseRestaurant
    )
);
--34 Selecta?i numele clien?ilor care au plasat comenzi finalizate pentru produse de tip Pranz sau Cina
SELECT cl.nume, co.Status_Comanda
FROM ClientiRestaurant cl
JOIN ComenziRestaurant co ON cl.ID = co.ID_Client
JOIN ProduseRestaurant pr ON co.ID_Produs = pr.ID
WHERE pr.categorie ='Pranz' AND co.Status_Comanda = 'Finalizata'
UNION
SELECT cl.nume, co.Status_Comanda
FROM ClientiRestaurant cl
JOIN ComenziRestaurant co ON cl.ID = co.ID_Client
JOIN ProduseRestaurant pr ON co.ID_Produs = pr.ID
WHERE pr.categorie ='Cina' AND co.Status_Comanda = 'Finalizata';
--35Afi?a?i numele furnizorilor ?i produsele pe furnizate,daca au cel pu?in un produs din categoria "Aperitiv" sau "Desert"
SELECT f.nume AS Furnizor, pr.nume AS Produs
FROM FurnizoriRestaurant f
JOIN StocuriRestaurant s ON f.ID = s.ID_furnizor
JOIN ProduseStocuri ps ON s.ID = ps.ID_Stoc
JOIN ProduseRestaurant pr ON ps.ID_Produs = pr.ID
WHERE pr.categorie = 'Aperitiv'
UNION
SELECT f.nume AS Furnizor, pr.nume AS Produs
FROM FurnizoriRestaurant f
JOIN StocuriRestaurant s ON f.ID = s.ID_furnizor
JOIN ProduseStocuri ps ON s.ID = ps.ID_Stoc
JOIN ProduseRestaurant pr ON ps.ID_Produs = pr.ID
WHERE pr.categorie = 'Desert';
--36 Sa se afiseze clientii care au cheltuit intre 10 si 100 de lei minus cei care au cheltuit intre 40 si 60
SELECT cl.nume, SUM(co.Cantitate * pr.pret) AS TotalCheltuieli
FROM ClientiRestaurant cl
JOIN ComenziRestaurant co ON cl.ID = co.ID_Client
JOIN ProduseRestaurant pr ON co.ID_Produs = pr.ID
GROUP BY cl.nume
HAVING SUM(co.Cantitate * pr.pret) BETWEEN 10 AND 100
MINUS
SELECT cl.nume, SUM(co.Cantitate * pr.pret) AS TotalCheltuieli
FROM ClientiRestaurant cl
JOIN ComenziRestaurant co ON cl.ID = co.ID_Client
JOIN ProduseRestaurant pr ON co.ID_Produs = pr.ID
GROUP BY cl.nume
HAVING SUM(co.Cantitate * pr.pret) BETWEEN 40 AND 60;


--37 Sa se realizeze o tabela virtuala cu totate comenzile si numele clientilor care nu sunt finalizate 
CREATE OR REPLACE VIEW ComenziNeincheiate AS
SELECT c.ID AS ID_Comanda, c.ID_Client, cl.nume AS Nume_Client,
    c.ID_Produs, p.nume AS Nume_Produs, c.Cantitate, c.Status_Comanda AS StatusComanda, c.Numar_Comanda
FROM ComenziRestaurant c
JOIN ClientiRestaurant cl ON c.ID_Client = cl.ID
JOIN ProduseRestaurant p ON c.ID_Produs = p.ID
WHERE c.Status_Comanda IN ('In procesare', 'In asteptare')
;

SELECT * FROM ComenziNeincheiate;
SELECT * FROM ComenziRestaurant;


--39 Sa se realizeze o tabela virtuala care sa arate cele mai comandate produse descrescator(se vor afisa si produsele fara comenzi)
CREATE OR REPLACE VIEW TopProduseComandate AS
SELECT
    p.ID AS ID_Produs,
    p.nume AS Nume_Produs,
    COUNT(c.ID) AS NumarComenzi 
FROM
    ProduseRestaurant p
LEFT JOIN
    ComenziRestaurant c ON p.ID = c.ID_Produs
GROUP BY
    p.ID, p.nume
ORDER BY
    NumarComenzi DESC;
 SELECT * FROM TopProduseComandate;

 --40sa se inlocuiasca statusul comenzilor in 'Finalizata' daca erau 'In procesare' si in 'In procesare' daca erau 'In asteptare' din ComenziNeincheiate
 UPDATE ComenziNeincheiate
    SET StatusComanda = 
        DECODE(StatusComanda, 'In procesare', 'Finalizata', 'In asteptare', 'In procesare')
    WHERE StatusComanda IN ('In procesare', 'In asteptare');
-- da bine ca tabelele virtuale modifica si tabelul original
-- 41 Folosind SEQUENCE  sa se introduca in tabela ComenziRestaurant alte 10 comenzi cu id-uri de la 21 la 30 (sunt toate ale aceuiasi client)
CREATE SEQUENCE seq_id_comenzi
START WITH 20
INCREMENT BY 1
NOCACHE
NOCYCLE;
INSERT INTO ComenziRestaurant (ID, ID_Client, ID_Produs, Cantitate, Status_Comanda, Numar_Comanda)
VALUES (seq_id_comenzi.NEXTVAL, 1, 1, 2, 'In procesare', 12345);
SELECT * FROM ComenziRestaurant WHERE ID>=20;
--Sa se modifice valoarea maxima al seq_id_comenzi in 30
ALTER SEQUENCE seq_id_comenzi MAXVALUE 30;
--Sa se creeze un sinonim pentru tabela FurnizoriRestaurant
CREATE SYNONYM fr FOR FurnizorRestaurant;
--nu se mai poate lucra cu sinonime RIP SINONIME 1980-2023
SELECT nume, adresa
FROM fr
WHERE email LIKE '%gmail.com%';
select * from fr;
--Sa se dropeze o tabela si sa se recupereze
DROP TABLE ComenziRestaurant;
FLASHBACK TABLE ComenziRestaurant TO BEFORE DROP;