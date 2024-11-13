-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/POZyYb


-- Creating the Campaign table
CREATE TABLE "Campaign" (
    "cf_id" int NOT NULL,                -- Unique identifier for each campaign
    "contact_id" int NOT NULL,           -- References the contact managing the campaign
    "company_name" Varchar NOT NULL,     -- Name of the company running the campaign
    "description" Varchar NOT NULL,      -- Description of the campaign
    "goal" float NOT NULL,               -- Funding goal for the campaign
    "pledged" float NOT NULL,            -- Amount pledged so far
    "backers_count" int NOT NULL,        -- Number of backers who supported the campaign
    "county" Varchar NOT NULL,           -- County where the campaign is based
    "currency" Varchar NOT NULL,         -- Currency used for the campaign goal and pledges
    "launch_Date" date NOT NULL,         -- Launch date of the campaign
    "end_Date" date NOT NULL,            -- End date of the campaign
    "category_id" Varchar NOT NULL,      -- References the category of the campaign
    "subcategory_id" Varchar NOT NULL,   -- References the subcategory of the campaign
    CONSTRAINT "pk_Campaign" PRIMARY KEY ("cf_id")  -- Primary key constraint on cf_id
);

-- Creating the Category table
CREATE TABLE "Category" (
    "category_id" Varchar NOT NULL,      -- Unique identifier for each category
    "category" Varchar NOT NULL,         -- Name of the category
    CONSTRAINT "pk_Category" PRIMARY KEY ("category_id")  -- Primary key constraint on category_id
);

-- Creating the SubCategory table
CREATE TABLE "SubCategory" (
    "subcategory_id" Varchar NOT NULL,   -- Unique identifier for each subcategory
    "subcategory" Varchar NOT NULL,      -- Name of the subcategory
    CONSTRAINT "pk_SubCategory" PRIMARY KEY ("subcategory_id")  -- Primary key constraint on subcategory_id
);

-- Creating the Contacts table
CREATE TABLE "Contacts" (
    "contact_id" int NOT NULL,           -- Unique identifier for each contact
    "first_name" Varchar NOT NULL,       -- First name of the contact
    "last_name" Varchar NOT NULL,        -- Last name of the contact
    "email" Varchar NOT NULL,            -- Email address of the contact
    CONSTRAINT "pk_Contacts" PRIMARY KEY ("contact_id")  -- Primary key constraint on contact_id
);

-- Selecting all records from each table for review
SELECT * FROM "Campaign";
SELECT * FROM "Contacts";
SELECT * FROM "Category";
SELECT * FROM "SubCategory";

-- Adding foreign key constraint to Campaign table for contact_id
ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_contact_id" 
FOREIGN KEY("contact_id") REFERENCES "Contacts" ("contact_id");

-- Adding foreign key constraint to Campaign table for category_id
ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_category_id" 
FOREIGN KEY("category_id") REFERENCES "Category" ("category_id");

-- Adding foreign key constraint to Campaign table for subcategory_id
ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_subcategory_id" 
FOREIGN KEY("subcategory_id") REFERENCES "SubCategory" ("subcategory_id");