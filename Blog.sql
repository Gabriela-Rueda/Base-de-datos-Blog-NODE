CREATE TABLE "user" (
  "id" SERIAL PRIMARY KEY,
  "nombre" varchar,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int
);

CREATE TABLE "tags" (
  "id" SERIAL PRIMARY KEY,
  "id_category" int,
  "id_author" int,
  "title" varchar NOT NULL,
  "description" varchar,
  "content" text NOT NULL
);

CREATE TABLE "author" (
  "id" SERIAL PRIMARY KEY,
  "firstname" varchar UNIQUE,
  "lastname" varchar,
  "user" varchar UNIQUE
);

CREATE TABLE "categories" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "comments" (
  "id" SERIAL PRIMARY KEY,
  "id_user" int,
  "id_tags" int,
  "comment" text NOT NULL
);

ALTER TABLE "tags" ADD FOREIGN KEY ("id_author") REFERENCES "author" ("id");

ALTER TABLE "tags" ADD FOREIGN KEY ("id_category") REFERENCES "categories" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("id_user") REFERENCES "user" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("id_tags") REFERENCES "tags" ("id");

insert into "user" (nombre, email, "password", age) values
('Jesus', 'jesus@gmail.com', '12345', 17),
('Paola', 'paola@gmail.com', '6754', 22);

select * from "user" u ;

insert into author (firstname, lastname, "user") values
('Luis', 'Sanchez', 'LSanchez'),
('Angela','Ramirez','AngelR');

select * from author ;

insert into categories (name) values 
('Ciencia'),('Astrologia'),('Libros'),('Cocina');

insert into tags (id_category, id_author, title, description, "content") values
(1,2,'Familia neandertal', '',
'Hallan por primera vez una familia neandertal en una cueva de Siberia'),
(3,1,'Próximo libro de ‘Game of Thrones’','',
'George R. R. Martin ha confirmado que continúa en la escritura del próximo libro de Game of Thrones');

insert into "comments" (id_user, id_tags, "comment") values
(1,1,'Interesante informacion sobre el hallazgo'),
(2,1,'Increible'),
(2,2,'Al fin un proximo libro de esta increible saga')

select * from tags t ;

select * from "comments" c ;