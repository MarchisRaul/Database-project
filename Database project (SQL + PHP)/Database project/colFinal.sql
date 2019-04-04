-- Subiectul 11 --
-- Marchis Raul, Grupa 30229 --
-- Baza de date pentru colocviul final --

create database if not exists colocviuFinal;

-- 11.01
-- a)
CREATE TABLE Proprietar
(id_proprietar double,
nume varchar (30),
email varchar (30));


-- b)
CREATE TABLE Apartament
(id_apartament double,
adresa varchar (50),
nr_apartament double,
suprafata double,
id_proprietar double);


-- c)
CREATE TABLE Consum
(id_apartament double,
an double,
luna double,
nr_persoane double,
cantitate double, 
valoare double,
pret_apa double);


-- d)
CREATE TABLE Chitanta
(numar double,
data datetime ,
id_apartament double, 
valoare double);


-- f)
ALTER TABLE Proprietar
ADD telefon varchar (10);



INSERT INTO Proprietar(id_proprietar, nume, email, telefon)
VALUES ('1', 'Raul Marchis', 'dan_mar_chis@yahoo.com', '0746263614');
INSERT INTO Proprietar(id_proprietar, nume, email, telefon)
VALUES ('2', 'Florea Ronaldo', 'ronnydflorea@gmail.com', '0758393921');
INSERT INTO Proprietar(id_proprietar, nume, email, telefon)
VALUES ('3', 'Neagoe Adrian Denis', 'adineagoe@gmail.com', '0757854672');
INSERT INTO Proprietar(id_proprietar, nume, email, telefon)
VALUES ('5', 'Borz Tina Adelina', 'tinaadelina@yahoo.com', '0755611980');
INSERT INTO Proprietar(id_proprietar, nume, email, telefon)
VALUES ('6', 'Hura Abel Jonathan', 'huraabel@yahoo.com', '0755263614');

INSERT INTO Apartament(id_apartament, adresa, nr_apartament, suprafata, id_proprietar)
VALUES('1', 'Turda Baita 17', '6', '70', '1');
INSERT INTO Apartament(id_apartament, adresa, nr_apartament, suprafata, id_proprietar)
VALUES('2', 'Turda Baita 20', '15', '55', '2');
INSERT INTO Apartament(id_apartament, adresa, nr_apartament, suprafata, id_proprietar)
VALUES('3', 'Turda Baita 17', '1', '72', '1');
INSERT INTO Apartament(id_apartament, adresa, nr_apartament, suprafata, id_proprietar)
VALUES('111', 'Turda Baita 30', '51', '63', '5');
INSERT INTO Apartament(id_apartament, adresa, nr_apartament, suprafata, id_proprietar)
VALUES('5', 'Turda Baita 99', '140', '90', '6');
INSERT INTO Apartament(id_apartament, adresa, nr_apartament, suprafata, id_proprietar)
VALUES('6', 'Turda Baita 100', '125', '60', '3');

INSERT INTO CONSUM(id_apartament, an, luna, nr_persoane, cantitate, valoare, pret_apa)
VALUES('1', '2018', '8', '3', '100', '130', '20');
INSERT INTO CONSUM(id_apartament, an, luna, nr_persoane, cantitate, valoare, pret_apa)
VALUES('3', '2019', '2', '5', '150', '180', '20');
INSERT INTO CONSUM(id_apartament, an, luna, nr_persoane, cantitate, valoare, pret_apa)
VALUES('2', '2018', '8', '5', '150', '120', '20');
INSERT INTO CONSUM(id_apartament, an, luna, nr_persoane, pret_apa)
VALUES('111', '2018', '8', '2', '20');
INSERT INTO CONSUM(id_apartament, an, luna, nr_persoane, cantitate, valoare, pret_apa)
VALUES('5', '2018', '6', '3', '150', '200', '15');
INSERT INTO CONSUM(id_apartament, an, luna, nr_persoane, cantitate, valoare, pret_apa)
VALUES('6', '2019', '7', '2', '120', '210', '20');

INSERT INTO Chitanta(numar, data, id_apartament, valoare)
VALUES('1', str_to_date('09/21/2017','%m/%d/%Y'), '1', '120');
INSERT INTO Chitanta(numar, data, id_apartament, valoare)
VALUES('2', str_to_date('05/18/2019','%m/%d/%Y'), '3', '60');




ALTER TABLE Consum ADD CONSTRAINT CK_an CHECK (AN >= 2017 AND AN <=2019);
ALTER TABLE Consum ADD CONSTRAINT CK_cantitate CHECK ((cantitate = 0 AND nr_persoane = 0) OR (cantitate != 0));
ALTER TABLE Proprietar ADD CONSTRAINT PK_id_proprietar PRIMARY KEY (id_proprietar);
ALTER TABLE Apartament ADD CONSTRAINT PK_id_apartament PRIMARY KEY (id_apartament);
ALTER TABLE Apartament ADD CONSTRAINT FK_id_prop FOREIGN KEY (id_proprietar) REFERENCES Proprietar (id_proprietar);
ALTER TABLE Consum ADD CONSTRAINT PK_idAp_an_luna PRIMARY KEY (id_apartament, an, luna);
ALTER TABLE Consum ADD CONSTRAINT FK_id_ap FOREIGN KEY (id_apartament) REFERENCES Apartament (id_apartament);
ALTER TABLE Chitanta ADD CONSTRAINT PK_numar PRIMARY KEY (numar);
ALTER TABLE Chitanta ADD CONSTRAINT FK_id_ap_chitanta FOREIGN KEY (id_apartament) REFERENCES Apartament (id_apartament);

create procedure proc_4a()
SELECT ap1.id_apartament as apartament1, ap2.id_apartament as apartament2, ap1.ID_PROPRIETAR as idprop
FROM Apartament ap1 JOIN Apartament ap2
ON (ap1.id_proprietar = ap2.id_proprietar)
WHERE ap1.id_apartament < ap2.id_apartament;

create procedure proc_ex6a()
SELECT ID_APARTAMENT, AN, AVG(CANTITATE) as cantitate
FROM Consum
GROUP BY ID_APARTAMENT, AN;