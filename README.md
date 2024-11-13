Crowdfunding_ETL project

Introduction
This ETL (Extract, Transform, Load) Mini Project aims to process raw data from a crowdfunding platform, clean it, and organize it into well-structured CSV files for future analysis. By using Python and the Pandas library, we extract data from Excel files, transform it through cleaning and reformatting, and finally save the results as structured CSV files.
<img width="531" alt="Screenshot 2024-11-13 at 6 45 04 PM" src="https://github.com/user-attachments/assets/fbb6db99-b765-496c-876c-c0fd8bf29e6d">

Project Overview
The project involves three main datasets:
1.	Crowdfunding Data (crowdfunding.xlsx): Contains detailed information about various crowdfunding campaigns.
2.	Contacts Data (contacts.xlsx): Includes information about contact persons for each campaign.
3.	Category and Subcategory Data (extracted from the crowdfunding.xlsx file): Contains hierarchical categories of the campaigns.

Objective
The goal is to extract data from these sources, clean and format it appropriately, and save the transformed data into four CSV files:
•	category.csv
•	subcategory.csv
•	campaign.csv
•	contacts.csv

ETL Workflow Summary
1.	Extract: Load data from Excel files using Pandas.
2.	Transform: Clean, reformat, and merge data to create a unified dataset.
3.	Load: Export the cleaned and processed data to CSV files.
________________________________________
Extract Data
We began by loading the data from Excel files using Pandas.
import pandas as pd
crowdfunding_info_df = pd.read_excel('Resources/crowdfunding.xlsx')
contact_info_df = pd.read_excel('Resources/contacts.xlsx', header=3)
The crowdfunding dataset includes columns like cf_id, contact_id, company_name, goal, pledged, country, currency, and a combined category & sub-category column.

Transform Data
Splitting Categories and Subcategories
We split the category & sub-category column into separate category and sub-category columns for better organization.
crowdfunding_info_df[['category', 'sub-category']] = crowdfunding_info_df['category & sub-category'].str.split('/', expand=True)
From this, we created two separate DataFrames:
•	Category DataFrame: Contains unique categories with their IDs.
•	Subcategory DataFrame: Contains unique subcategories with their IDs.
  
The cleaned DataFrame was exported as category.csv
The cleaned DataFrame was exported as subcategory.csv

Merging and Cleaning Campaign Data
We cleaned the campaign data by converting data types and formatting date columns.
campaign_df['goal'] = campaign_df['goal'].astype(float)
campaign_df['pledged'] = campaign_df['pledged'].astype(float)
campaign_df['launch_date'] = pd.to_datetime(campaign_df['launch_date'], unit='s').dt.strftime('%Y-%m-%d')
campaign_df['end_date'] = pd.to_datetime(campaign_df['end_date'], unit='s').dt.strftime('%Y-%m-%d')
The campaign data was then merged with the category and subcategory DataFrames.
The cleaned DataFrame was exported as campaign.csv

Extracting and Transforming Contact Data
Contact data was extracted from contacts.xlsx, which contained JSON-like strings.
We parsed these strings to create a structured DataFrame with columns: contact_id, first_name, last_name, and email.
The cleaned DataFrame was exported as contacts.csv.

               
Generated CSV Files
1.	category.csv: Contains the list of unique categories and their IDs.
2.	subcategory.csv: Contains the list of unique subcategories and their IDs.
3.	campaign.csv: Includes detailed campaign data with category and subcategory mappings.
4.	contacts.csv: Provides contact information split into first_name, last_name, and email.

Conclusion
This project demonstrated the power of Python's Pandas library for data extraction, cleaning, and transformation. The ETL process helped organize raw data into a structured format, making it easier for analysis and further use

