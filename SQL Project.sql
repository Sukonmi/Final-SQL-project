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
(17, 'Alice Mutton', 7, 6, '20 boxes (1 kg)', 195.00, 0, 0, -1),
(19, 'Teatime Chocolate Biscuits', 8, 3, '10 boxes x 12 pieces', 46.00, 25, 0, 0),
(20, 'Sir Rodney''s Marmalade', 8, 3, '30 jars', 405.00, 40, 0, 0),
(21, 'Sir Rodney''s Scones', 8, 3, '24 cartons x 4 pieces', 50.00, 3, 40, 0),
(22, 'Gustaf''s Knäckebröd', 9, 5, '24 cartons (500 g)', 105.00, 104, 0, 0),
(23, 'Tunnbröd', 9, 5, '12 cartons (250 g)', 45.00, 61, 0, 0),
(25, 'NuNuCa Nuß-Nougat-Creme', 11, 3, '20 jars (450 g)', 70.00, 76, 0, 0),
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
(15, 'Genen Shouyu', 6, 2, '24 bottles (250 ml)', 78.00, 22, 0, 0);


SET DateStyle = 'DMY';
INSERT INTO ORDERS  
VALUES 
( 10354,'PERIC',8,'14/11/96','20/11/96', 2.69 ),
( 10365,'ANTON',3,'27/11/96','02/12/96', 1.10 ),
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
( 10678,'SAVEA',7,'23/09/97','16/10/97', 1944.90 ,
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
( 10248,1, 70.00,12, .00 ),
( 10248,2, 49.00,10, .00 ),
( 10248,3, 174.00,5, .00 ),
( 10248,4, 70.00,12, .00 ),
( 10248,5, 49.00,10, .00 ),
( 10248,6, 174.00,5, .00 ),
( 10248,7, 70.00,12, .00 ),
( 10248,8, 49.00,10, .00 ),
( 10248,9, 174.00,5, .00 ),
( 10248,10, 70.00,12, .00 ),
( 10248,11, 49.00,10, .00 ),
( 10248,12, 174.00,5, .00 ),
( 10248,13, 70.00,12, .00 ),
( 10248,14, 49.00,10, .00 ),
( 10248,15, 174.00,5, .00 ),
( 10248,16, 70.00,12, .00 ),
( 10248,17, 49.00,10, .00 ),
( 10248,18, 174.00,5, .00 ),
( 10248,19, 70.00,12, .00 ),
( 10248,20, 49.00,10, .00 ),
( 10248,21, 70.00,12, .00 ),
( 10248,22, 49.00,10, .00 ),
( 10248,23, 174.00,5, .00 ),
( 10248,24, 70.00,12, .00 ),
( 10248,25, 49.00,10, .00 ),
( 10248,26, 174.00,5, .00 ),
( 10248,27, 70.00,12, .00 ),
( 10248,28, 49.00,10, .00 ),
( 10248,29, 174.00,5, .00 ),
( 10248,30, 70.00,12, .00 ),
( 10248,31, 49.00,10, .00 ),
( 10248,32, 174.00,5, .00 ),
( 10248,33, 70.00,12, .00 ),
( 10248,34, 49.00,10, .00 ),
( 10248,35, 174.00,5, .00 ),
( 10248,36, 70.00,12, .00 );
( 10248,37, 49.00,10, .00 );
( 10248,38, 174.00,5, .00 );
( 10248,39, 70.00,12, .00 );
( 10248,40, 49.00,10, .00 );
( 10248,41, 70.00,12, .00 );
( 10248,42, 49.00,10, .00 );
( 10248,43, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,44, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,45, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,46, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,47, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,48, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,49, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,50, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,51, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,52, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,53, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,54, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,55, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,56, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,57, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,58, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,59, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,60, 49.00,10, .00 );

INSERT INTO ORDER_DETAILS  VALUES ( 10248,61, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,62, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,63, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,64, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,65, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,66, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,67, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,68, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,69, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,70, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,71, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,72, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,73, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,74, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,75, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,76, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,77, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,90, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,91, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,92, 49.00,10, .00 );



INSERT INTO ORDER_DETAILS  VALUES ( 10249,14, 93.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10249,51, 212.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10250,41, 38.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10250,51, 212.00,35, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10250,65, 84.00,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10251,22, 84.00,6, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10251,57, 78.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10251,65, 84.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10252,20, 324.00,40, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10252,33, 10.00,25, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10252,60, 136.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10253,31, 50.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10253,39, 72.00,42, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10253,49, 80.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10254,24, 18.00,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10254,55, 96.00,21, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10254,74, 40.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10255,2, 76.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10255,16, 69.50,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10255,36, 76.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10255,59, 220.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10256,53, 131.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10256,77, 52.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10257,27, 175.50,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10257,39, 72.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10257,77, 52.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10258,2, 76.00,50, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10258,5, 85.00,65, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10258,32, 128.00,6, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10259,21, 40.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10259,37, 104.00,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10260,41, 38.50,16, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10260,57, 78.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10260,62, 197.00,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10260,70, 60.00,21, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10261,21, 40.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10261,35, 72.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10262,5, 85.00,12, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10262,7, 120.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10262,56, 152.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10263,16, 69.50,60, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10263,24, 18.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10263,30, 103.50,60, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10263,74, 40.00,36, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10264,2, 76.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10264,41, 38.50,25, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10265,17, 156.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10265,70, 60.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10266,12, 152.00,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10267,40, 73.50,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10267,59, 220.00,70, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10267,76, 72.00,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10268,29, 495.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10268,72, 139.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10269,33, 10.00,60, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10269,72, 139.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10270,36, 76.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10270,43, 184.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10271,33, 10.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10272,20, 324.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10272,31, 50.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10272,72, 139.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10273,10, 124.00,24, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10273,31, 50.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10273,33, 10.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10273,40, 73.50,60, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10273,76, 72.00,33, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10274,71, 86.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10274,72, 139.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10275,24, 18.00,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10275,59, 220.00,6, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10276,10, 124.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10276,13, 24.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10277,28, 182.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10277,62, 197.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10278,44, 77.50,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10278,59, 220.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10278,63, 175.50,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10278,73, 60.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10279,17, 156.00,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10280,24, 18.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10280,55, 96.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10280,75, 31.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10281,19, 36.50,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10281,24, 18.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10281,35, 72.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10282,30, 103.50,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10282,57, 78.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10283,15, 62.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10283,19, 36.50,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10283,60, 136.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10283,72, 139.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10284,27, 175.50,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10284,44, 77.50,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10284,60, 136.00,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10284,67, 56.00,5, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10285,1, 72.00,45, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10285,40, 73.50,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10285,53, 131.00,36, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10286,35, 72.00,100, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10286,62, 197.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10287,16, 69.50,40, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10287,34, 56.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10287,46, 48.00,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10288,54, 29.50,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10288,68, 50.00,3, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10289,3, 40.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10289,64, 133.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10290,5, 85.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10290,29, 495.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10290,49, 80.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10290,77, 52.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10291,13, 24.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10291,44, 77.50,24, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10291,51, 212.00,2, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10292,20, 324.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10293,18, 250.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10293,24, 18.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10293,63, 175.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10293,75, 31.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10294,1, 72.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10294,17, 156.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10294,43, 184.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10294,60, 136.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10294,75, 31.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10295,56, 152.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10296,11, 84.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10296,16, 69.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10296,69, 144.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10297,39, 72.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10297,72, 139.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10298,2, 76.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10298,36, 76.00,40, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10298,59, 220.00,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10298,62, 197.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10299,19, 36.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10299,70, 60.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10300,66, 68.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10300,68, 50.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10301,40, 73.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10301,56, 152.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10302,17, 156.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10302,28, 182.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10302,43, 184.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10303,40, 73.50,40, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10303,65, 84.00,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10303,68, 50.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10304,49, 80.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10304,59, 220.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10304,71, 86.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10305,18, 250.00,25, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10305,29, 495.00,25, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10305,39, 72.00,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10306,30, 103.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10306,53, 131.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10306,54, 29.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10307,62, 197.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10307,68, 50.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10308,69, 144.00,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10308,70, 60.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10309,4, 88.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10309,6, 100.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10309,42, 56.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10309,43, 184.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10309,71, 86.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10310,16, 69.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10310,62, 197.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10311,42, 56.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10311,69, 144.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10312,28, 182.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10312,43, 184.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10312,53, 131.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10312,75, 31.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10313,36, 76.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10314,32, 128.00,40, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10314,58, 53.00,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10314,62, 197.00,25, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10315,34, 56.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10315,70, 60.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10316,41, 38.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10316,62, 197.00,70, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10317,1, 72.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10318,41, 38.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10318,76, 72.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10319,17, 156.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10319,28, 182.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10319,76, 72.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10320,71, 86.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10321,35, 72.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10322,52, 28.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10323,15, 62.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10323,25, 56.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10323,39, 72.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10324,16, 69.50,21, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10324,35, 72.00,70, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10324,46, 48.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10324,59, 220.00,40, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10324,63, 175.50,80, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10325,6, 100.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10325,13, 24.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10325,14, 93.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10325,31, 50.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10325,72, 139.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10326,4, 88.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10326,57, 78.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10326,75, 31.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10327,2, 76.00,25, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10327,11, 84.00,50, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10327,30, 103.50,35, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10327,58, 53.00,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10328,59, 220.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10328,65, 84.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10328,68, 50.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10329,19, 36.50,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10329,30, 103.50,8, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10329,38, 1054.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10329,56, 152.00,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10330,26, 124.50,50, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10330,72, 139.00,25, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10331,54, 29.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10332,18, 250.00,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10332,42, 56.00,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10332,47, 38.00,16, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10333,14, 93.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10333,21, 40.00,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10333,71, 86.00,40, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10334,52, 28.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10334,68, 50.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10335,2, 76.00,7, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10335,31, 50.00,25, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10335,32, 128.00,6, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10335,51, 212.00,48, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10336,4, 88.00,18, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10337,23, 36.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10337,26, 124.50,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10337,36, 76.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10337,37, 104.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10337,72, 139.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10338,17, 156.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10338,30, 103.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10339,4, 88.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10339,17, 156.00,70, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10339,62, 197.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10340,18, 250.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10340,41, 38.50,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10340,43, 184.00,40, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10341,33, 10.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10341,59, 220.00,9, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10342,2, 76.00,24, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10342,31, 50.00,56, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10342,36, 76.00,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10342,55, 96.00,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10343,64, 133.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10343,68, 50.00,4, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10343,76, 72.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10344,4, 88.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10344,8, 160.00,70, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10345,8, 160.00,70, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10345,19, 36.50,80, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10345,42, 56.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10346,17, 156.00,36, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10346,56, 152.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10347,25, 56.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10347,39, 72.00,50, .15 );
( 10347,40, 73.50,4, .00 );
( 10347,75, 31.00,6, .15 );
( 10348,1, 72.00,15, .15 );
( 10348,23, 36.00,25, .00 );
( 10349,54, 29.50,24, .00 );
( 10350,50, 65.00,15, .10 );
( 10350,69, 144.00,18, .10 );
( 10351,38, 1054.00,20, .05 );
( 10351,41, 38.50,13, .00 );
( 10351,44, 77.50,77, .05 );
( 10351,65, 84.00,10, .05 );
( 10352,24, 18.00,10, .00 );
( 10352,54, 29.50,20, .15 );
( 10353,11, 84.00,12, .20 );
( 10353,38, 1054.00,50, .20 );
( 10354,1, 72.00,12, .00 );
( 10354,29, 495.00,4, .00 );
( 10355,24, 18.00,25, .00 );
( 10355,57, 78.00,25, .00 );
( 10356,31, 50.00,30, .00 );
( 10356,55, 96.00,12, .00 );
( 10356,69, 144.00,20, .00 );
( 10357,10, 124.00,30, .20 );
( 10357,26, 124.50,16, .00 );
( 10357,60, 136.00,8, .20 );
( 10358,24, 18.00,10, .05 );
( 10358,34, 56.00,10, .05 );
( 10358,36, 76.00,20, .05 );
( 10359,16, 69.50,56, .05 );
( 10359,31, 50.00,70, .05 );
( 10359,60, 136.00,80, .05 );
( 10360,28, 182.00,30, .00 );
( 10360,29, 495.00,35, .00 );
( 10360,38, 1054.00,10, .00 );
( 10360,49, 80.00,35, .00 );
( 10360,54, 29.50,28, .00 );
( 10361,39, 72.00,54, .10 );
( 10361,60, 136.00,55, .10 );
( 10362,25, 56.00,50, .00 );
( 10362,51, 212.00,20, .00 );
( 10362,54, 29.50,24, .00 );
( 10363,31, 50.00,20, .00 );
( 10363,75, 31.00,12, .00 );
( 10363,76, 72.00,12, .00 );
( 10364,69, 144.00,30, .00 );
( 10364,71, 86.00,5, .00 );
( 10365,11, 84.00,24, .00 );
( 10366,65, 84.00,5, .00 );
( 10366,77, 52.00,5, .00 );
( 10367,34, 56.00,36, .00 );
( 10367,54, 29.50,18, .00 );
( 10367,65, 84.00,15, .00 );
( 10367,77, 52.00,7, .00 );
( 10368,21, 40.00,5, .10 );
( 10368,28, 182.00,13, .10 );
( 10368,57, 78.00,25, .00 );
( 10368,64, 133.00,35, .10 );
( 10369,29, 495.00,20, .00 );
( 10369,56, 152.00,18, .25 );
( 10370,1, 72.00,15, .15 );
( 10370,64, 133.00,30, .00 );
( 10370,74, 40.00,20, .15 );
( 10371,36, 76.00,6, .20 );
( 10372,20, 324.00,12, .25 );
( 10372,38, 1054.00,40, .25 );
( 10372,60, 136.00,70, .25 );
( 10372,72, 139.00,42, .25 );
( 10373,58, 53.00,80, .20 );
( 10373,71, 86.00,50, .20 );
( 10374,31, 50.00,30, .00 );
( 10374,58, 53.00,15, .00 );
( 10375,14, 93.00,15, .00 );
( 10375,54, 29.50,10, .00 );
( 10376,31, 50.00,42, .05 );
( 10377,28, 182.00,20, .15 );
( 10377,39, 72.00,20, .15 );
( 10378,71, 86.00,6, .00 );
( 10379,41, 38.50,8, .10 );
( 10379,63, 175.50,16, .10 );
( 10379,65, 84.00,20, .10 );
( 10380,30, 103.50,18, .10 );
( 10380,53, 131.00,20, .10 );
( 10380,60, 136.00,6, .10 );
( 10380,70, 60.00,30, .00 );
( 10381,74, 40.00,14, .00 );
( 10382,5, 85.00,32, .00 );
( 10382,18, 250.00,9, .00 );
( 10382,29, 495.00,14, .00 );
( 10382,33, 10.00,60, .00 );
( 10382,74, 40.00,50, .00 );









