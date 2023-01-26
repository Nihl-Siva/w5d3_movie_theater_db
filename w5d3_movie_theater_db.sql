CREATE TABLE "customers" (
	"customer_id" SERIAL PRIMARY KEY,
	"first_name" VARCHAR(100),
	"last_name" VARCHAR(100),
	"rewards_member" BOOLEAN
);

CREATE TABLE "movies" (
	"movie_id" SERIAL PRIMARY KEY,
	"director" VARCHAR(100),
	"writer" VARCHAR(100),
	"rating" VARCHAR(10),
	"run_time" TIME,
	"distributor" VARCHAR(100)
);

CREATE TABLE "concessions" (
	"concession_id" SERIAL PRIMARY KEY,
	"concession_price" NUMERIC(5,2),
	"item" VARCHAR(100)
);

CREATE TABLE "tickets" (
	"ticket_id" SERIAL PRIMARY KEY,
	"ticket_price" NUMERIC(5,2),
	"showing" TIMESTAMP,
	"theater" INTEGER,
	"movie_id" INTEGER REFERENCES "movies"("movie_id")
);

CREATE TABLE "payments" (
	"payment_id" SERIAL PRIMARY KEY,
	"concession_total" NUMERIC(6,5),
	"ticket_total" NUMERIC(6,5),
	"purchase_total" NUMERIC(6,5),
	"customer_id" INTEGER REFERENCES "customers"("customer_id"),
	"concession_id" INTEGER REFERENCES "concessions"("concession_id"),
	"ticket_id" INTEGER REFERENCES "tickets"("ticket_id")
);

INSERT INTO "concessions"(
	"concession_price",
	"item"
)VALUES(
	10.00,
	'Large Soda'
);

INSERT INTO "concessions"(
	"concession_price",
	"item"
)VALUES(
	8.00,
	'Popcorn'
);

SELECT*
FROM "concessions";

INSERT INTO "customers"(
	"first_name",
	"last_name",
	"rewards_member"
)VALUES(
	'Navin',
	'Johnson',
	True
);

SELECT*
FROM "customers";


-- Realizing I somehow forgot 'title' on movies until I got here, I added that column, then checked that it was showing up.
ALTER TABLE "movies"
ADD "title" VARCHAR(250);

SELECT*
FROM "movies";

INSERT INTO "movies"(
	"director",
	"writer",
	"rating",
	"run_time",
	"distributor",
	"title"
)VALUES(
	'Sam Wann',
	'Robert Tarantino',
	'R',
	'02:05:45',
	'El Rey Band Apart Studios',
	'Starship Troopers Wear Prada'
);

SELECT*
FROM "movies";

INSERT INTO "tickets"(
	"ticket_price",
	"showing",
	"theater",
	"movie_id"
)VALUES(
	10.00,
	'2023-01-27 19:30:00',
	3,
	1
);

SELECT*
FROM "tickets";
	
-- At this point I noticed I set the scale wrong on all the numeric columns in payments, so I went back and altered them to (6,2) rather than (6,5)	

ALTER TABLE payments
ALTER COLUMN concession_total TYPE NUMERIC(6,2),
ALTER COLUMN ticket_total TYPE NUMERIC(6,2),
ALTER COLUMN purchase_total TYPE NUMERIC(6,2);


INSERT INTO  "payments"(
	"concession_total",
	"ticket_total",
	"purchase_total",
	"customer_id",
	"concession_id",
	"ticket_id"
)VALUES(
	8.00,
	10.00,
	18.00,
	1,
	2,
	1
);

SELECT*
FROM "payments";

