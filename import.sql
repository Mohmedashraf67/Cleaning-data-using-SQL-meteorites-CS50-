create table if not exists "meteorites" (
 "name" text,
"id" int,
-- "nametype" text,
"class" text,
"mass" real,
"discovery"text ,
"year" int,
"lat" real,
"long" real,
primary key("id")
);

.import --csv --skip 0 meteorites.csv meteorites_temp
-- drop table "meteorites"

update meteorites_temp
set mass=NULL
where mass =0;


update meteorites_temp
set year=NULL
where year =0;

update meteorites_temp
set year=NULL
where year like '';


update meteorites_temp
set lat=NULL
where lat =0;


update meteorites_temp
set long=NULL
where long =0;


update meteorites_temp
set mass =round(mass,2),
    lat=round(lat,2),
    long= round(long,2);


INSERT INTO "meteorites" ("id", "name" ,"class" ,"mass" ,"discovery" ,"year" ,"lat" ,"long" )
SELECT "id", "name" ,"class","mass" ,"discovery" ,"year" ,"lat" ,"long"
FROM "meteorites_temp"
where "nametype" NOT like "%relict%"
order by  "year","name";
