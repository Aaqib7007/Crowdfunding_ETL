-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/POZyYb
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" Varchar   NOT NULL,
    "description" Varchar   NOT NULL,
    "goal" float   NOT NULL,
    "pledged" float   NOT NULL,
    "backers_count" int   NOT NULL,
    "county" Varchar   NOT NULL,
    "currency" Varchar   NOT NULL,
    "launch_Date" date   NOT NULL,
    "end_Date" date   NOT NULL,
    "category_id" Varchar   NOT NULL,
    "subcategory_id" Varchar  NOT NULL,
    CONSTRAINT "pk_Campaign" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "Category" (
    "category_id" Varchar   NOT NULL,
    "category" Varchar   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "SubCategory" (
    "subcategory_id" Varchar   NOT NULL,
    "subcategory" Varchar   NOT NULL,
    CONSTRAINT "pk_SubCategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "Contacts" (
    "contact_id" int   NOT NULL,
    "first_name" Varchar   NOT NULL,
    "last_name" Varchar   NOT NULL,
    "email" Varchar   NOT NULL,
    CONSTRAINT "pk_Contacts" PRIMARY KEY (
        "contact_id"
     )
);

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "Contacts" ("contact_id");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "Category" ("category_id");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "SubCategory" ("subcategory_id");

