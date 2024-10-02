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
(1, 2, 'Davolio', 'Nancy', 'Sales Representative', 'Miss', '12/08/68', '05/01/92', 3135.00, 1500.00),
(2, 2, 'Fuller', 'Andrew', 'Vice President', 'Dr.', '02/19/52', '08/14/92', 10000.00, NULL),
(3, 2, 'Leverling', 'Janet', 'Sales Representative', 'Miss', '08/30/63', '04/01/92', 3500.00, 1000.00),
(4, 2, 'Peacock', 'Margaret', 'Sales Representative', 'Mrs.', '09/19/58', '05/03/93', 2856.00, 250.00),
(5, 2, 'Buchanan', 'Steven', 'Sales Manager', 'Mr.', '03/04/55', '10/17/93', 8000.00, NULL),
(6, 5, 'Suyama', 'Michael', 'Sales Representative', 'Mr.', '07/02/63', '10/17/93', 2534.00, 600.00),
(7, NULL, 'King', 'Robert', 'Sales Representative', 'Mr.', '05/29/60', '01/02/94', 2356.00, 800.00),
(8, 2, 'Callahan', 'Laura', 'Sales Assistant', 'Miss', '01/09/58', '03/05/94', 2000.00, NULL),
(9, 5, 'Dodsworth', 'Anne', 'Sales Representative', 'Miss', '07/02/69', '11/15/94', 2180.00, 0.00);



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
('ANTON','Antonio Moreno Taquería','Mataderos  2312','México D.F.','05023','Mexique','(5) 555-3932'),
('AROUT','Around the Horn','120 Hanover Sq.','London','WA1 4SD','Royaume-Uni','(71) 555-7788','(71) 555-6750'),
('BERGS','Berglunds snabbköp','Berguvsvägen  8','Luleå','S-958 22','Suède','0921-12 34 65','0921-12 34 67'),
('BLAUS','BlauerSeeDelikatessen','Forsterstr. 57','Mannheim','68306','Allemagne','0621-08460','0621-08924'),
('BLONP','Blondel père et fils','24, place Kléber','Strasbourg','67000','France','03.88.60.15.31','03.88.60.15.32'),
('BOLID','Bólido Comidas preparadas','Araquil, 67','Madrid','28023','Espagne','(91) 555 22 82','(91) 555 91 99'),
('BONAP','Bon app','12, rue des Bouchers','Marseille','13008','France','04.91.24.45.40','04.91.24.45.41'),
('BOTTM','Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','T2F 8M4','Canada','(604) 555-4729','(604) 555-3745'),
('BSBEV','B''s Beverages','Fauntleroy Circus','London','EC2 4SD','Royaume-Uni','(71) 555-1212'),
('CACTU','Cactus Comidas para llevar','Cerrito 333','Buenos Aires','1010','Argentine','(1) 135-5555','(1) 135-4892'),
('CENTC','Centro comercial Moctezuma','Sierras de Granada 9993','México D.F.','05022','Mexique','(5) 555-3392','(5) 555-7293'),
('CHOPS','Chop-suey Chinese','Hauptstr. 29','Bern','3012','Suisse','0452-076545'),
('COMMI','Comércio Mineiro','Av. dos Lusíadas, 23','São Paulo','05432-043','Brésil','(11) 555-7647'),
('CONSH','Consolidated Holdings','Berkeley Gardens12  Brewery ','London','WX1 4SD','Royaume-Uni','(71) 555-2282','(71) 555-9199'),
('DRACD','Drachenblut Delikatessen','Walserweg 21','Aachen','52066','Allemagne','0241-039123','0241-059428'),
('DUMON','Du monde entier','67, rue des Cinquante Otages','Nantes','44000','France','02.40.67.88.88','02.40.67.89.89'),
('EASTC','Eastern Connection','35 King George','London','WX3 6FW','Royaume-Uni','(71) 555-0297','(71) 555-3373'),
('ERNSH','Ernst Handel','Kirchgasse 6','Graz','8010','Autriche','7675-3425','7675-3426'),
('FAMIA','Familia Arquibaldo','Rua Orós, 92','São Paulo','05442-030','Brésil','(11) 555-9857'),
('FISSA','FISSA Fabrica Inter. Salchichas S.A.','Moralzarzal, 86','Madrid','28034','Espagne','(91) 555 94 44','(91) 555 55 93'),
('FOLIG','Folies gourmandes','184, chaussée de Tournai','Lille','59000','France','03.20.16.10.16','03.20.16.10.17'),
('FOLKO','Folk och fä HB','Åkergatan 24','Bräcke','S-844 67','Suède','0695-34 67 21'),
('FRANK','Frankenversand','Berliner Platz 43','München','80805','Allemagne','089-0877310','089-0877451'),
('FRANR','France restauration','54, rue Royale','Nantes','44000','France','02.40.32.21.21','02.40.32.21.20'),
('FRANS','Franchi S.p.A.','Via Monte Bianco 34','Torino','10100','Italie','011-4988260','011-4988261'),
('FURIB','Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa','1675','Portugal','(1) 354-2534','(1) 354-2535'),
('GALED','Galería del gastrónomo','Rambla de Cataluña, 23','Barcelona','08022','Espagne','(93) 203 4560','(93) 203 4561'),
('GODOS','Godos Cocina Típica','Romero, 33','Sevilla','41101','Espagne','(95) 555 82 82'),
('GOURL','Gourmet Lanchonetes','Av. Brasil, 442','Campinas','04876-786','Brésil','(11) 555-9482'),
('GREAL','Great Lakes Food Market','2732 Baker Blvd.','Eugene','97403','États-Unis','(503) 555-7555'),
('GROSR','GROSELLA-Restaurante','5ª Ave. Los Palos Grandes','Caracas','1081','Venezuela','(2) 283-2951','(2) 283-3397'),
('HANAR','Hanari Carnes','Rua do Paço, 67','Rio de Janeiro','05454-876','Brésil','(21) 555-0091','(21) 555-8765'),
('HILAA','HILARIÓN-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristóbal','5022','Venezuela','(5) 555-1340','(5) 555-1948'),
('HUNGC','Hungry Coyote Import Store','City Center Plaza516 Main St.','Elgin','97827','États-Unis','(503) 555-6874','(503) 555-2376'),
('HUNGO','Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','2506','Irlande','2967 542','2967 3333'),
('ISLAT','Island Trading','Garden HouseCrowther Way','Cowes','PO31 7PJ','Royaume-Uni','(198) 555-8888'),
('KOENE','Königlich Essen','Maubelstr. 90','Brandenburg','14776','Allemagne','0555-09876'),
('LACOR','La corne d. abondance','67, avenue de l. Europe','Versailles','78000','France','01.30.59.84.10','01.30.59.85.11'),
('LAMAI','La maison d''Asie','1 rue Alsace-Lorraine','Toulouse','31000','France','05.61.77.61.10','05.61.77.61.11'),
('LAUGB','Laughing Bacchus Wine Cellars','1900 Oak St.','Vancouver','V3F 2K1','Canada','(604) 555-3392','(604) 555-7293'),
('LAZYK','Lazy K Kountry Store','12 Orchestra Terrace','Walla Walla','99362','États-Unis','(509) 555-7969','(509) 555-6221'),
('LEHMS','Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M. ','60528','Allemagne','069-0245984','069-0245874'),
('LETSS','Let''s Stop N Shop','87 Polk St.Suite 5','San Francisco','94117','États-Unis','(415) 555-5938'),
('LILAS','LILA-Supermercado','Carrera 52 con Ave. Bolívar #65-98 Llano Largo','Barquisimeto','3508','Venezuela','(9) 331-6954','(9) 331-7256'),
('LINOD','LINO-Delicateses','Ave. 5 de Mayo Porlamar','I. de Margarita','4980','Venezuela','(8) 34-56-12','(8) 34-93-93'),
('LONEP','Lonesome Pine Restaurant','89 Chiaroscuro Rd.','Portland','97219','États-Unis','(503) 555-9573','(503) 555-9646'),
('MAGAA','Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo','24100','Italie','035-640230','035-640231'),
('MAISD','Maison Dewey','Rue Joseph-Bens 532','Bruxelles','B-1180','Belgique','(02) 201 24 67','(02) 201 24 68'),
('MEREP','Mère Paillarde','43 rue St. Laurent','Montréal','H1J 1C3','Canada','(514) 555-8054','(514) 555-8055'),
('MORGK','Morgenstern Gesundkost','Heerstr. 22','Leipzig','04179','Allemagne','0342-023176'),
('NORTS','North/South','South House300 Queensbridge','London','SW7 1RZ','Royaume-Uni','(71) 555-7733','(71) 555-2530'),
('OCEAN','Océano Atlántico Ltda.','Ing. Gustavo Moncada 8585Piso 20-A','Buenos Aires','1010','Argentine','(1) 135-5333','(1) 135-5535'),
('OLDWO','Old World Delicatessen','2743 Bering St.','Anchorage','99508','États-Unis','(907) 555-7584','(907) 555-2880'),
('OTTIK','Ottilies Käseladen','Mehrheimerstr. 369','Köln','50739','Allemagne','0221-0644327','0221-0765721'),
('PARIS','Paris spécialités','265, boulevard Charonne','Paris','75012','France','01.42.34.22.66','01.42.34.22.77'),
('PERIC','Pericles Comidas clásicas','Calle Dr. Jorge Cash 321','México D.F.','05033','Mexique','(5) 552-3745','(5) 545-3745'),
('PICCO','Piccolo und mehr','Geislweg 14','Salzburg','5020','Autriche','6562-9722','6562-9723'),
('PRINI','Princesa Isabel Vinhos','Estrada da saúde n. 58','Lisboa','1756','Portugal','(1) 356-5634'),
('QUEDE','Que Delícia','Rua da Panificadora, 12','Rio de Janeiro','02389-673','Brésil','(21) 555-4252','(21) 555-4545'),
('QUEEN','Queen Cozinha','Alameda dos Canàrios, 891','São Paulo','05487-020','Brésil','(11) 555-1189'),
('QUICK','QUICK-Stop','Taucherstraße 10','Cunewalde','01307','Allemagne','0372-035188'),
('RANCH','Rancho grande','Av. del Libertador 900','Buenos Aires','1010','Argentine','(1) 123-5555','(1) 123-5556'),
('RATTC','Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','87110','États-Unis','(505) 555-5939','(505) 555-3620'),
('REGGC','Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia','42100','Italie','0522-556721','0522-556722'),
('RICAR','Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','02389-890','Brésil','(21) 555-3412'),
('RICSU','Richter Supermarkt','Grenzacherweg 237','Genève','1203','Suisse','0897-034214'),
('ROMEY','Romero y tomillo','Gran Vía, 1','Madrid','28001','Espagne','(91) 745 6200','(91) 745 6210'),
('SANTG','Santé Gourmet','Erling Skakkes gate 78','Stavern','4110','Norvège','07-98 92 35','07-98 92 47'),
('SAVEA','Save-a-lot Markets','187 Suffolk Ln.','Boise','83720','États-Unis','(208) 555-8097'),
('SEVES','Seven Seas Imports','90 Wadhurst Rd.','London','OX15 4NB','Royaume-Uni','(71) 555-1717','(71) 555-5646' ),
('SIMOB','Simons bistro','Vinbæltet 34','København','1734','Danemark','31 12 34 56','31 13 35 57'),
('SPECD','Spécialités du monde','25, rue Lauriston','Paris','75016','France','01.47.55.60.10','01.47.55.60.20'),
('SPLIR','Split Rail Beer  Ale','P.O. Box 555','Lander','82520','États-Unis','(307) 555-4680','(307) 555-6525'),
('SUPRD','Suprêmes délices','Boulevard Tirou, 255','Charleroi','B-6000','Belgique','(071) 23 67 22 20','(071) 23 67 22 21'),
('THEBI','The Big Cheese','89 Jefferson WaySuite 2','Portland','97201','États-Unis','(503) 555-3612'),
('THECR','The Cracker Box','55 Grizzly Peak Rd.','Butte','59801','États-Unis','(406) 555-5834','(406) 555-8083'),
('TOMSP','Toms Spezialitäten','Luisenstr. 48','Münster','44087','Allemagne','0251-031259','0251-035695'),
('TORTU','Tortuga Restaurante','Avda. Azteca 123','México D.F.','05033','Mexique','(5) 555-2933'),





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

