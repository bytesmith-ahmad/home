BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "anniversaries [move to tasks AND ~/arch]" (
	"who"	TEXT NOT NULL,
	"date"	TEXT NOT NULL,
	"type"	TEXT,
	"notes"	TEXT
);
INSERT INTO "anniversaries [move to tasks AND ~/arch]" VALUES ('Nabi','2024-12-23','marriage','Married on 2023-12-03');
INSERT INTO "anniversaries [move to tasks AND ~/arch]" VALUES ('Nabi','2024-07-11','birthday','Born 1998');
INSERT INTO "anniversaries [move to tasks AND ~/arch]" VALUES ('Baba','2024-10-03','birthday','Born on 1971?');
INSERT INTO "anniversaries [move to tasks AND ~/arch]" VALUES ('Mama','2025-02-12','birthday',NULL);
INSERT INTO "anniversaries [move to tasks AND ~/arch]" VALUES ('Zahra','2024-07-27','birthday','Born 2000');
INSERT INTO "anniversaries [move to tasks AND ~/arch]" VALUES ('Maraim','2024-06-18','birthday','Born 2003');
INSERT INTO "anniversaries [move to tasks AND ~/arch]" VALUES ('Ali','2024-08-14','birthday','Born 2010');
INSERT INTO "anniversaries [move to tasks AND ~/arch]" VALUES ('Mo','2024-10-28','birthday',NULL);
INSERT INTO "anniversaries [move to tasks AND ~/arch]" VALUES ('Toqa','2024-05-28','birthday',NULL);
INSERT INTO "anniversaries [move to tasks AND ~/arch]" VALUES ('Mimo','2024-09-25','birthday',NULL);
INSERT INTO "anniversaries [move to tasks AND ~/arch]" VALUES ('Harris','2025-02-19','birthday',NULL);
INSERT INTO "anniversaries [move to tasks AND ~/arch]" VALUES ('Ramadan','2024-03-10','holiday',NULL);
INSERT INTO "anniversaries [move to tasks AND ~/arch]" VALUES ('Eid Al-Fitr','2024-04-10','holiday',NULL);
INSERT INTO "anniversaries [move to tasks AND ~/arch]" VALUES ('Mother''s Day','2024-05-13','holiday',NULL);
INSERT INTO "anniversaries [move to tasks AND ~/arch]" VALUES ('Father''s Day','2024-06-16','holiday',NULL);
INSERT INTO "anniversaries [move to tasks AND ~/arch]" VALUES ('Nabi','2025-02-14','holiday','Rose day on Feb 7');
CREATE VIEW V_expenses AS
	WITH	
	frequencies AS (
		SELECT
			ROWID,
			amount,
			frequency / 100000 		  as numberOfYears,
			frequency % 100000 / 1000 as numberOfMonths,
			frequency % 1000 	  	  as numberOfDays
		FROM expenses
	),
	
	daily AS (
		SELECT 
			ROWID, -- To make the join successful
				amount / (365*numberOfYears + 30.437*numberOfMonths + numberOfDays) AS
			rate
		FROM frequencies
	)

	SELECT
		e.ROWID as id,
		-- Bill as is
		bill,
		-- Calculate rates according to amount and frequency
			round(30.437 * daily.rate,2) AS
		monthly,
			round(7 * daily.rate,2) AS
		weekly,
			round(daily.rate,2) AS
		daily,
		-- Requires external formatting: foreach ($row in $x) {$row.Deadline = (date $row.Deadline -format "MMM d").toUpper()}
		deadline,
		-- Calculate time left
			round(julianday(deadline) - julianday('now'),0) AS
		remaining,
		-- Source as is
		source,
		-- isPaid: Change 0/1 to False/True
			CASE
				WHEN isPaid = 0 THEN 'false'
				WHEN isPaid = 1 THEN 'true'
			END AS
		isPaid,
		-- Note as is
		"notes"
		
	FROM expenses AS e
	JOIN daily ON daily.ROWID = id
	WHERE deadline != ''
	ORDER BY Deadline;
CREATE VIEW V_expenses_aggr AS
SELECT
    NULL AS id,
    'TOTAL' AS bill,
    SUM(monthly) AS monthly,
    SUM(weekly) AS weekly,
    SUM(daily) AS daily,
    MIN(deadline) AS deadline,
    MIN(remaining) AS remaining,
    NULL AS source,
	NULL AS isPaid,
    'Sums include debit only' AS Note
FROM V_expenses WHERE source = 'debit';
COMMIT;
