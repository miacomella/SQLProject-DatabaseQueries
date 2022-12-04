-- --------------- SQL PROJECT -----------------
-- --------------- Maria Comella Romeu ---------

-- - 1 - -- Create Database

CREATE DATABASE journal_articles;
USE journal_articles;

-- - 2 - -- Create Tables with PRIMARY and FOREIGN KEYS

CREATE TABLE articles (
ID_article INTEGER PRIMARY KEY, 
Title VARCHAR(500),
Year YEAR,
Journal VARCHAR(500)
);

CREATE TABLE authors (
ID_author INTEGER PRIMARY KEY,
Surname VARCHAR (50),
Initials VARCHAR(50)
);

CREATE TABLE articles_authors (		-- Junction Table
ID_article INTEGER,
ID_author INTEGER, 
FOREIGN KEY (ID_article) REFERENCES articles(ID_article),
FOREIGN KEY (ID_author) REFERENCES authors(ID_author)
);

CREATE TABLE topic (
ID_article INTEGER,
Keyword_1 VARCHAR(50),
Keyword_2 VARCHAR(50),
Keyword_3 VARCHAR(50),
FOREIGN KEY (ID_article) REFERENCES articles(ID_article)
);

CREATE TABLE method (
ID_article INTEGER,
Causal VARCHAR(50),
Method VARCHAR(50),
Specification VARCHAR(500),
FOREIGN KEY (ID_article) REFERENCES articles(ID_article)
);

CREATE TABLE data (
ID_article INTEGER,
Statistical_type VARCHAR(50),
Prim_or_Sec VARCHAR(50),
Sampling VARCHAR(500),
Unit VARCHAR(50),
Sample_size INTEGER,
FOREIGN KEY (ID_article) REFERENCES articles(ID_article)
);

CREATE TABLE referencing (
ID_article INTEGER,
Vol_issue VARCHAR(50),
Page_First INT,
Page_Last INT,
FOREIGN KEY (ID_article) REFERENCES articles(ID_article)
);


-- - 3 - -- Insert Values

INSERT INTO articles
(ID_article, Title, Year, Journal)
VALUES
('1',  'Free Distribution or Cost-sharing? Evidence from a Randomized Malaria Prevention Program', '2010', 'The Quarterly Journal of Economics'),
('2',  'Short-Run Subsidies and Long-Run Adoption of New Health Products: Evidence from a Field Experiment', '2012', 'Econometrica'),
('3',  'Teacher Performance Pay: Experimental Evidence from India', '2011', 'Journal of Political Economy'),
('4',  'The (Perceived) returns to education and the Demand for Schooling', '2010', 'The Quarterly Journal of Economics'),
('5',  'The schooling decision: Family preferences, intergenerational conflict, and moral hazard in the Brazilian favelas', '2012', 'Journal of Political Economy'),
('6',  'Risk Sharing and Transaction Costs: Evidence from Kenyas Mobile Money Revolution', '2014', 'American Economic Review'),
('7',  'Retail Globalization and Household Welfare: Evidence from Mexico', '2017', 'Journal of Political Economy'),
('8',  'Under-Investment in a Profitable Technology:The Case of Seasonal Migration in Bangladesh', '2017', 'Econometrica'),
('9',  'Heterogeneous productivity response to tariff reduction. Evidence from Brazilian manufacturing firms', '2004', 'Journal of Development Economics'),
('10',  'Grandmothers and Granddaughters: Old-Age Pensions and Intra-household Allocation in South Africa', '2003', 'The Quarterly Journal of Economics'),
('11',  'Unappreciated Service: Performance, Perceptions, and Women Leaders in India.', '2004', 'Journal of Political Economy'),
('12',  'Women as Policy Makers: Evidence from a Randomized Policy Experiment in India', '2004', 'Econometrica'), 
('13',  'Schooling and Labor Market Consequences of School Construction in Indonesia', '2001', 'American Economic Review'),
('14',  'Household bargaining and excess fertility', '2014', 'American Economic Review');


INSERT INTO authors
(ID_author, Surname, Initials)
VALUES
('1', 'Cohen', 'J.'),
('2', 'Dupas', 'P.'),
('3', 'Muralidharan', 'K.'),
('4', 'Sundararaman', 'V.'),
('5', 'Jensen', 'R.'),
('6', 'Bursztyn', 'L.'),
('7', 'Coffman', 'L.C.'),
('8', 'William', 'J.'),
('9', 'Tavneet', 'S.'),
('10', 'Atkin', 'D.B.'),
('11',  'Bryan', 'G.S.'),
('12', 'Schor', 'A.'),
('13', 'Duflo', 'E.'),
('14', 'Topalova', 'P.'),
('15', 'Ashraf', 'N.');

INSERT INTO articles_authors
(ID_article, ID_author)
VALUES
('1', '1'),
('1', '2'),
('2', '2'),
('3', '3'),
('3', '4'),
('4', '5'),
('5', '6'),
('5', '7'),
('6', '8'),
('6', '9'),
('7', '10'),
('8', '11'),
('9', '12'),
('10', '13'),
('11', '13'),
('11', '14'),
('12', '13'),
('13', '13'),
('14', '15');

INSERT INTO topic 
(ID_article, Keyword_1, Keyword_2, Keyword_3)
VALUES
('1', 'Randomized Experiment', 'Medication Cost', 'Malaria'),
('2', 'Randomized Experiment', 'Medication Subsidies', 'Long-run Study'),
('3', 'Teacher Performance', 'Teacher Pay', 'India'),
('4', 'Education Returns', 'Percieved Value', 'Latin America'),
('5', 'Intra-household decisions', 'Schooling', 'Brazil'),
('6', 'Mobile Money', 'Transaction Costs', 'Kenya'),
('7', 'Retail', 'Welfare', 'Mexico'),
('8', 'Migration', 'Bangladesh', 'Subsidies'),
('9', 'TFP', 'Heterogeneity', 'Brazil'),
('10', 'Intra-household decisions', 'Gender', 'South Africa'),
('11', 'Gender', 'Leadership', 'India'),
('12', 'Gender', 'Leadership', 'India'),
('13', 'School Contruction', 'Education', 'Indonesia'),
('14', 'Intra-household decisions', 'Fertility', 'Gender');


INSERT INTO method
(ID_article, Causal, Method, Specification)
VALUES
('1', 'Casual', 'Randomized Control Trial (RCT)', 'Attrition'),
('2', 'Casual', 'Randomized Control Trial (RCT)', NULL),
('3', 'Casual', 'Randomized Control Trial (RCT)', NULL),
('4', 'Descriptive', 'Regression Analysis', NULL),
('5', 'Causal', 'Regression Discontinuity', 'Policy'),
('6', 'Causal', 'Fixed Effects Regression', 'Individual Fixed Effects'),
('7', 'Causal', 'Fixed Effects Regressio', NULL),
('8', 'Causal', 'Difference-in-Differences', NULL),
('9', 'Causal', 'Fixed Effects Regression', 'Firm Fixed Effects'),
('10', 'Causal', 'Difference-in-Differences', 'Triple Difference-in-Differences'),
('11', 'Descriptive', 'Regression Analysis', NULL),
('12', 'Casual', 'Randomized Control Trial (RCT)', 'Attrition'),
('13', 'Casual', 'Difference-in-Differences', 'Triple Difference-in-Differences'),
('14', 'Casual', 'Regression Discontinuity', 'Policy');


INSERT INTO data
(ID_article, Statistical_type, Prim_or_Sec, Sampling, Unit, Sample_size)
VALUES
('1', 'Panel', 'Primary', 'Random', 'Individual', '1020'),
('2', 'Panel', 'Primary', 'Random', 'Individual', '900'),
('3', 'Panel', 'Primary', 'Random', 'School', '300'),
('4', 'Cross-Section', 'Secondary', NULL, 'Individual', '4000'),
('5', 'Panel', 'Secondary', NULL, 'Houhsehold', '700'),
('6', 'Panel', 'Secondary', 'Non-random', 'Individual', '5000'),
('7', 'Panel', 'Primary', 'Random', 'Household', '7000'),
('8', 'Panel', 'Primary', 'Random', 'Individual', '500'),
('9', 'Panel', 'Secondary', 'Non-random', 'Firm', '5000'),
('10', 'Panel', 'Secondary', 'Non-random', 'Household', '600'),
('11', 'Cross-Section', 'Primary', 'Non-Random', 'Individual', '700'),
('12', 'Panel', 'Primary', 'Random', 'Individual', '50'),
('13', 'Panel', 'Secondary', 'Non-Random', 'Village', '800'),
('14', 'Panel', 'Secondary', 'Non-Random', 'Individual', '1200');

INSERT INTO referencing 
(ID_article, Vol_issue, Page_First, Page_Last)
VALUES
('1', '125(1)', '125', '135'),
('2', '82(1)', '197', '228'),
('3', '119(1)', '80', '97'),
('4', '125(2)', '514', '548'),
('5', '120(3)', '359', '397'),
('6', '112(1)', '210', '233'),
('7', '128(1)', '1', '51'),
('8', '82(5)', '1671', '1748'),
('9', '75(1)', '373', '396'),
('10', '17(1)', '1', '25'),
('11', '81(1)', '214', '248'),
('12', '72(5)', '1409', '1443'),
('13', '91(4)', '795', '813'),
('14', '104(7)', '2210', '2223');

-- - 4 - -- Required Tasks

-- 'TASK: Using any type of the joins create a view that combines multiple tables in a logical way'

-- VIEW Table with Basic Infromation (Combines 3 tables)
CREATE VIEW basic_info
AS
SELECT 
a.ID_article, a.Title, GROUP_CONCAT(CONCAT_WS(',', w.Surname, w.Initials)), a.Year, a.Journal
FROM articles a
INNER JOIN articles_authors j ON a.ID_article = j.ID_article
INNER JOIN authors w ON j.ID_author = w.ID_author
GROUP BY a.ID_article, a.Title, a.Year, a.Journal;

SELECT * FROM basic_info;

-- TASK: 'create a stored function that can be applied to a query in your DB'

-- Function that calculates number of pager per article

DELIMITER $$
CREATE FUNCTION article_length (Page_First INT, Page_Last INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE page_count INT; 
	SET page_count = (Page_Last - Page_First);
RETURN page_count;
END $$
DELIMITER ;


SELECT
ID_article, article_length(Page_First, Page_Last)
FROM referencing;

SELECT
ID_article, article_length(Page_First, Page_Last)
FROM referencing
WHERE article_length(Page_First, Page_Last)<25;


-- TASK: 'Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis'

-- Find articles that have a saple size betwen 400 and 1000 obervations and include the author in the table 
SELECT
a.ID_article, GROUP_CONCAT(CONCAT_WS(', ', w.Surname, w.Initials)), a.Year, a.Title
FROM
articles a
INNER JOIN articles_authors j ON a.ID_article = j.ID_article
INNER JOIN authors w ON j.ID_author = w.ID_author
WHERE
a.ID_article IN (SELECT
				a.ID_article
				FROM
                data d
                WHERE 
                d.Sample_size BETWEEN 400 AND 1000)
GROUP BY a.ID_article, a.Year, a.Title;



-- - 5 - -- Advanced Tasks

-- TASK: 'Create a view that uses at least 3-4 base tables; prepare and demonstrate a query that uses the view to produce a
-- logically arranged result set for analysi'

-- VIEW Table with Articles and their Methodology and Data (Combines 5 tables)
CREATE VIEW methodology_and_data
AS
SELECT
a.ID_article, GROUP_CONCAT(CONCAT_WS(',', w.Surname, w.Initials)), a.Year, m.Causal, m.Method, m.Specification, 
d.Prim_or_Sec, d.Sampling, d.Unit, d.Sample_size
FROM articles a
INNER JOIN method m ON a.ID_article = m.ID_article
INNER JOIN data d ON a.ID_article= d.ID_article
INNER JOIN articles_authors j ON a.ID_article = j.ID_article
INNER JOIN authors w ON j.ID_author = w.ID_author
GROUP BY a.ID_article,a.Year, m.Causal, m.Method, m.Specification, 
d.Prim_or_Sec, d.Sampling, d.Unit, d.Sample_size;

SELECT * FROM methodology_and_data;

-- Query to find papers where sampler size iS smaller than 720 and the data was NOT selected randomly
SELECT
*
FROM 
methodology_and_data 
WHERE
Sample_size<720 AND Sampling != 'Random';


-- TASK: 'create a trigger and demonstrate how it runs'

-- Trigger that ensures consistency - Capitalizes author's Surname and Initials

DELIMITER $

CREATE TRIGGER befrore_author_insert
BEFORE INSERT on authors
FOR EACH ROW
BEGIN
SET NEW.Surname = CONCAT(UPPER(SUBSTRING(NEW.Surname,1,1)), LOWER(SUBSTRING(NEW.Surname FROM 2)));
SET NEW.Initials = UPPER(NEW.Initials);
END $

DELIMITER ;

-- Insert Data (example)
INSERT INTO authors (ID_author, Surname, Initials)
VALUES ('100','CoMeLla', 'm.r.');

SELECT * FROM authors;

DELETE FROM authors WHERE id_author=100;

