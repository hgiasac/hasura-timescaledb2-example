CREATE TABLE "public"."locations"(
  "id" Text NOT NULL, 
  "description" text NOT NULL, 
  PRIMARY KEY ("id") 
);

INSERT INTO "public"."locations" VALUES
  ('US', 'United State'),
  ('EU', 'Europe');
