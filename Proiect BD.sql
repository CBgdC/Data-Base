CREATE  TABLE PROGRAM(
id_program NUMBER(4) PRIMARY KEY,
interval_orar VARCHAR2(25),
data DATE);

select * from PROGRAM;

CREATE TABLE MAGAZINE(
id_mag NUMBER(4) PRIMARY KEY,
id_tara VARCHAR2(25),
oras VARCHAR2(25),
adresa VARCHAR2(25),
id_program VARCHAR2(25),
telefon VARCHAR2(25),
email VARCHAR2(25),
id_management VARCHAR2(25));

ALTER TABLE MAGAZINE
ADD FOREIGN KEY (id_tara) REFERENCES TARA(id_tara);
ADD FOREIGN KEY (id_program) REFERENCES PROGRAM(id_program);
ADD FOREIGN KEY (id_management) REFERENCES MANAGEMENT(id_management);

select * from MAGAZINE;

CREATE TABLE MANAGEMENT (
id_management number(4) PRIMARY KEY,
id_ang VARCHAR2(25),
id_functie VARCHAR2(25),
buget VARCHAR2(25),
target VARCHAR2(25));

ALTER TABLE MANAGEMENT
ADD FOREIGN KEY (id_ang) REFERENCES ANGAJATI(id_ang);
ADD FOREIGN KEY (id_functie) REFERENCES FUNCTII(id_functie);

select * from MANAGEMENT;

CREATE TABLE FUNCTII(
id_functie NUMBER(4) PRIMARY KEY,
denumire VARCHAR2(50),
salariu_de_baza VARCHAR2(25),
superior_direct VARCHAR2(25));

select * from FUNCTII;

CREATE TABLE ANGAJATI(
id_ang NUMBER(4) PRIMARY KEY,
id_mag NUMBER(4),
id_functie VARCHAR2(25),
nume VARCHAR2(25),
prenume VARCHAR2(25),
data_ang DATE,
salariu NUMBER(8),
telefon1 VARCHAR2(25),
email1 VARCHAR2(25),
stare_civila VARCHAR2(25));

ALTER TABLE ANGAJATI
ADD FOREIGN KEY (id_mag) REFERENCES MAGAZINE(id_mag);
ADD FOREIGN KEY (id_functie) REFERENCES FUNCTII(id_functie);

select * from ANGAJATI;

CREATE TABLE TARA(
id_tara NUMBER(4) PRIMARY KEY,
numeT VARCHAR2(25),
continet VARCHAR2(25));

select * from TARA;

CREATE TABLE EV_PROGRAM(
id_evprog NUMBER(4) PRIMARY KEY,
id_program VARCHAR2(25),
id_ang VARCHAR2(25));

ALTER TABLE EV_PROGRAM
ADD FOREIGN KEY (id_program) REFERENCES PROGRAM(id_program);
ADD FOREIGN KEY (id_ang) REFERENCES ANGAJATI(id_ang);

select * from EV_PROGRAM;

 CREATE TABLE INCASARI(
 id_incasari NUMBER(4) PRIMARY KEY,
 id_mag NUMBER(4),
 suma VARCHAR2(25),
 id_moneda VARCHAR2(25),
 id_program VARCHAR2(25));
 
 ALTER TABLE INCASARI
 ADD FOREIGN KEY (id_mag) REFERENCES MAGAZINE(id_mag);
 ADD FOREIGN KEY (id_moneda) REFERENCES MONEDE(id_moneda);
 ADD FOREIGN KEY (id_program) REFERENCES PROGRAM(id_program);
 
 select * from INCASARI;
 
 CREATE TABLE INGREDIENTE(
 id_ing NUMBER(4) PRIMARY KEY,
 id_furnizor VARCHAR2(25),
 denumireIN VARCHAR2(25),
 pret VARCHAR2(25),
 data_achizitie DATE,
 data_expirare DATE);
 
 ALTER TABLE INGREDIENTE
 ADD FOREIGN KEY (id_furnizor) REFERENCES FURNIZORI(id_furnizor);
 
 select* from INGREDIENTE;
 
 CREATE TABLE MENIU(
 id_meniu NUMBER(4) PRIMARY KEY,
 denumire_produs VARCHAR2(25),
 id_ing VARCHAR2(25),
 pret VARCHAR2(25));
 
 ALTER TABLE MENIU
 ADD FOREIGN KEY (id_ing) REFERENCES INGREDIENTE(id_ing);
 
 select * from MENIU;
 
 CREATE TABLE CLIENTI(
 id_client NUMBER(4) PRIMARY KEY,
 numeC VARCHAR2(25),
 prenumeC VARCHAR2(25),
 telefonC VARCHAR2(25),
 emailC VARCHAR2(25),
 id_mag NUMBER(4));
 
 ALTER TABLE CLIENTI
 ADD FOREIGN KEY (id_mag) REFERENCES MAGAZINE(id_mag);
 
 select * from CLIENTI;
 
 CREATE TABLE MONEDE(
 id_moneda NUMBER(4) PRIMARY KEY,
 id_tara VARCHAR2(25),
 denumireM VARCHAR2(25),
 valoare_euro VARCHAR2(25));
 
 ALTER TABLE MONEDE
 ADD FOREIGN KEY (id_tara) REFERENCES TARA(id_tara);
 
 select * from MONEDE;
 
 CREATE TABLE  PROD_BINE_VD(
 id_pbv NUMBER(4) PRIMARY KEY,
 id_meniu VARCHAR2(25),
 id_mag NUMBER(4));
 
 ALTER TABLE PROD_BINE_VD
 ADD FOREIGN KEY (id_meniu) REFERENCES MENIU(id_meniu);
 ADD FOREIGN KEY (id_mag) REFERENCES MAGAZINE(id_mag);
 
 select * from PROD_BINE_VD;
 
 
 CREATE TABLE INV_OBIECTE(
 id_inv NUMBER(4) PRIMARY KEY,
 numeI VARCHAR2(25),
 cantitate VARCHAR2(25),
 pretI VARCHAR2(25),
 data_achizitie DATE,
 id_furnizor VARCHAR2(25));
 
 ALTER TABLE INV_OBIECTE
 ADD FOREIGN KEY (id_frnizor) REFERENCES FURNIZORI(id_frunizor);
 
 select * from INV_OBIECTE;
 
 CREATE TABLE CONCURENTA(
 id_concurent NUMBER(4) PRIMARY KEY,
 numeC VARCHAR2(25),
 id_tara VARCHAR2(25),
 oras1CO VARCHAR2(25),
 adresaCO VARCHAR2(25),
 telefonCO VARCHAR2(25),
 emailC VARCHAR2(25));
 
ALTER TABLE CONCURENTA
ADD FOREIGN KEY (id_tara) REFERENCES TARA(id_tara);

select * from CONCURENTA;

 CREATE TABLE FURNIZORI(
 id_furnizori NUMBER(4) PRIMARY KEY,
 numeFR VARCHAR2(25),
 id_tara VARCHAR2(25),
 telefonFR VARCHAR2(25),
 emailFR VARCHAR2(25));
 
 ALTER TABLE FRUNIZORI
 ADD FOREIGN KEY (id_tara) REFERENCES TARA(id_tara);
 
 select * from FURNIZORI;
 
 --Tara
insert into TARA(id_tara, numeT, continet)
values(1, 'Romania', 'Europa');
insert into TARA(id_tara, numeT, continet)
values(2, 'Italia', 'Europa');
insert into TARA(id_tara, numeT, continet)
values(3, 'China', 'Asia');
insert into TARA(id_tara, numeT, continet)
values(4, 'California', 'America de Nord');
insert into TARA(id_tara, numeT, continet)
values(5, 'Brazilia', 'America de Sud');
insert into TARA(id_tara, numeT, continet)
values(6, 'Columbia', 'America de Sud');

--Furnizori
insert into FURNIZORI(id_furnizori, numeFR, id_tara, telefonFR, emailFR)
values(1, 'Strauss Romania', 1, '0743938502', 'straussromania@gmail.com' );
insert into FURNIZORI(id_furnizori, numeFR, id_tara, telefonFR, emailFR)
values(2, 'Kraft Foods', 4, '0234857301', 'kraftfoods@gmail.com' );
insert into FURNIZORI(id_furnizori, numeFR, id_tara, telefonFR, emailFR)
values(3, 'Tchibo Romania', 1, '0765789203', 'tchimboromania@gmail.com' );
insert into FURNIZORI(id_furnizori, numeFR, id_tara, telefonFR, emailFR)
values(4, 'Lavazza', 5, '0345783967', 'lavazza@gmail.com' );
insert into FURNIZORI(id_furnizori, numeFR, id_tara, telefonFR, emailFR)
values(5, 'Barshaker', 6, '0438593859', 'barshaker@gmail.com' );
insert into FURNIZORI(id_furnizori, numeFR, id_tara, telefonFR, emailFR)
values(6, 'Supermercato', 2, '0368563210', 'supermercato@gmail.com' );
insert into FURNIZORI(id_furnizori, numeFR, id_tara, telefonFR, emailFR)
values(7, 'Roc Industry', 3, '86-536-5678288', 'director@sgrocltd.com' );

--MONEDE
insert into MONEDE(id_moneda, id_tara, denumireM, valoare_euro)
values(1, 1, 'Ron', '0.20 euro');
insert into MONEDE(id_moneda, id_tara, denumireM, valoare_euro)
values(2, 2, 'Euro', '1 euro');
insert into MONEDE(id_moneda, id_tara, denumireM, valoare_euro)
values(3, 3, 'Yuan renminbi', '0.14 euro');
insert into MONEDE(id_moneda, id_tara, denumireM, valoare_euro)
values(4, 4, 'Dolar', '0.95 euro');
insert into MONEDE(id_moneda, id_tara, denumireM, valoare_euro)
values(5, 5, 'Real', '0.18 euro');
insert into MONEDE(id_moneda, id_tara, denumireM, valoare_euro)
values(6, 6, 'Pesos', '0.049 euro');

--Concurenta
insert into CONCURENTA(id_concurent, numeC, id_tara, oras1CO, adresaCO, telefonCO, emailC)
values(1, '5 To Go', 1, 'Craiova', 'Alexandru Ioan Cuza 9', '0251 466 508', '5togo@gmail.com');
insert into CONCURENTA(id_concurent, numeC, id_tara, oras1CO, adresaCO, telefonCO, emailC)
values(2, 'Itali coffe', 2, 'Savona', 'Via Antonio Baglietto', '0355 349 943', 'italicoffe@gmail.com');
insert into CONCURENTA(id_concurent, numeC, id_tara, oras1CO, adresaCO, telefonCO, emailC)
values(3, 'Brazilian Coffee Stores', 5, 'Ash Shatibi', '20 Salah Salem', '20 3 4874705', 'braziliancoffe@gmail.com');
insert into CONCURENTA(id_concurent, numeC, id_tara, oras1CO, adresaCO, telefonCO, emailC)
values(4, 'California Coffee Bar', 4, 'USA', '3619 California Ave', '+1 412-766-0444', 'californiacoffe@gmail.com');
insert into CONCURENTA(id_concurent, numeC, id_tara, oras1CO, adresaCO, telefonCO, emailC)
values(5, 'Coffee Store', 1, 'Bucuresti', 'Calea Victoriei 85', '0720 045 411', 'coffestore@gmail.com');

--Ingrediente
insert into INGREDIENTE(id_ing, id_furnizor, denumireIN, pret, data_achizitie, data_expirare)
values(1, 3, 'Boabe Cafea Tchibo', '18.5 Ron', TO_DATE('2022/12/18', 'YYYY-MM-DD'), TO_DATE('2025/12/05', 'YYYY-MM-DD'));
insert into INGREDIENTE(id_ing, id_furnizor, denumireIN, pret, data_achizitie, data_expirare)
values(2, 4, 'Cafea Lavazza', '13 Real', TO_DATE('2022/10/16', 'YYYY-MM-DD'), TO_DATE('2026/05/15', 'YYYY-MM-DD'));
insert into INGREDIENTE(id_ing, id_furnizor, denumireIN, pret, data_achizitie, data_expirare)
values(3, 2, 'Lapte', '3 Dolari', TO_DATE('2022/12/23', 'YYYY-MM-DD'), TO_DATE('2023/04/15', 'YYYY-MM-DD'));
insert into INGREDIENTE(id_ing, id_furnizor, denumireIN, pret, data_achizitie, data_expirare)
values(4, 5, 'Zahar', '2 Pesos', TO_DATE('2022/04/12', 'YYYY-MM-DD'), TO_DATE('2027/11/17', 'YYYY-MM-DD'));
insert into INGREDIENTE(id_ing, id_furnizor, denumireIN, pret, data_achizitie, data_expirare)
values(5, 6, 'Cafea Solubila', '3 Euro', TO_DATE('2022/09/11', 'YYYY-MM-DD'), TO_DATE('2024/06/07', 'YYYY-MM-DD'));

--Meniu
insert into MENIU(id_meniu, denumire_produs, id_ing, pret)
values(1, 'Espresso Macchiato', 1, '2 Euro');
insert into MENIU(id_meniu, denumire_produs, id_ing, pret)
values(2, 'Latte Macchiato', 5, '3 Euro');
insert into MENIU(id_meniu, denumire_produs, id_ing, pret)
values(3, 'Milkshake', 3, '1 Euro');
insert into MENIU(id_meniu, denumire_produs, id_ing, pret)
values(4, 'Espresso Lungo', 2, '2 Euro');

--Program
insert into PROGRAM(id_program, interval_orar, data)
values(1,'09:00-23:00', TO_DATE('2022/12/25', 'YYYY-MM-DD'));
insert into PROGRAM(id_program, interval_orar, data)
values(2,'10:00-22:00', TO_DATE('2022/12/25', 'YYYY-MM-DD'));
insert into PROGRAM(id_program, interval_orar, data)
values(3,'12:00-02:00', TO_DATE('2022/12/25', 'YYYY-MM-DD'));
insert into PROGRAM(id_program, interval_orar, data)
values(4,'08:00-21:00', TO_DATE('2022/12/31', 'YYYY-MM-DD'));
insert into PROGRAM(id_program, interval_orar, data)
values(5,'11:00-18:00', TO_DATE('2022/12/31', 'YYYY-MM-DD'));
insert into PROGRAM(id_program, interval_orar, data)
values(6,'12:00-19:00', TO_DATE('2022/12/31', 'YYYY-MM-DD'));

--Functii
insert into FUNCTII(id_functie, denumire, salariu_de_baza, superior_direct)
values(1, 'Manager', '2000 Euro', '--');
insert into FUNCTII(id_functie, denumire, salariu_de_baza, superior_direct)
values(2, 'Contabil', '1200 Euro', 'Manager');
insert into FUNCTII(id_functie, denumire, salariu_de_baza, superior_direct)
values(3, 'Sef de Sala', '1000 Euro', 'Manager');
insert into FUNCTII(id_functie, denumire, salariu_de_baza, superior_direct)
values(4, 'Barista', '800 Euro', 'Sef de Sala');
insert into FUNCTII(id_functie, denumire, salariu_de_baza, superior_direct)
values(5, 'Ospatar', '700 Euro', 'Sef de Sala');

--Magazine
insert into MAGAZINE(id_mag, id_tara, oras, adresa, id_program, telefon, email, id_management)
values(1, 1, 'Craiova', 'Strada Lapus Arges', 2, '024764763845', 'emailunu@gmail.com', 1);
insert into MAGAZINE(id_mag, id_tara, oras, adresa, id_program, telefon, email, id_management)
values(2, 2, 'Savona', 'Corso Italia', 5, '5558945685475', 'emaildoi@gmail.com', 1);
insert into MAGAZINE(id_mag, id_tara, oras, adresa, id_program, telefon, email, id_management)
values(3, 4, 'USA', ' 3541 Cedar Street', 1, '583464763845', 'emailtrei@gmail.com', 1);
insert into MAGAZINE(id_mag, id_tara, oras, adresa, id_program, telefon, email, id_management)
values(4, 5, 'Ash Shatibi', 'Abu al-Qasim al-Shatibi', 4, '0247647632455', 'emailpatru@gmail.com', 1);
insert into MAGAZINE(id_mag, id_tara, oras, adresa, id_program, telefon, email, id_management)
values(5, 6, 'Medelin', ' Alpujarra', 3, '0247673576845', 'emailcinci@gmail.com', 1);

--Angajati
insert into ANGAJATI(id_ang, id_mag, id_functie, nume, prenume, data_ang, salariu, telefon1, email1, stare_civila)
values(1, 1, 1, 'Petre', 'Dragos', TO_DATE('2010/05/18', 'YYYY-MM-DD'), 2500, '0740-036 682 ', 'dragosp@gmail.com', 'casatorit');
insert into ANGAJATI(id_ang, id_mag, id_functie, nume, prenume, data_ang, salariu, telefon1, email1, stare_civila)
values(2, 2, 1, 'Georgescu', 'Flavia', TO_DATE('2012/03/18', 'YYYY-MM-DD'), 2000, '0250-731 422  ', 'grsgresg@gmail.com', 'necasatorit');
insert into ANGAJATI(id_ang, id_mag, id_functie, nume, prenume, data_ang, salariu, telefon1, email1, stare_civila)
values(3, 4, 1, 'Marinescu', 'George', TO_DATE('2014/01/18', 'YYYY-MM-DD'), 2100, '+40(233)234443 ', 'dgergergp@gmail.com', 'casatorit');
insert into ANGAJATI(id_ang, id_mag, id_functie, nume, prenume, data_ang, salariu, telefon1, email1, stare_civila)
values(4, 1, 2, 'Iliescu', 'Ion', TO_DATE('2016/01/18', 'YYYY-MM-DD'), 1300, '+40(234)342210  ', 'grsg@gmail.com', 'casatorit');
insert into ANGAJATI(id_ang, id_mag, id_functie, nume, prenume, data_ang, salariu, telefon1, email1, stare_civila)
values(5, 1, 4, 'Florescu', 'Laurentiu', TO_DATE('2018/06/18', 'YYYY-MM-DD'), 900, '+40(250)731350  ', 'dsgfdsgp@gmail.com', 'necasatorit');
insert into ANGAJATI(id_ang, id_mag, id_functie, nume, prenume, data_ang, salariu, telefon1, email1, stare_civila)
values(6, 5, 1, 'Anghel', 'Maria', TO_DATE('2011/12/18', 'YYYY-MM-DD'), 2700, '0254-779 519  ', 'sdgergosp@gmail.com', 'casatorit');
insert into ANGAJATI(id_ang, id_mag, id_functie, nume, prenume, data_ang, salariu, telefon1, email1, stare_civila)
values(7, 5, 1, 'Burcea', 'Nicu', TO_DATE('2020/11/18', 'YYYY-MM-DD'), 2500, '0744-609 846 ', 'sbvrsbrp@gmail.com', 'necasatorit');
insert into ANGAJATI(id_ang, id_mag, id_functie, nume, prenume, data_ang, salariu, telefon1, email1, stare_civila)
values(8, 3, 1, 'Costescu', 'Pana', TO_DATE('2008/03/18', 'YYYY-MM-DD'), 2300, '0744-522 714  ', 'srbsrbsp@gmail.com', 'necasatorit');
insert into ANGAJATI(id_ang, id_mag, id_functie, nume, prenume, data_ang, salariu, telefon1, email1, stare_civila)
values(9, 3, 3, 'Dracea', 'Petre', TO_DATE('2009/06/18', 'YYYY-MM-DD'), 1500, '+40(263)230065  ', 'srbrsosp@gmail.com', 'casatorit');
insert into ANGAJATI(id_ang, id_mag, id_functie, nume, prenume, data_ang, salariu, telefon1, email1, stare_civila)
values(10, 3, 5, 'Eugen', 'Raul', TO_DATE('2021/07/18', 'YYYY-MM-DD'), 800, '+40(259)237016 ', 'brsbsp@gmail.com', 'necasatorit');

--Management
insert into MANAGEMENT(id_management, id_ang, id_functie, buget, target)
values(1, 1, 1, '8000 Euro', '16000 Euro');
insert into MANAGEMENT(id_management, id_ang, id_functie, buget, target)
values(2, 2, 1, '6000 Euro', '12000 Euro');
insert into MANAGEMENT(id_management, id_ang, id_functie, buget, target)
values(3, 3, 1, '4000 Euro', '8000 Euro');
insert into MANAGEMENT(id_management, id_ang, id_functie, buget, target)
values(4, 6, 1, '7000 Euro', '14000 Euro');
insert into MANAGEMENT(id_management, id_ang, id_functie, buget, target)
values(5, 7, 1, '9000 Euro', '18000 Euro');
insert into MANAGEMENT(id_management, id_ang, id_functie, buget, target)
values(6, 8, 1, '10000 Euro', '10000 Euro');

--Ev_Program
insert into EV_PROGRAM(id_evprog, id_program, id_ang)
values(1, 3, 1);
insert into EV_PROGRAM(id_evprog, id_program, id_ang)
values(2, 1, 2);
insert into EV_PROGRAM(id_evprog, id_program, id_ang)
values(3, 4, 3);
insert into EV_PROGRAM(id_evprog, id_program, id_ang)
values(4, 2, 4);
insert into EV_PROGRAM(id_evprog, id_program, id_ang)
values(5, 5, 5);
insert into EV_PROGRAM(id_evprog, id_program, id_ang)
values(6, 6, 6);
insert into EV_PROGRAM(id_evprog, id_program, id_ang)
values(7, 3, 7);
insert into EV_PROGRAM(id_evprog, id_program, id_ang)
values(8, 2, 8);
insert into EV_PROGRAM(id_evprog, id_program, id_ang)
values(9, 4, 9);
insert into EV_PROGRAM(id_evprog, id_program, id_ang)
values(10, 6, 10);

--Incasari
insert into INCASARI(id_incasari, id_mag, suma, id_moneda, id_program)
values(1, 1, '1000', 1, 2);
insert into INCASARI(id_incasari, id_mag, suma, id_moneda, id_program)
values(2, 2, '200', 2, 6);
insert into INCASARI(id_incasari, id_mag, suma, id_moneda, id_program)
values(3, 3, '400', 4, 3);
insert into INCASARI(id_incasari, id_mag, suma, id_moneda, id_program)
values(4, 4, '10000', 5, 1);
insert into INCASARI(id_incasari, id_mag, suma, id_moneda, id_program)
values(5, 5, '8000', 6, 4);

--Clienti
insert into CLIENTI(id_client, numeC, prenumeC, telefonC, emailC, id_mag)
values(1, 'Popescu', 'Alex', '+40(21)3184400 ', 'emailcinci@gmail.com', 1);
insert into CLIENTI(id_client, numeC, prenumeC, telefonC, emailC, id_mag)
values(2, 'Georgescu', 'Bogdan', '+40(234)518507 ', 'emailsase@gmail.com', 1);
insert into CLIENTI(id_client, numeC, prenumeC, telefonC, emailC, id_mag)
values(3, 'Mihailescu', 'Catalin', '+40(234)581568  ', 'emailsapte@gmail.com', 3);
insert into CLIENTI(id_client, numeC, prenumeC, telefonC, emailC, id_mag)
values(4, 'Curca', 'Dan', '+40(262)277010 ', 'emailopt@gmail.com', 2);
insert into CLIENTI(id_client, numeC, prenumeC, telefonC, emailC, id_mag)
values(5, 'Popa', 'Eugen', '+40(262)277133 ', 'emailnoua@gmail.com', 2);
insert into CLIENTI(id_client, numeC, prenumeC, telefonC, emailC, id_mag)
values(6, 'Bobocea', 'Florina', '+40(21)318450 ', 'emailzece@gmail.com', 3);

--Prod_Bine_Vd
insert into PROD_BINE_VD(id_pbv, id_meniu, id_mag)
values(1, 1, 2);
insert into PROD_BINE_VD(id_pbv, id_meniu, id_mag)
values(2, 3, 4);
insert into PROD_BINE_VD(id_pbv, id_meniu, id_mag)
values(3, 1, 5);
insert into PROD_BINE_VD(id_pbv, id_meniu, id_mag)
values(4, 3, 1);

--Inv_Obiecte
insert into INV_OBIECTE(id_inv, numeI, cantitate, pretI, data_achizitie, id_furnizor)
values(1, 'Masa', '5', '100 Euro', TO_DATE('2007/10/23','YYYY-MM-DD'), 7);
insert into INV_OBIECTE(id_inv, numeI, cantitate, pretI, data_achizitie, id_furnizor)
values(2, 'Scaun', '20', '50 Euro', TO_DATE('2007/10/23','YYYY-MM-DD'), 7);
insert into INV_OBIECTE(id_inv, numeI, cantitate, pretI, data_achizitie, id_furnizor)
values(3, 'Dulap', '3', '200 Euro', TO_DATE('2007/10/23','YYYY-MM-DD'), 7);
insert into INV_OBIECTE(id_inv, numeI, cantitate, pretI, data_achizitie, id_furnizor)
values(4, 'Espressor', '2', '1000 Euro', TO_DATE('2007/10/23','YYYY-MM-DD'), 7);

SELECT MIN(data_ang), MAX(data_ang)
FROM ANGAJATI

SELECT ANGAJATI.NUME,ANGAJATI.PRENUME
FROM ANGAJATI
WHERE ANGAJATI.STARE_CIVILA = 'casatorit'

select * from Magazine
order by oras desc;

SELECT NUME,UPPER(nume), prenume,UPPER(prenume)
from ANGAJATI;

select * from FURNIZORI
order by numeFR ASC;

SELECT ANGAJATI.NUME, ANGAJATI.PRENUME, ANGAJATI.SALARIU
FROM ANGAJATI
WHERE ANGAJATI.SALARIU>= 2000;

SELECT  ANGAJATI.NUME, ANGAJATI.PRENUME, ANGAJATI.ID_MAG
FROM ANGAJATI
WHERE ID_FUNCTIE = 1;

SELECT INGREDIENTE.ID_ING, INGREDIENTE.DENUMIREIN
FROM INGREDIENTE, MENIU
WHERE MENIU.ID_ING = INGREDIENTE.ID_ING;

SELECT  PROD_BINE_VD.ID_MAG, MENIU.DENUMIRE_PRODUS, INGREDIENTE.DENUMIREIN
FROM  MENIU, INGREDIENTE, PROD_BINE_VD
WHERE INGREDIENTE.ID_ING = MENIU.ID_MENIU AND PROD_BINE_VD.ID_MENIU = MENIU.ID_MENIU;


SELECT NUME, PRENUME, SALARIU+0.2*SALARIU AS "Marire salariu"
FROM ANGAJATI
WHERE ID_FUNCTIE = '1';

SELECT COUNT(*)
FROM ANGAJATI
WHERE ID_FUNCTIE = '1';


