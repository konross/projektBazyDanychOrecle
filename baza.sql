-- @"D:\12K2_KStano_Bazy_Danych\baza.sql";
Konrad Stano

CLEAR SCREEN;
set wrap off;
set linesize 1000;
set serveroutput on;

PROMPT ;
PROMPT logowanie jako STUDENT;
PROMPT ;

PROMPT ;
PROMPT Kasowanie tabel;
PROMPT ;

DELETE FROM STAZE;
drop table STAZE;
DELETE FROM FAKTURY;
drop table FAKTURY;
drop table CEN_WYK;
drop table PRA_WYK;
DELETE FROM WYKONANE_PRACE;
drop table WYKONANE_PRACE;
DELETE FROM PROMOCJE;
drop table PROMOCJE;
drop table CZE_DOS;
DELETE FROM CZESCI;
drop table CZESCI;
DELETE FROM DOSTAWCY;
drop table DOSTAWCY;
DELETE FROM NAPRAWIANE_AUTA;
drop table NAPRAWIANE_AUTA;
DELETE FROM NABYWCY;
drop table NABYWCY;
DELETE FROM AUTA_SPRZEDAWANE;
drop table AUTA_SPRZEDAWANE;
DELETE FROM CENNIK;
drop table CENNIK;
DELETE FROM KLIENCI;
drop table KLIENCI;
DELETE FROM PRACOWNICY;
drop table PRACOWNICY;
DELETE FROM ADRESY;
drop table ADRESY;
--
PROMPT ;
PROMPT Tworzenie tabel:;
PROMPT ;
--
PROMPT----------------------------------------;
PROMPT CREATE TABLE ADRESY;
--
create table ADRESY
(
	ADRk_1_ID 			NUMBER(8) 	NOT NULL,
	ADR_KRAJ 			VARCHAR(45) NOT NULL,
	ADR_MIEJSCOWOSC 	VARCHAR(45) NOT NULL,
	ADR_ULICA 			VARCHAR(45) NOT NULL,
	ADR_NR_DOMU 		VARCHAR(6)  NOT NULL,
	ADR_NR_LOKUM 		VARCHAR(6) 	,
	ADR_KOD_POCZTOWY 	VARCHAR(6) 	NOT NULL
);
		PROMPT----------------------------------------;
		PROMPT Primary Key ADRESY;
		--
			alter table ADRESY
			add constraint CSR_PK_ADRESY
			primary key (ADRk_1_ID);
		--
PROMPT----------------------------------------;
PROMPT CREATE TABLE PRACOWNICY;
--
create table PRACOWNICY
(
	PRAk_1_ID 			NUMBER(8) 	NOT NULL,
	PRA_IMIE 			VARCHAR(25) NOT NULL,
	PRA_NAZWISKO 		VARCHAR(45) NOT NULL,
	PRA_ADRES_EMAIL 	VARCHAR(60) ,
	PRA_TELEFON1 		NUMBER(20) NOT NULL,
	PRA_PESEL 			VARCHAR(11) NOT NULL,
	PRA_PENSJA			VARCHAR(10) NOT NULL,
	ADR_ID 				NUMBER(8) 	NOT NULL
);
		--
		PROMPT----------------------------------------;
		PROMPT Primary Key PRACOWNICY;
			--
			alter table PRACOWNICY
			add constraint CSR_PK_PRACOWNICY
			primary key (PRAk_1_ID);
			--
		PROMPT----------------------------------------;
		PROMPT Foreign Key PRACOWNICY;
		--
			alter table PRACOWNICY add constraint CSR_FK_PRACOWNICY
			foreign key (ADR_ID)
			references ADRESY (ADRk_1_ID);

PROMPT----------------------------------------;
PROMPT CREATE TABLE KLIENCI;
--
create table KLIENCI
(
	KLIk_1_ID 			NUMBER(8) 	NOT NULL,
	KLI_IMIE 			VARCHAR(25) NOT NULL,
	KLI_NAZWISKO 		VARCHAR(45) NOT NULL,
	KLI_ADRES_EMAIL 	VARCHAR(60) ,
	KLI_TELEFON1 		NUMBER(20) NOT NULL,
	KLI_PESEL 			VARCHAR(11) NOT NULL,
	KLI_ZLECENIE 		VARCHAR(500),
	ADR_ID 				NUMBER(8) 	NOT NULL
);
		PROMPT----------------------------------------;
		PROMPT Primary Key KLIENCI;
		--
			alter table KLIENCI
			add constraint CSR_PK_KLIENCI
			primary key (KLIk_1_ID);
		PROMPT----------------------------------------;
		PROMPT Foreign Key KLIENCI;
		--
			alter table KLIENCI add constraint CSR_FK_KLIENCI
			foreign key (ADR_ID)
			references ADRESY (ADRk_1_ID);

--
PROMPT----------------------------------------;
PROMPT CREATE TABLE CENNIK;;
--
create table CENNIK
(
	CENk_1_ID	NUMBER(8)	NOT NULL,
	CEN_USLUGA	VARCHAR(50)	NOT NULL,
	CEN_CENA	VARCHAR(10) NOT NULL
);
		PROMPT----------------------------------------;
		PROMPT Primary Key CENNIK;
		--
			alter table CENNIK add constraint CSR_PK_CENNIK
			primary key (CENk_1_ID);
--
PROMPT----------------------------------------;
PROMPT CREATE TABLE AUTA_SPRZEDAWANE;
--
create table AUTA_SPRZEDAWANE
(
	AUTk_1_ID				NUMBER(8)		NOT NULL,
	AUT_CENA				VARCHAR(10)		NOT NULL,
	AUT_KRAJ_POCHODZENIA	VARCHAR(45)		,
	AUT_KRAJ_REJESTRACJI	VARCHAR(45)		NOT NULL,
	AUT_MARKA				VARCHAR(30)		NOT NULL,
	AUT_MODEL				VARCHAR(45)		NOT NULL,
	AUT_ROK_PROD			VARCHAR(7)		NOT NULL,
	AUT_PRZEBIEG			VARCHAR(10)		NOT NULL,
	AUT_PALIWO				VARCHAR(20)		NOT NULL,
	AUT_POJEMNOSC			VARCHAR(10)		NOT NULL,
	AUT_MOC					VARCHAR(10)		NOT NULL,
	AUT_KOLOR				VARCHAR(30)		,
	AUT_WYPOSAZENIE			VARCHAR(250)	NOT NULL,
	AUT_OPIS				VARCHAR(500)	
);
		PROMPT----------------------------------------;
		PROMPT Primary Key AUTA_SPRZEDAWANE;
		--
			alter table AUTA_SPRZEDAWANE add constraint CSR_PK_AUTA_SPRZEDANE
			primary key (AUTk_1_ID);
--
PROMPT----------------------------------------;
PROMPT CREATE TABLE NABYWCY;
--
create table NABYWCY
(
	NABk_1_ID	NUMBER(8)	NOT NULL,
	AUT_ID		NUMBER(8)	NOT NULL,
	KLI_ID		NUMBER(8)	NOT NULL,
	NAB_DATA	DATE		NOT NULL,
	NAB_CENA	VARCHAR(10)	NOT NULL
);
		PROMPT----------------------------------------;
		PROMPT Primary Key NABYWCY;
		--
			alter table NABYWCY add constraint CSR_PK_NABYWCY
			primary key (NABk_1_ID);
		PROMPT----------------------------------------;
		PROMPT Foreign Key Nabywcy;
		--
			alter table NABYWCY add constraint CSR_FK_1_NABYWCY
			foreign key (AUT_ID)
			references AUTA_SPRZEDAWANE (AUTk_1_ID);
			
			alter table NABYWCY add constraint CSR_FK_2_NABYWCY
			foreign key (KLI_ID)
			references KLIENCI (KLIk_1_ID);
--
PROMPT----------------------------------------;
PROMPT CREATE TABLE NAPRAWIANE_AUTA;
--
create table NAPRAWIANE_AUTA
(
	NAPk_1_ID			NUMBER(8)	NOT NULL,
	NAP_MARKA			VARCHAR(30)	NOT NULL,
	NAP_MODEL			VARCHAR(45)	NOT NULL,
	NAP_ROK_PROD		VARCHAR(7)	NOT NULL,
	NAP_NR_REJESTRACJI	VARCHAR(10)	NOT NULL,
	NAP_NR_VIN			VARCHAR(20)	NOT NULL,
	KLI_ID				NUMBER(8)	NOT NULL
	-- WYK_ID				NUMBER(8)	NOT NULL
);
		PROMPT----------------------------------------;
		PROMPT Primary Key NAPRAWIANE_AUTA;
		--
			alter table NAPRAWIANE_AUTA add constraint CSR_PK_NAPRAWIANE_AUTA
			primary key (NAPk_1_ID);
		PROMPT----------------------------------------;
		PROMPT Foreign Key NAPRAWIANE_AUTA;
		--
			alter table NAPRAWIANE_AUTA add constraint CSR_FK_NAPRAWIANE_AUTA
			foreign key (KLI_ID)
			references KLIENCI (KLIk_1_ID);

PROMPT----------------------------------------;
PROMPT CREATE TABLE DOSTAWCY;
--
create table DOSTAWCY
(
	DOSk_1_ID		NUMBER(8)		NOT NULL,
	DOS_NAZWA		VARCHAR(50)		NOT NULL,
	DOS_TELEFON		VARCHAR(20)		NOT NULL,
	DOS_EMAIL		VARCHAR(60)		NOT NULL,
	ADR_ID			NUMBER(8)
);
		PROMPT----------------------------------------;
		PROMPT Primary Key DOSTAWCY;
		--
			alter table DOSTAWCY add constraint CSR_PK_DOSTAWCY
			primary key (DOSk_1_ID);
		PROMPT----------------------------------------;
		PROMPT Foreign Key DOSTAWCY;
		--
			alter table DOSTAWCY add constraint CSR_FK_DOSTAWCY
			foreign key (ADR_ID)
			references ADRESY (ADRk_1_ID);
--

PROMPT----------------------------------------;
PROMPT CREATE TABLE CZESCI;
--
create table CZESCI
(
	CZEk_1_ID		NUMBER(8)		NOT NULL,
	CZE_DATA_ZAM	DATE			,
	CZE_NAZWA		VARCHAR(50)		NOT NULL,
	CZE_CENA		VARCHAR(10)		NOT NULL,
	DOS_ID			NUMBER(8)		NOT NULL
);
		PROMPT----------------------------------------;
		PROMPT Primary Key CZESCI;
		--
			alter table CZESCI add constraint CSR_PK_CZESCI
			primary key (CZEk_1_ID);
		PROMPT----------------------------------------;
		PROMPT Foreign Key CZESCI;
		--
			alter table CZESCI add constraint CSR_FK_CZESCI
			foreign key (DOS_ID)
			references DOSTAWCY (DOSk_1_ID);
--
ROMPT----------------------------------------;
PROMPT CREATE TABLE CZE_DOS;
--
create table CZE_DOS
(
	CZE_ID		NUMBER(8)		NOT NULL,
	DOS_ID		NUMBER(8)		NOT NULL,
);

			alter table CZE_DOS add constraint FK_CZE
			FOREIGN KEY (CZE_ID)
			references CZESCI (CZEk_1_ID);
			
			alter table CZE_DOS add constraint FK_DOS
			FOREIGN KEY (DOS_ID)
			references DOSTAWCY (DOSk_1_ID);

--
PROMPT----------------------------------------;
PROMPT CREATE TABLE PROMOCJE;
--
create table PROMOCJE
(
	PROk_1_ID		NUMBER(8)		NOT NULL,
	PRO_NAZWA		VARCHAR(50)		NOT NULL,
	-- PRO_CENA		VARCHAR(10)		,
	PRO_ZNIZKA		VARCHAR(10)		,
	PRO_DATA_ROZP	DATE			NOT NULL,
	PRO_DATA_ZAK	DATE			NOT NULL,
	PRO_OPIS		VARCHAR(250)
);
		PROMPT----------------------------------------;
		PROMPT Primary Key PROMOCJE;
		--
			alter table PROMOCJE add constraint CSR_PK_PROMOCJE
			primary key (PROk_1_ID);
			
--
PROMPT----------------------------------------;
PROMPT CREATE TABLE WYKONANE_PRACE;
--
create table WYKONANE_PRACE
(
	WYKk_1_ID			NUMBER(8)		NOT NULL,
	WYK_NR_STANOWISKA	VARCHAR(3)		NOT NULL,
	PRA_ID				NUMBER(8)		NOT NULL,
	CZE_ID				NUMBER(8)		NOT NULL,
	WYK_PRACE			VARCHAR(100)	NOT NULL,
	CEN_ID				NUMBER(8)		NOT NULL,
	NAP_ID				NUMBER(8)		NOT NULL,
	-- FAK_ID				NUMBER(8)		NOT NULL,
	PRO_ID				NUMBER(8)		NOT NULL
);
		PROMPT----------------------------------------;
		PROMPT Primary Key WYKONANE_PRACE;
		--
			alter table WYKONANE_PRACE add constraint CSR_PK_WYKONANE_PRACE
			primary key (WYKk_1_ID);
		PROMPT----------------------------------------;
		PROMPT Foreign Key WYKONANE_PRACE;
		--
			alter table WYKONANE_PRACE add constraint CSR_FK_1_WYKONANE_PRACE
			foreign key (PRA_ID)
			references PRACOWNICY (PRAk_1_ID);
			
			alter table WYKONANE_PRACE add constraint CSR_FK_2_WYKONANE_PRACE
			foreign key (CZE_ID)
			references CZESCI (CZEk_1_ID);
			
			alter table WYKONANE_PRACE add constraint CSR_FK_3_WYKONANE_PRACE
			foreign key (CEN_ID)
			references CENNIK (CENk_1_ID);
			
			alter table WYKONANE_PRACE add constraint CSR_FK_4_WYKONANE_PRACE
			foreign key (NAP_ID)
			references NAPRAWIANE_AUTA (NAPk_1_ID);
			
			alter table WYKONANE_PRACE add constraint CSR_FK_5_WYKONANE_PRACE
			foreign key (PRO_ID)
			references PROMOCJE (PROk_1_ID);
--


PROMPT----------------------------------------;
PROMPT CREATE TABLE FAKTURY;
--
create table FAKTURY
(
	FAKk_1_ID			NUMBER(8)		NOT NULL,
	FAK_DATA_WYST		DATE			NOT NULL,
	FAK_DATA_PLATNOSCI	DATE			NOT NULL,
	FAK_CENA			VARCHAR(10)		NOT NULL,
	KLI_ID				NUMBER(8)		NOT NULL,
	WYK_ID				NUMBER(8)		NOT NULL
);
		PROMPT----------------------------------------;
		PROMPT Primary Key FAKTURY;
		--
			alter table FAKTURY add constraint CSR_PK_FAKTURY
			primary key (FAKk_1_ID);
		PROMPT----------------------------------------;
		PROMPT Foreign Key FAKTURY;
		--
			alter table FAKTURY add constraint CSR_FK_1_FAKTURY
			foreign key (KLI_ID)
			references KLIENCI (KLIk_1_ID);
			
			alter table FAKTURY add constraint CSR_FK_2_FAKTURY
			foreign key (WYK_ID)
			references WYKONANE_PRACE (WYKk_1_ID);

			
create table STAZE
(
	ID_STAZ NUMBER(8) NULL,
	PENSJA_MIN NUMBER(8) NULL,
	PENSJA_MAX NUMBER(8) NULL,
	GRUPA VARCHAR(20)
);		


PROMPT----------------------------------------;
PROMPT DESCRIBE;
PROMPT----------------------------------------;
--
PROMPT Sprawdzamy czy prawidlowo utworzono tabele;
PROMPT ;
--
describe ADRESY;
describe PRACOWNICY;
describe KLIENCI;
describe CENNIK;
describe AUTA_SPRZEDAWANE;
describe NABYWCY
describe NAPRAWIANE_AUTA
describe WYKONANE_PRACE
describe CZESCI
describe DOSTAWCY
describe PROMOCJE
describe FAKTURY
--


PROMPT----------------------------------------;
PROMPT SEKWENCJE I TRIGGERY;
PROMPT----------------------------------------;


drop sequence SEQ_FAKTURY;
drop sequence SEQ_WYKONANE_PRACE;
drop sequence SEQ_PROMOCJE;
drop sequence SEQ_CZESCI;
drop sequence SEQ_DOSTAWCY;
drop sequence SEQ_NAPRAWIANE_AUTA;
drop sequence SEQ_NABYWCY;
drop sequence SEQ_AUTA_SPRZEDAWANE;
drop sequence SEQ_CENNIK;
drop sequence SEQ_KLIENCI;
drop sequence SEQ_PRACOWNICY;
drop sequence SEQ_ADRESY;


create sequence SEQ_FAKTURY
increment by 1 start with 1
maxvalue 9999999 minvalue 1;

	create or replace trigger T_BI_FAKTURY
	before insert on FAKTURY
	for each row
	begin
	if :new.FAKk_1_ID is NULL then
		SELECT SEQ_FAKTURY.nextval INTO :new.FAKk_1_ID FROM dual;
	end if;
	end;
	/	
	
create sequence SEQ_WYKONANE_PRACE
increment by 1 start with 1
maxvalue 9999999 minvalue 1;

	create or replace trigger T_BI_WYKONANE_PRACE
	before insert on WYKONANE_PRACE
	for each row
	begin
	if :new.WYKk_1_ID is NULL then
		SELECT SEQ_WYKONANE_PRACE.nextval INTO :new.WYKk_1_ID FROM dual;
	end if;
	end;
	/	
	
create sequence SEQ_PROMOCJE
increment by 1 start with 1
maxvalue 9999999 minvalue 1;

	create or replace trigger T_BI_PROMOCJE
	before insert on PROMOCJE
	for each row
	begin
	if :new.PROk_1_ID is NULL then
		SELECT SEQ_PROMOCJE.nextval INTO :new.PROk_1_ID FROM dual;
	end if;
	end;
	/
	
create sequence SEQ_CZESCI
increment by 1 start with 1
maxvalue 9999999 minvalue 1;

	create or replace trigger T_BI_CZESCI
	before insert on CZESCI
	for each row
	begin
	if :new.CZEk_1_ID is NULL then
		SELECT SEQ_CZESCI.nextval INTO :new.CZEk_1_ID FROM dual;
	end if;
	end;
	/
	
create sequence SEQ_DOSTAWCY
increment by 1 start with 1
maxvalue 9999999 minvalue 1;

	create or replace trigger T_BI_DOSTAWCY
	before insert on DOSTAWCY
	for each row
	begin
	if :new.DOSk_1_ID is NULL then
		SELECT SEQ_DOSTAWCY.nextval INTO :new.DOSk_1_ID FROM dual;
	end if;
	end;
	/	
	
create sequence SEQ_NAPRAWIANE_AUTA
increment by 1 start with 1
maxvalue 9999999 minvalue 1;

	create or replace trigger T_BI_NAPRAWIANE_AUTA
	before insert on NAPRAWIANE_AUTA
	for each row
	begin
	if :new.NAPk_1_ID is NULL then
		SELECT SEQ_NAPRAWIANE_AUTA.nextval INTO :new.NAPk_1_ID FROM dual;
	end if;
	end;
	/
	
create sequence SEQ_NABYWCY
increment by 1 start with 1
maxvalue 9999999 minvalue 1;

	create or replace trigger T_BI_NABYWCY
	before insert on NABYWCY
	for each row
	begin
	if :new.NABk_1_ID is NULL then
		SELECT SEQ_NABYWCY.nextval INTO :new.NABk_1_ID FROM dual;
	end if;
	end;
	/	
	
create sequence SEQ_AUTA_SPRZEDAWANE
increment by 1 start with 1
maxvalue 9999999 minvalue 1;

	create or replace trigger T_BI_AUTA_SPRZEDAWANE
	before insert on AUTA_SPRZEDAWANE
	for each row
	begin
	if :new.AUTk_1_ID is NULL then
		SELECT SEQ_AUTA_SPRZEDAWANE.nextval INTO :new.AUTk_1_ID FROM dual;
	end if;
	end;
	/	
	
create sequence SEQ_CENNIK
increment by 1 start with 1
maxvalue 9999999 minvalue 1;

	create or replace trigger T_BI_CENNIK
	before insert on CENNIK
	for each row
	begin
	if :new.CENk_1_ID is NULL then
		SELECT SEQ_CENNIK.nextval INTO :new.CENk_1_ID FROM dual;
	end if;
	end;
	/
	
create sequence SEQ_KLIENCI
increment by 1 start with 1
maxvalue 9999999 minvalue 1;

	create or replace trigger T_BI_KLIENCI
	before insert on KLIENCI
	for each row
	begin
	if :new.KLIk_1_ID is NULL then
		SELECT SEQ_KLIENCI.nextval INTO :new.KLIk_1_ID FROM dual;
	end if;
	end;
	/	
	
create sequence SEQ_PRACOWNICY
increment by 1 start with 1
maxvalue 9999999 minvalue 1;

	create or replace trigger T_BI_PRACOWNICY
	before insert on PRACOWNICY
	for each row
	begin
	if :new.PRAk_1_ID is NULL then
		SELECT SEQ_PRACOWNICY.nextval INTO :new.PRAk_1_ID FROM dual;
	end if;
	end;
	/	
	
create sequence SEQ_ADRESY
increment by 1 start with 1
maxvalue 9999999 minvalue 1;

	create or replace trigger T_BI_ADRESY
	before insert on ADRESY
	for each row
	begin
	if :new.ADRk_1_ID is NULL then
		SELECT SEQ_ADRESY.nextval INTO :new.ADRk_1_ID FROM dual;
	end if;
	end;
	/	
----------------------------
COLUMN ADRk_1_ID HEADING 'ID_ADR' FORMAT 99;
COLUMN ADR_KRAJ HEADING 'KRAJ' FORMAT A15;
COLUMN ADR_MIEJSCOWOSC heading 'MIEJSCOWOSC' FORMAT A10;
COLUMN ADR_ULICA heading 'ULICA' FORMAT A15;
COLUMN ADR_NR_DOMU heading 'NR_DOMU' FORMAT A10;
COLUMN ADR_NR_LOKUM heading 'NR_LOKUM' FORMAT A10;
COLUMN ADR_KOD_POCZTOWY heading 'KOD_POCZT' FORMAT A10;

COLUMN PRAk_1_ID HEADING 'ID_PRA' FORMAT 99;
COLUMN PRA_IMIE HEADING 'IMIE_PRA' FORMAT A10;
COLUMN PRA_NAZWISKO HEADING 'NAZWISKO_PRA' FORMAT A25;
COLUMN PRA_ADRES_EMAIL HEADING 'EMAIL_PRA' FORMAT A20;
COLUMN PRA_TELEFON1 HEADING 'TELEFON_PRA' FORMAT A10;
COLUMN PRA_PESEL HEADING 'PESEL_PRA' FORMAT A15;
COLUMN PRA_PENSJA HEADING 'PENSJA' FORMAT A10;

COLUMN KLIk_1_ID HEADING 'ID_KLI' FORMAT 99;
COLUMN KLI_IMIE HEADING 'IMIE_KLI' FORMAT A10;
COLUMN KLI_NAZWISKO HEADING 'NAZWISKO_KLI' FORMAT A25;
COLUMN KLI_ADRES_EMAIL HEADING 'EMAIL_KLI' FORMAT A20;
COLUMN KLI_TELEFON1 HEADING 'TELEFON_KLI' FORMAT 99;
COLUMN KLI_PESEL HEADING 'PESEL_KLI' FORMAT A15;
COLUMN KLI_ZLECENIE HEADING 'ZLECENIE' FORMAT A50;

-----------------------------
PROMPT----------------------------------------;
PROMPT INSERTY;
PROMPT----------------------------------------;	
INSERT INTO ADRESY
VALUES('','POLSKA','ZATOR','POLNA','2D','','32-640');
INSERT INTO ADRESY
VALUES('','POLSKA','PODOLSZE','EKOLOGICZNA','6','','32-640');
INSERT INTO ADRESY
VALUES('','POLSKA','OKLEŚNA','MŁOSZOWA','17','','32-566');
--@"D:\12K2_KStano_Bazy_Danych\baza.sql";
	
INSERT INTO ADRESY
VALUES('','POLSKA','KRAKÓW','CENTRALNA','32','2','31-581');	
INSERT INTO ADRESY
VALUES('','POLSKA','KRAKÓW','JANA PAWLA','78','G121','31-581');

INSERT INTO ADRESY
VALUES('','POLSKA','KRAKÓW','NOWOHUCKA','23','4','31-581');
INSERT INTO ADRESY
VALUES('','POLSKA','KRAKÓW','BASZTOWA','3','5','31-581');

INSERT INTO PRACOWNICY
VALUES('','JAN','KOWALSKI','jan.kowalski@wp.pl',
876321654,'81090235614','2250',5);
INSERT INTO PRACOWNICY
VALUES('','TOMASZ','BRZECZYSZCZYKIEWICZ','TB@buziaczek.pl',
123456789,'83120412345','2450',5);
INSERT INTO PRACOWNICY
VALUES('','KONRAD','STANO','ks@gmail.com',
888152152,'94020900000','2600',5);
INSERT INTO PRACOWNICY
VALUES('','SZYMON','STANO','Ss@gmail.com',
888152152,'94020900000','2300',4);
--select * from PRACOWNICY;

INSERT INTO PRACOWNICY
VALUES('','MICHAL','SZYMCZAK','MS@gmail.com',
7879342,'95020900000','2500',5);
INSERT INTO PRACOWNICY
VALUES('','PIOTR','KAWALEC','PK@gmail.com',
506231489,'76020900000','2500',4);

INSERT INTO PRACOWNICY
VALUES('','WOJTEK','REJMAN','WR@gmail.com',
658521591,'71020900000','2450',5);
INSERT INTO PRACOWNICY
VALUES('','MACIEK','PIORUN','MP@gmail.com',
357456123,'87020900000','4000',4);

--select * from PRACOWNICY;
/*
PROMPT----------------------------------------;
PROMPT KURSORY;
PROMPT----------------------------------------;	


CREATE OR REPLACE PROCEDURE KURSOR_REKDANE1
IS
CURSOR DANE_REK_KURSOR
IS
SELECT PRA_IMIE,PRA_NAZWISKO,ADR_MIEJSCOWOSC,ADR_ULICA 
FROM ADRESY, PRACOWNICY  WHERE ADRk_1_ID=ADR_ID;
TYPE RECORD1 IS RECORD(
	--PR_ID PRACOWNICY.PRAk_1_ID%TYPE,
	IMIE PRACOWNICY.PRA_IMIE%TYPE,
	NAZWISKO PRACOWNICY.PRA_NAZWISKO%TYPE,
	--ADRES_EMAIL PRACOWNICY.PRA_ADRES_EMAIL%TYPE,
	--TELEFON1 PRACOWNICY.PRA_TELEFON1%TYPE,
	--PESEL PRACOWNICY.PRA_PESEL%TYPE,
	--PENSJA	PRACOWNICY.PRA_PENSJA%TYPE,
	--ADR_ID1  PRACOWNICY.ADR_ID%TYPE,

	--AD_ID ADRESY.ADRk_1_ID%TYPE,
	--KRAJ ADRESY.ADR_KRAJ%TYPE,
	MIEJSCOWOSC ADRESY.ADR_MIEJSCOWOSC%TYPE,
	ULICA ADRESY.ADR_ULICA%TYPE
	--NR_DOMU ADRESY.ADR_NR_DOMU%TYPE,
	--NR_LOKUM ADRESY.ADR_NR_LOKUM%TYPE,
	--KOD_POCZTOWY ADRESY.ADR_KOD_POCZTOWY%TYPE
);
R RECORD1;
 
	BEGIN
	SELECT PRA_IMIE,PRA_NAZWISKO,ADR_MIEJSCOWOSC,ADR_ULICA
	INTO R
	FROM PRACOWNICY,ADRESY WHERE ADRk_1_ID=ADR_ID AND PRAk_1_ID=5; 
	OPEN DANE_REK_KURSOR;
		LOOP
		FETCH DANE_REK_KURSOR INTO R;
		EXIT WHEN DANE_REK_KURSOR%NOTFOUND OR DANE_REK_KURSOR%ROWCOUNT <1;
		DBMS_OUTPUT.PUT_LINE('IMIE: '||R.IMIE||' NAZWISKO:'
		||R.NAZWISKO||' MIEJSCOWOSC: '||R.MIEJSCOWOSC||
		' ULICA: '||R.ULICA);
		END LOOP;
	CLOSE DANE_REK_KURSOR;
END;
/

BEGIN 
KURSOR_REKDANE1();
END;
/



CREATE OR REPLACE PROCEDURE KURSOR_DANE_1
IS
/*
IMIE PRACOWNICY.PRA_IMIE%TYPE;
NAZWISKO PRACOWNICY.PRA_NAZWISKO%TYPE;
ADRES_EMAIL PRACOWNICY.PRA_ADRES_EMAIL%TYPE;
TELEFON1 PRACOWNICY.PRA_TELEFON1%TYPE;
PESEL PRACOWNICY.PRA_PESEL%TYPE;
PENSJA	PRACOWNICY.PRA_PENSJA%TYPE;
ADR_ID1  PRACOWNICY.ADR_ID%TYPE;

KRAJ ADRESY.ADR_KRAJ%TYPE;
MIEJSCOWOSC ADRESY.ADR_MIEJSCOWOSC%TYPE;
ULICA ADRESY.ADR_ULICA%TYPE;
NR_DOMU ADRESY.ADR_NR_DOMU%TYPE;
NR_LOKUM ADRESY.ADR_NR_LOKUM%TYPE;
KOD_POCZTOWY ADRESY.ADR_KOD_POCZTOWY%TYPE;
*/
/*
licznik number(2);
id number(2); 
	CURSOR DANE_KURSOR
	IS SELECT *
	/*IMIE,NAZWISKO,ADRES_EMAIL,TELEFON1,PESEL,PENSJA,ADR_ID1,
	KRAJ,MIEJSCOWOSC,ULICA,NR_DOMU,NR_LOKUM,KOD_POCZTOWY */
	/*
	FROM PRACOWNICY,ADRESY;
	BEGIN  
	licznik:=1;
	id:=licznik+7;
	OPEN DANE_KURSOR;
		LOOP
		EXIT WHEN licznik>6 or DANE_KURSOR%NOTFOUND;
		INSERT INTO ADRESY 
		VALUES ('','KRAJ'||licznik,
'miejscowosc'||licznik, 'ulica'||licznik , 
		'1'||licznik,'2'||licznik,'32-6'||licznik);
		INSERT INTO PRACOWNICY
		VALUES
('','Imie'||licznik,'Nazwisko'||licznik,'email'||licznik,
		1234543||licznik,'9402091'||licznik,'320'||licznik,id);
		licznik:=licznik+1;
		id:=id+1;
		END LOOP;
	CLOSE DANE_KURSOR;
END;
/

BEGIN 
KURSOR_DANE_1();
END;
/

select * from ADRESY;
select * from PRACOWNICY;

CREATE OR REPLACE PROCEDURE KURSOR_DANE2_2
IS 
licznik number(2);
	CURSOR DANE_KURSOR_2
	IS SELECT *
	FROM PRACOWNICY;
	BEGIN  
	licznik:=14;
	OPEN DANE_KURSOR_2;
		WHILE licznik<10;
		LOOP
		EXIT WHEN DANE_KURSOR%NOTFOUND;
		DELETE FROM PRACOWNICY WHERE PRAk_1_ID=licznik;
		licznik:=licznik-1;
		END LOOP;
	CLOSE DANE_KURSOR2_2;
END;
/

BEGIN 
KURSOR_DANE_2();
END;
/

select * from PRACOWNICY;


CREATE OR REPLACE PROCEDURE KURSOR_UPDANE_1
(
ID ADRESY.ADRk_1_ID%TYPE,
KRAJ ADRESY.ADR_KRAJ%TYPE,
MIEJSCOWOSC ADRESY.ADR_MIEJSCOWOSC%TYPE,
ULICA ADRESY.ADR_ULICA%TYPE,
NR_DOMU ADRESY.ADR_NR_DOMU%TYPE,
NR_LOKUM ADRESY.ADR_NR_LOKUM%TYPE,
KOD_POCZTOWY ADRESY.ADR_KOD_POCZTOWY%TYPE
)
IS
BEGIN  
	UPDATE ADRESY SET ADR_KRAJ=KRAJ,ADR_MIEJSCOWOSC=MIEJSCOWOSC,
	ADR_ULICA=ULICA,ADR_NR_DOMU=NR_DOMU,ADR_NR_LOKUM=NR_LOKUM,
	ADR_KOD_POCZTOWY=KOD_POCZTOWY WHERE ADRk_1_ID=ID;
	--
	IF SQL%NOTFOUND THEN
	INSERT INTO ADRESY VALUES('',KRAJ,MIEJSCOWOSC,ULICA,NR_DOMU,
	NR_LOKUM,KOD_POCZTOWY);
	END IF;
END;
/

BEGIN 
KURSOR_UPDANE_1(3,'POLSKA','PODOLSZE','STAROWIEJSKA','204','','32-640');
END;
/
*/


/*
PROMPT----------------------------------------;
PROMPT INDEKSY;
PROMPT----------------------------------------;	
create index IX_ADRESY_KRAJ on ADRESY (ADR_KRAJ) STORAGE (INITIAL 150k
NEXT 150k)
tablespace STUDENT_INDEX;

create index IX_ADRESY_KRAJ_MIASTO on ADRESY (ADR_KRAJ, ADR_MIEJSCOWOSC)
STORAGE (INITIAL 150k
NEXT 150k)
tablespace STUDENT_INDEX;

CREATE or REPLACE PROCEDURE DOSTAWCY_INSERT(ile IN number)
IS
	licznik NUMBER(2);
BEGIN
	licznik := 1;
	WHILE licznik < ile+10
	LOOP
		INSERT INTO DOSTAWCY
		VALUES
('','DOS_NAZWA'||licznik,'DOS_TELEFON'||licznik,
		'DOS_EMAIL'||licznik,5);
		
		licznik := licznik+1;
	END LOOP;
END;
/

BEGIN
	DOSTAWCY_INSERT(10);
END;
/

CREATE or REPLACE PROCEDURE INSERT_PRACOWNIK(Imie IN VARCHAR2,
Nazwisko IN VARCHAR2,Email IN VARCHAR2,tel IN number,Pesel IN VARCHAR2,
pensja IN VARCHAR2,kraj IN VARCHAR2,miejscowosc IN VARCHAR2,
ulica IN VARCHAR2,nr_domu IN VARCHAR2,nr_lokal IN VARCHAR2,kodpocz IN
VARCHAR2)
IS
	mie_id_curr ADRESY.ADRk_1_ID%TYPE;
BEGIN
	INSERT INTO ADRESY VALUES ('',kraj,miejscowosc,ulica,nr_domu,
	nr_lokal,kodpocz);
	--
	select SEQ_ADRESY.currval into mie_id_curr from dual;
	--
	INSERT INTO PRACOWNICY VALUES ('',Imie,
Nazwisko,Email,tel,Pesel,
	pensja,mie_id_curr);
END;
/
BEGIN
	INSERT_PRACOWNIK('jan','nowak','a@a.pl',12345,'9876654','12345',
	'polsza','rowy','blotna','12','123','32=123');
END;
/
select * from PRACOWNICY, ADRESY where ADRk_1_ID=ADR_ID;

CREATE or REPLACE PROCEDURE PLSQL_uTime2
IS
-- deklaracja zmiennej
baza_dt VARCHAR2(40);
-- anchor
mc baza_dt%TYPE;
tt baza_dt%TYPE;
BEGIN
mc := to_char(sysdate, 'Day');
tt := to_char(sysdate, 'HH24:MI:SS');
--
DBMS_OUTPUT.PUT_LINE('Własnie mamy: '|| mc);
DBMS_OUTPUT.PUT_LINE('Godzina: '|| tt);
END;
/
BEGIN
PLSQL_uTime2();
END;
/


CREATE or REPLACE FUNCTION f_mc_tt
(dformat IN varchar2, gformat IN varchar2)
RETURN VARCHAR2
IS
BEGIN
RETURN 'Własnie mamy: '|| to_char(sysdate, dformat) ||
' Godzina: '|| to_char(sysdate, gformat);
END;
/
BEGIN
DBMS_OUTPUT.PUT_LINE(f_mc_tt('Day','HH24:MI:SS'));
END;
/
BEGIN
DBMS_OUTPUT.PUT_LINE(f_mc_tt('YYYY','HH24:MI:SS'));
END;
*/


/*
create table STAZE
(
	ID_STAZ NUMBER(8) NULL,
	PENSJA_MIN NUMBER(8) NULL,
	PENSJA_MAX NUMBER(8) NULL,
	GRUPA VARCHAR(20)
);

INSERT INTO STAZE VALUES(1,1800,2299,'ZOLTODZIOB');
INSERT INTO STAZE VALUES(2,2299,2499,'PRZECIETNY');
INSERT INTO STAZE VALUES(3,2499,3000,'DOSWIADCZONY');
*/
/*
PROMPT----------------------------------------;
PROMPT SELECTY;
PROMPT----------------------------------------;	

SELECT * FROM ADRESY;
PROMPT----------------------------------------;	
SELECT * FROM PRACOWNICY;
PROMPT----------------------------------------;	
SELECT PRAk_1_ID, PRA_IMIE, PRA_NAZWISKO, PRA_ADRES_EMAIL, 
		PRA_TELEFON1, PRA_PENSJA, PRA_PESEL, ADR_KRAJ, ADR_MIEJSCOWOSC,
		ADR_ULICA, ADR_NR_DOMU, ADR_NR_LOKUM, ADR_KOD_POCZTOWY
	FROM PRACOWNICY, ADRESY WHERE ADR_ID=ADRk_1_ID;
PROMPT----------------------------------------;	
SELECT PRAk_1_ID, PRA_IMIE, PRA_NAZWISKO, PRA_ADRES_EMAIL, 
		PRA_TELEFON1, ADR_MIEJSCOWOSC,
		ADR_ULICA, ADR_NR_DOMU, ADR_KOD_POCZTOWY
	FROM PRACOWNICY, ADRESY WHERE ADR_ID=ADRk_1_ID AND PRAk_1_ID=3;
PROMPT----------------------------------------;	
SELECT * FROM ADRESY, PRACOWNICY WHERE ADRk_1_ID=ADR_ID IN (1,3,6);
PROMPT----------------------------------------;	

	
PROMPT----------------------------------------;
PROMPT PERSPEKTYWY;
PROMPT----------------------------------------;		
create or replace view U_pierwsza_perspect
(ID, Imie, Nazwisko, Pensja, Miejscowosc, Ulica, Nr_domu)
as
select PRAk_1_ID, PRA_IMIE, PRA_NAZWISKO, PRA_PENSJA,
	   ADR_MIEJSCOWOSC, ADR_ULICA, ADR_NR_DOMU
	   FROM PRACOWNICY, ADRESY
	   WHERE ADR_ID=ADRk_1_ID AND PRA_PENSJA>2300;

SELECT * FROM U_pierwsza_perspect;
	
	
PROMPT----------------------------------------;
PROMPT ZLACZENIA NIEROWNOSCIOWE, ZEWNETRZNE I PODZAPYTANIA;
PROMPT----------------------------------------;	

SELECT PRAk_1_ID, PRA_IMIE, PRA_NAZWISKO, PRA_PENSJA, ID_STAZ, GRUPA
FROM PRACOWNICY, STAZE
WHERE PRA_PENSJA BETWEEN PENSJA_MIN AND PENSJA_MAX
ORDER BY PRA_PENSJA;
PROMPT----------------------------------------;	
SELECT PRAk_1_ID, PRA_IMIE, PRA_NAZWISKO, PRA_PENSJA, ID_STAZ, GRUPA
FROM PRACOWNICY, STAZE
WHERE PRA_PENSJA BETWEEN PENSJA_MIN(+) AND PENSJA_MAX(+)
ORDER BY PRA_PENSJA;



PROMPT----------------------------------------;
PROMPT FUNKCJE GRUPUJĄCE I OPERATORY ZBIOROWE;
PROMPT----------------------------------------;	
SELECT PRAk_1_ID, MAX(PRA_PENSJA) FROM ADRESY;

SELECT PRAk_1_ID, PRA_IMIE, PRA_NAZWISKO, PRA_PENSJA
FROM PRACOWNICY WHERE PRA_PENSJA
BETWEEN 2300 AND 2460;
UNION
SELECT PRAk_1_ID, PRA_IMIE, PRA_NAZWISKO, PRA_PENSJA
FROM PRACOWNICY WHERE PRA_PENSJA
BETWEEN 2400 AND 2700;

PROMPT----------------------------------------;

SELECT PRAk_1_ID, PRA_IMIE, PRA_NAZWISKO, PRA_PENSJA
FROM PRACOWNICY WHERE PRA_PENSJA
BETWEEN 2300 AND 2460;
INTERSECT
SELECT PRAk_1_ID, PRA_IMIE, PRA_NAZWISKO, PRA_PENSJA
FROM PRACOWNICY WHERE PRA_PENSJA
BETWEEN 2400 AND 2700;

-----------------------------------------------
*/

--
PROMPT ;
PROMPT END of SCRIPT;
--
commit;
----@"D:\12K2_KStano_Bazy_Danych\baza_danych_komis_warsztat.sql";