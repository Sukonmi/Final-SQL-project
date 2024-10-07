-- Creating tables.
CREATE TABLE CATEGORIES (
    CATEGORY_CODE INT PRIMARY KEY,
    CATEGORY_NAME VARCHAR(100) NOT NULL,
    DESCRIPTION VARCHAR(100)
);

CREATE TABLE CUSTOMERS(
    CUSTOMER_CODE VARCHAR(10) PRIMARY KEY,
    COMPANY VARCHAR(100) NOT NULL,
    ADDRESS VARCHAR(255),
    CITY VARCHAR(100),
    POSTAL_CODE VARCHAR(10),  
    COUNTRY VARCHAR(30),
    PHONE VARCHAR(30),        
    FAX VARCHAR(30)          
);

CREATE TABLE EMPLOYEES (
    EMPLOYEE_NUMBER INT PRIMARY KEY,
    REPORTS_TO INT,              
    LAST_NAME VARCHAR(100) NOT NULL,
    FIRST_NAME VARCHAR(100) NOT NULL,
    POSITION VARCHAR(50),
    TITLE VARCHAR(10),
    BIRTH_DATE DATE,
    HIRE_DATE DATE,
    SALARY NUMERIC(15, 2),       
    COMMISSION NUMERIC(10, 2)
);

CREATE TABLE ORDERS (
    ORDER_NUMBER NUMERIC(10) PRIMARY KEY,
    CUSTOMER_CODE VARCHAR(10),
    EMPLOYEE_NUMBER INT,
    ORDER_DATE DATE NOT NULL,
    SHIP_DATE DATE,
    SHIPPING_COST NUMERIC(10, 2),
    FOREIGN KEY (CUSTOMER_CODE) REFERENCES CUSTOMERS(CUSTOMER_CODE) ON DELETE CASCADE,
    FOREIGN KEY (EMPLOYEE_NUMBER) REFERENCES EMPLOYEES(EMPLOYEE_NUMBER) ON DELETE CASCADE
);


CREATE TABLE ORDER_DETAILS (
    ORDER_NUMBER NUMERIC(10),
    PRODUCT_REF NUMERIC(10),
    UNIT_PRICE NUMERIC(10, 2),
    QUANTITY NUMERIC,        
    DISCOUNT FLOAT,
    PRIMARY KEY (ORDER_NUMBER, PRODUCT_REF),
    FOREIGN KEY (ORDER_NUMBER) REFERENCES ORDERS(ORDER_NUMBER) ON DELETE CASCADE,
    FOREIGN KEY (PRODUCT_REF) REFERENCES PRODUCTS(PRODUCT_REF) ON DELETE CASCADE
);



CREATE TABLE SUPPLIERS (
    SUPPLIER_NUMBER NUMERIC((6)) PRIMARY KEY,
    COMPANY VARCHAR(50) NOT NULL,
    ADDRESS VARCHAR(100),
    CITY VARCHAR(50),
    POSTAL_CODE VARCHAR(30),
    COUNTRY VARCHAR(50),
    PHONE VARCHAR(50),
    FAX VARCHAR(50)
);


CREATE TABLE PRODUCTS (
    PRODUCT_REF NUMERIC(10) PRIMARY KEY,
    PRODUCT_NAME VARCHAR(50) NOT NULL,
    SUPPLIER_NUMBER NUMERIC,
    CATEGORY_CODE INT,
    QUANTITY VARCHAR(50),
    UNIT_PRICE NUMERIC(10, 2),
    UNITS_IN_STOCK NUMERIC(10, 0),
    UNITS_ON_ORDER NUMERIC(10, 0),
    UNAVAILABLE INT,
    FOREIGN KEY (SUPPLIER_NUMBER) REFERENCES SUPPLIERS(SUPPLIER_NUMBER),
    FOREIGN KEY (CATEGORY_CODE) REFERENCES CATEGORIES(CATEGORY_CODE)
);

-- Insertion of Values.
INSERT INTO employees
VALUES 
(1, 2, 'Davolio', 'Nancy', 'Sales Representative', 'Miss', '2068/12/08', '1992/05/01', 3135.00, 1500.00),
(2, 2, 'Fuller', 'Andrew', 'Vice President', 'Dr.', '2052/02/19', '1992/08/14', 10000.00, NULL),
(3, 2, 'Leverling', 'Janet', 'Sales Representative', 'Miss', '2063/08/30', '1992/04/01', 3500.00, 1000.00),
(4, 2, 'Peacock', 'Margaret', 'Sales Representative', 'Mrs.', '2058/09/19', '1993/05/03', 2856.00, 250.00),
(5, 2, 'Buchanan', 'Steven', 'Sales Manager', 'Mr.', '2055/03/04', '1993/10/17', 8000.00, NULL),
(6, 5, 'Suyama', 'Michael', 'Sales Representative', 'Mr.', '2063/07/02', '1993/10/17', 2534.00, 600.00),
(7, NULL, 'King', 'Robert', 'Sales Representative', 'Mr.', '2060/05/29', '1994/01/02', 2356.00, 800.00),
(8, 2, 'Callahan', 'Laura', 'Sales Assistant', 'Miss', '2058/01/09', '1994/03/05', 2000.00, NULL),
(9, 5, 'Dodsworth', 'Anne', 'Sales Representative', 'Miss', '2069/07/02', '1994/11/15', 2180.00, 0.00);


INSERT INTO categories 
VALUES 
(1, 'Beverages', 'Beverages, coffees and teas'),
(2, 'Condiments', 'Sauces, seasonings, and spices'),
(3, 'Desserts', 'Desserts and sweets'),
(4, 'Dairy Products', 'Cheeses'),
(5, 'Pasta and Cereals', 'Breads, biscuits, pasta, and cereals'),
(6, 'Meats', 'Prepared meats'),
(7, 'Dry Products', 'Dried fruits, raisins, others'),
(8, 'Fish and Seafood', 'Fish, seafood, and snails'),
(9, 'Computer Equipment', 'Laptops, keyboards, and mouse');



INSERT INTO customers
VALUES 
('ALFKI','Alfreds Futterkiste','Obere Str. 57','Berlin','12209','Allemagne','030-0074321','030-0076545'),
('ANATR','Ana Trujillo Emparedados y helados','Avda. de la Constitución 2222','México D.F.','05021','Mexique','(5) 555-4729','(5) 555-3745'),
('ANTON','Antonio Moreno Taquería','Mataderos  2312','México D.F.','05023','Mexique','(5) 555-3932', NULL),
('AROUT','Around the Horn','120 Hanover Sq.','London','WA1 4SD','Royaume-Uni','(71) 555-7788','(71) 555-6750'),
('BERGS','Berglunds snabbköp','Berguvsvägen  8','Luleå','S-958 22','Suède','0921-12 34 65','0921-12 34 67'),
('BLAUS','BlauerSeeDelikatessen','Forsterstr. 57','Mannheim','68306','Allemagne','0621-08460','0621-08924'),
('BLONP','Blondel père et fils','24, place Kléber','Strasbourg','67000','France','03.88.60.15.31','03.88.60.15.32'),
('BOLID','Bólido Comidas preparadas','Araquil, 67','Madrid','28023','Espagne','(91) 555 22 82','(91) 555 91 99'),
('BONAP','Bon app','12, rue des Bouchers','Marseille','13008','France','04.91.24.45.40','04.91.24.45.41'),
('BOTTM','Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','T2F 8M4','Canada','(604) 555-4729','(604) 555-3745'),
('BSBEV','B''s Beverages','Fauntleroy Circus','London','EC2 4SD','Royaume-Uni','(71) 555-1212', NULL),
('CACTU','Cactus Comidas para llevar','Cerrito 333','Buenos Aires','1010','Argentine','(1) 135-5555','(1) 135-4892'),
('CENTC','Centro comercial Moctezuma','Sierras de Granada 9993','México D.F.','05022','Mexique','(5) 555-3392','(5) 555-7293'),
('CHOPS','Chop-suey Chinese','Hauptstr. 29','Bern','3012','Suisse','0452-076545', NULL),
('COMMI','Comércio Mineiro','Av. dos Lusíadas, 23','São Paulo','05432-043','Brésil','(11) 555-7647', NULL),
('CONSH','Consolidated Holdings','Berkeley Gardens12  Brewery ','London','WX1 4SD','Royaume-Uni','(71) 555-2282','(71) 555-9199'),
('DRACD','Drachenblut Delikatessen','Walserweg 21','Aachen','52066','Allemagne','0241-039123','0241-059428'),
('DUMON','Du monde entier','67, rue des Cinquante Otages','Nantes','44000','France','02.40.67.88.88','02.40.67.89.89'),
('EASTC','Eastern Connection','35 King George','London','WX3 6FW','Royaume-Uni','(71) 555-0297','(71) 555-3373'),
('ERNSH','Ernst Handel','Kirchgasse 6','Graz','8010','Autriche','7675-3425','7675-3426'),
('FAMIA','Familia Arquibaldo','Rua Orós, 92','São Paulo','05442-030','Brésil','(11) 555-9857', NULL),
('FISSA','FISSA Fabrica Inter. Salchichas S.A.','Moralzarzal, 86','Madrid','28034','Espagne','(91) 555 94 44','(91) 555 55 93'),
('FOLIG','Folies gourmandes','184, chaussée de Tournai','Lille','59000','France','03.20.16.10.16','03.20.16.10.17'),
('FOLKO','Folk och fä HB','Åkergatan 24','Bräcke','S-844 67','Suède','0695-34 67 21', NULL),
('FRANK','Frankenversand','Berliner Platz 43','München','80805','Allemagne','089-0877310','089-0877451'),
('FRANR','France restauration','54, rue Royale','Nantes','44000','France','02.40.32.21.21','02.40.32.21.20'),
('FRANS','Franchi S.p.A.','Via Monte Bianco 34','Torino','10100','Italie','011-4988260','011-4988261'),
('FURIB','Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa','1675','Portugal','(1) 354-2534','(1) 354-2535'),
('GALED','Galería del gastrónomo','Rambla de Cataluña, 23','Barcelona','08022','Espagne','(93) 203 4560','(93) 203 4561'),
('GODOS','Godos Cocina Típica','Romero, 33','Sevilla','41101','Espagne','(95) 555 82 82', NULL),
('GOURL','Gourmet Lanchonetes','Av. Brasil, 442','Campinas','04876-786','Brésil','(11) 555-9482', NULL),
('GREAL','Great Lakes Food Market','2732 Baker Blvd.','Eugene','97403','États-Unis','(503) 555-7555', NULL),
('GROSR','GROSELLA-Restaurante','5ª Ave. Los Palos Grandes','Caracas','1081','Venezuela','(2) 283-2951','(2) 283-3397'),
('HANAR','Hanari Carnes','Rua do Paço, 67','Rio de Janeiro','05454-876','Brésil','(21) 555-0091','(21) 555-8765'),
('HILAA','HILARIÓN-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristóbal','5022','Venezuela','(5) 555-1340','(5) 555-1948'),
('HUNGC','Hungry Coyote Import Store','City Center Plaza516 Main St.','Elgin','97827','États-Unis','(503) 555-6874','(503) 555-2376'),
('HUNGO','Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','2506','Irlande','2967 542','2967 3333'),
('ISLAT','Island Trading','Garden HouseCrowther Way','Cowes','PO31 7PJ','Royaume-Uni','(198) 555-8888', NULL),
('KOENE','Königlich Essen','Maubelstr. 90','Brandenburg','14776','Allemagne','0555-09876', NULL),
('LACOR','La corne d. abondance','67, avenue de l. Europe','Versailles','78000','France','01.30.59.84.10','01.30.59.85.11'),
('LAMAI','La maison d''Asie','1 rue Alsace-Lorraine','Toulouse','31000','France','05.61.77.61.10','05.61.77.61.11'),
('LAUGB','Laughing Bacchus Wine Cellars','1900 Oak St.','Vancouver','V3F 2K1','Canada','(604) 555-3392','(604) 555-7293'),
('LAZYK','Lazy K Kountry Store','12 Orchestra Terrace','Walla Walla','99362','États-Unis','(509) 555-7969','(509) 555-6221'),
('LEHMS','Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M. ','60528','Allemagne','069-0245984','069-0245874'),
('LETSS','Let''s Stop N Shop','87 Polk St.Suite 5','San Francisco','94117','États-Unis','(415) 555-5938', NULL),
('LILAS','LILA-Supermercado','Carrera 52 con Ave. Bolívar #65-98 Llano Largo','Barquisimeto','3508','Venezuela','(9) 331-6954','(9) 331-7256'),
('LINOD','LINO-Delicateses','Ave. 5 de Mayo Porlamar','I. de Margarita','4980','Venezuela','(8) 34-56-12','(8) 34-93-93'),
('LONEP','Lonesome Pine Restaurant','89 Chiaroscuro Rd.','Portland','97219','États-Unis','(503) 555-9573','(503) 555-9646'),
('MAGAA','Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo','24100','Italie','035-640230','035-640231'),
('MAISD','Maison Dewey','Rue Joseph-Bens 532','Bruxelles','B-1180','Belgique','(02) 201 24 67','(02) 201 24 68'),
('MEREP','Mère Paillarde','43 rue St. Laurent','Montréal','H1J 1C3','Canada','(514) 555-8054','(514) 555-8055'),
('MORGK','Morgenstern Gesundkost','Heerstr. 22','Leipzig','04179','Allemagne','0342-023176', NULL),
('NORTS','North/South','South House300 Queensbridge','London','SW7 1RZ','Royaume-Uni','(71) 555-7733','(71) 555-2530'),
('OCEAN','Océano Atlántico Ltda.','Ing. Gustavo Moncada 8585Piso 20-A','Buenos Aires','1010','Argentine','(1) 135-5333','(1) 135-5535'),
('OLDWO','Old World Delicatessen','2743 Bering St.','Anchorage','99508','États-Unis','(907) 555-7584','(907) 555-2880'),
('OTTIK','Ottilies Käseladen','Mehrheimerstr. 369','Köln','50739','Allemagne','0221-0644327','0221-0765721'),
('PARIS','Paris spécialités','265, boulevard Charonne','Paris','75012','France','01.42.34.22.66','01.42.34.22.77'),
('PERIC','Pericles Comidas clásicas','Calle Dr. Jorge Cash 321','México D.F.','05033','Mexique','(5) 552-3745','(5) 545-3745'),
('PICCO','Piccolo und mehr','Geislweg 14','Salzburg','5020','Autriche','6562-9722','6562-9723'),
('PRINI','Princesa Isabel Vinhos','Estrada da saúde n. 58','Lisboa','1756','Portugal','(1) 356-5634', NULL),
('QUEDE','Que Delícia','Rua da Panificadora, 12','Rio de Janeiro','02389-673','Brésil','(21) 555-4252','(21) 555-4545'),
('QUEEN','Queen Cozinha','Alameda dos Canàrios, 891','São Paulo','05487-020','Brésil','(11) 555-1189', NULL),
('QUICK','QUICK-Stop','Taucherstraße 10','Cunewalde','01307','Allemagne','0372-035188', NULL),
('RANCH','Rancho grande','Av. del Libertador 900','Buenos Aires','1010','Argentine','(1) 123-5555','(1) 123-5556'),
('RATTC','Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','87110','États-Unis','(505) 555-5939','(505) 555-3620'),
('REGGC','Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia','42100','Italie','0522-556721','0522-556722'),
('RICAR','Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','02389-890','Brésil','(21) 555-3412', NULL),
('RICSU','Richter Supermarkt','Grenzacherweg 237','Genève','1203','Suisse','0897-034214', NULL),
('ROMEY','Romero y tomillo','Gran Vía, 1','Madrid','28001','Espagne','(91) 745 6200','(91) 745 6210'),
('SANTG','Santé Gourmet','Erling Skakkes gate 78','Stavern','4110','Norvège','07-98 92 35','07-98 92 47'),
('SAVEA','Save-a-lot Markets','187 Suffolk Ln.','Boise','83720','États-Unis','(208) 555-8097', NULL),
('SEVES','Seven Seas Imports','90 Wadhurst Rd.','London','OX15 4NB','Royaume-Uni','(71) 555-1717','(71) 555-5646' ),
('SIMOB','Simons bistro','Vinbæltet 34','København','1734','Danemark','31 12 34 56','31 13 35 57'),
('SPECD','Spécialités du monde','25, rue Lauriston','Paris','75016','France','01.47.55.60.10','01.47.55.60.20'),
('SPLIR','Split Rail Beer  Ale','P.O. Box 555','Lander','82520','États-Unis','(307) 555-4680','(307) 555-6525'),
('SUPRD','Suprêmes délices','Boulevard Tirou, 255','Charleroi','B-6000','Belgique','(071) 23 67 22 20','(071) 23 67 22 21'),
('THEBI','The Big Cheese','89 Jefferson WaySuite 2','Portland','97201','États-Unis','(503) 555-3612', NULL),
('THECR','The Cracker Box','55 Grizzly Peak Rd.','Butte','59801','États-Unis','(406) 555-5834','(406) 555-8083'),
('TOMSP','Toms Spezialitäten','Luisenstr. 48','Münster','44087','Allemagne','0251-031259','0251-035695'),
('TORTU','Tortuga Restaurante','Avda. Azteca 123','México D.F.','05033','Mexique','(5) 555-2933', NULL),
( 'TRADH','Tradição Hipermercados','Av. Inês de Castro, 414','São Paulo','05634-030','Brésil','(11) 555-2167','(11) 555-2168' ),
( 'TRAIH','Trail''s Head Gourmet Provisioners','722 DaVinci Blvd.','Kirkland','98034','États-Unis','(206) 555-8257','(206) 555-2174' ),
( 'VAFFE','Vaffeljernet','Smagsløget 45','Århus','8200','Danemark','86 21 32 43','86 22 33 44' ),
( 'VICTE','Victuailles en stock','2, rue du Commerce','Lyon','69004','France','04.78.32.54.86','04.78.32.54.87' ),
( 'VINET','Vinis et Chevalier','59 rue de l''Abbaye','Reims','51100','France','03.26.47.15.10','03.26.47.15.11' ),
( 'WANDK','Die Wandernde Kuh','Adenauerallee 900','Stuttgart','70563','Allemagne','0711-020361','0711-035428' ),
( 'WARTH','Wartian Herkku','Torikatu 38','Oulu','90110','Finlande','981-443655','981-443655' ),
( 'WELLI','Wellington Importadora','Rua do Mercado, 12','Resende','08737-363','Brésil','(14) 555-8122', NULL ),
( 'WHITC','White Clover Markets','305 - 14th Ave. S.Suite 3B','Seattle','98128','États-Unis','(206) 555-4112','(206) 555-4115' ),
( 'WILMK','Wilman Kala','Keskuskatu 45','Helsinki','21240','Finlande','90-224 8858','90-224 8858' ),
( 'WOLZA','Wolski  Zajazd','ul. Filtrowa 68','Warszawa','01-012','Pologne','(26) 642-7012','(26) 642-7012' ),
( 'MONP','MONOPRIX - SFAX EL AIN','Route d''El Ain Km 1,5 3000 Sfax ','Safx','1003','Tunisie','(26) 642-7012','(26) 642-7012' );




INSERT INTO SUPPLIERS 
VALUES 
(1, 'Exotic Liquids', '49 Gilbert St.', 'London', 'EC1 4SD', 'Royaume-Uni', '(171) 555-2222', ''),
(2, 'Nouvelle-Orléans Cajun Delights', 'P.O. Box 78934', 'Nouvelle-Orléans', '70117', 'Etats-Unis', '(100) 555-4822', ''),
(3, 'Grandma Kelly''s Homestead', '707 Oxford Rd.', 'Ann Arbor', '48104', 'Etats-Unis', '(313) 555-5735', '(313) 555-3349'),
(4, 'Tokyo Traders', '9-8 SekimaiMusashino-shi', 'Tokyo', '100', 'Japon', '(03) 3555-5011', ''),
(5, 'Cooperativa de Quesos ''Las Cabras''', 'Calle del Rosal 4', 'Oviedo', '33007', 'Espagne', '(98) 598 76 54', ''),
(6, 'Mayumi''s', '92 SetsukoChuo-ku', 'Osaka', '545', 'Japon', '(06) 431-7877', ''),
(7, 'Pavlova, Ltd.', '74 Rose St.Moonie Ponds', 'Melbourne', '3058', 'Australie', '(059) 55-5450', '(03) 444-6588'),
(8, 'Specialty Biscuits, Ltd.', '29 King''s Way', 'Manchester', 'M14 GSD', 'Royaume-Uni', '(161) 555-4448', ''),
(9, 'PB Knäckebröd AB', 'Kaloadagatan 13', 'Göteborg', 'S-345 67', 'Suède', '031-987 65 43', '031-987 65 91'),
(10, 'Refrescos Americanas LTDA', 'Av. das Americanas 12.890', 'São Paulo', '5442', 'Brésil', '(11) 555 4640', ''),
(11, 'Heli Süßwaren GmbH Co. KG', 'Tiergartenstraße 5', 'Berlin', '10785', 'Allemagne', '(010) 9984510', ''),
(12, 'Plutzer Lebensmittelgroßmärkte AG', 'Bogenallee 51', 'Frankfurt', '60439', 'Allemagne', '(069) 992755', ''),
(13, 'Nord-Ost-Fisch Handelsgesellschaft mbH', 'Frahmredder 112a', 'Cuxhaven', '27478', 'Allemagne', '(04721) 8713', '(04721) 8714'),
(14, 'Formaggi Fortini s.r.l.', 'Viale Dante, 75', 'Ravenna', '48100', 'Italie', '(0544) 60323', '(0544) 60603'),
(15, 'Norske Meierier', 'Hatlevegen 5', 'Sandvika', '1320', 'Norvège', '(0)2-953010', ''),
(16, 'Bigfoot Breweries', '3400 - 8th AvenueSuite 210', 'Bend', '97101', 'Etats-Unis', '(503) 555-9931', ''),
(17, 'Svensk Sjöföda AB', 'Brovallavägen 231', 'Stockholm', 'S-123 45', 'Suède', '08-123 45 67', ''),
(18, 'Aux joyeux ecclésiastiques', '203, Rue des Francs-Bourgeois', 'Paris', '75004', 'France', '01.03.83.00.68', '01.03.83.00.62'),
(19, 'New England Seafood Cannery', 'Order Processing Dept.2100 Paul Revere Blvd.', 'Boston', '02134', 'Etats-Unis', '(617) 555-3267', '(617) 555-3389'),
(20, 'Leka Trading', '471 Serangoon Loop, Suite #402', 'Singapore', '0512', 'Singapour', '555-8787', ''),
(21, 'Lyngbysild', 'LyngbysildFiskebakken 10', 'Lyngby', '2800', 'Danemark', '43844108', '43844115'),
(22, 'Zaanse Snoepfabriek', 'VerkoopRijnweg 22', 'Zaandam', '9999 ZZ', 'Pays-Bas', '(12345)1212', '(12345) 1210'),
(23, 'Karkki Oy', 'Valtakatu 12', 'Lappeenranta', '53120', 'Finlande', '(953) 10956', ''),
(24, 'G''day, Mate', '170 Prince Edward ParadeHunter''s Hill', 'Sydney', '2042', 'Australie', '(02) 555-4873', '(02) 555-4873'),
(25, 'Ma Maison', '2960 Rue St. Laurent', 'Montréal', 'H1J 1C3', 'Canada', '(514) 555-9022', ''),
(26, 'Pasta Buttini s.r.l.', 'Via dei Gelsomini, 153', 'Salerno', '84100', 'Italie', '(089) 6547665', '(089) 6547667'),
(27, 'Escargots Nouveaux', '22, rue H. Voiron', 'Montceau', '71300', 'France', '04.85.57.00.07', ''),
(28, 'Gai pâturage', 'Bat. B3, rue des Alpes', 'Annecy', '74000', 'France', '04.38.76.98.06', '04.38.76.98.58'),
(29, 'Forêts d''érables', '148 rue Chasseur', 'Ste-Hyacinthe', 'J2S 7S8', 'Canada', '(514) 555-2955', '(514) 555-2921'),
(30, 'Lenovo', '149 rue Chasseur', 'Ste-Hyacinthe', 'J2S 7S8', 'Canada', '(514) 555-2956', '(514) 555-2922'),
(31, 'Asus', '150 rue Chasseur', 'Ste-Hyacinthe', 'J2S 7S8', 'Canada', '(514) 555-2957', '(514) 555-2923');


INSERT INTO PRODUCTS 
VALUES 
(1, 'Chai', 1, 1, '10 boxes x 20 bags', 90.00, 39, 0, 0),
(2, 'Chang', 1, 1, '24 bottles (1 liter)', 95.00, 17, 40, 0),
(3, 'Aniseed Syrup', 1, 2, '12 bottles (550 ml)', 50.00, 13, 70, 0),
(4, 'Chef Anton''s Cajun Seasoning', 2, 2, '48 jars (6 ounces)', 110.00, 53, 0, 0),
(6, 'Grandma''s Boysenberry Spread', 3, 2, '12 jars (8 ounces)', 125.00, 120, 0, 0),
(7, 'Uncle Bob''s Organic Dried Pears', 3, 7, '12 cartons (1 kg)', 150.00, 15, 0, 0),
(8, 'Northwoods Cranberry Sauce', 3, 2, '12 jars (12 ounces)', 200.00, 6, 0, 0),
(9, 'Mishi Kobe Niku', 4, 6, '18 cartons (500 g)', 485.00, 29, 0, -1),
(10, 'Ikura', 4, 8, '12 jars (200 g)', 155.00, 31, 0, 0),
(11, 'Queso Cabrales', 5, 4, '1 carton (1 kg)', 105.00, 22, 30, 0),
(12, 'Queso Manchego La Pastora', 5, 4, '10 cartons (500 g)', 190.00, 86, 0, 0),
(13, 'Konbu', 6, 8, '1 box (2 kg)', 30.00, 24, 0, 0),
(16, 'Chef Ayomide''s pepper chicken', 9, 9, '60 cartons (40kg)', 225.00, 250, 0, 0),
(17, 'Alice Mutton', 7, 6, '20 boxes (1 kg)', 195.00, 0, 0, -1),
(18, 'Tasty Turkey', 2, 4, '10 oxws x 5 bags', 100.00, 100, 0, 0),
(19, 'Teatime Chocolate Biscuits', 8, 3, '10 boxes x 12 pieces', 46.00, 25, 0, 0),
(20, 'Sir Rodney''s Marmalade', 8, 3, '30 jars', 405.00, 40, 0, 0),
(21, 'Sir Rodney''s Scones', 8, 3, '24 cartons x 4 pieces', 50.00, 3, 40, 0),
(22, 'Gustaf''s Knäckebröd', 9, 5, '24 cartons (500 g)', 105.00, 104, 0, 0),
(23, 'Tunnbröd', 9, 5, '12 cartons (250 g)', 45.00, 61, 0, 0),
(24, 'Puff Puff', 1, 1, '5 boxes x 10 bags', 50.00, 24, 5, 0),
(25, 'NuNuCa Nuß-Nougat-Creme', 11, 3, '20 jars (450 g)', 70.00, 76, 0, 0),
(26, 'Yagi Pepper', 2, 1, '5 boxes x 10 bags', 50.00, 34, 0, 0)
(27, 'Nana Yoghurt', 2, 3, '50 bottles', 30.00, 26, 10, 0),
(29, 'Fura de Nunu', 2, 1, '100 bottles', 50.00, 24, 5, 0),
(30, 'Meatpie', 4, 1, '5 boxes x 2 bags', 20.00, 14, 0, 0),
(33, 'Mama put', 1, 5, '5 boxes x 10 bags', 50.00, 44, 2, 0),
(38, 'The Place', 16, 8, '5 bottles', 20.00, 240, 3, 0),
(41, 'The Palms', 17, 8, '5o jars (510g)', 150.00, 204, 0, 0),
(44, 'Amino Kano Mall', 19, 8, '50 cans (40 ounces)', 200.00, 224, 0, 0),
(45, 'Delizz Supermarket', 1, 1, '5 boxes x 10 bags', 50.00, 24, 5, 0),
(31, 'Puff Plaza', 17, 1, '5 boxes x 10 bags', 10.00, 12, 5, 0),
(47, 'The Puffs', 12, 7, '50 cans (1620 g)', 350.00, 24, 1, 0),
(48, 'Ikoyi Mall', 14, 4, '25 cartons (220 g)', 170.00, 2, 20, 0),
(50, 'Jakende Estate', 1, 1, '5 boxes x 10 bags', 50.00, 24, 5, 0),
(54, 'Sango Palace', 12, 1, '5 boxes x 10 bags', 50.00, 24, 5, 0),
(57, 'Olabimitan Estate', 1, 1, '5 boxes x 10 bags', 50.00, 24, 5, 0),
(58, 'Palmgroove Mall', 1, 2, '50 boxes x 1 bag', 70.00, 8, 2, 0),
(28, 'Rössle Sauerkraut', 12, 7, '25 cans (825 g)', 228.00, 26, 0, -1),
(32, 'Mascarpone Fabioli', 14, 4, '24 cartons (200 g)', 160.00, 9, 40, 0),
(34, 'Sasquatch Ale', 16, 1, '24 bottles (70 cl)', 70.00, 111, 0, 0),
(35, 'Steeleye Stout', 16, 1, '24 bottles (1 liter)', 90.00, 20, 0, 0),
(36, 'Inlagd Sill', 17, 8, '24 jars (250 g)', 95.00, 112, 0, 0),
(37, 'Gravad lax', 17, 8, '12 cartons (500 g)', 130.00, 11, 50, 0),
(39, 'Chartreuse verte', 18, 1, '1 bottle (750 cc)', 90.00, 69, 0, 0),
(40, 'Boston Crab Meat', 19, 8, '24 cans (4 ounces)', 92.00, 123, 0, 0),
(42, 'Singaporean Hokkien Fried Mee', 20, 5, '32 cartons (1 kg)', 70.00, 26, 0, -1),
(43, 'Ipoh Coffee', 20, 1, '16 boxes (500 g)', 230.00, 17, 10, 0),
(46, 'Spegesild', 21, 8, '4 cans (250 g)', 60.00, 95, 0, 0),
(49, 'Maxilaku', 23, 3, '24 cartons (50 g)', 100.00, 10, 60, 0),
(51, 'Manjimup Dried Apples', 24, 7, '50 cartons (300 g)', 265.00, 20, 0, 0),
(52, 'Filo Mix', 24, 5, '16 boxes (2 kg)', 35.00, 38, 0, 0),
(53, 'Perth Pasties', 24, 6, '48 pieces', 164.00, 0, 0, -1),
(55, 'Pâté chinois', 25, 6, '24 boxes x 2 pies', 120.00, 115, 0, 0),
(56, 'Gnocchi di nonna Alice', 26, 5, '24 cartons (250 g)', 190.00, 21, 10, 0),
(59, 'Raclette Courdavault', 28, 4, '1 carton (5 kg)', 275.00, 79, 0, 0),
(60, 'Camembert Pierrot', 28, 4, '15 units (300 g)', 170.00, 19, 0, 0),
(66, 'Louisiana Hot Spiced Okra', 2, 2, '24 jars (8 ounces)', 85.00, 4, 100, 0),
(67, 'Laughing Lumberjack Lager', 16, 1, '24 bottles (12 ounces)', 70.00, 52, 0, 0),
(69, 'Gudbrandsdalsost', 15, 4, '1 carton (10 kg)', 180.00, 26, 0, 0),
(70, 'Outback Lager', 7, 1, '24 bottles (355 ml)', 75.00, 15, 10, 0),
(72, 'Mozzarella di Giovanni', 14, 4, '24 cartons (200 g)', 174.00, 14, 0, 0),
(73, 'Röd Kaviar', 17, 8, '24 jars (150 g)', 75.00, 101, 0, 0),
(74, 'Longlife Tofu', 4, 7, '1 carton (5 kg)', 50.00, 4, 20, 0),
(76, 'Lakkalikööri', 23, 1, '1 bottle (500 ml)', 90.00, 57, 0, 0),
(77, 'Original Frankfurter grüne Soße', 12, 2, '12 cans', 65.00, 32, 0, 0),
(5, 'Chef Anton''s Gumbo Mix', 2, 2, '36 cans', 106.00, 0, 0, 1),
(14, 'Tofu', 6, 7, '40 cartons (100 g)', 116.00, 35, 0, 0),
(61, 'Piff Diddy', 1, 1, '40 cartons (100 g)', 115.00, 34, 0, 0),
(62, 'Daniel Plaza', 1, 1, '5 boxes x 10 bags', 50.00, 24, 5, 0),
(63, 'Heaven on Earth', 1, 1, '5 boxes x 10 bags', 50.00, 24, 5, 0),
(64, 'China Town', 1, 1, '5 boxes x 10 bags', 50.00, 24, 5, 0),
(65, 'Shoprite', 1, 1, '5 boxes x 10 bags', 50.00, 24, 5, 0),
(68, 'Jendol', 1, 1, '5 boxes x 10 bags', 50.00, 24, 5, 0),
(71, 'Silverbird Mall', 1, 1, '5 boxes x 10 bags', 50.00, 24, 5, 0),
(75, 'The Continental', 1, 1, '5 boxes x 10 bags', 50.00, 24, 5, 0),
(90, 'Reddish Chronicles', 4, 1, '50 Kilos', 500.00, 74, 5, 0),
(91, 'CMK Culinary', 1, 3, '5 boxes x 100 bags', 50.00, 240, 0, 0),
(92, 'The Land of Milk and Honey', 2, 2, '50 gallons', 100.00, 14, 1, 0),
(15, 'Genen Shouyu', 6, 2, '24 bottles (250 ml)', 78.00, 22, 0, 0);


SET DateStyle = 'DMY';
INSERT INTO ORDERS  
VALUES 
( 10354,'PERIC',8,'14/11/96','20/11/96', 2.69 )
( 10365,'ANTON',3,'27/11/96','02/12/96', 1.10 )
( 10410,'BOTTM',3,'10/01/97','15/01/97', .12 ),
( 10415,'HUNGC',3,'15/01/97','24/01/97', .01 ),
( 10464,'FURIB',4,'04/03/97','14/03/97', 4.45 ),
( 10472,'SEVES',8,'12/03/97','19/03/97', .21 ),
( 10556,'SIMOB',2,'03/06/97','13/06/97', .49 ),
( 10566,'BLONP',9,'12/06/97','18/06/97', 4.42 ),
( 10574,'TRAIH',4,'19/06/97','30/06/97', 1.88 ),
( 10578,'BSBEV',4,'24/06/97','25/07/97', 1.48 ),
( 10593,'LEHMS',7,'09/07/97','13/08/97', 8.71 ),
( 10606,'TRADH',4,'22/07/97','31/07/97', 3.97 ),
( 10624,'THECR',4,'07/08/97','19/08/97', 4.74 ),
( 10649,'MAISD',5,'28/08/97','29/08/97', .31 ),
( 10651,'WANDK',8,'01/09/97','11/09/97', 1.03 ),
( 10683,'DUMON',2,'26/09/97','01/10/97', .22 ),
( 10690,'HANAR',1,'02/10/97','03/10/97', .79 ),
( 10709,'GOURL',1,'17/10/97','20/11/97', 10.54 ),
( 10715,'BONAP',3,'23/10/97','29/10/97', 3.16 ),
( 10774,'FOLKO',4,'11/12/97','12/12/97', 2.41 ),
( 10789,'FOLIG',1,'22/12/97','31/12/97', 5.03 ),
( 10822,'TRAIH',6,'08/01/98','16/01/98', .35 ),
( 10919,'LINOD',2,'02/03/98','04/03/98', .99 ),
( 10931,'RICSU',4,'06/03/98','19/03/98', .68 ),
( 10946,'VAFFE',1,'12/03/98','19/03/98', 1.36 ),
( 10968,'ERNSH',1,'23/03/98','01/04/98', 3.73 ),
( 10995,'PERIC',1,'02/04/98','06/04/98', 2.30 ),
( 11014,'LINOD',2,'10/04/98','15/04/98', 1.18 ),
( 11016,'AROUT',9,'10/04/98','13/04/98', 1.69 ),
( 11037,'GODOS',7,'21/04/98','27/04/98', .16 ),
( 11039,'LINOD',1,'21/04/98',NULL, 3.25 ),
( 11043,'SPECD',5,'22/04/98','29/04/98', .44 ),
( 11059,'RICAR',2,'29/04/98',NULL, 4.29 ),
( 11070,'LEHMS',2,'05/05/98',NULL, 6.80 ),
( 10248,'VINET',5,'04/07/96','16/07/96', 161.90 ),
( 10249,'TOMSP',6,'05/07/96','10/07/96', 58.05 ),
( 10291,'QUEDE',6,'27/08/96','04/09/96', .32 ),
( 10322,'PERIC',7,'04/10/96','23/10/96', .02 ),
( 10250,'HANAR',4,'08/07/96','12/07/96', 329.15 ),
( 10251,'VICTE',3,'08/07/96','15/07/96', 206.70 ),
( 10252,'SUPRD',4,'09/07/96','11/07/96', 256.50 ),
( 10253,'HANAR',3,'10/07/96','16/07/96', 290.85 ),
( 10254,'CHOPS',5,'11/07/96','23/07/96', 114.90 ),
( 10255,'RICSU',9,'12/07/96','15/07/96', 741.65 ),
( 10256,'WELLI',3,'15/07/96','17/07/96', 69.85 ),
( 10257,'HILAA',4,'16/07/96','22/07/96', 409.55 ),
( 10258,'ERNSH',1,'17/07/96','23/07/96', 702.55 ),
( 10259,'CENTC',4,'18/07/96','25/07/96', 16.25 ),
( 10260,'OTTIK',4,'19/07/96','29/07/96', 275.45 ),
( 10261,'QUEDE',4,'19/07/96','30/07/96', 15.25 ),
( 10262,'RATTC',8,'22/07/96','25/07/96', 241.45 ),
( 10263,'ERNSH',9,'23/07/96','31/07/96', 730.30 ),
( 10264,'FOLKO',6,'24/07/96','23/08/96', 18.35 ),
( 10265,'BLONP',2,'25/07/96','12/08/96', 276.40 ),
( 10266,'WARTH',3,'26/07/96','31/07/96', 128.65 ),
( 10267,'FRANK',4,'29/07/96','06/08/96', 1042.90 ),
( 10268,'GROSR',8,'30/07/96','02/08/96', 331.45 ),
( 10269,'WHITC',5,'31/07/96','09/08/96', 22.80 ),
( 10270,'WARTH',1,'01/08/96','02/08/96', 682.70 ),
( 10271,'SPLIR',6,'01/08/96','30/08/96', 22.70 ),
( 10272,'RATTC',6,'02/08/96','06/08/96', 490.15 ),
( 10273,'QUICK',3,'05/08/96','12/08/96', 380.35 ),
( 10274,'VINET',6,'06/08/96','16/08/96', 30.05 ),
( 10275,'MAGAA',1,'07/08/96','09/08/96', 134.65 ),
( 10276,'TORTU',8,'08/08/96','14/08/96', 69.20 ),
( 10277,'MORGK',2,'09/08/96','13/08/96', 628.85 ),
( 10278,'BERGS',8,'12/08/96','16/08/96', 463.45 ),
( 10279,'LEHMS',8,'13/08/96','16/08/96', 129.15 ),
( 10280,'BERGS',2,'14/08/96','12/09/96', 44.90 ),
( 10281,'ROMEY',4,'14/08/96','21/08/96', 14.70 ),
( 10282,'ROMEY',4,'15/08/96','21/08/96', 63.45 ),
( 10283,'LILAS',3,'16/08/96','23/08/96', 424.05 ),
( 10284,'LEHMS',4,'19/08/96','27/08/96', 382.80 ),
( 10285,'QUICK',1,'20/08/96','26/08/96', 384.15 ),
( 10286,'QUICK',8,'21/08/96','30/08/96', 1146.20 ),
( 10287,'RICAR',8,'22/08/96','28/08/96', 63.80 ),
( 10288,'REGGC',4,'23/08/96','03/09/96', 37.25 ),
( 10289,'BSBEV',7,'26/08/96','28/08/96', 113.85 ),
( 10290,'COMMI',8,'27/08/96','03/09/96', 398.50 ),
( 10292,'TRADH',1,'28/08/96','02/09/96', 6.75 ),
( 10293,'TORTU',1,'29/08/96','11/09/96', 105.90 ),
( 10294,'RATTC',4,'30/08/96','05/09/96', 736.30 ),
( 10295,'VINET',2,'02/09/96','10/09/96', 5.75 ),
( 10296,'LILAS',6,'03/09/96','11/09/96', .60 ),
( 10297,'BLONP',5,'04/09/96','10/09/96', 28.70 ),
( 10298,'HUNGO',6,'05/09/96','11/09/96', 841.10 ),
( 10299,'RICAR',4,'06/09/96','13/09/96', 148.80 ),
( 10300,'MAGAA',2,'09/09/96','18/09/96', 88.40 ),
( 10301,'WANDK',8,'09/09/96','17/09/96', 225.40 ),
( 10302,'SUPRD',4,'10/09/96','09/10/96', 31.35 ),
( 10303,'GODOS',7,'11/09/96','18/09/96', 539.15 ),
( 10304,'TORTU',1,'12/09/96','17/09/96', 318.95 ),
( 10305,'OLDWO',8,'13/09/96','09/10/96', 1288.10 ),
( 10306,'ROMEY',1,'16/09/96','23/09/96', 37.80 ),
( 10307,'LONEP',2,'17/09/96','25/09/96', 2.80 ),
( 10308,'ANATR',7,'18/09/96','24/09/96', 8.05 ),
( 10309,'HUNGO',3,'19/09/96','23/10/96', 236.50 ),
( 10310,'THEBI',8,'20/09/96','27/09/96', 87.60 ),
( 10311,'DUMON',1,'20/09/96','26/09/96', 123.45 ),
( 10312,'WANDK',2,'23/09/96','03/10/96', 201.30 ),
( 10313,'QUICK',2,'24/09/96','04/10/96', 9.80 ),
( 10314,'RATTC',1,'25/09/96','04/10/96', 370.80 ),
( 10315,'ISLAT',4,'26/09/96','03/10/96', 208.80 ),
( 10316,'RATTC',1,'27/09/96','08/10/96', 750.75 ),
( 10317,'LONEP',6,'30/09/96','10/10/96', 63.45 ),
( 10318,'ISLAT',8,'01/10/96','04/10/96', 23.65 ),
( 10319,'TORTU',7,'02/10/96','11/10/96', 322.50 ),
( 10320,'WARTH',5,'03/10/96','18/10/96', 172.85),
( 10321,'ISLAT',3,'03/10/96','11/10/96', 17.15),
( 10323,'KOENE',4,'07/10/96','14/10/96', 24.40),
( 10324,'SAVEA',9,'08/10/96','10/10/96', 1071.35),
( 10325,'KOENE',1,'09/10/96','14/10/96', 324.30),
( 10326,'BOLID',4,'10/10/96','14/10/96', 389.60),
( 10327,'FOLKO',2,'11/10/96','14/10/96', 316.80),
( 10328,'FURIB',4,'14/10/96','17/10/96', 435.15),
( 10329,'SPLIR',4,'15/10/96','23/10/96', 958.35 ),
( 10330,'LILAS',3,'16/10/96','28/10/96', 63.75 ),
( 10331,'BONAP',9,'16/10/96','21/10/96', 50.95 ),
( 10332,'MEREP',3,'17/10/96','21/10/96', 264.20 ),
( 10333,'WARTH',5,'18/10/96','25/10/96', 2.95 ),
( 10334,'VICTE',8,'21/10/96','28/10/96', 42.80 ),
( 10335,'HUNGO',7,'22/10/96','24/10/96', 210.55 ),
( 10336,'PRINI',7,'23/10/96','25/10/96', 77.55 ),
( 10337,'FRANK',4,'24/10/96','29/10/96', 541.30 ),
( 10338,'OLDWO',4,'25/10/96','29/10/96', 421.05 ),
( 10339,'MEREP',2,'28/10/96','04/11/96', 78.30 ),
( 10340,'BONAP',1,'29/10/96','08/11/96', 831.55 ),
( 10341,'SIMOB',7,'29/10/96','05/11/96', 133.90 ),
( 10342,'FRANK',4,'30/10/96','04/11/96', 274.15 ),
( 10343,'LEHMS',4,'31/10/96','06/11/96', 551.85 ),
( 10344,'WHITC',4,'01/11/96','05/11/96', 116.45 ),
( 10345,'QUICK',2,'04/11/96','11/11/96', 1245.30 ),
( 10346,'RATTC',3,'05/11/96','08/11/96', 710.40 ),
( 10347,'FAMIA',4,'06/11/96','08/11/96', 15.50 ),
( 10348,'WANDK',4,'07/11/96','15/11/96', 3.90 ),
( 10349,'SPLIR',7,'08/11/96','15/11/96', 43.15 ),
( 10350,'LAMAI',6,'11/11/96','03/12/96', 320.95 ),
( 10351,'ERNSH',1,'11/11/96','20/11/96', 811.65 ),
( 10352,'FURIB',3,'12/11/96','18/11/96', 6.50 ),
( 10353,'PICCO',7,'13/11/96','25/11/96', 1803.15 ),
( 10355,'AROUT',6,'15/11/96','20/11/96', 209.75 ),
( 10356,'WANDK',6,'18/11/96','27/11/96', 183.55 ),
( 10357,'LILAS',1,'19/11/96','02/12/96', 174.40 ),
( 10358,'LAMAI',5,'20/11/96','27/11/96', 98.20 ),
( 10359,'SEVES',5,'21/11/96','26/11/96', 1442.15 ),
( 10360,'BLONP',4,'22/11/96','02/12/96', 658.50 ),
( 10361,'QUICK',1,'22/11/96','03/12/96', 915.85 ),
( 10362,'BONAP',3,'25/11/96','28/11/96', 480.20 ),
( 10363,'DRACD',4,'26/11/96','04/12/96', 152.70 ),
( 10364,'EASTC',1,'26/11/96','04/12/96', 359.85 ),
( 10366,'GALED',8,'28/11/96','30/12/96', 50.70 ),
( 10367,'VAFFE',7,'28/11/96','02/12/96', 67.75 ),
( 10368,'ERNSH',2,'29/11/96','02/12/96', 509.75 ),
( 10369,'SPLIR',8,'02/12/96','09/12/96', 978.40 ),
( 10370,'CHOPS',6,'03/12/96','27/12/96', 5.85 ),
( 10371,'LAMAI',1,'03/12/96','24/12/96', 2.25 ),
( 10372,'QUEEN',5,'04/12/96','09/12/96', 4453.90 ),
( 10373,'HUNGO',4,'05/12/96','11/12/96', 620.60 ),
( 10374,'WOLZA',1,'05/12/96','09/12/96', 19.70 ),
( 10375,'HUNGC',3,'06/12/96','09/12/96', 100.60 ),
( 10376,'MEREP',1,'09/12/96','13/12/96', 101.95 ),
( 10377,'SEVES',1,'09/12/96','13/12/96', 111.05 ),
( 10378,'FOLKO',5,'10/12/96','19/12/96', 27.20 ),
( 10379,'QUEDE',2,'11/12/96','13/12/96', 225.15 ),
( 10380,'HUNGO',8,'12/12/96','16/01/97', 175.15 ),
( 10381,'LILAS',3,'12/12/96','13/12/96', 39.95 ),
( 10382,'ERNSH',4,'13/12/96','16/12/96', 473.85 ),
( 10383,'AROUT',8,'16/12/96','18/12/96', 171.20 ),
( 10384,'BERGS',3,'16/12/96','20/12/96', 843.20 ),
( 10385,'SPLIR',1,'17/12/96','23/12/96', 154.80 ),
( 10386,'FAMIA',9,'18/12/96','25/12/96', 69.95 ),
( 10387,'SANTG',1,'18/12/96','20/12/96', 468.15 ),
( 10388,'SEVES',2,'19/12/96','20/12/96', 174.30 ),
( 10389,'BOTTM',4,'20/12/96','24/12/96', 237.10 ),
( 10390,'ERNSH',6,'23/12/96','26/12/96', 631.90 ),
( 10391,'DRACD',3,'23/12/96','31/12/96', 27.25 ),
( 10392,'PICCO',2,'24/12/96','01/01/97', 612.30 ),
( 10393,'SAVEA',1,'25/12/96','03/01/97', 632.80 ),
( 10394,'HUNGC',1,'25/12/96','03/01/97', 151.70 ),
( 10395,'HILAA',6,'26/12/96','03/01/97', 922.05 ),
( 10396,'FRANK',1,'27/12/96','06/01/97', 676.75 ),
( 10397,'PRINI',5,'27/12/96','02/01/97', 301.30 ),
( 10398,'SAVEA',2,'30/12/96','09/01/97', 445.80 ),
( 10399,'VAFFE',8,'31/12/96','08/01/97', 136.80 ),
( 10400,'EASTC',1,'01/01/97','16/01/97', 419.65 ),
( 10401,'RATTC',1,'01/01/97','10/01/97', 62.55 ),
( 10402,'ERNSH',8,'02/01/97','10/01/97', 339.40 ),
( 10403,'ERNSH',4,'03/01/97','09/01/97', 368.95 ),
( 10404,'MAGAA',2,'03/01/97','08/01/97', 779.85 ),
( 10405,'LINOD',1,'06/01/97','22/01/97', 174.10 ),
( 10406,'QUEEN',7,'07/01/97','13/01/97', 540.20 ),
( 10407,'OTTIK',2,'07/01/97','30/01/97', 457.40 ),
( 10408,'FOLIG',8,'08/01/97','14/01/97', 56.30 ),
( 10409,'OCEAN',3,'09/01/97','14/01/97', 149.15 ),
( 10411,'BOTTM',9,'10/01/97','21/01/97', 118.25 ),
( 10412,'WARTH',8,'13/01/97','15/01/97', 18.85 ),
( 10413,'LAMAI',3,'14/01/97','16/01/97', 478.30 ),
( 10414,'FAMIA',2,'14/01/97','17/01/97', 107.40 ),
( 10416,'WARTH',8,'16/01/97','27/01/97', 113.60 ),
( 10417,'SIMOB',4,'16/01/97','28/01/97', 351.45 ),
( 10418,'QUICK',4,'17/01/97','24/01/97', 87.75 ),
( 10419,'RICSU',4,'20/01/97','30/01/97', 686.75 ),
( 10420,'WELLI',3,'21/01/97','27/01/97', 220.60 ),
( 10421,'QUEDE',8,'21/01/97','27/01/97', 496.15 ),
( 10422,'FRANS',2,'22/01/97','31/01/97', 15.10 ),
( 10423,'GOURL',6,'23/01/97','24/02/97', 122.50 ),
( 10424,'MEREP',7,'23/01/97','27/01/97', 1853.05 ),
( 10425,'LAMAI',6,'24/01/97','14/02/97', 39.65 ),
( 10426,'GALED',4,'27/01/97','06/02/97', 93.45 ),
( 10427,'PICCO',4,'27/01/97','03/03/97', 156.45 ),
( 10428,'REGGC',7,'28/01/97','04/02/97', 55.45 ),
( 10429,'HUNGO',3,'29/01/97','07/02/97', 283.15 ),
( 10430,'ERNSH',4,'30/01/97','03/02/97', 2293.90 ),
( 10431,'BOTTM',4,'30/01/97','07/02/97', 220.85 ),
( 10432,'SPLIR',3,'31/01/97','07/02/97', 21.70 ),
( 10433,'PRINI',3,'03/02/97','04/03/97', 369.15 ),
( 10434,'FOLKO',3,'03/02/97','13/02/97', 89.60 ),
( 10435,'CONSH',8,'04/02/97','07/02/97', 46.05 ),
( 10436,'BLONP',3,'05/02/97','11/02/97', 783.30 ),
( 10437,'WARTH',8,'05/02/97','12/02/97', 99.85 ),
( 10438,'TOMSP',3,'06/02/97','14/02/97', 41.20 ),
( 10439,'MEREP',6,'07/02/97','10/02/97', 20.35 ),
( 10440,'SAVEA',4,'10/02/97','28/02/97', 432.65 ),
( 10441,'OLDWO',3,'10/02/97','14/03/97', 365.10 ),
( 10442,'ERNSH',3,'11/02/97','18/02/97', 239.70 ),
( 10443,'REGGC',8,'12/02/97','14/02/97', 69.75 ),
( 10444,'BERGS',3,'12/02/97','21/02/97', 17.50 ),
( 10445,'BERGS',3,'13/02/97','20/02/97', 46.50 ),
( 10446,'TOMSP',6,'14/02/97','19/02/97', 73.40 ),
( 10447,'RICAR',4,'14/02/97','07/03/97', 343.30 ),
( 10448,'RANCH',4,'17/02/97','24/02/97', 194.10 ),
( 10449,'BLONP',3,'18/02/97','27/02/97', 266.50 ),
( 10450,'VICTE',8,'19/02/97','11/03/97', 36.15 ),
( 10451,'QUICK',4,'19/02/97','12/03/97', 945.45 ),
( 10452,'SAVEA',8,'20/02/97','26/02/97', 701.30 ),
( 10453,'AROUT',1,'21/02/97','26/02/97', 126.80 ),
( 10454,'LAMAI',4,'21/02/97','25/02/97', 13.70 ),
( 10455,'WARTH',8,'24/02/97','03/03/97', 902.25 ),
( 10456,'KOENE',8,'25/02/97','28/02/97', 40.60 ),
( 10457,'KOENE',2,'25/02/97','03/03/97', 57.85 ),
( 10458,'SUPRD',7,'26/02/97','04/03/97', 735.30 ),
( 10459,'VICTE',4,'27/02/97','28/02/97', 125.45 ),
( 10460,'FOLKO',8,'28/02/97','03/03/97', 81.35 ),
( 10461,'LILAS',1,'28/02/97','05/03/97', 743.05 ),
( 10462,'CONSH',2,'03/03/97','18/03/97', 30.85 ),
( 10463,'SUPRD',5,'04/03/97','06/03/97', 73.90 ),
( 10465,'VAFFE',1,'05/03/97','14/03/97', 725.20 ),
( 10466,'COMMI',4,'06/03/97','13/03/97', 59.65 ),
( 10467,'MAGAA',8,'06/03/97','11/03/97', 24.65 ),
( 10468,'KOENE',3,'07/03/97','12/03/97', 220.60 ),
( 10469,'WHITC',1,'10/03/97','14/03/97', 300.90 ),
( 10470,'BONAP',4,'11/03/97','14/03/97', 322.80 ),
( 10471,'BSBEV',2,'11/03/97','18/03/97', 227.95 ),
( 10473,'ISLAT',1,'13/03/97','21/03/97', 81.85 ),
( 10474,'PERIC',5,'13/03/97','21/03/97', 417.45 ),
( 10475,'SUPRD',9,'14/03/97','04/04/97', 342.60 ),
( 10476,'HILAA',8,'17/03/97','24/03/97', 22.05 ),
( 10477,'PRINI',5,'17/03/97','25/03/97', 65.10 ),
( 10478,'VICTE',2,'18/03/97','26/03/97', 24.05 ),
( 10479,'RATTC',3,'19/03/97','21/03/97', 3544.75 ),
( 10480,'FOLIG',6,'20/03/97','24/03/97', 6.75 ),
( 10481,'RICAR',8,'20/03/97','25/03/97', 321.65 ),
( 10482,'LAZYK',1,'21/03/97','10/04/97', 37.40 ),
( 10483,'WHITC',7,'24/03/97','25/04/97', 76.40 ),
( 10484,'BSBEV',3,'24/03/97','01/04/97', 34.40 ),
( 10485,'LINOD',4,'25/03/97','31/03/97', 322.25 ),
( 10486,'HILAA',1,'26/03/97','02/04/97', 152.65 ),
( 10487,'QUEEN',2,'26/03/97','28/03/97', 355.35 ),
( 10488,'FRANK',8,'27/03/97','02/04/97', 24.65 ),
( 10489,'PICCO',6,'28/03/97','09/04/97', 26.45 ),
( 10490,'HILAA',7,'31/03/97','03/04/97', 1050.95 ),
( 10491,'FURIB',8,'31/03/97','08/04/97', 84.80 ),
( 10492,'BOTTM',3,'01/04/97','11/04/97', 314.45 ),
( 10493,'LAMAI',4,'02/04/97','10/04/97', 53.20 ),
( 10494,'COMMI',4,'02/04/97','09/04/97', 329.95 ),
( 10495,'LAUGB',3,'03/04/97','11/04/97', 23.25 ),
( 10496,'TRADH',7,'04/04/97','07/04/97', 233.85 ),
( 10497,'LEHMS',7,'04/04/97','07/04/97', 181.05 ),
( 10498,'HILAA',8,'07/04/97','11/04/97', 148.75 ),
( 10499,'LILAS',4,'08/04/97','16/04/97', 510.10 ),
( 10500,'LAMAI',6,'09/04/97','17/04/97', 213.40 ),
( 10501,'BLAUS',9,'09/04/97','16/04/97', 44.25 ),
( 10502,'PERIC',2,'10/04/97','29/04/97', 346.60 ),
( 10503,'HUNGO',6,'11/04/97','16/04/97', 83.70 ),
( 10504,'WHITC',4,'11/04/97','18/04/97', 295.65 ),
( 10505,'MEREP',3,'14/04/97','21/04/97', 35.65 ),
( 10506,'KOENE',9,'15/04/97','02/05/97', 105.95 ),
( 10507,'ANTON',7,'15/04/97','22/04/97', 237.25 ),
( 10508,'OTTIK',1,'16/04/97','13/05/97', 24.95 ),
( 10509,'BLAUS',4,'17/04/97','29/04/97', .75 ),
( 10510,'SAVEA',6,'18/04/97','28/04/97', 1838.15 ),
( 10511,'BONAP',4,'18/04/97','21/04/97', 1753.20 ),
( 10512,'FAMIA',7,'21/04/97','24/04/97', 17.65 ),
( 10513,'WANDK',7,'22/04/97','28/04/97', 528.25 ),
( 10514,'ERNSH',3,'22/04/97','16/05/97', 3949.75 ),
( 10515,'QUICK',2,'23/04/97','23/05/97', 1022.35 ),
( 10516,'HUNGO',2,'24/04/97','01/05/97', 313.90 ),
( 10517,'NORTS',3,'24/04/97','29/04/97', 160.35 ),
( 10518,'TORTU',4,'25/04/97','05/05/97', 1090.75 ),
( 10519,'CHOPS',6,'28/04/97','01/05/97', 458.80 ),
( 10520,'SANTG',7,'29/04/97','01/05/97', 66.85 ),
( 10521,'CACTU',8,'29/04/97','02/05/97', 86.10 ),
( 10522,'LEHMS',4,'30/04/97','06/05/97', 226.65 ),
( 10523,'SEVES',7,'01/05/97','30/05/97', 388.15 ),
( 10524,'BERGS',1,'01/05/97','07/05/97', 1223.95 ),
( 10525,'BONAP',1,'02/05/97','23/05/97', 55.30 ),
( 10526,'WARTH',4,'05/05/97','15/05/97', 292.95 ),
( 10527,'QUICK',7,'05/05/97','07/05/97', 209.50 ),
( 10528,'GREAL',6,'06/05/97','09/05/97', 16.75 ),
( 10529,'MAISD',5,'07/05/97','09/05/97', 333.45 ),
( 10530,'PICCO',3,'08/05/97','12/05/97', 1696.10 ),
( 10531,'OCEAN',7,'08/05/97','19/05/97', 40.60 ),
( 10532,'EASTC',7,'09/05/97','12/05/97', 372.30 ),
( 10533,'FOLKO',8,'12/05/97','22/05/97', 940.20 ),
( 10534,'LEHMS',8,'12/05/97','14/05/97', 139.70 ),
( 10535,'ANTON',4,'13/05/97','21/05/97', 78.20 ),
( 10536,'LEHMS',3,'14/05/97','06/06/97', 294.40 ),
( 10537,'RICSU',1,'14/05/97','19/05/97', 394.25 ),
( 10538,'BSBEV',9,'15/05/97','16/05/97', 24.35 ),
( 10539,'BSBEV',6,'16/05/97','23/05/97', 61.80 ),
( 10540,'QUICK',3,'19/05/97','13/06/97', 5038.20 ),
( 10541,'HANAR',2,'19/05/97','29/05/97', 343.25 ),
( 10542,'KOENE',1,'20/05/97','26/05/97', 54.75 ),
( 10543,'LILAS',8,'21/05/97','23/05/97', 240.85 ),
( 10544,'LONEP',4,'21/05/97','30/05/97', 124.55 ),
( 10545,'LAZYK',8,'22/05/97','26/06/97', 59.60 ),
( 10546,'VICTE',1,'23/05/97','27/05/97', 973.60 ),
( 10547,'SEVES',3,'23/05/97','02/06/97', 892.15 ),
( 10548,'TOMSP',3,'26/05/97','02/06/97', 7.15 ),
( 10549,'QUICK',5,'27/05/97','30/05/97', 856.20 ),
( 10550,'GODOS',7,'28/05/97','06/06/97', 21.60 ),
( 10551,'FURIB',4,'28/05/97','06/06/97', 364.75 ),
( 10552,'HILAA',2,'29/05/97','05/06/97', 416.10 ),
( 10553,'WARTH',2,'30/05/97','03/06/97', 747.45 ),
( 10554,'OTTIK',4,'30/05/97','05/06/97', 604.85 ),
( 10555,'SAVEA',6,'02/06/97','04/06/97', 1262.45 ),
( 10557,'LEHMS',9,'03/06/97','06/06/97', 483.60 ),
( 10558,'AROUT',1,'04/06/97','10/06/97', 364.85 ),
( 10559,'BLONP',6,'05/06/97','13/06/97', 40.25 ),
( 10560,'FRANK',8,'06/06/97','09/06/97', 183.25 ),
( 10561,'FOLKO',2,'06/06/97','09/06/97', 1211.05 ),
( 10562,'REGGC',1,'09/06/97','12/06/97', 114.75 ),
( 10563,'RICAR',2,'10/06/97','24/06/97', 302.15 ),
( 10564,'RATTC',4,'10/06/97','16/06/97', 68.75 ),
( 10565,'MEREP',8,'11/06/97','18/06/97', 35.75 ),
( 10567,'HUNGO',1,'12/06/97','17/06/97', 169.85 ),
( 10568,'GALED',3,'13/06/97','09/07/97', 32.70 ),
( 10569,'RATTC',5,'16/06/97','11/07/97', 294.90 ),
( 10570,'MEREP',3,'17/06/97','19/06/97', 944.95 ),
( 10571,'ERNSH',8,'17/06/97','04/07/97', 130.30 ),
( 10572,'BERGS',3,'18/06/97','25/06/97', 582.15 ),
( 10573,'ANTON',7,'19/06/97','20/06/97', 424.20 ),
( 10575,'MORGK',5,'20/06/97','30/06/97', 636.70 ),
( 10576,'TORTU',3,'23/06/97','30/06/97', 92.80 ),
( 10577,'TRAIH',9,'23/06/97','30/06/97', 127.05 ),
( 10579,'LETSS',1,'25/06/97','04/07/97', 68.65 ),
( 10580,'OTTIK',4,'26/06/97','01/07/97', 379.45 ),
( 10581,'FAMIA',3,'26/06/97','02/07/97', 15.05 ),
( 10582,'BLAUS',3,'27/06/97','14/07/97', 138.55 ),
( 10583,'WARTH',2,'30/06/97','04/07/97', 36.40 ),
( 10584,'BLONP',4,'30/06/97','04/07/97', 295.70 ),
( 10585,'WELLI',7,'01/07/97','10/07/97', 67.05 ),
( 10586,'REGGC',9,'02/07/97','09/07/97', 2.40 ),
( 10587,'QUEDE',1,'02/07/97','09/07/97', 312.60 ),
( 10588,'QUICK',2,'03/07/97','10/07/97', 973.35 ),
( 10589,'GREAL',8,'04/07/97','14/07/97', 22.10 ),
( 10590,'MEREP',4,'07/07/97','14/07/97', 223.85 ),
( 10591,'VAFFE',1,'07/07/97','16/07/97', 279.60 ),
( 10592,'LEHMS',3,'08/07/97','16/07/97', 160.50 ),
( 10594,'OLDWO',3,'09/07/97','16/07/97', 26.20 ),
( 10595,'ERNSH',2,'10/07/97','14/07/97', 483.90 ),
( 10596,'WHITC',8,'11/07/97','12/08/97', 81.70 ),
( 10597,'PICCO',7,'11/07/97','18/07/97', 175.60 ),
( 10598,'RATTC',1,'14/07/97','18/07/97', 222.10 ),
( 10599,'BSBEV',6,'15/07/97','21/07/97', 149.90 ),
( 10600,'HUNGC',4,'16/07/97','21/07/97', 225.65 ),
( 10601,'HILAA',7,'16/07/97','22/07/97', 291.50 ),
( 10602,'VAFFE',8,'17/07/97','22/07/97', 14.60 ),
( 10603,'SAVEA',8,'18/07/97','08/08/97', 243.85 ),
( 10604,'FURIB',1,'18/07/97','29/07/97', 37.30 ),
( 10605,'MEREP',1,'21/07/97','29/07/97', 1895.65 ),
( 10607,'SAVEA',5,'22/07/97','25/07/97', 1001.20 ),
( 10608,'TOMSP',4,'23/07/97','01/08/97', 138.95 ),
( 10609,'DUMON',7,'24/07/97','30/07/97', 9.25 ),
( 10610,'LAMAI',8,'25/07/97','06/08/97', 133.90 ),
( 10611,'WOLZA',6,'25/07/97','01/08/97', 403.25 ),
( 10612,'SAVEA',1,'28/07/97','01/08/97', 2720.40 ),
( 10613,'HILAA',4,'29/07/97','01/08/97', 40.55 ),
( 10614,'BLAUS',8,'29/07/97','01/08/97', 9.65 ),
( 10615,'WILMK',2,'30/07/97','06/08/97', 3.75 ),
( 10616,'GREAL',1,'31/07/97','05/08/97', 582.65 ),
( 10617,'GREAL',4,'31/07/97','04/08/97', 92.65 ),
( 10618,'MEREP',1,'01/08/97','08/08/97', 773.40 ),
( 10619,'MEREP',3,'04/08/97','07/08/97', 455.25 ),
( 10620,'LAUGB',2,'05/08/97','14/08/97', 4.70 ),
( 10621,'ISLAT',4,'05/08/97','11/08/97', 118.65 ),
( 10622,'RICAR',4,'06/08/97','11/08/97', 254.85 ),
( 10623,'FRANK',8,'07/08/97','12/08/97', 485.90 ),
( 10625,'ANATR',3,'08/08/97','14/08/97', 219.50 ),
( 10626,'BERGS',1,'11/08/97','20/08/97', 693.45 ),
( 10627,'SAVEA',8,'11/08/97','21/08/97', 537.30 ),
( 10628,'BLONP',4,'12/08/97','20/08/97', 151.80 ),
( 10629,'GODOS',4,'12/08/97','20/08/97', 427.30 ),
( 10630,'KOENE',1,'13/08/97','19/08/97', 161.75 ),
( 10631,'LAMAI',8,'14/08/97','15/08/97', 4.35 ),
( 10632,'WANDK',8,'14/08/97','19/08/97', 206.90 ),
( 10633,'ERNSH',7,'15/08/97','18/08/97', 2389.50 ),
( 10634,'FOLIG',4,'15/08/97','21/08/97', 2436.90 ),
( 10635,'MAGAA',8,'18/08/97','21/08/97', 237.30 ),
( 10636,'WARTH',4,'19/08/97','26/08/97', 5.75 ),
( 10637,'QUEEN',6,'19/08/97','26/08/97', 1006.45 ),
( 10638,'LINOD',3,'20/08/97','01/09/97', 792.20 ),
( 10639,'SANTG',7,'20/08/97','27/08/97', 193.20 ),
( 10640,'WANDK',4,'21/08/97','28/08/97', 117.75 ),
( 10641,'HILAA',4,'22/08/97','26/08/97', 898.05 ),
( 10642,'SIMOB',7,'22/08/97','05/09/97', 209.45 ),
( 10643,'AROUT',6,'25/08/97','02/09/97', 147.30 ),
( 10644,'WELLI',3,'25/08/97','01/09/97', .70 ),
( 10645,'HANAR',4,'26/08/97','02/09/97', 62.05 ),
( 10646,'HUNGO',9,'27/08/97','03/09/97', 711.65 ),
( 10647,'QUEDE',4,'27/08/97','03/09/97', 227.70 ),
( 10648,'RICAR',5,'28/08/97','09/09/97', 71.25 ),
( 10650,'FAMIA',5,'29/08/97','03/09/97', 884.05 ),
( 10652,'GOURL',4,'01/09/97','08/09/97', 35.70 ),
( 10653,'FRANK',1,'02/09/97','19/09/97', 466.25 ),
( 10654,'BERGS',5,'02/09/97','11/09/97', 276.30 ),
( 10655,'REGGC',1,'03/09/97','11/09/97', 22.05 ),
( 10656,'GREAL',6,'04/09/97','10/09/97', 285.75 ),
( 10657,'SAVEA',2,'04/09/97','15/09/97', 1763.45 ),
( 10658,'QUICK',4,'05/09/97','08/09/97', 1820.75 ),
( 10659,'QUEEN',7,'05/09/97','10/09/97', 529.05 ),
( 10660,'HUNGC',8,'08/09/97','15/10/97', 556.45 ),
( 10661,'HUNGO',7,'09/09/97','15/09/97', 87.75 ),
( 10662,'LONEP',3,'09/09/97','18/09/97', 6.40 ),
( 10663,'BONAP',2,'10/09/97','03/10/97', 565.75 ),
( 10664,'FURIB',1,'10/09/97','19/09/97', 6.35 ),
( 10665,'LONEP',1,'11/09/97','17/09/97', 131.55 ),
( 10666,'RICSU',7,'12/09/97','22/09/97', 1162.10 ),
( 10667,'ERNSH',7,'12/09/97','19/09/97', 390.45 ),
( 10668,'WANDK',1,'15/09/97','23/09/97', 236.10 ),
( 10669,'SIMOB',2,'15/09/97','22/09/97', 121.95 ),
( 10670,'FRANK',4,'16/09/97','18/09/97', 1017.40 ),
( 10671,'FRANR',1,'17/09/97','24/09/97', 151.70 ),
( 10672,'BERGS',9,'17/09/97','26/09/97', 478.75 ),
( 10673,'WILMK',2,'18/09/97','19/09/97', 113.80 ),
( 10674,'ISLAT',4,'18/09/97','30/09/97', 4.50 ),
( 10675,'FRANK',5,'19/09/97','23/09/97', 159.25 ),
( 10676,'TORTU',2,'22/09/97','29/09/97', 10.05 ),
( 10677,'ANTON',1,'22/09/97','26/09/97', 20.15 ),
( 10678,'SAVEA',7,'23/09/97','16/10/97', 1944.90 ),
( 10679,'BLONP',8,'23/09/97','30/09/97', 139.70 ),
( 10680,'OLDWO',1,'24/09/97','26/09/97', 133.05 ),
( 10681,'GREAL',3,'25/09/97','30/09/97', 380.65 ),
( 10682,'ANTON',3,'25/09/97','01/10/97', 180.65 ),
( 10684,'OTTIK',3,'26/09/97','30/09/97', 728.15 ),
( 10685,'GOURL',4,'29/09/97','03/10/97', 168.75 ),
( 10686,'PICCO',2,'30/09/97','08/10/97', 482.50 ),
( 10687,'HUNGO',9,'30/09/97','30/10/97', 1482.15 ),
( 10688,'VAFFE',4,'01/10/97','07/10/97', 1495.45 ),
( 10689,'BERGS',1,'01/10/97','07/10/97', 67.10 ),
( 10691,'QUICK',2,'03/10/97','22/10/97', 4050.25 ),
( 10692,'BSBEV',4,'03/10/97','13/10/97', 305.10 ),
( 10693,'WHITC',3,'06/10/97','10/10/97', 696.70 ),
( 10694,'QUICK',8,'06/10/97','09/10/97', 1991.80 ),
( 10695,'WILMK',7,'07/10/97','14/10/97', 83.60 ),
( 10696,'WHITC',8,'08/10/97','14/10/97', 512.75 ),
( 10697,'LINOD',3,'08/10/97','14/10/97', 227.60 ),
( 10698,'ERNSH',4,'09/10/97','17/10/97', 1362.35 ),
( 10699,'MORGK',3,'09/10/97','13/10/97', 2.90 ),
( 10700,'SAVEA',3,'10/10/97','16/10/97', 325.50 ),
( 10701,'HUNGO',6,'13/10/97','15/10/97', 1101.55 ),
( 10702,'ALFKI',4,'13/10/97','21/10/97', 119.70 ),
( 10703,'FOLKO',6,'14/10/97','20/10/97', 761.50 ),
( 10704,'QUEEN',6,'14/10/97','07/11/97', 23.90 ),
( 10705,'HILAA',9,'15/10/97','18/11/97', 17.60 ),
( 10706,'OLDWO',8,'16/10/97','21/10/97', 678.15 ),
( 10707,'AROUT',4,'16/10/97','23/10/97', 108.70 ),
( 10708,'THEBI',6,'17/10/97','05/11/97', 14.80 ),
( 10710,'FRANS',1,'20/10/97','23/10/97', 24.90 ),
( 10711,'SAVEA',5,'21/10/97','29/10/97', 262.05 ),
( 10712,'HUNGO',3,'21/10/97','31/10/97', 449.65 ),
( 10713,'SAVEA',1,'22/10/97','24/10/97', 835.25 ),
( 10714,'SAVEA',5,'22/10/97','27/10/97', 122.45 ),
( 10716,'RANCH',4,'24/10/97','27/10/97', 112.85 ),
( 10717,'FRANK',1,'24/10/97','29/10/97', 296.25 ),
( 10718,'KOENE',1,'27/10/97','29/10/97', 854.40 ),
( 10719,'LETSS',8,'27/10/97','05/11/97', 257.20 ),
( 10720,'QUEDE',8,'28/10/97','05/11/97', 47.65 ),
( 10721,'QUICK',5,'29/10/97','31/10/97', 244.60 ),
( 10722,'SAVEA',8,'29/10/97','04/11/97', 372.90 ),
( 10723,'WHITC',3,'30/10/97','25/11/97', 108.60 ),
( 10724,'MEREP',8,'30/10/97','05/11/97', 288.75 ),
( 10725,'FAMIA',4,'31/10/97','05/11/97', 54.15 ),
( 10726,'EASTC',4,'03/11/97','05/12/97', 82.80 ),
( 10727,'REGGC',2,'03/11/97','05/12/97', 449.50 ),
( 10728,'QUEEN',4,'04/11/97','11/11/97', 291.65 ),
( 10729,'LINOD',8,'04/11/97','14/11/97', 705.30 ),
( 10730,'BONAP',5,'05/11/97','14/11/97', 100.60 ),
( 10731,'CHOPS',7,'06/11/97','14/11/97', 483.25 ),
( 10732,'BONAP',3,'06/11/97','07/11/97', 84.85 ),
( 10733,'BERGS',1,'07/11/97','10/11/97', 550.55 ),
( 10734,'GOURL',2,'07/11/97','12/11/97', 8.15 ),
( 10735,'LETSS',6,'10/11/97','21/11/97', 229.85 ),
( 10736,'HUNGO',9,'11/11/97','21/11/97', 220.50 ),
( 10737,'VINET',2,'11/11/97','18/11/97', 38.95 ),
( 10738,'SPECD',2,'12/11/97','18/11/97', 14.55 ),
( 10739,'VINET',3,'12/11/97','17/11/97', 55.40 ),
( 10740,'WHITC',4,'13/11/97','25/11/97', 409.40 ),
( 10741,'AROUT',4,'14/11/97','18/11/97', 54.80 ),
( 10742,'BOTTM',3,'14/11/97','18/11/97', 1218.65 ),
( 10743,'AROUT',1,'17/11/97','21/11/97', 118.60 ),
( 10744,'VAFFE',6,'17/11/97','24/11/97', 345.95 ),
( 10745,'QUICK',9,'18/11/97','27/11/97', 17.60 ),
( 10746,'CHOPS',1,'19/11/97','21/11/97', 157.15 ),
( 10747,'PICCO',6,'19/11/97','26/11/97', 586.65 ),
( 10748,'SAVEA',3,'20/11/97','28/11/97', 1162.75 ),
( 10749,'ISLAT',4,'20/11/97','19/12/97', 307.65 ),
( 10750,'WARTH',9,'21/11/97','24/11/97', 396.50 ),
( 10751,'RICSU',3,'24/11/97','03/12/97', 653.95 ),
( 10752,'NORTS',2,'24/11/97','28/11/97', 6.95 ),
( 10753,'FRANS',3,'25/11/97','27/11/97', 38.50 ),
( 10754,'MAGAA',6,'25/11/97','27/11/97', 11.90 ),
( 10755,'BONAP',4,'26/11/97','28/11/97', 83.55 ),
( 10756,'SPLIR',8,'27/11/97','02/12/97', 366.05 ),
( 10757,'SAVEA',6,'27/11/97','15/12/97', 40.95 ),
( 10758,'RICSU',3,'28/11/97','04/12/97', 690.85 ),
( 10759,'ANATR',3,'28/11/97','12/12/97', 59.95 ),
( 10760,'MAISD',4,'01/12/97','10/12/97', 778.20 ),
( 10761,'RATTC',5,'02/12/97','08/12/97', 93.30 ),
( 10762,'FOLKO',3,'02/12/97','09/12/97', 1643.70 ),
( 10763,'FOLIG',3,'03/12/97','08/12/97', 186.75 ),
( 10764,'ERNSH',6,'03/12/97','08/12/97', 727.25 ),
( 10765,'QUICK',3,'04/12/97','09/12/97', 213.70 ),
( 10766,'OTTIK',4,'05/12/97','09/12/97', 787.75 ),
( 10767,'SUPRD',4,'05/12/97','15/12/97', 7.95 ),
( 10768,'AROUT',3,'08/12/97','15/12/97', 731.60 ),
( 10769,'VAFFE',3,'08/12/97','12/12/97', 325.30 ),
( 10770,'HANAR',8,'09/12/97','17/12/97', 26.60 ),
( 10771,'ERNSH',9,'10/12/97','02/01/98', 55.95 ),
( 10772,'LEHMS',3,'10/12/97','19/12/97', 456.40 ),
( 10773,'ERNSH',1,'11/12/97','16/12/97', 482.15 ),
( 10775,'THECR',7,'12/12/97','26/12/97', 101.25 ),
( 10776,'ERNSH',1,'15/12/97','18/12/97', 1757.65 ),
( 10777,'GOURL',7,'15/12/97','21/01/98', 15.05 ),
( 10778,'BERGS',3,'16/12/97','24/12/97', 33.95 ),
( 10779,'MORGK',3,'16/12/97','14/01/98', 290.65 ),
( 10780,'LILAS',2,'16/12/97','25/12/97', 210.65 ),
( 10781,'WARTH',2,'17/12/97','19/12/97', 365.80 ),
( 10782,'CACTU',9,'17/12/97','22/12/97', 5.50 ),
( 10783,'HANAR',4,'18/12/97','19/12/97', 624.90 ),
( 10784,'MAGAA',4,'18/12/97','22/12/97', 350.45 ),
( 10785,'GROSR',1,'18/12/97','24/12/97', 7.55 ),
( 10786,'QUEEN',8,'19/12/97','23/12/97', 554.35 ),
( 10787,'LAMAI',2,'19/12/97','26/12/97', 1249.65 ),
( 10788,'QUICK',1,'22/12/97','19/01/98', 213.50 ),
( 10790,'GOURL',6,'22/12/97','26/12/97', 141.15 ),
( 10791,'FRANK',6,'23/12/97','01/01/98', 84.25 ),
( 10792,'WOLZA',1,'23/12/97','31/12/97', 118.95 ),
( 10793,'AROUT',3,'24/12/97','08/01/98', 22.60 ),
( 10794,'QUEDE',6,'24/12/97','02/01/98', 107.45 ),
( 10795,'ERNSH',8,'24/12/97','20/01/98', 633.30 ),
( 10796,'HILAA',3,'25/12/97','14/01/98', 132.60 ),
( 10797,'DRACD',7,'25/12/97','05/01/98', 166.75 ),
( 10798,'ISLAT',2,'26/12/97','05/01/98', 11.65 ),
( 10799,'KOENE',9,'26/12/97','05/01/98', 153.80 ),
( 10800,'SEVES',1,'26/12/97','05/01/98', 687.20 ),
( 10801,'BOLID',4,'29/12/97','31/12/97', 485.45 ),
( 10802,'SIMOB',4,'29/12/97','02/01/98', 1286.30 ),
( 10803,'WELLI',4,'30/12/97','06/01/98', 276.15 ),
( 10804,'SEVES',6,'30/12/97','07/01/98', 136.65 ),
( 10805,'THEBI',2,'30/12/97','09/01/98', 1186.70 ),
( 10806,'VICTE',3,'31/12/97','05/01/98', 110.55 ),
( 10807,'FRANS',4,'31/12/97','30/01/98', 6.80 ),
( 10808,'OLDWO',2,'01/01/98','09/01/98', 227.65 ),
( 10809,'WELLI',7,'01/01/98','07/01/98', 24.35 ),
( 10810,'LAUGB',2,'01/01/98','07/01/98', 21.65 ),
( 10811,'LINOD',8,'02/01/98','08/01/98', 156.10 ),
( 10812,'REGGC',5,'02/01/98','12/01/98', 298.90 ),
( 10813,'RICAR',1,'05/01/98','09/01/98', 236.90 ),
( 10814,'VICTE',3,'05/01/98','14/01/98', 654.70 ),
( 10815,'SAVEA',2,'05/01/98','14/01/98', 73.10 ),
( 10816,'GREAL',4,'06/01/98','04/02/98', 3598.90 ),
( 10817,'KOENE',3,'06/01/98','13/01/98', 1530.35 ),
( 10818,'MAGAA',7,'07/01/98','12/01/98', 327.40 ),
( 10819,'CACTU',2,'07/01/98','16/01/98', 98.80 ),
( 10820,'RATTC',3,'07/01/98','13/01/98', 187.60 ),
( 10821,'SPLIR',1,'08/01/98','15/01/98', 183.40 ),
( 10823,'LILAS',5,'09/01/98','13/01/98', 819.85 ),
( 10824,'FOLKO',8,'09/01/98','30/01/98', 6.15 ),
( 10825,'DRACD',1,'09/01/98','14/01/98', 396.25 ),
( 10826,'BLONP',6,'12/01/98','06/02/98', 35.45 ),
( 10827,'BONAP',1,'12/01/98','06/02/98', 317.70 ),
( 10828,'RANCH',9,'13/01/98','04/02/98', 454.25 ),
( 10829,'ISLAT',9,'13/01/98','23/01/98', 773.60 ),
( 10830,'TRADH',4,'13/01/98','21/01/98', 409.15 ),
( 10831,'SANTG',3,'14/01/98','23/01/98', 360.95 ),
( 10832,'LAMAI',2,'14/01/98','19/01/98', 216.30 ),
( 10833,'OTTIK',6,'15/01/98','23/01/98', 357.45 ),
( 10834,'TRADH',1,'15/01/98','19/01/98', 148.90 ),
( 10835,'ALFKI',1,'15/01/98','21/01/98', 347.65 ),
( 10836,'ERNSH',7,'16/01/98','21/01/98', 2059.40 ),
( 10837,'BERGS',9,'16/01/98','23/01/98', 66.60 ),
( 10838,'LINOD',3,'19/01/98','23/01/98', 296.40 ),
( 10839,'TRADH',3,'19/01/98','22/01/98', 177.15 ),
( 10840,'LINOD',4,'19/01/98','16/02/98', 13.55 ),
( 10841,'SUPRD',5,'20/01/98','29/01/98', 2121.50 ),
( 10842,'TORTU',1,'20/01/98','29/01/98', 272.10 ),
( 10843,'VICTE',4,'21/01/98','26/01/98', 46.30 ),
( 10844,'PICCO',8,'21/01/98','26/01/98', 126.10 ),
( 10845,'QUICK',8,'21/01/98','30/01/98', 1064.90 ),
( 10846,'SUPRD',2,'22/01/98','23/01/98', 282.30 ),
( 10847,'SAVEA',4,'22/01/98','10/02/98', 2437.85 ),
( 10848,'CONSH',7,'23/01/98','29/01/98', 191.20 ),
( 10849,'KOENE',9,'23/01/98','30/01/98', 2.80 ),
( 10850,'VICTE',1,'23/01/98','30/01/98', 245.95 ),
( 10851,'RICAR',5,'26/01/98','02/02/98', 802.75 ),
( 10852,'RATTC',8,'26/01/98','30/01/98', 870.25 ),
( 10853,'BLAUS',9,'27/01/98','03/02/98', 269.15 ),
( 10854,'ERNSH',3,'27/01/98','05/02/98', 501.10 ),
( 10855,'OLDWO',3,'27/01/98','04/02/98', 854.85 ),
( 10856,'ANTON',3,'28/01/98','10/02/98', 292.15 ),
( 10857,'BERGS',8,'28/01/98','06/02/98', 944.25 ),
( 10858,'LACOR',2,'29/01/98','03/02/98', 262.55 ),
( 10859,'FRANK',1,'29/01/98','02/02/98', 380.50 ),
( 10860,'FRANR',3,'29/01/98','04/02/98', 96.30 ),
( 10861,'WHITC',4,'30/01/98','17/02/98', 74.65 ),
( 10862,'LEHMS',8,'30/01/98','02/02/98', 266.15 ),
( 10863,'HILAA',4,'02/02/98','17/02/98', 151.30 ),
( 10864,'AROUT',4,'02/02/98','09/02/98', 15.20 ),
( 10865,'QUICK',2,'02/02/98','12/02/98', 1740.70 ),
( 10866,'BERGS',5,'03/02/98','12/02/98', 545.55 ),
( 10867,'LONEP',6,'03/02/98','11/02/98', 9.65 ),
( 10868,'QUEEN',7,'04/02/98','23/02/98', 956.35 ),
( 10869,'SEVES',5,'04/02/98','09/02/98', 716.40 ),
( 10870,'WOLZA',5,'04/02/98','13/02/98', 60.20 ),
( 10871,'BONAP',9,'05/02/98','10/02/98', 561.35 ),
( 10872,'GODOS',5,'05/02/98','09/02/98', 876.60 ),
( 10873,'WILMK',4,'06/02/98','09/02/98', 4.10 ),
( 10874,'GODOS',5,'06/02/98','11/02/98', 97.90 ),
( 10875,'BERGS',4,'06/02/98','03/03/98', 161.85 ),
( 10876,'BONAP',7,'09/02/98','12/02/98', 302.10 ),
( 10877,'RICAR',1,'09/02/98','19/02/98', 190.30 ),
( 10878,'QUICK',4,'10/02/98','12/02/98', 233.45 ),
( 10879,'WILMK',3,'10/02/98','12/02/98', 42.50 ),
( 10880,'FOLKO',7,'10/02/98','18/02/98', 440.05 ),
( 10881,'CACTU',4,'11/02/98','18/02/98', 14.20 ),
( 10882,'SAVEA',4,'11/02/98','20/02/98', 115.50 ),
( 10883,'LONEP',8,'12/02/98','20/02/98', 2.65 ),
( 10884,'LETSS',4,'12/02/98','13/02/98', 454.85 ),
( 10885,'SUPRD',6,'12/02/98','18/02/98', 28.20 ),
( 10886,'HANAR',1,'13/02/98','02/03/98', 24.95 ),
( 10887,'GALED',8,'13/02/98','16/02/98', 6.25 ),
( 10888,'GODOS',1,'16/02/98','23/02/98', 259.35 ),
( 10889,'RATTC',9,'16/02/98','23/02/98', 1403.05 ),
( 10890,'DUMON',7,'16/02/98','18/02/98', 163.80 ),
( 10891,'LEHMS',7,'17/02/98','19/02/98', 101.85 ),
( 10892,'MAISD',4,'17/02/98','19/02/98', 601.35 ),
( 10893,'KOENE',9,'18/02/98','20/02/98', 388.90 ),
( 10894,'SAVEA',1,'18/02/98','20/02/98', 580.65 ),
( 10895,'ERNSH',3,'18/02/98','23/02/98', 813.75 ),
( 10896,'MAISD',7,'19/02/98','27/02/98', 162.25 ),
( 10897,'HUNGO',3,'19/02/98','25/02/98', 3017.70 ),
( 10898,'OCEAN',4,'20/02/98','06/03/98', 6.35 ),
( 10899,'LILAS',5,'20/02/98','26/02/98', 6.05 ),
( 10900,'WELLI',1,'20/02/98','04/03/98', 8.30 ),
( 10901,'HILAA',4,'23/02/98','26/02/98', 310.45 ),
( 10902,'FOLKO',1,'23/02/98','03/03/98', 220.75 ),
( 10903,'HANAR',3,'24/02/98','04/03/98', 183.55 ),
( 10904,'WHITC',3,'24/02/98','27/02/98', 814.75 ),
( 10905,'WELLI',9,'24/02/98','06/03/98', 68.60 ),
( 10906,'WOLZA',4,'25/02/98','03/03/98', 131.45 ),
( 10907,'SPECD',6,'25/02/98','27/02/98', 45.95 ),
( 10908,'REGGC',4,'26/02/98','06/03/98', 164.80 ),
( 10909,'SANTG',1,'26/02/98','10/03/98', 265.25 ),
( 10910,'WILMK',1,'26/02/98','04/03/98', 190.55 ),
( 10911,'GODOS',3,'26/02/98','05/03/98', 190.95 ),
( 10912,'HUNGO',2,'26/02/98','18/03/98', 2904.55 ),
( 10913,'QUEEN',4,'26/02/98','04/03/98', 165.25 ),
( 10914,'QUEEN',6,'27/02/98','02/03/98', 105.95 ),
( 10915,'TORTU',2,'27/02/98','02/03/98', 17.55 ),
( 10916,'RANCH',1,'27/02/98','09/03/98', 318.85 ),
( 10917,'ROMEY',4,'02/03/98','11/03/98', 41.45 ),
( 10918,'BOTTM',3,'02/03/98','11/03/98', 244.15 ),
( 10920,'AROUT',4,'03/03/98','09/03/98', 148.05 ),
( 10921,'VAFFE',1,'03/03/98','09/03/98', 882.40 ),
( 10922,'HANAR',5,'03/03/98','05/03/98', 313.70 ),
( 10923,'LAMAI',7,'03/03/98','13/03/98', 341.30 ),
( 10924,'BERGS',3,'04/03/98','08/04/98', 757.60 ),
( 10925,'HANAR',3,'04/03/98','13/03/98', 11.35 ),
( 10926,'ANATR',4,'04/03/98','11/03/98', 199.60 ),
( 10927,'LACOR',4,'05/03/98','08/04/98', 98.95 ),
( 10928,'GALED',1,'05/03/98','18/03/98', 6.80 ),
( 10929,'FRANK',6,'05/03/98','12/03/98', 169.65 ),
( 10930,'SUPRD',4,'06/03/98','18/03/98', 77.75 ),
( 10932,'BONAP',8,'06/03/98','24/03/98', 673.20 ),
( 10933,'ISLAT',6,'06/03/98','16/03/98', 270.75 ),
( 10934,'LEHMS',3,'09/03/98','12/03/98', 160.05 ),
( 10935,'WELLI',4,'09/03/98','18/03/98', 237.95 ),
( 10936,'GREAL',3,'09/03/98','18/03/98', 168.40 ),
( 10937,'CACTU',7,'10/03/98','13/03/98', 157.55 ),
( 10938,'QUICK',3,'10/03/98','16/03/98', 159.45 ),
( 10939,'MAGAA',2,'10/03/98','13/03/98', 381.65 ),
( 10940,'BONAP',8,'11/03/98','23/03/98', 98.85 ),
( 10941,'SAVEA',7,'11/03/98','20/03/98', 2004.05 ),
( 10942,'REGGC',9,'11/03/98','18/03/98', 89.75 ),
( 10943,'BSBEV',4,'11/03/98','19/03/98', 10.85 ),
( 10944,'BOTTM',6,'12/03/98','13/03/98', 264.60 ),
( 10945,'MORGK',4,'12/03/98','18/03/98', 51.10 ),
( 10947,'BSBEV',3,'13/03/98','16/03/98', 16.30 ),
( 10948,'GODOS',3,'13/03/98','19/03/98', 116.95 ),
( 10949,'BOTTM',2,'13/03/98','17/03/98', 372.20 ),
( 10950,'MAGAA',1,'16/03/98','23/03/98', 12.50 ),
( 10951,'RICSU',9,'16/03/98','07/04/98', 154.25 ),
( 10952,'ALFKI',1,'16/03/98','24/03/98', 202.10 ),
( 10953,'AROUT',9,'16/03/98','25/03/98', 118.60 ),
( 10954,'LINOD',5,'17/03/98','20/03/98', 139.55 ),
( 10955,'FOLKO',8,'17/03/98','20/03/98', 16.30 ),
( 10956,'BLAUS',6,'17/03/98','20/03/98', 223.25 ),
( 10957,'HILAA',8,'18/03/98','27/03/98', 526.80 ),
( 10958,'OCEAN',7,'18/03/98','27/03/98', 247.80 ),
( 10959,'GOURL',6,'18/03/98','23/03/98', 24.90 ),
( 10960,'HILAA',3,'19/03/98','08/04/98', 10.40 ),
( 10961,'QUEEN',8,'19/03/98','30/03/98', 522.35 ),
( 10962,'QUICK',8,'19/03/98','23/03/98', 1378.95 ),
( 10963,'FURIB',9,'19/03/98','26/03/98', 13.50 ),
( 10964,'SPECD',3,'20/03/98','24/03/98', 436.90 ),
( 10965,'OLDWO',6,'20/03/98','30/03/98', 721.90 ),
( 10966,'CHOPS',4,'20/03/98','08/04/98', 135.95 ),
( 10967,'TOMSP',2,'23/03/98','02/04/98', 311.10 ),
( 10969,'COMMI',1,'23/03/98','30/03/98', 1.05 ),
( 10970,'BOLID',9,'24/03/98','24/04/98', 80.80 ),
( 10971,'FRANR',2,'24/03/98','02/04/98', 609.10 ),
( 10972,'LACOR',4,'24/03/98','26/03/98', .10 ),
( 10973,'LACOR',6,'24/03/98','27/03/98', 75.85 ),
( 10974,'SPLIR',3,'25/03/98','03/04/98', 64.80 ),
( 10975,'BOTTM',1,'25/03/98','27/03/98', 161.35 ),
( 10976,'HILAA',1,'25/03/98','03/04/98', 189.85 ),
( 10977,'FOLKO',8,'26/03/98','10/04/98', 1042.50 ),
( 10978,'MAISD',9,'26/03/98','23/04/98', 164.10 ),
( 10979,'ERNSH',8,'26/03/98','31/03/98', 1765.35 ),
( 10980,'FOLKO',4,'27/03/98','17/04/98', 6.30 ),
( 10981,'HANAR',1,'27/03/98','02/04/98', 966.85 ),
( 10982,'BOTTM',2,'27/03/98','08/04/98', 70.05 ),
( 10983,'SAVEA',2,'27/03/98','06/04/98', 3287.70 ),
( 10984,'SAVEA',1,'30/03/98','03/04/98', 1056.10 ),
( 10985,'HUNGO',2,'30/03/98','02/04/98', 457.55 ),
( 10986,'OCEAN',8,'30/03/98','21/04/98', 1089.30 ),
( 10987,'EASTC',8,'31/03/98','06/04/98', 927.40 ),
( 10988,'RATTC',3,'31/03/98','10/04/98', 305.70 ),
( 10989,'QUEDE',2,'31/03/98','02/04/98', 173.80 ),
( 10990,'ERNSH',2,'01/04/98','07/04/98', 588.05 ),
( 10991,'QUICK',1,'01/04/98','07/04/98', 192.55 ),
( 10992,'THEBI',1,'01/04/98','03/04/98', 21.35 ),
( 10993,'FOLKO',7,'01/04/98','10/04/98', 44.05 ),
( 10994,'VAFFE',2,'02/04/98','09/04/98', 327.65 ),
( 10996,'QUICK',4,'02/04/98','10/04/98', 5.60 ),
( 10997,'LILAS',8,'03/04/98','13/04/98', 369.55 ),
( 10998,'WOLZA',8,'03/04/98','17/04/98', 101.55 ),
( 10999,'OTTIK',6,'03/04/98','10/04/98', 481.75 ),
( 11000,'RATTC',2,'06/04/98','14/04/98', 275.60 ),
( 11001,'FOLKO',2,'06/04/98','14/04/98', 986.50 ),
( 11002,'SAVEA',4,'06/04/98','16/04/98', 705.80 ),
( 11003,'THECR',3,'06/04/98','08/04/98', 74.55 ),
( 11004,'MAISD',3,'07/04/98','20/04/98', 224.20 ),
( 11005,'WILMK',2,'07/04/98','10/04/98', 3.75 ),
( 11006,'GREAL',3,'07/04/98','15/04/98', 125.95 ),
( 11007,'PRINI',8,'08/04/98','13/04/98', 1011.20 ),
( 11008,'ERNSH',7,'08/04/98',NULL, 397.30 ),
( 11009,'GODOS',2,'08/04/98','10/04/98', 295.55 ),
( 11010,'REGGC',2,'09/04/98','21/04/98', 143.55 ),
( 11011,'ALFKI',3,'09/04/98','13/04/98', 6.05 ),
( 11012,'FRANK',1,'09/04/98','17/04/98', 1214.75 ),
( 11013,'ROMEY',2,'09/04/98','10/04/98', 164.95 ),
( 11015,'SANTG',2,'10/04/98','20/04/98', 23.10 ),
( 11017,'ERNSH',9,'13/04/98','20/04/98', 3771.30 ),
( 11018,'LONEP',4,'13/04/98','16/04/98', 58.25 ),
( 11019,'RANCH',6,'13/04/98',NULL, 15.85 ),
( 11020,'OTTIK',2,'14/04/98','16/04/98', 216.50 ),
( 11021,'QUICK',3,'14/04/98','21/04/98', 1485.90 ),
( 11022,'HANAR',9,'14/04/98','04/05/98', 31.35 ),
( 11023,'BSBEV',1,'14/04/98','24/04/98', 619.15 ),
( 11024,'EASTC',4,'15/04/98','20/04/98', 371.80 ),
( 11025,'WARTH',6,'15/04/98','24/04/98', 145.85 ),
( 11026,'FRANS',4,'15/04/98','28/04/98', 235.45 ),
( 11027,'BOTTM',1,'16/04/98','20/04/98', 262.60 ),
( 11028,'KOENE',2,'16/04/98','22/04/98', 147.95 ),
( 11029,'CHOPS',4,'16/04/98','27/04/98', 239.20 ),
( 11030,'SAVEA',7,'17/04/98','27/04/98', 4153.75 ),
( 11031,'SAVEA',6,'17/04/98','24/04/98', 1136.10 ),
( 11032,'WHITC',2,'17/04/98','23/04/98', 3030.95 ),
( 11033,'RICSU',7,'17/04/98','23/04/98', 423.70 ),
( 11034,'OLDWO',8,'20/04/98','27/04/98', 201.60 ),
( 11035,'SUPRD',2,'20/04/98','24/04/98', .85 ),
( 11036,'DRACD',8,'20/04/98','22/04/98', 747.35 ),
( 11038,'SUPRD',1,'21/04/98','30/04/98', 147.95 ),
( 11040,'GREAL',4,'22/04/98',NULL, 94.20 ),
( 11041,'CHOPS',3,'22/04/98','28/04/98', 241.10 ),
( 11042,'COMMI',2,'22/04/98','01/05/98', 149.95 ),
( 11044,'WOLZA',4,'23/04/98','01/05/98', 43.60 ),
( 11045,'BOTTM',6,'23/04/98',NULL, 352.90 ),
( 11046,'WANDK',8,'23/04/98','24/04/98', 358.20 ),
( 11047,'EASTC',7,'24/04/98','01/05/98', 233.10 ),
( 11048,'BOTTM',7,'24/04/98','30/04/98', 120.60 ),
( 11049,'GOURL',3,'24/04/98','04/05/98', 41.70 ),
( 11050,'FOLKO',8,'27/04/98','05/05/98', 297.05 ),
( 11051,'LAMAI',7,'27/04/98',NULL, 13.95 ),
( 11052,'HANAR',3,'27/04/98','01/05/98', 336.30 ),
( 11053,'PICCO',2,'27/04/98','29/04/98', 265.25 ),
( 11054,'CACTU',8,'28/04/98',NULL, 1.65 ),
( 11055,'HILAA',7,'28/04/98','05/05/98', 604.60 ),
( 11056,'EASTC',8,'28/04/98','01/05/98', 1394.80 ),
( 11057,'NORTS',3,'29/04/98','01/05/98', 20.65 ),
( 11058,'BLAUS',9,'29/04/98',NULL, 155.70 ),
( 11060,'FRANS',2,'30/04/98','04/05/98', 54.90 ),
( 11061,'GREAL',4,'30/04/98',NULL, 70.05 ),
( 11062,'REGGC',4,'30/04/98',NULL, 149.65 ),
( 11063,'HUNGO',3,'30/04/98','06/05/98', 408.65 ),
( 11064,'SAVEA',1,'01/05/98','04/05/98', 150.45 ),
( 11065,'LILAS',8,'01/05/98',NULL, 64.55 ),
( 11066,'WHITC',7,'01/05/98','04/05/98', 223.60 ),
( 11067,'DRACD',1,'04/05/98','06/05/98', 39.90 ),
( 11068,'QUEEN',8,'04/05/98',NULL, 408.75 ),
( 11069,'TORTU',1,'04/05/98','06/05/98', 78.35 ),
( 11071,'LILAS',1,'05/05/98',NULL, 4.65 ),
( 11072,'ERNSH',4,'05/05/98',NULL, 1293.20 ),
( 11073,'PERIC',2,'05/05/98',NULL, 124.75 ),
( 11074,'SIMOB',7,'06/05/98',NULL, 92.20 ),
( 11075,'RICSU',8,'06/05/98',NULL, 30.95 ),
( 11076,'BONAP',4,'06/05/98',NULL, 191.40 ),
( 11077,'RATTC',1,'06/05/98',NULL, 42.65 ),
( 11078,'RATTC',1,'07/05/98',NULL, 30.01 );


INSERT INTO ORDER_DETAILS
VALUES
-- ( 10248,1, 70.00,12, .00 ),
-- ( 10248,2, 49.00,10, .00 ),
-- ( 10248,3, 174.00,5, .00 ),
-- ( 10248,4, 70.00,12, .00 ),
-- ( 10248,5, 49.00,10, .00 ),
-- ( 10248,6, 174.00,5, .00 ),
-- ( 10248,7, 70.00,12, .00 ),
-- ( 10248,8, 49.00,10, .00 ),
-- ( 10248,9, 174.00,5, .00 ),
-- ( 10248,10, 70.00,12, .00 ),
-- ( 10248,11, 49.00,10, .00 ),
-- ( 10248,12, 174.00,5, .00 ),
-- ( 10248,13, 70.00,12, .00 ),
-- ( 10248,14, 49.00,10, .00 ),
-- ( 10248,15, 174.00,5, .00 ),
-- ( 10248,16, 70.00,12, .00 ),
-- ( 10248,17, 49.00,10, .00 ),
-- ( 10248,18, 174.00,5, .00 ),
-- ( 10248,19, 70.00,12, .00 ),
-- ( 10248,20, 49.00,10, .00 ),
-- ( 10248,21, 70.00,12, .00 ),
-- ( 10248,22, 49.00,10, .00 ),
-- ( 10248,23, 174.00,5, .00 ),
-- ( 10248,24, 70.00,12, .00 ),
-- ( 10248,25, 49.00,10, .00 ),
-- ( 10248,26, 174.00,5, .00 ),
-- ( 10248,27, 70.00,12, .00 ),
-- ( 10248,28, 49.00,10, .00 ),
-- ( 10248,29, 174.00,5, .00 ),
-- ( 10248,30, 70.00,12, .00 ),
-- ( 10248,31, 49.00,10, .00 ),
-- ( 10248,32, 174.00,5, .00 ),
-- ( 10248,33, 70.00,12, .00 ),
-- ( 10248,34, 49.00,10, .00 ),
-- ( 10248,35, 174.00,5, .00 ),
-- ( 10248,36, 70.00,12, .00 ),
-- ( 10248,37, 49.00,10, .00 ),
-- ( 10248,38, 174.00,5, .00 ),
-- ( 10248,39, 70.00,12, .00 ),
-- ( 10248,40, 49.00,10, .00 ),
-- ( 10248,41, 70.00,12, .00 ),
-- ( 10248,42, 49.00,10, .00 ),
-- ( 10248,43, 174.00,5, .00 ),
-- ( 10248,44, 70.00,12, .00 ),
-- ( 10248,45, 49.00,10, .00 ),
-- ( 10248,46, 174.00,5, .00 ),
-- ( 10248,47, 70.00,12, .00 ),
-- ( 10248,48, 49.00,10, .00 ),
-- ( 10248,49, 174.00,5, .00 ),
-- ( 10248,50, 70.00,12, .00 ),
-- ( 10248,51, 49.00,10, .00 ),
-- ( 10248,52, 174.00,5, .00 ),
-- ( 10248,53, 70.00,12, .00 ),
-- ( 10248,54, 49.00,10, .00 ),
-- ( 10248,55, 174.00,5, .00 ),
-- ( 10248,56, 70.00,12, .00 ),
-- ( 10248,57, 49.00,10, .00 ),
-- ( 10248,58, 174.00,5, .00 ),
-- ( 10248,59, 70.00,12, .00 ),
-- ( 10248,60, 49.00,10, .00 ),
-- ( 10248,61, 70.00,12, .00 ),
-- ( 10248,62, 49.00,10, .00 ),
-- ( 10248,63, 174.00,5, .00 ),
-- ( 10248,64, 70.00,12, .00 ),
-- ( 10248,65, 49.00,10, .00 ),
-- ( 10248,66, 174.00,5, .00 ),
-- ( 10248,67, 70.00,12, .00 ),
-- ( 10248,68, 49.00,10, .00 ),
-- ( 10248,69, 174.00,5, .00 ),
-- ( 10248,70, 70.00,12, .00 ),
-- ( 10248,71, 49.00,10, .00 ),
-- ( 10248,72, 174.00,5, .00 ),
-- ( 10248,73, 70.00,12, .00 ),
-- ( 10248,74, 49.00,10, .00 ),
-- ( 10248,75, 174.00,5, .00 ),
-- ( 10248,76, 70.00,12, .00 ),
-- ( 10248,77, 49.00,10, .00 ),
-- ( 10248,90, 174.00,5, .00 ),
-- ( 10248,91, 70.00,12, .00 ),
-- ( 10248,92, 49.00,10, .00 ),
-- ( 10249,14, 93.00,9, .00 ),
-- ( 10249,51, 212.00,40, .00 ),
-- ( 10250,41, 38.50,10, .00 ),
-- ( 10250,51, 212.00,35, .15 ),
-- ( 10250,65, 84.00,15, .15 ),
-- ( 10251,22, 84.00,6, .05 ),
-- ( 10251,57, 78.00,15, .05 ),
-- ( 10251,65, 84.00,20, .00 ),
-- ( 10252,20, 324.00,40, .05 ),
-- ( 10252,33, 10.00,25, .05 ),
-- ( 10252,60, 136.00,40, .00 ),
-- ( 10253,31, 50.00,20, .00 ),
-- ( 10253,39, 72.00,42, .00 ),
-- ( 10253,49, 80.00,40, .00 ),
-- ( 10254,24, 18.00,15, .15 ),
-- ( 10254,55, 96.00,21, .15 ),
-- ( 10254,74, 40.00,21, .00 ),
-- ( 10255,2, 76.00,20, .00 ),
-- ( 10255,16, 69.50,35, .00 ),
-- ( 10255,36, 76.00,25, .00 ),
-- ( 10255,59, 220.00,30, .00 ),
-- ( 10256,53, 131.00,15, .00 ),
-- ( 10256,77, 52.00,12, .00 ),
-- ( 10257,27, 175.50,25, .00 ),
-- ( 10257,39, 72.00,6, .00 ),
-- ( 10257,77, 52.00,15, .00 ),
-- ( 10258,2, 76.00,50, .20 ),
-- ( 10258,5, 85.00,65, .20 ),
-- ( 10258,32, 128.00,6, .20 ),
-- ( 10259,21, 40.00,10, .00 ),
-- ( 10259,37, 104.00,1, .00 ),
-- ( 10260,41, 38.50,16, .25 ),
-- ( 10260,57, 78.00,50, .00 ),
-- ( 10260,62, 197.00,15, .25 ),
-- ( 10260,70, 60.00,21, .25 ),
-- ( 10261,21, 40.00,20, .00 ),
-- ( 10261,35, 72.00,20, .00 ),
-- ( 10262,5, 85.00,12, .20 ),
-- ( 10262,7, 120.00,15, .00 ),
-- ( 10262,56, 152.00,2, .00 ),
-- ( 10263,16, 69.50,60, .25 ),
-- ( 10263,24, 18.00,28, .00 ),
-- ( 10263,30, 103.50,60, .25 ),
-- ( 10263,74, 40.00,36, .25 ),
-- ( 10264,2, 76.00,35, .00 ),
-- ( 10264,41, 38.50,25, .15 ),
-- ( 10265,17, 156.00,30, .00 ),
-- ( 10265,70, 60.00,20, .00 ),
-- ( 10266,12, 152.00,12, .05 ),
-- ( 10267,40, 73.50,50, .00 ),
-- ( 10267,59, 220.00,70, .15 ),
-- ( 10267,76, 72.00,15, .15 ),
-- ( 10268,29, 495.00,10, .00 ),
-- ( 10268,72, 139.00,4, .00 ),
-- ( 10269,33, 10.00,60, .05 ),
-- ( 10269,72, 139.00,20, .05 ),
-- ( 10270,36, 76.00,30, .00 ),
-- ( 10270,43, 184.00,25, .00 ),
-- ( 10271,33, 10.00,24, .00 ),
-- ( 10272,20, 324.00,6, .00 ),
-- ( 10272,31, 50.00,40, .00 ),
-- ( 10272,72, 139.00,24, .00 ),
-- ( 10273,10, 124.00,24, .05 ),
-- ( 10273,31, 50.00,15, .05 ),
-- ( 10273,33, 10.00,20, .00 ),
-- ( 10273,40, 73.50,60, .05 ),
-- ( 10273,76, 72.00,33, .05 ),
-- ( 10274,71, 86.00,20, .00 ),
-- ( 10274,72, 139.00,7, .00 ),
-- ( 10275,24, 18.00,12, .05 ),
-- ( 10275,59, 220.00,6, .05 ),
-- ( 10276,10, 124.00,15, .00 ),
-- ( 10276,13, 24.00,10, .00 ),
-- ( 10277,28, 182.00,20, .00 ),
-- ( 10277,62, 197.00,12, .00 ),
-- ( 10278,44, 77.50,16, .00 ),
-- ( 10278,59, 220.00,15, .00 ),
-- ( 10278,63, 175.50,8, .00 ),
-- ( 10278,73, 60.00,25, .00 ),
-- ( 10279,17, 156.00,15, .25 ),
-- ( 10280,24, 18.00,12, .00 ),
-- ( 10280,55, 96.00,20, .00 ),
-- ( 10280,75, 31.00,30, .00 ),
-- ( 10281,19, 36.50,1, .00 ),
-- ( 10281,24, 18.00,6, .00 ),
-- ( 10281,35, 72.00,4, .00 ),
-- ( 10282,30, 103.50,6, .00 ),
-- ( 10282,57, 78.00,2, .00 ),
-- ( 10283,15, 62.00,20, .00 ),
-- ( 10283,19, 36.50,18, .00 ),
-- ( 10283,60, 136.00,35, .00 ),
-- ( 10283,72, 139.00,3, .00 ),
-- ( 10284,27, 175.50,15, .25 ),
-- ( 10284,44, 77.50,21, .00 ),
-- ( 10284,60, 136.00,20, .25 ),
-- ( 10284,67, 56.00,5, .25 ),
-- ( 10285,1, 72.00,45, .20 ),
-- ( 10285,40, 73.50,40, .20 ),
-- ( 10285,53, 131.00,36, .20 ),
-- ( 10286,35, 72.00,100, .00 ),
-- ( 10286,62, 197.00,40, .00 ),
-- ( 10287,16, 69.50,40, .15 ),
-- ( 10287,34, 56.00,20, .00 ),
-- ( 10287,46, 48.00,15, .15 ),
-- ( 10288,54, 29.50,10, .10 ),
-- ( 10288,68, 50.00,3, .10 ),
-- ( 10289,3, 40.00,30, .00 ),
-- ( 10289,64, 133.00,9, .00 ),
-- ( 10290,5, 85.00,20, .00 ),
-- ( 10290,29, 495.00,15, .00 ),
-- ( 10290,49, 80.00,15, .00 ),
-- ( 10290,77, 52.00,10, .00 ),
-- ( 10291,13, 24.00,20, .10 ),
-- ( 10291,44, 77.50,24, .10 ),
-- ( 10291,51, 212.00,2, .10 ),
-- ( 10292,20, 324.00,20, .00 ),
-- ( 10293,18, 250.00,12, .00 ),
-- ( 10293,24, 18.00,10, .00 ),
-- ( 10293,63, 175.50,5, .00 ),
-- ( 10293,75, 31.00,6, .00 ),
-- ( 10294,1, 72.00,18, .00 ),
-- ( 10294,17, 156.00,15, .00 ),
-- ( 10294,43, 184.00,15, .00 ),
-- ( 10294,60, 136.00,21, .00 ),
-- ( 10294,75, 31.00,6, .00 ),
-- ( 10295,56, 152.00,4, .00 ),
-- ( 10296,11, 84.00,12, .00 ),
-- ( 10296,16, 69.50,30, .00 ),
-- ( 10296,69, 144.00,15, .00 ),
-- ( 10297,39, 72.00,60, .00 ),
-- ( 10297,72, 139.00,20, .00 ),
-- ( 10298,2, 76.00,40, .00 ),
-- ( 10298,36, 76.00,40, .25 ),
-- ( 10298,59, 220.00,30, .25 ),
-- ( 10298,62, 197.00,15, .00 ),
-- ( 10299,19, 36.50,15, .00 ),
-- ( 10299,70, 60.00,20, .00 ),
-- ( 10300,66, 68.00,30, .00 ),
-- ( 10300,68, 50.00,20, .00 ),
-- ( 10301,40, 73.50,10, .00 ),
-- ( 10301,56, 152.00,20, .00 ),
-- ( 10302,17, 156.00,40, .00 ),
-- ( 10302,28, 182.00,28, .00 ),
-- ( 10302,43, 184.00,12, .00 ),
-- ( 10303,40, 73.50,40, .10 ),
-- ( 10303,65, 84.00,30, .10 ),
-- ( 10303,68, 50.00,15, .10 ),
-- ( 10304,49, 80.00,30, .00 ),
-- ( 10304,59, 220.00,10, .00 ),
-- ( 10304,71, 86.00,2, .00 ),
-- ( 10305,18, 250.00,25, .10 ),
-- ( 10305,29, 495.00,25, .10 ),
-- ( 10305,39, 72.00,30, .10 ),
-- ( 10306,30, 103.50,10, .00 ),
-- ( 10306,53, 131.00,10, .00 ),
-- ( 10306,54, 29.50,5, .00 ),
-- ( 10307,62, 197.00,10, .00 ),
-- ( 10307,68, 50.00,3, .00 ),
-- ( 10308,69, 144.00,1, .00 ),
-- ( 10308,70, 60.00,5, .00 ),
-- ( 10309,4, 88.00,20, .00 ),
-- ( 10309,6, 100.00,30, .00 ),
-- ( 10309,42, 56.00,2, .00 ),
-- ( 10309,43, 184.00,20, .00 ),
-- ( 10309,71, 86.00,3, .00 ),
-- ( 10310,16, 69.50,10, .00 ),
-- ( 10310,62, 197.00,5, .00 ),
-- ( 10311,42, 56.00,6, .00 ),
-- ( 10311,69, 144.00,7, .00 ),
-- ( 10312,28, 182.00,4, .00 ),
-- ( 10312,43, 184.00,24, .00 ),
-- ( 10312,53, 131.00,20, .00 ),
-- ( 10312,75, 31.00,10, .00 ),
-- ( 10313,36, 76.00,12, .00 ),
-- ( 10314,32, 128.00,40, .10 ),
-- ( 10314,58, 53.00,30, .10 ),
-- ( 10314,62, 197.00,25, .10 ),
-- ( 10315,34, 56.00,14, .00 ),
-- ( 10315,70, 60.00,30, .00 ),
-- ( 10316,41, 38.50,10, .00 ),
-- ( 10316,62, 197.00,70, .00 ),
-- ( 10317,1, 72.00,20, .00 ),
-- ( 10318,41, 38.50,20, .00 ),
-- ( 10318,76, 72.00,6, .00 ),
-- ( 10319,17, 156.00,8, .00 ),
-- ( 10319,28, 182.00,14, .00 ),
-- ( 10319,76, 72.00,30, .00 ),
-- ( 10320,71, 86.00,30, .00 ),
-- ( 10321,35, 72.00,10, .00 ),
-- ( 10322,52, 28.00,20, .00 ),
-- ( 10323,15, 62.00,5, .00 ),
-- ( 10323,25, 56.00,4, .00 ),
-- ( 10323,39, 72.00,4, .00 ),
-- ( 10324,16, 69.50,21, .15 ),
-- ( 10324,35, 72.00,70, .15 ),
-- ( 10324,46, 48.00,30, .00 ),
-- ( 10324,59, 220.00,40, .15 ),
-- ( 10324,63, 175.50,80, .15 ),
-- ( 10325,6, 100.00,6, .00 ),
-- ( 10325,13, 24.00,12, .00 ),
-- ( 10325,14, 93.00,9, .00 ),
-- ( 10325,31, 50.00,4, .00 ),
-- ( 10325,72, 139.00,40, .00 ),
-- ( 10326,4, 88.00,24, .00 ),
-- ( 10326,57, 78.00,16, .00 ),
-- ( 10326,75, 31.00,50, .00 ),
-- ( 10327,2, 76.00,25, .20 ),
-- ( 10327,11, 84.00,50, .20 ),
-- ( 10327,30, 103.50,35, .20 ),
-- ( 10327,58, 53.00,30, .20 ),
-- ( 10328,59, 220.00,9, .00 ),
-- ( 10328,65, 84.00,40, .00 ),
-- ( 10328,68, 50.00,10, .00 ),
-- ( 10329,19, 36.50,10, .05 ),
-- ( 10329,30, 103.50,8, .05 ),
-- ( 10329,38, 1054.00,20, .05 ),
-- ( 10329,56, 152.00,12, .05 ),
-- ( 10330,26, 124.50,50, .15 ),
-- ( 10330,72, 139.00,25, .15 ),
-- ( 10331,54, 29.50,15, .00 ),
-- ( 10332,18, 250.00,40, .20 ),
-- ( 10332,42, 56.00,10, .20 ),
-- ( 10332,47, 38.00,16, .20 ),
-- ( 10333,14, 93.00,10, .00 ),
-- ( 10333,21, 40.00,10, .10 ),
-- ( 10333,71, 86.00,40, .10 ),
-- ( 10334,52, 28.00,8, .00 ),
-- ( 10334,68, 50.00,10, .00 ),
-- ( 10335,2, 76.00,7, .20 ),
-- ( 10335,31, 50.00,25, .20 ),
-- ( 10335,32, 128.00,6, .20 ),
-- ( 10335,51, 212.00,48, .20 ),
-- ( 10336,4, 88.00,18, .10 ),
-- ( 10337,23, 36.00,40, .00 ),
-- ( 10337,26, 124.50,24, .00 ),
-- ( 10337,36, 76.00,20, .00 ),
-- ( 10337,37, 104.00,28, .00 ),
-- ( 10337,72, 139.00,25, .00 ),
-- ( 10338,17, 156.00,20, .00 ),
-- ( 10338,30, 103.50,15, .00 ),
-- ( 10339,4, 88.00,10, .00 ),
-- ( 10339,17, 156.00,70, .05 ),
-- ( 10339,62, 197.00,28, .00 ),
-- ( 10340,18, 250.00,20, .05 ),
-- ( 10340,41, 38.50,12, .05 ),
-- ( 10340,43, 184.00,40, .05 ),
-- ( 10341,33, 10.00,8, .00 ),
-- ( 10341,59, 220.00,9, .15 ),
-- ( 10342,2, 76.00,24, .20 ),
-- ( 10342,31, 50.00,56, .20 ),
-- ( 10342,36, 76.00,40, .20 ),
-- ( 10342,55, 96.00,40, .20 ),
-- ( 10343,64, 133.00,50, .00 ),
-- ( 10343,68, 50.00,4, .05 ),
-- ( 10343,76, 72.00,15, .00 ),
-- ( 10344,4, 88.00,35, .00 ),
-- ( 10344,8, 160.00,70, .25 ),
-- ( 10345,8, 160.00,70, .00 ),
-- ( 10345,19, 36.50,80, .00 ),
-- ( 10345,42, 56.00,9, .00 ),
-- ( 10346,17, 156.00,36, .10 ),
-- ( 10346,56, 152.00,20, .00 ),
-- ( 10347,25, 56.00,10, .00 ),
-- ( 10347,39, 72.00,50, .15 ),
-- ( 10347,40, 73.50,4, .00 ),
-- ( 10347,75, 31.00,6, .15 ),
-- ( 10348,1, 72.00,15, .15 ),
-- ( 10348,23, 36.00,25, .00 ),
-- ( 10349,54, 29.50,24, .00 ),
-- ( 10350,50, 65.00,15, .10 ),
-- ( 10350,69, 144.00,18, .10 ),
-- ( 10351,38, 1054.00,20, .05 ),
-- ( 10351,41, 38.50,13, .00 ),
-- ( 10351,44, 77.50,77, .05 ),
-- ( 10351,65, 84.00,10, .05 ),
-- ( 10352,24, 18.00,10, .00 ),
-- ( 10352,54, 29.50,20, .15 ),
-- ( 10353,11, 84.00,12, .20 ),
-- ( 10353,38, 1054.00,50, .20 ),
-- ( 10354,1, 72.00,12, .00 ),
-- ( 10354,29, 495.00,4, .00 ),
-- ( 10355,24, 18.00,25, .00 ),
-- ( 10355,57, 78.00,25, .00 ),
-- ( 10356,31, 50.00,30, .00 ),
-- ( 10356,55, 96.00,12, .00 ),
-- ( 10356,69, 144.00,20, .00 ),
-- ( 10357,10, 124.00,30, .20 ),
-- ( 10357,26, 124.50,16, .00 ),
-- ( 10357,60, 136.00,8, .20 ),
-- ( 10358,24, 18.00,10, .05 ),
-- ( 10358,34, 56.00,10, .05 ),
-- ( 10358,36, 76.00,20, .05 ),
-- ( 10359,16, 69.50,56, .05 ),
-- ( 10359,31, 50.00,70, .05 ),
-- ( 10359,60, 136.00,80, .05 ),
-- ( 10360,28, 182.00,30, .00 ),
-- ( 10360,29, 495.00,35, .00 ),
-- ( 10360,38, 1054.00,10, .00 ),
-- ( 10360,49, 80.00,35, .00 ),
-- ( 10360,54, 29.50,28, .00 ),
-- ( 10361,39, 72.00,54, .10 ),
-- ( 10361,60, 136.00,55, .10 ),
-- ( 10362,25, 56.00,50, .00 ),
-- ( 10362,51, 212.00,20, .00 ),
-- ( 10362,54, 29.50,24, .00 ),
-- ( 10363,31, 50.00,20, .00 ),
-- ( 10363,75, 31.00,12, .00 ),
-- ( 10363,76, 72.00,12, .00 ),
-- ( 10364,69, 144.00,30, .00 ),
-- ( 10364,71, 86.00,5, .00 ),
-- ( 10365,11, 84.00,24, .00 ),
-- ( 10366,65, 84.00,5, .00 ),
-- ( 10366,77, 52.00,5, .00 ),
-- ( 10367,34, 56.00,36, .00 ),
-- ( 10367,54, 29.50,18, .00 ),
-- ( 10367,65, 84.00,15, .00 ),
-- ( 10367,77, 52.00,7, .00 ),
-- ( 10368,21, 40.00,5, .10 ),
-- ( 10368,28, 182.00,13, .10 ),
-- ( 10368,57, 78.00,25, .00 ),
-- ( 10368,64, 133.00,35, .10 ),
-- ( 10369,29, 495.00,20, .00 ),
-- ( 10369,56, 152.00,18, .25 ),
-- ( 10370,1, 72.00,15, .15 ),
-- ( 10370,64, 133.00,30, .00 ),
-- ( 10370,74, 40.00,20, .15 ),
-- ( 10371,36, 76.00,6, .20 ),
-- ( 10372,20, 324.00,12, .25 ),
-- ( 10372,38, 1054.00,40, .25 ),
-- ( 10372,60, 136.00,70, .25 ),
-- ( 10372,72, 139.00,42, .25 ),
-- ( 10373,58, 53.00,80, .20 ),
-- ( 10373,71, 86.00,50, .20 ),
-- ( 10374,31, 50.00,30, .00 ),
-- ( 10374,58, 53.00,15, .00 ),
-- ( 10375,14, 93.00,15, .00 ),
-- ( 10375,54, 29.50,10, .00 ),
-- ( 10376,31, 50.00,42, .05 ),
-- ( 10377,28, 182.00,20, .15 ),
-- ( 10377,39, 72.00,20, .15 ),
-- ( 10378,71, 86.00,6, .00 ),
-- ( 10379,41, 38.50,8, .10 ),
-- ( 10379,63, 175.50,16, .10 ),
-- ( 10379,65, 84.00,20, .10 ),
-- ( 10380,30, 103.50,18, .10 ),
-- ( 10380,53, 131.00,20, .10 ),
-- ( 10380,60, 136.00,6, .10 ),
-- ( 10380,70, 60.00,30, .00 ),
-- ( 10381,74, 40.00,14, .00 ),
-- ( 10382,5, 85.00,32, .00 ),
-- ( 10382,18, 250.00,9, .00 ),
-- ( 10382,29, 495.00,14, .00 ),
-- ( 10382,33, 10.00,60, .00 ),
-- ( 10382,74, 40.00,50, .00 ),
-- ( 10383,13, 24.00,20, .00 ),
-- (10383, 50, 65.00, 15, 0.00),
-- (10383, 56, 152.00, 20, 0.00),
-- (10384, 20, 324.00, 28, 0.00),
-- (10384, 60, 136.00, 15, 0.00),
-- (10385, 7, 120.00, 10, 0.20),
-- (10385, 60, 136.00, 20, 0.20),
-- (10385, 68, 50.00, 8, 0.20),
-- (10386, 24, 18.00, 15, 0.00),
-- (10386, 34, 56.00, 10, 0.00),
-- (10387, 24, 18.00, 15, 0.00),
-- (10387, 28, 182.00, 6, 0.00),
-- (10387, 59, 220.00, 12, 0.00),
-- (10387, 71, 86.00, 15, 0.00),
-- (10388, 45, 38.00, 15, 0.20),
-- (10388, 52, 28.00, 20, 0.20),
-- (10388, 53, 131.00, 40, 0.00),
-- (10389, 10, 124.00, 16, 0.00),
-- (10389, 55, 96.00, 15, 0.00),
-- (10389, 62, 197.00, 20, 0.00),
-- (10389, 70, 60.00, 30, 0.00),
-- (10390, 31, 50.00, 60, 0.10),
-- (10390, 35, 72.00, 40, 0.10),
-- (10390, 46, 48.00, 45, 0.00),
-- (10390, 72, 139.00, 24, 0.10),
-- (10391, 13, 24.00, 18, 0.00),
-- (10392, 69, 144.00, 50, 0.00),
-- (10393, 2, 76.00, 25, 0.25),
-- (10393, 14, 93.00, 42, 0.25),
-- (10393, 25, 56.00, 7, 0.25),
-- (10393, 26, 124.50, 70, 0.25),
-- (10393, 31, 50.00, 32, 0.00),
-- (10394, 13, 24.00, 10, 0.00),
-- (10394, 62, 197.00, 10, 0.00),
-- (10395, 46, 48.00, 28, 0.10),
-- (10395, 53, 131.00, 70, 0.10),
-- (10395, 69, 144.00, 8, 0.00),
-- (10396, 23, 36.00, 40, 0.00),
-- (10396, 71, 86.00, 60, 0.00),
-- (10396, 72, 139.00, 21, 0.00),
-- (10397, 21, 40.00, 10, 0.15),
-- (10397, 51, 212.00, 18, 0.15),
-- (10398, 35, 72.00, 30, 0.00),
-- (10398, 55, 96.00, 120, 0.10),
-- (10399, 68, 50.00, 60, 0.00),
-- (10399, 71, 86.00, 30, 0.00),
-- (10399, 76, 72.00, 35, 0.00),
-- (10399, 77, 52.00, 14, 0.00),
-- (10400, 29, 495.00, 21, 0.00),
-- (10400, 35, 72.00, 35, 0.00),
-- (10400, 49, 80.00, 30, 0.00),
-- (10401, 30, 103.50, 18, 0.00),
-- (10401, 56, 152.00, 70, 0.00),
-- (10401, 65, 84.00, 20, 0.00),
-- (10401, 71, 86.00, 60, 0.00),
-- (10402, 23, 36.00, 60, 0.00),
-- (10402, 63, 175.50, 65, 0.00),
-- (10403, 16, 69.50, 21, 0.15),
-- (10403, 48, 51.00, 70, 0.15),
-- (10404, 26, 124.50, 30, 0.05),
-- (10404, 42, 56.00, 40, 0.05),
-- (10404, 49, 80.00, 30, 0.05),
-- (10405, 3, 40.00, 50, 0.00),
-- (10406, 1, 72.00, 10, 0.00),
-- (10406, 21, 40.00, 30, 0.10),
-- (10406, 28, 182.00, 42, 0.10),
-- (10406, 36, 76.00, 5, 0.10),
-- (10406, 40, 73.50, 2, 0.10),
-- (10407, 11, 84.00, 30, 0.00),
-- (10407, 69, 144.00, 15, 0.00),
-- (10407, 71, 86.00, 15, 0.00),
-- (10408, 37, 104.00, 10, 0.00),
-- (10408, 54, 29.50, 6, 0.00),
-- (10408, 62, 197.00, 35, 0.00),
-- (10409, 14, 93.00, 12, 0.00),
-- (10409, 21, 40.00, 12, 0.00),
-- (10410, 33, 10.00, 49, 0.00),
-- (10410, 59, 220.00, 16, 0.00),
-- (10411, 41, 38.50, 25, 0.20),
-- (10411, 44, 77.50, 40, 0.20),
-- (10411, 59, 220.00, 9, 0.20),
-- (10412, 14, 93.00, 20, 0.10),
-- (10413, 1, 72.00, 24, 0.00),
-- (10413, 62, 197.00, 40, 0.00),
-- (10413, 76, 72.00, 14, 0.00),
-- (10414, 19, 36.50, 18, 0.05),
-- (10414, 33, 10.00, 50, 0.00),
-- (10415, 17, 156.00, 2, 0.00),
-- (10415, 33, 10.00, 20, 0.00),
-- (10416, 19, 36.50, 20, 0.00),
-- (10416, 53, 131.00, 10, 0.00),
-- (10416, 57, 78.00, 20, 0.00),
-- (10417, 38, 1054.00, 50, 0.00),
-- (10417, 46, 48.00, 2, 0.25),
-- (10417, 68, 50.00, 36, 0.25),
-- (10417, 77, 52.00, 35, 0.00),
-- (10418, 2, 76.00, 60, 0.00),
-- (10418, 47, 38.00, 55, 0.00),
-- (10418, 61, 114.00, 16, 0.00),
-- (10418, 74, 40.00, 15, 0.00),
-- (10419, 60, 136.00, 60, 0.05),
-- (10419, 69, 144.00, 20, 0.05),
-- (10420, 9, 388.00, 20, 0.10),
-- (10420, 13, 24.00, 2, 0.10),
-- (10420, 70, 60.00, 8, 0.10),
-- (10420, 73, 60.00, 20, 0.10),
-- (10421, 19, 36.50, 4, 0.15),
-- (10421, 26, 124.50, 30, 0.00),
-- (10421, 53, 131.00, 15, 0.15),
-- (10421, 77, 52.00, 10, 0.15),
-- (10422, 26, 124.50, 2, 0.00),
-- (10423, 31, 50.00, 14, 0.00),
-- (10423, 59, 220.00, 20, 0.00),
-- (10424, 35, 72.00, 60, 0.20),
-- (10424, 38, 1054.00, 49, 0.20),
-- (10424, 68, 50.00, 30, 0.20),
-- (10425, 55, 96.00, 10, 0.25),
-- (10425, 76, 72.00, 20, 0.25),
-- (10426, 56, 152.00, 5, 0.00),
-- (10426, 64, 133.00, 7, 0.00),
-- (10427, 14, 93.00, 35, 0.00),
-- (10428, 46, 48.00, 20, 0.00),
-- (10429, 50, 65.00, 40, 0.00),
-- (10429, 63, 175.50, 35, 0.25),
-- (10430, 17, 156.00, 45, 0.20),
-- (10430, 21, 40.00, 50, 0.00),
-- (10430, 56, 152.00, 30, 0.00),
-- (10430, 59, 220.00, 70, 0.20),
-- (10431, 17, 156.00, 50, 0.25),
-- (10431, 40, 73.50, 50, 0.25),
-- (10431, 47, 38.00, 30, 0.25),
-- (10432, 26, 124.50, 10, 0.00),
-- (10432, 54, 29.50, 40, 0.00),
-- (10433, 56, 152.00, 28, 0.00),
-- (10434, 11, 84.00, 6, 0.00),
-- (10434, 76, 72.00, 18, 0.15),
-- (10435, 2, 76.00, 10, 0.00),
-- (10435, 22, 84.00, 12, 0.00),
-- (10435, 72, 139.00, 10, 0.00),
-- (10436, 46, 48.00, 5, 0.00),
-- (10436, 56, 152.00, 40, 0.10),
-- (10436, 64, 133.00, 30, 0.10),
-- (10436, 75, 31.00, 24, 0.10),
-- (10437, 53, 131.00, 15, 0.00),
-- (10438, 19, 36.50, 15, 0.20),
-- (10438, 34, 56.00, 20, 0.20),
-- (10438, 57, 78.00, 15, 0.20),
-- (10439, 12, 152.00, 15, 0.00),
-- (10439, 16, 69.50, 16, 0.00),
-- (10439, 64, 133.00, 6, 0.00),
-- (10439, 74, 40.00, 30, 0.00),
INSERT INTO ORDER_DETAILS  VALUES ( 10440,2, 76.00,45, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10440,16, 69.50,49, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10440,29, 495.00,24, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10440,61, 114.00,90, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10441,27, 175.50,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10442,11, 84.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10442,54, 29.50,80, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10442,66, 68.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10443,11, 84.00,6, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10443,28, 182.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10444,17, 156.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10444,26, 124.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10444,35, 72.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10444,41, 38.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10445,39, 72.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10445,54, 29.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10446,19, 36.50,12, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10446,24, 18.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10446,31, 50.00,3, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10446,52, 28.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10447,19, 36.50,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10447,65, 84.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10447,71, 86.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10448,26, 124.50,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10448,40, 73.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10449,10, 124.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10449,52, 28.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10449,62, 197.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10450,10, 124.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10450,54, 29.50,6, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10451,55, 96.00,120, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10451,64, 133.00,35, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10451,65, 84.00,28, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10451,77, 52.00,55, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10452,28, 182.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10452,44, 77.50,100, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10453,48, 51.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10453,70, 60.00,25, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10454,16, 69.50,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10454,33, 10.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10454,46, 48.00,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10455,39, 72.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10455,53, 131.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10455,61, 114.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10455,71, 86.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10456,21, 40.00,40, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10456,49, 80.00,21, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10457,59, 220.00,36, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10458,26, 124.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10458,28, 182.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10458,43, 184.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10458,56, 152.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10458,71, 86.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10459,7, 120.00,16, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10459,46, 48.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10459,72, 139.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10460,68, 50.00,21, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10460,75, 31.00,4, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10461,21, 40.00,40, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10461,30, 103.50,28, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10461,55, 96.00,60, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10462,13, 24.00,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10462,23, 36.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10463,19, 36.50,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10463,42, 56.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10464,4, 88.00,16, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10464,43, 184.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10464,56, 152.00,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10464,60, 136.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10465,24, 18.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10465,29, 495.00,18, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10465,40, 73.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10465,45, 38.00,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10465,50, 65.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10466,11, 84.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10466,46, 48.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10467,24, 18.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10467,25, 56.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10468,30, 103.50,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10468,43, 184.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10469,2, 76.00,40, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10469,16, 69.50,35, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10469,44, 77.50,2, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10470,18, 250.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10470,23, 36.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10470,64, 133.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10471,7, 120.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10471,56, 152.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10472,24, 18.00,80, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10472,51, 212.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10473,33, 10.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10473,71, 86.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10474,14, 93.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10474,28, 182.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10474,40, 73.50,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10474,75, 31.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10475,31, 50.00,35, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10475,66, 68.00,60, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10475,76, 72.00,42, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10476,55, 96.00,2, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10476,70, 60.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10477,1, 72.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10477,21, 40.00,21, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10477,39, 72.00,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10478,10, 124.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10479,38, 1054.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10479,53, 131.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10479,59, 220.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10479,64, 133.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10480,47, 38.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10480,59, 220.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10481,49, 80.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10481,60, 136.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10482,40, 73.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10483,34, 56.00,35, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10483,77, 52.00,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10484,21, 40.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10484,40, 73.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10484,51, 212.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10485,2, 76.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10485,3, 40.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10485,55, 96.00,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10485,70, 60.00,60, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10486,11, 84.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10486,51, 212.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10486,74, 40.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10487,19, 36.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10487,26, 124.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10487,54, 29.50,24, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10488,59, 220.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10488,73, 60.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10489,11, 84.00,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10489,16, 69.50,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10490,59, 220.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10490,68, 50.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10490,75, 31.00,36, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10491,44, 77.50,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10491,77, 52.00,7, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10492,25, 56.00,60, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10492,42, 56.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10493,65, 84.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10493,66, 68.00,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10493,69, 144.00,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10494,56, 152.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10495,23, 36.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10495,41, 38.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10495,77, 52.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10496,31, 50.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10497,56, 152.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10497,72, 139.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10497,77, 52.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10498,24, 22.50,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10498,40, 92.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10498,42, 70.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10499,28, 228.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10499,49, 100.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10500,15, 77.50,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10500,28, 228.00,8, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10501,54, 37.25,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10502,45, 47.50,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10502,53, 164.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10502,67, 70.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10503,14, 116.25,70, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10503,65, 105.25,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10504,2, 95.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10504,21, 50.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10504,53, 164.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10504,61, 142.50,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10505,62, 246.50,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10506,25, 70.00,18, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10506,70, 75.00,14, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10507,43, 230.00,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10507,48, 63.75,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10508,13, 30.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10508,39, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10509,28, 228.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10510,29, 618.95,36, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10510,75, 38.75,36, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10511,4, 110.00,50, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10511,7, 150.00,50, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10511,8, 200.00,10, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10512,24, 22.50,10, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10512,46, 60.00,9, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10512,47, 47.50,6, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10512,60, 170.00,12, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10513,21, 50.00,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10513,32, 160.00,50, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10513,61, 142.50,15, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10514,20, 405.00,39, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10514,28, 228.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10514,56, 190.00,70, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10514,65, 105.25,39, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10514,75, 38.75,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10515,9, 485.00,16, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10515,16, 87.25,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10515,27, 219.50,120, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10515,33, 12.50,16, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10515,60, 170.00,84, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10516,18, 312.50,25, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10516,41, 48.25,80, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10516,42, 70.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10517,52, 35.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10517,59, 275.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10517,70, 75.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10518,24, 22.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10518,38, 1317.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10518,44, 97.25,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10519,10, 155.00,16, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10519,56, 190.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10519,60, 170.00,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10520,24, 22.50,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10520,53, 164.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10521,35, 90.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10521,41, 48.25,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10521,68, 62.50,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10522,1, 90.00,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10522,8, 200.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10522,30, 129.45,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10522,40, 92.00,25, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10523,17, 195.00,25, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10523,20, 405.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10523,37, 130.00,18, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10523,41, 48.25,6, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10524,10, 155.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10524,30, 129.45,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10524,43, 230.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10524,54, 37.25,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10525,36, 95.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10525,40, 92.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10526,1, 90.00,8, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10526,13, 30.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10526,56, 190.00,30, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10527,4, 110.00,50, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10527,36, 95.00,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10528,11, 105.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10528,33, 12.50,8, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10528,72, 174.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10529,55, 120.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10529,68, 62.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10529,69, 180.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10530,17, 195.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10530,43, 230.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10530,61, 142.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10530,76, 90.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10531,59, 275.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10532,30, 129.45,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10532,66, 85.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10533,4, 110.00,50, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10533,72, 174.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10533,73, 75.00,24, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10534,30, 129.45,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10534,40, 92.00,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10534,54, 37.25,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10535,11, 105.00,50, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10535,40, 92.00,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10535,57, 97.50,5, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10535,59, 275.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10536,12, 190.00,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10536,31, 62.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10536,33, 12.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10536,60, 170.00,35, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10537,31, 62.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10537,51, 265.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10537,58, 66.25,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10537,72, 174.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10537,73, 75.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10538,70, 75.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10538,72, 174.00,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10539,13, 30.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10539,21, 50.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10539,33, 12.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10539,49, 100.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10540,3, 50.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10540,26, 156.15,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10540,38, 1317.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10540,68, 62.50,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10541,24, 22.50,35, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10541,38, 1317.50,4, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10541,65, 105.25,36, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10541,71, 107.50,9, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10542,11, 105.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10542,54, 37.25,24, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10543,12, 190.00,30, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10543,23, 45.00,70, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10544,28, 228.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10544,67, 70.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10545,11, 105.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10546,7, 150.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10546,35, 90.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10546,62, 246.50,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10547,32, 160.00,24, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10547,36, 95.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10548,34, 70.00,10, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10548,41, 48.25,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10549,31, 62.50,55, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10549,45, 47.50,100, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10549,51, 265.00,48, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10550,17, 195.00,8, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10550,19, 46.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10550,21, 50.00,6, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10550,61, 142.50,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10551,16, 87.25,40, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10551,35, 90.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10551,44, 97.25,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10552,69, 180.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10552,75, 38.75,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10553,11, 105.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10553,16, 87.25,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10553,22, 105.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10553,31, 62.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10553,35, 90.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10554,16, 87.25,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10554,23, 45.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10554,62, 246.50,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10554,77, 65.00,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10555,14, 116.25,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10555,19, 46.00,35, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10555,24, 22.50,18, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10555,51, 265.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10555,56, 190.00,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10556,72, 174.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10557,64, 166.25,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10557,75, 38.75,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10558,47, 47.50,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10558,51, 265.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10558,52, 35.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10558,53, 164.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10558,73, 75.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10559,41, 48.25,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10559,55, 120.00,18, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10560,30, 129.45,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10560,62, 246.50,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10561,44, 97.25,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10561,51, 265.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10562,33, 12.50,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10562,62, 246.50,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10563,36, 95.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10563,52, 35.00,70, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10564,17, 195.00,16, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10564,31, 62.50,6, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10564,55, 120.00,25, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10565,24, 22.50,25, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10565,64, 166.25,18, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10566,11, 105.00,35, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10566,18, 312.50,18, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10566,76, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10567,31, 62.50,60, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10567,51, 265.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10567,59, 275.00,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10568,10, 155.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10569,31, 62.50,35, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10569,76, 90.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10570,11, 105.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10570,56, 190.00,60, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10571,14, 116.25,11, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10571,42, 70.00,28, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10572,16, 87.25,12, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10572,32, 160.00,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10572,40, 92.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10572,75, 38.75,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10573,17, 195.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10573,34, 70.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10573,53, 164.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10574,33, 12.50,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10574,40, 92.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10574,62, 246.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10574,64, 166.25,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10575,59, 275.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10575,63, 219.50,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10575,72, 174.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10575,76, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10576,1, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10576,31, 62.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10576,44, 97.25,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10577,39, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10577,75, 38.75,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10577,77, 65.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10578,35, 90.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10578,57, 97.50,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10579,15, 77.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10579,75, 38.75,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10580,14, 116.25,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10580,41, 48.25,9, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10580,65, 105.25,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10581,75, 38.75,50, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10582,57, 97.50,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10582,76, 90.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10583,29, 618.95,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10583,60, 170.00,24, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10583,69, 180.00,10, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10584,31, 62.50,50, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10585,47, 47.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10586,52, 35.00,4, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10587,26, 156.15,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10587,35, 90.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10587,77, 65.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10588,18, 312.50,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10588,42, 70.00,100, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10589,35, 90.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10590,1, 90.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10590,77, 65.00,60, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10591,3, 50.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10591,7, 150.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10591,54, 37.25,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10592,15, 77.50,25, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10592,26, 156.15,5, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10593,20, 405.00,21, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10593,69, 180.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10593,76, 90.00,4, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10594,52, 35.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10594,58, 66.25,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10595,35, 90.00,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10595,61, 142.50,120, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10595,69, 180.00,65, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10596,56, 190.00,5, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10596,63, 219.50,24, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10596,75, 38.75,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10597,24, 22.50,35, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10597,57, 97.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10597,65, 105.25,12, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10598,27, 219.50,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10598,71, 107.50,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10599,62, 246.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10600,54, 37.25,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10600,73, 75.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10601,13, 30.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10601,59, 275.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10602,77, 65.00,5, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10603,22, 105.00,48, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10603,49, 100.00,25, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10604,48, 63.75,6, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10604,76, 90.00,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10605,16, 87.25,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10605,59, 275.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10605,60, 170.00,70, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10605,71, 107.50,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10606,4, 110.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10606,55, 120.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10606,62, 246.50,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10607,7, 150.00,45, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10607,17, 195.00,100, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10607,33, 12.50,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10607,40, 92.00,42, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10607,72, 174.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10608,56, 190.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10609,1, 90.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10609,10, 155.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10609,21, 50.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10610,36, 95.00,21, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10611,1, 90.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10611,2, 95.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10611,60, 170.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10612,10, 155.00,70, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10612,36, 95.00,55, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10612,49, 100.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10612,60, 170.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10612,76, 90.00,80, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10613,13, 30.00,8, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10613,75, 38.75,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10614,11, 105.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10614,21, 50.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10614,39, 90.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10615,55, 120.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10616,38, 1317.50,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10616,56, 190.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10616,70, 75.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10616,71, 107.50,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10617,59, 275.00,30, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10618,6, 125.00,70, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10618,56, 190.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10618,68, 62.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10619,21, 50.00,42, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10619,22, 105.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10620,24, 22.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10620,52, 35.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10621,19, 46.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10621,23, 45.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10621,70, 75.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10621,71, 107.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10622,2, 95.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10622,68, 62.50,18, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10623,14, 116.25,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10623,19, 46.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10623,21, 50.00,25, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10623,24, 22.50,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10623,35, 90.00,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10624,28, 228.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10624,29, 618.95,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10624,44, 97.25,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10625,14, 116.25,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10625,42, 70.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10625,60, 170.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10626,53, 164.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10626,60, 170.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10626,71, 107.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10627,62, 246.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10627,73, 75.00,35, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10628,1, 90.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10629,29, 618.95,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10629,64, 166.25,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10630,55, 120.00,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10630,76, 90.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10631,75, 38.75,8, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10632,2, 95.00,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10632,33, 12.50,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10633,12, 190.00,36, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10633,13, 30.00,13, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10633,26, 156.15,35, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10633,62, 246.50,80, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10634,7, 150.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10634,18, 312.50,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10634,51, 265.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10634,75, 38.75,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10635,4, 110.00,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10635,5, 106.75,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10635,22, 105.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10636,4, 110.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10636,58, 66.25,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10637,11, 105.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10637,50, 81.25,25, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10637,56, 190.00,60, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10638,45, 47.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10638,65, 105.25,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10638,72, 174.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10639,18, 312.50,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10640,69, 180.00,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10640,70, 75.00,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10641,2, 95.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10641,40, 92.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10642,21, 50.00,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10642,61, 142.50,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10643,28, 228.00,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10643,39, 90.00,21, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10643,46, 60.00,2, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10644,18, 312.50,4, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10644,43, 230.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10644,46, 60.00,21, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10645,18, 312.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10645,36, 95.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10646,1, 90.00,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10646,10, 155.00,18, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10646,71, 107.50,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10646,77, 65.00,35, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10647,19, 46.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10647,39, 90.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10648,22, 105.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10648,24, 22.50,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10649,28, 228.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10649,72, 174.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10650,30, 129.45,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10650,53, 164.00,25, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10650,54, 37.25,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10651,19, 46.00,12, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10651,22, 105.00,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10652,30, 129.45,2, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10652,42, 70.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10653,16, 87.25,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10653,60, 170.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10654,4, 110.00,12, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10654,39, 90.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10654,54, 37.25,6, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10655,41, 48.25,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10656,14, 116.25,3, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10656,44, 97.25,28, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10656,47, 47.50,6, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10657,15, 77.50,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10657,41, 48.25,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10657,46, 60.00,45, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10657,47, 47.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10657,56, 190.00,45, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10657,60, 170.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10658,21, 50.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10658,40, 92.00,70, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10658,60, 170.00,55, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10658,77, 65.00,70, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10659,31, 62.50,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10659,40, 92.00,24, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10659,70, 75.00,40, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10660,20, 405.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10661,39, 90.00,3, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10661,58, 66.25,49, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10662,68, 62.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10663,40, 92.00,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10663,42, 70.00,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10663,51, 265.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10664,10, 155.00,24, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10664,56, 190.00,12, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10664,65, 105.25,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10665,51, 265.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10665,59, 275.00,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10665,76, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10666,29, 618.95,36, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10666,65, 105.25,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10667,69, 180.00,45, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10667,71, 107.50,14, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10668,31, 62.50,8, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10668,55, 120.00,4, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10668,64, 166.25,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10669,36, 95.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10670,23, 45.00,32, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10670,46, 60.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10670,67, 70.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10670,73, 75.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10670,75, 38.75,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10671,16, 87.25,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10671,62, 246.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10671,65, 105.25,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10672,38, 1317.50,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10672,71, 107.50,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10673,16, 87.25,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10673,42, 70.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10673,43, 230.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10674,23, 45.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10675,14, 116.25,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10675,53, 164.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10675,58, 66.25,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10676,10, 155.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10676,19, 46.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10676,44, 97.25,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10677,26, 156.15,30, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10677,33, 12.50,8, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10678,12, 190.00,100, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10678,33, 12.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10678,41, 48.25,120, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10678,54, 37.25,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10679,59, 275.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10680,16, 87.25,50, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10680,31, 62.50,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10680,42, 70.00,40, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10681,19, 46.00,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10681,21, 50.00,12, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10681,64, 166.25,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10682,33, 12.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10682,66, 85.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10682,75, 38.75,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10683,52, 35.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10684,40, 92.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10684,47, 47.50,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10684,60, 170.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10685,10, 155.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10685,41, 48.25,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10685,47, 47.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10686,17, 195.00,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10686,26, 156.15,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10687,9, 485.00,50, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10687,29, 618.95,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10687,36, 95.00,6, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10688,10, 155.00,18, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10688,28, 228.00,60, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10688,34, 70.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10689,1, 90.00,35, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10690,56, 190.00,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10690,77, 65.00,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10691,1, 90.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10691,29, 618.95,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10691,43, 230.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10691,44, 97.25,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10691,62, 246.50,48, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10692,63, 219.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10693,9, 485.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10693,54, 37.25,60, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10693,69, 180.00,30, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10693,73, 75.00,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10694,7, 150.00,90, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10694,59, 275.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10694,70, 75.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10695,8, 200.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10695,12, 190.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10695,24, 22.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10696,17, 195.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10696,46, 60.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10697,19, 46.00,7, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10697,35, 90.00,9, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10697,58, 66.25,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10697,70, 75.00,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10698,11, 105.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10698,17, 195.00,8, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10698,29, 618.95,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10698,65, 105.25,65, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10698,70, 75.00,8, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10699,47, 47.50,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10700,1, 90.00,5, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10700,34, 70.00,12, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10700,68, 62.50,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10700,71, 107.50,60, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10701,59, 275.00,42, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10701,71, 107.50,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10701,76, 90.00,35, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10702,3, 50.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10702,76, 90.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10703,2, 95.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10703,59, 275.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10703,73, 75.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10704,4, 110.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10704,24, 22.50,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10704,48, 63.75,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10705,31, 62.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10705,32, 160.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10706,16, 87.25,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10706,43, 230.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10706,59, 275.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10707,55, 120.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10707,57, 97.50,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10707,70, 75.00,28, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10708,5, 106.75,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10708,36, 95.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10709,8, 200.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10709,51, 265.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10709,60, 170.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10710,19, 46.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10710,47, 47.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10711,19, 46.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10711,41, 48.25,42, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10711,53, 164.00,120, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10712,53, 164.00,3, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10712,56, 190.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10713,10, 155.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10713,26, 156.15,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10713,45, 47.50,110, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10713,46, 60.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10714,2, 95.00,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10714,17, 195.00,27, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10714,47, 47.50,50, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10714,56, 190.00,18, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10714,58, 66.25,12, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10715,10, 155.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10715,71, 107.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10716,21, 50.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10716,51, 265.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10716,61, 142.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10717,21, 50.00,32, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10717,54, 37.25,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10717,69, 180.00,25, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10718,12, 190.00,36, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10718,16, 87.25,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10718,36, 95.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10718,62, 246.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10719,18, 312.50,12, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10719,30, 129.45,3, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10719,54, 37.25,40, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10720,35, 90.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10720,71, 107.50,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10721,44, 97.25,50, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10722,2, 95.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10722,31, 62.50,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10722,68, 62.50,45, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10722,75, 38.75,42, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10723,26, 156.15,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10724,10, 155.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10724,61, 142.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10725,41, 48.25,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10725,52, 35.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10725,55, 120.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10726,4, 110.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10726,11, 105.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10727,17, 195.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10727,56, 190.00,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10727,59, 275.00,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10728,30, 129.45,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10728,40, 92.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10728,55, 120.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10728,60, 170.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10729,1, 90.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10729,21, 50.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10729,50, 81.25,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10730,16, 87.25,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10730,31, 62.50,3, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10730,65, 105.25,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10731,21, 50.00,40, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10731,51, 265.00,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10732,76, 90.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10733,14, 116.25,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10733,28, 228.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10733,52, 35.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10734,6, 125.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10734,30, 129.45,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10734,76, 90.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10735,61, 142.50,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10735,77, 65.00,2, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10736,65, 105.25,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10736,75, 38.75,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10737,13, 30.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10737,41, 48.25,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10738,16, 87.25,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10739,36, 95.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10739,52, 35.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10740,28, 228.00,5, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10740,35, 90.00,35, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10740,45, 47.50,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10740,56, 190.00,14, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10741,2, 95.00,15, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10742,3, 50.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10742,60, 170.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10742,72, 174.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10743,46, 60.00,28, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10744,40, 92.00,50, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10745,18, 312.50,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10745,44, 97.25,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10745,59, 275.00,45, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10745,72, 174.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10746,13, 30.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10746,42, 70.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10746,62, 246.50,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10746,69, 180.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10747,31, 62.50,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10747,41, 48.25,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10747,63, 219.50,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10747,69, 180.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10748,23, 45.00,44, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10748,40, 92.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10748,56, 190.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10749,56, 190.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10749,59, 275.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10749,76, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10750,14, 116.25,5, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10750,45, 47.50,40, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10750,59, 275.00,25, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10751,26, 156.15,12, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10751,30, 129.45,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10751,50, 81.25,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10751,73, 75.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10752,1, 90.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10752,69, 180.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10753,45, 47.50,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10753,74, 50.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10754,40, 92.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10755,47, 47.50,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10755,56, 190.00,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10755,57, 97.50,14, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10755,69, 180.00,25, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10756,18, 312.50,21, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10756,36, 95.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10756,68, 62.50,6, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10756,69, 180.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10757,34, 70.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10757,59, 275.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10757,62, 246.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10757,64, 166.25,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10758,26, 156.15,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10758,52, 35.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10758,70, 75.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10759,32, 160.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10760,25, 70.00,12, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10760,27, 219.50,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10760,43, 230.00,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10761,25, 70.00,35, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10761,75, 38.75,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10762,39, 90.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10762,47, 47.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10762,51, 265.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10762,56, 190.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10763,21, 50.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10763,22, 105.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10763,24, 22.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10764,3, 50.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10764,39, 90.00,130, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10765,65, 105.25,80, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10766,2, 95.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10766,7, 150.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10766,68, 62.50,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10767,42, 70.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10768,22, 105.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10768,31, 62.50,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10768,60, 170.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10768,71, 107.50,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10769,41, 48.25,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10769,52, 35.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10769,61, 142.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10769,62, 246.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10770,11, 105.00,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10771,71, 107.50,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10772,29, 618.95,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10772,59, 275.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10773,17, 195.00,33, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10773,31, 62.50,70, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10773,75, 38.75,7, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10774,31, 62.50,2, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10774,66, 85.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10775,10, 155.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10775,67, 70.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10776,31, 62.50,16, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10776,42, 70.00,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10776,45, 47.50,27, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10776,51, 265.00,120, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10777,42, 70.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10778,41, 48.25,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10779,16, 87.25,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10779,62, 246.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10780,70, 75.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10780,77, 65.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10781,54, 37.25,3, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10781,56, 190.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10781,74, 50.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10782,31, 62.50,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10783,31, 62.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10783,38, 1317.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10784,36, 95.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10784,39, 90.00,2, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10784,72, 174.00,30, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10785,10, 155.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10785,75, 38.75,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10786,8, 200.00,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10786,30, 129.45,15, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10786,75, 38.75,42, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10787,2, 95.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10787,29, 618.95,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10788,19, 46.00,50, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10788,75, 38.75,40, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10789,18, 312.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10789,35, 90.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10789,63, 219.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10789,68, 62.50,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10790,7, 150.00,3, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10790,56, 190.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10791,29, 618.95,14, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10791,41, 48.25,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10792,2, 95.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10792,54, 37.25,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10792,68, 62.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10793,41, 48.25,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10793,52, 35.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10794,14, 116.25,15, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10794,54, 37.25,6, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10795,16, 87.25,65, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10795,17, 195.00,35, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10796,26, 156.15,21, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10796,44, 97.25,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10796,64, 166.25,35, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10796,69, 180.00,24, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10797,11, 105.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10798,62, 246.50,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10798,72, 174.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10799,13, 30.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10799,24, 22.50,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10799,59, 275.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10800,11, 105.00,50, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10800,51, 265.00,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10800,54, 37.25,7, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10801,17, 195.00,40, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10801,29, 618.95,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10802,30, 129.45,25, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10802,51, 265.00,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10802,55, 120.00,60, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10802,62, 246.50,5, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10803,19, 46.00,24, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10803,25, 70.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10803,59, 275.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10804,10, 155.00,36, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10804,28, 228.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10804,49, 100.00,4, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10805,34, 70.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10805,38, 1317.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10806,2, 95.00,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10806,65, 105.25,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10806,74, 50.00,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10807,40, 92.00,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10808,56, 190.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10808,76, 90.00,50, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10809,52, 35.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10810,13, 30.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10810,25, 70.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10810,70, 75.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10811,19, 46.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10811,23, 45.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10811,40, 92.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10812,31, 62.50,16, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10812,72, 174.00,40, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10812,77, 65.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10813,2, 95.00,12, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10813,46, 60.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10814,41, 48.25,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10814,43, 230.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10814,48, 63.75,8, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10814,61, 142.50,30, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10815,33, 12.50,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10816,38, 1317.50,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10816,62, 246.50,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10817,26, 156.15,40, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10817,38, 1317.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10817,40, 92.00,60, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10817,62, 246.50,25, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10818,32, 160.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10818,41, 48.25,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10819,43, 230.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10819,75, 38.75,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10820,56, 190.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10821,35, 90.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10821,51, 265.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10822,62, 246.50,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10822,70, 75.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10823,11, 105.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10823,57, 97.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10823,59, 275.00,40, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10823,77, 65.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10824,41, 48.25,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10824,70, 75.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10825,26, 156.15,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10825,53, 164.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10826,31, 62.50,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10826,57, 97.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10827,10, 155.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10827,39, 90.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10828,20, 405.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10828,38, 1317.50,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10829,2, 95.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10829,8, 200.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10829,13, 30.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10829,60, 170.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10830,6, 125.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10830,39, 90.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10830,60, 170.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10830,68, 62.50,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10831,19, 46.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10831,35, 90.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10831,38, 1317.50,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10831,43, 230.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10832,13, 30.00,3, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10832,25, 70.00,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10832,44, 97.25,16, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10832,64, 166.25,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10833,7, 150.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10833,31, 62.50,9, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10833,53, 164.00,9, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10834,29, 618.95,8, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10834,30, 129.45,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10835,59, 275.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10835,77, 65.00,2, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10836,22, 105.00,52, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10836,35, 90.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10836,57, 97.50,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10836,60, 170.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10836,64, 166.25,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10837,13, 30.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10837,40, 92.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10837,47, 47.50,40, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10837,76, 90.00,21, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10838,1, 90.00,4, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10838,18, 312.50,25, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10838,36, 95.00,50, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10839,58, 66.25,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10839,72, 174.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10840,25, 70.00,6, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10840,39, 90.00,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10841,10, 155.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10841,56, 190.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10841,59, 275.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10841,77, 65.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10842,11, 105.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10842,43, 230.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10842,68, 62.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10842,70, 75.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10843,51, 265.00,4, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10844,22, 105.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10845,23, 45.00,70, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10845,35, 90.00,25, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10845,42, 70.00,42, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10845,58, 66.25,60, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10845,64, 166.25,48, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10846,4, 110.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10846,70, 75.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10846,74, 50.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10847,1, 90.00,80, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10847,19, 46.00,12, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10847,37, 130.00,60, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10847,45, 47.50,36, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10847,60, 170.00,45, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10847,71, 107.50,55, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10848,5, 106.75,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10848,9, 485.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10849,3, 50.00,49, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10849,26, 156.15,18, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10850,25, 70.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10850,33, 12.50,4, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10850,70, 75.00,30, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10851,2, 95.00,5, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10851,25, 70.00,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10851,57, 97.50,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10851,59, 275.00,42, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10852,2, 95.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10852,17, 195.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10852,62, 246.50,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10853,18, 312.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10854,10, 155.00,100, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10854,13, 30.00,65, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10855,16, 87.25,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10855,31, 62.50,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10855,56, 190.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10855,65, 105.25,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10856,2, 95.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10856,42, 70.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10857,3, 50.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10857,26, 156.15,35, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10857,29, 618.95,10, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10858,7, 150.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10858,27, 219.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10858,70, 75.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10859,24, 22.50,40, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10859,54, 37.25,35, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10859,64, 166.25,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10860,51, 265.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10860,76, 90.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10861,17, 195.00,42, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10861,18, 312.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10861,21, 50.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10861,33, 12.50,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10861,62, 246.50,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10862,11, 105.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10862,52, 35.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10863,1, 90.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10863,58, 66.25,12, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10864,35, 90.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10864,67, 70.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10865,38, 1317.50,60, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10865,39, 90.00,80, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10866,2, 95.00,21, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10866,24, 22.50,6, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10866,30, 129.45,40, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10867,53, 164.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10868,26, 156.15,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10868,35, 90.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10868,49, 100.00,42, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10869,1, 90.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10869,11, 105.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10869,23, 45.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10869,68, 62.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10870,35, 90.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10870,51, 265.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10871,6, 125.00,50, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10871,16, 87.25,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10871,17, 195.00,16, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10872,55, 120.00,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10872,62, 246.50,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10872,64, 166.25,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10872,65, 105.25,21, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10873,21, 50.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10873,28, 228.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10874,10, 155.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10875,19, 46.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10875,47, 47.50,21, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10875,49, 100.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10876,46, 60.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10876,64, 166.25,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10877,16, 87.25,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10877,18, 312.50,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10878,20, 405.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10879,40, 92.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10879,65, 105.25,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10879,76, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10880,23, 45.00,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10880,61, 142.50,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10880,70, 75.00,50, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10881,73, 75.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10882,42, 70.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10882,49, 100.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10882,54, 37.25,32, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10883,24, 22.50,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10884,21, 50.00,40, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10884,56, 190.00,21, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10884,65, 105.25,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10885,2, 95.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10885,24, 22.50,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10885,70, 75.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10885,77, 65.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10886,10, 155.00,70, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10886,31, 62.50,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10886,77, 65.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10887,25, 70.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10888,2, 95.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10888,68, 62.50,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10889,11, 105.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10889,38, 1317.50,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10890,17, 195.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10890,34, 70.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10890,41, 48.25,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10891,30, 129.45,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10892,59, 275.00,40, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10893,8, 200.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10893,24, 22.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10893,29, 618.95,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10893,30, 129.45,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10893,36, 95.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10894,13, 30.00,28, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10894,69, 180.00,50, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10894,75, 38.75,120, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10895,24, 22.50,110, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10895,39, 90.00,45, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10895,40, 92.00,91, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10895,60, 170.00,100, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10896,45, 47.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10896,56, 190.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10897,29, 618.95,80, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10897,30, 129.45,36, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10898,13, 30.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10899,39, 90.00,8, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10900,70, 75.00,3, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10901,41, 48.25,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10901,71, 107.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10902,55, 120.00,30, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10902,62, 246.50,6, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10903,13, 30.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10903,65, 105.25,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10903,68, 62.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10904,58, 66.25,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10904,62, 246.50,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10905,1, 90.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10906,61, 142.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10907,75, 38.75,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10908,7, 150.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10908,52, 35.00,14, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10909,7, 150.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10909,16, 87.25,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10909,41, 48.25,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10910,19, 46.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10910,49, 100.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10910,61, 142.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10911,1, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10911,17, 195.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10911,67, 70.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10912,11, 105.00,40, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10912,29, 618.95,60, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10913,4, 110.00,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10913,33, 12.50,40, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10913,58, 66.25,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10914,71, 107.50,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10915,17, 195.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10915,33, 12.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10915,54, 37.25,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10916,16, 87.25,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10916,32, 160.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10916,57, 97.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10917,30, 129.45,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10917,60, 170.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10918,1, 90.00,60, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10918,60, 170.00,25, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10919,16, 87.25,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10919,25, 70.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10919,40, 92.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10920,50, 81.25,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10921,35, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10921,63, 219.50,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10922,17, 195.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10922,24, 22.50,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10923,42, 70.00,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10923,43, 230.00,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10923,67, 70.00,24, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10924,10, 155.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10924,28, 228.00,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10924,75, 38.75,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10925,36, 95.00,25, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10925,52, 35.00,12, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10926,11, 105.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10926,13, 30.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10926,19, 46.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10926,72, 174.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10927,20, 405.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10927,52, 35.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10927,76, 90.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10928,47, 47.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10928,76, 90.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10929,21, 50.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10929,75, 38.75,49, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10929,77, 65.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10930,21, 50.00,36, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10930,27, 219.50,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10930,55, 120.00,25, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10930,58, 66.25,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10931,13, 30.00,42, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10931,57, 97.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10932,16, 87.25,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10932,62, 246.50,14, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10932,72, 174.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10932,75, 38.75,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10933,53, 164.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10933,61, 142.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10934,6, 125.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10935,1, 90.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10935,18, 312.50,4, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10935,23, 45.00,8, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10936,36, 95.00,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10937,28, 228.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10937,34, 70.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10938,13, 30.00,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10938,43, 230.00,24, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10938,60, 170.00,49, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10938,71, 107.50,35, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10939,2, 95.00,10, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10939,67, 70.00,40, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10940,7, 150.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10940,13, 30.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10941,31, 62.50,44, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10941,62, 246.50,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10941,68, 62.50,80, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10941,72, 174.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10942,49, 100.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10943,13, 30.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10943,22, 105.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10943,46, 60.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10944,11, 105.00,5, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10944,44, 97.25,18, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10944,56, 190.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10945,13, 30.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10945,31, 62.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10946,10, 155.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10946,24, 22.50,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10946,77, 65.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10947,59, 275.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10948,50, 81.25,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10948,51, 265.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10948,55, 120.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10949,6, 125.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10949,10, 155.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10949,17, 195.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10949,62, 246.50,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10950,4, 110.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10951,33, 12.50,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10951,41, 48.25,6, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10951,75, 38.75,50, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10952,6, 125.00,16, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10952,28, 228.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10953,20, 405.00,50, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10953,31, 62.50,50, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10954,16, 87.25,28, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10954,31, 62.50,25, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10954,45, 47.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10954,60, 170.00,24, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10955,75, 38.75,12, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10956,21, 50.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10956,47, 47.50,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10956,51, 265.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10957,30, 129.45,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10957,35, 90.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10957,64, 166.25,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10958,5, 106.75,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10958,7, 150.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10958,72, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10959,75, 38.75,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10960,24, 22.50,10, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10960,41, 48.25,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10961,52, 35.00,6, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10961,76, 90.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10962,7, 150.00,45, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10962,13, 30.00,77, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10962,53, 164.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10962,69, 180.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10962,76, 90.00,44, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10963,60, 170.00,2, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10964,18, 312.50,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10964,38, 1317.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10964,69, 180.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10965,51, 265.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10966,37, 130.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10966,56, 190.00,12, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10966,62, 246.50,12, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10967,19, 46.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10967,49, 100.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10968,12, 190.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10968,24, 22.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10968,64, 166.25,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10969,46, 60.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10970,52, 35.00,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10971,29, 618.95,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10972,17, 195.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10972,33, 12.50,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10973,26, 156.15,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10973,41, 48.25,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10973,75, 38.75,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10974,63, 219.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10975,8, 200.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10975,75, 38.75,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10976,28, 228.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10977,39, 90.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10977,47, 47.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10977,51, 265.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10977,63, 219.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10978,8, 200.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10978,21, 50.00,40, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10978,40, 92.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10978,44, 97.25,6, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10979,7, 150.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10979,12, 190.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10979,24, 22.50,80, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10979,27, 219.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10979,31, 62.50,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10979,63, 219.50,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10980,75, 38.75,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10981,38, 1317.50,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10982,7, 150.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10982,43, 230.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10983,13, 30.00,84, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10983,57, 97.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10984,16, 87.25,55, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10984,24, 22.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10984,36, 95.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10985,16, 87.25,36, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10985,18, 312.50,8, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10985,32, 160.00,35, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10986,11, 105.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10986,20, 405.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10986,76, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10986,77, 65.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10987,7, 150.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10987,43, 230.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10987,72, 174.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10988,7, 150.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10988,62, 246.50,40, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10989,6, 125.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10989,11, 105.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10989,41, 48.25,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10990,21, 50.00,65, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10990,34, 70.00,60, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10990,55, 120.00,65, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10990,61, 142.50,66, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10991,2, 95.00,50, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10991,70, 75.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10991,76, 90.00,90, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10992,72, 174.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10993,29, 618.95,50, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10993,41, 48.25,35, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10994,59, 275.00,18, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10995,51, 265.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10995,60, 170.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10996,42, 70.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10997,32, 160.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10997,46, 60.00,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10997,52, 35.00,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10998,24, 22.50,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10998,61, 142.50,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10998,74, 50.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10998,75, 38.75,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10999,41, 48.25,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10999,51, 265.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10999,77, 65.00,21, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11000,4, 110.00,25, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11000,24, 22.50,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11000,77, 65.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11001,7, 150.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11001,22, 105.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11001,46, 60.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11001,55, 120.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11002,13, 30.00,56, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11002,35, 90.00,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 11002,42, 70.00,24, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 11002,55, 120.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11003,1, 90.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11003,40, 92.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11003,52, 35.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11004,26, 156.15,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11004,76, 90.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11005,1, 90.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11005,59, 275.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11006,1, 90.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11006,29, 618.95,2, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11007,8, 200.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11007,29, 618.95,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11007,42, 70.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11008,28, 228.00,70, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11008,34, 70.00,90, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11008,71, 107.50,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11009,24, 22.50,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11009,36, 95.00,18, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11009,60, 170.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11010,7, 150.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11010,24, 22.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11011,58, 66.25,40, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11011,71, 107.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11012,19, 46.00,50, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11012,60, 170.00,36, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11012,71, 107.50,60, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11013,23, 45.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11013,42, 70.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11013,45, 47.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11013,68, 62.50,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11014,41, 48.25,28, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 11015,30, 129.45,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11015,77, 65.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11016,31, 62.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11016,36, 95.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11017,3, 50.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11017,59, 275.00,110, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11017,70, 75.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11018,12, 190.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11018,18, 312.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11018,56, 190.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11019,46, 60.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11019,49, 100.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11020,10, 155.00,24, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 11021,2, 95.00,11, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11021,20, 405.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11021,26, 156.15,63, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11021,51, 265.00,44, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11021,72, 174.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11022,19, 46.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11022,69, 180.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11023,7, 150.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11023,43, 230.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11024,26, 156.15,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11024,33, 12.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11024,65, 105.25,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11024,71, 107.50,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11025,1, 90.00,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 11025,13, 30.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 11026,18, 312.50,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11026,51, 265.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11027,24, 22.50,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11027,62, 246.50,21, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11028,55, 120.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11028,59, 275.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11029,56, 190.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11029,63, 219.50,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11030,2, 95.00,100, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11030,5, 106.75,70, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11030,29, 618.95,60, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11030,59, 275.00,100, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11031,1, 90.00,45, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11031,13, 30.00,80, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11031,24, 22.50,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11031,64, 166.25,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11031,71, 107.50,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11032,36, 95.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11032,38, 1317.50,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11032,59, 275.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11033,53, 164.00,70, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 11033,69, 180.00,36, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 11034,21, 50.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 11034,44, 97.25,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11034,61, 142.50,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11035,1, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11035,35, 90.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11035,42, 70.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11035,54, 37.25,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11036,13, 30.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11036,59, 275.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11037,70, 75.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11038,40, 92.00,5, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 11038,52, 35.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11038,71, 107.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11039,28, 228.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11039,35, 90.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11039,49, 100.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11039,57, 97.50,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11040,21, 50.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11041,2, 95.00,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 11041,63, 219.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11042,44, 97.25,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11042,61, 142.50,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11043,11, 105.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11044,62, 246.50,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11045,33, 12.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11045,51, 265.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11046,12, 190.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11046,32, 160.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11046,35, 90.00,18, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11047,1, 90.00,25, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11047,5, 106.75,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11048,68, 62.50,42, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11049,2, 95.00,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 11049,12, 190.00,4, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 11050,76, 90.00,50, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 11051,24, 22.50,10, .20 );
(11052, 43, 230.00, 30, 0.20),
(11052, 61, 142.50, 10, 0.20),
(11053, 18, 312.50, 35, 0.20),
(11053, 32, 160.00, 20, 0.00),
(11053, 64, 166.25, 25, 0.20),
(11054, 33, 12.50, 10, 0.00),
(11054, 67, 70.00, 20, 0.00),
(11055, 24, 22.50, 15, 0.00),
(11055, 25, 70.00, 15, 0.00),
(11055, 51, 265.00, 20, 0.00),
(11055, 57, 97.50, 20, 0.00),
(11056, 7, 150.00, 40, 0.00),
(11056, 55, 120.00, 35, 0.00),
(11056, 60, 170.00, 50, 0.00),
(11057, 70, 75.00, 3, 0.00),
(11058, 21, 50.00, 3, 0.00),
(11058, 60, 170.00, 21, 0.00),
(11058, 61, 142.50, 4, 0.00),
(11059, 13, 30.00, 30, 0.00),
(11059, 17, 195.00, 12, 0.00),
(11059, 60, 170.00, 35, 0.00),
(11060, 60, 170.00, 4, 0.00),
(11060, 77, 65.00, 10, 0.00),
(11061, 60, 170.00, 15, 0.00),
(11062, 53, 164.00, 10, 0.20),
(11062, 70, 75.00, 12, 0.20),
(11063, 34, 70.00, 30, 0.00),
(11063, 40, 92.00, 40, 0.10),
(11063, 41, 48.25, 30, 0.10),
(11064, 17, 195.00, 77, 0.10),
(11064, 53, 164.00, 25, 0.10),
(11064, 55, 120.00, 4, 0.10),
(11064, 68, 62.50, 55, 0.00),
(11065, 30, 129.45, 4, 0.25),
(11065, 54, 37.25, 20, 0.25),
(11066, 16, 87.25, 3, 0.00),
(11066, 19, 46.00, 42, 0.00),
(11066, 34, 70.00, 35, 0.00),
(11067, 41, 48.25, 9, 0.00),
(11068, 28, 228.00, 8, 0.15),
(11068, 43, 230.00, 36, 0.15),
(11068, 77, 65.00, 28, 0.15),
(11069, 39, 90.00, 20, 0.00),
(11070, 1, 90.00, 40, 0.15),
(11070, 2, 95.00, 20, 0.15),
(11070, 16, 87.25, 30, 0.15),
(11070, 31, 62.50, 20, 0.00),
(11071, 7, 150.00, 15, 0.05),
(11071, 13, 30.00, 10, 0.05),
(11072, 2, 95.00, 8, 0.00),
(11072, 41, 48.25, 40, 0.00),
(11072, 50, 81.25, 22, 0.00),
(11072, 64, 166.25, 130, 0.00),
(11073, 11, 105.00, 10, 0.00),
(11073, 24, 22.50, 20, 0.00),
(11074, 16, 87.25, 14, 0.05),
(11075, 2, 95.00, 10, 0.15),
(11075, 46, 60.00, 30, 0.15),
(11075, 76, 90.00, 2, 0.15),
(11075, 90, 675, 2, 0.15),
(11076, 6, 125.00, 20, 0.25),
(11076, 14, 116.25, 20, 0.25),
(11076, 19, 46.00, 10, 0.25),
(11076, 90, 645, 10, 0.25),
(11076, 91, 700, 10, 0.25),
(11076, 92, 705, 10, 0.25),
(11077, 2, 95.00, 24, 0.20),
(11077, 3, 50.00, 4, 0.00),
(11077, 4, 110.00, 1, 0.00),
(11077, 6, 125.00, 1, 0.02),
(11077, 7, 150.00, 1, 0.05),
(11077, 8, 200.00, 2, 0.10),
(11077, 10, 155.00, 1, 0.00),
(11077, 12, 190.00, 2, 0.05),
(11077, 13, 30.00, 4, 0.00),
(11077, 14, 116.25, 1, 0.03),
(11077, 16, 87.25, 2, 0.03),
(11077, 20, 405.00, 1, 0.04),
(11077, 23, 45.00, 2, 0.00),
(11077, 32, 160.00, 1, 0.00),
(11077, 39, 90.00, 2, 0.05),
(11077, 41, 48.25, 3, 0.00),
(11077, 46, 60.00, 3, 0.02),
(11077, 52, 35.00, 2, 0.00),
(11077, 55, 120.00, 2, 0.00),
(11077, 60, 170.00, 2, 0.06),
(11077, 64, 166.25, 2, 0.03),
(11077, 66, 85.00, 1, 0.00),
(11077, 73, 75.00, 2, 0.01),
(11077, 75, 38.75, 4, 0.00),
(11077, 77, 65.00, 2, 0.00),
(11077, 90, 644, 2, 0.00),
(11078, 91, 652.00, 2, 0.00),
(11078, 92, 654.00, 2, 0.00);









