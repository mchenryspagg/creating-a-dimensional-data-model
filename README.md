# Creating a Dimensional data model Using MySQL Workbench

## Table of contents

- [About](#about)
- [Project Overview](#project-overview)
- [Business Requirements](#business-requirements)
- [Part A](#part-a)
- [Steps to Create the Dimensional Model](#steps-to-create-the-dimensional-model)
- [Data Model Design](#data-model-design)
- [Table Description](#table-description)
- [Links](#links)
- [Summary](#summary)
- [Acknowledgements](#acknowledgements)

## About
This project involves creating a dimensional data model using MySQL Workbench for a car repair shop's operations in western Canada by examining a sample [invoice](https://drive.google.com/file/d/1enihc1uFFW9dHPYFiBC27wpk92QodBC-/view?usp=sharing) of the business.  The project objective is to analyze sales performance and make informed decisions by examining customer behavior, vehicle trends, job performance, parts usage, and overall financial health. 


## Project Overview
You are tasked with performing a comprehensive analysis of a car repair shop’s operations based on a sample [invoice](https://drive.google.com/file/d/1enihc1uFFW9dHPYFiBC27wpk92QodBC-/view?usp=sharing). The data includes information about customers, vehicles, jobs performed, parts used, and invoice summaries. Your goal is to extract meaningful insights using SQL and generate reports that can help the business optimize its operations, improve customer satisfaction, and increase profitability.
You will first suggest a design for a dimensional model to analyze data based on what data you think is relevant for a sales analysis. This technique reinforces that a dimensional model should be a logical business view of data.


## Business Requirements
The model will satisfy the following general needs:
-	Analyze the sales performance of our car repair centers.
-	Locations across western Canada.
-	Provide flexible analysis of sales of both services and parts by customer, vehicle brand/model/year, and shop location.

A sample [invoice](https://drive.google.com/file/d/1enihc1uFFW9dHPYFiBC27wpk92QodBC-/view?usp=sharing) illustrates the information recorded for auto service. Using only this information, infer a design for a dimensional model. The sample invoice may contain information that is superfluous to the core purpose of the model; and include only what is relevant for sales analysis.



## Steps to Create the Dimensional Model

1. **Understand the Business Requirements:**
   - Review the sample invoice and identify key pieces of information relevant for sales analysis.
   - Determine the types of analysis needed, such as sales by customer, vehicle brand/model/year, services, parts, and shop locations.

2. **Identify Facts and Dimensions:**
   - **Facts:** Determine key metrics (facts) to analyze, such as service charges, parts charges, total sales, etc.
   - **Dimensions:** Identify attributes (dimensions) to slice and dice these metrics, such as customer information, vehicle details, service types, part details, location information, and date/time of the transaction.

3. **Design Fact Table:**
   - Create a table to store quantitative data related to sales. Ensure this table includes foreign keys to link to the dimension tables.

4. **Design Dimension Tables:**
   - Create tables to store qualitative data for customers, vehicles, services, parts, locations, and dates. Ensure these tables support the fact table and facilitate detailed analysis.

5. **Create ER Diagram in MySQL Workbench:**
   - Create tables for each fact and dimension.
   - Define primary keys for each table.
   - Establish foreign key relationships between the fact table and dimension tables.
   - Ensure all necessary relationships between tables are defined.
   - Ensure referential integrity between tables.
   - Develop an Entity-Relationship diagram representing your fact and dimension tables.

6. **Document the Model:**
   - Prepare a PDF document including:
     - The ER diagram.
     - Descriptions of each table and column.
     - Logical explanations of your decisions in creating the tables from the sales receipt.


## Data Model Design
A dimensional data model was constructed using MySQL and named ‘DA_mchenryspagg’ per the project’s specifications. This data model adopts the star schema, consisting of a sales fact table and six additional dimension tables: ‘*jobs,’ ‘locations,’ ‘vehicles,’ ‘customers,’ ‘parts,’ and ‘dates*.’ The ER diagram screenshot below illustrates the relationships among these tables, connecting primary keys and foreign keys between the fact table and its associated dimensions.
   
  ![image](https://github.com/user-attachments/assets/308529b3-1ced-470d-b848-cc7db3870856)


## Table Description

Here's a description of the sales fact table and the six dimension tables created based on the database design:

### Fact Table:

**Sales**
| Column Name    | Data Type       | Description                               |
| -------------- | --------------- | ----------------------------------------- |
| InvoiceID      | Integer         | Primary key                               |
| CustomerID     | Integer         | Foreign key to Customers                  |
| VehicleID      | Integer         | Foreign key to Vehicles                   |
| JobID          | Integer         | Foreign key to Jobs                       |
| PartID         | Integer         | Foreign key to Parts                      |
| LocationID     | Integer         | Foreign key to Locations                  |
| DateID         | Integer         | Foreign key to Dates                      |
| ServiceCharges | Decimal(10, 2)  | Total service charges                     |
| PartsCharges   | Decimal(10, 2)  | Total charges for parts                   |
| TotalSales     | Decimal(10, 2)  | Total sales amount                        |
| TotalLabor     | Decimal(10, 2)  | Total labor charges                       |
| TotalParts     | Decimal(10, 2)  | Total parts charges                       |
| SalesTax       | Decimal(10, 2)  | Sales tax amount                          |
| TotalAmount    | Decimal(10, 2)  | Total invoice amount                      |

### Dimension Tables:

**Customers**
| Column Name | Data Type       | Description                  |
| ----------- | --------------- | ---------------------------- |
| CustomerID  | Integer         | Primary key                  |
| Name        | Varchar(100)    | Customer's full name         |
| Address     | Varchar(255)    | Customer's address           |
| Phone       | Varchar(20)     | Customer's phone number      |

**Vehicles**
| Column Name | Data Type       | Description                  |
| ----------- | --------------- | ---------------------------- |
| VehicleID   | Integer         | Primary key                  |
| Make        | Varchar(50)     | Make of the vehicle          |
| Model       | Varchar(50)     | Model of the vehicle         |
| Year        | Integer         | Year of manufacture          |
| Color       | Varchar(20)     | Color of the vehicle         |
| VIN         | Varchar(50)     | Vehicle Identification Number|
| RegNo       | Varchar(50)     | Registration number          |
| Mileage     | Integer         | Mileage at the time of service|

**Jobs**
| Column Name    | Data Type       | Description                  |
| -------------- | --------------- | ---------------------------- |
| JobID          | Integer         | Primary key                  |
| JobDescription | Varchar(255)    | Description of the job       |
| Hours          | Decimal(5, 2)   | Number of hours spent        |
| Rate           | Decimal(10, 2)  | Hourly rate                  |

**Parts**
| Column Name | Data Type       | Description                  |
| ----------- | --------------- | ---------------------------- |
| PartID      | Integer         | Primary key                  |
| PartNumber  | Varchar(50)     | Part number                  |
| PartName    | Varchar(100)    | Name of the part             |
| Quantity    | Integer         | Quantity used                |
| UnitPrice   | Decimal(10, 2)  | Price per unit               |

**Locations**
| Column Name  | Data Type       | Description                  |
| ------------ | --------------- | ---------------------------- |
| LocationID   | Integer         | Primary key                  |
| LocationName | Varchar(100)    | Name of the location         |
| Address      | Varchar(255)    | Address of the location      |

**Dates**
| Column Name | Data Type       | Description                  |
| ----------- | --------------- | ---------------------------- |
| DateID      | Integer         | Primary key                  |
| Date        | Date            | Actual date of the transaction|
| Year        | Integer         | Year of the transaction       |
| Month       | Integer         | Month of the transaction      |
| Day         | Integer         | Day of the transaction        |

The above provides a clear and concise description of each table and its columns, helping users understand the structure and purpose of the database.


## Links
- [PDF Report](https://drive.google.com/file/d/1lR5rTB8jSjJCUw3V65CsYsfkBz0gbTSH/view?usp=sharing)
- [SQL Queries Utilised](https://github.com/mchenryspagg/creating-a-dimensional-data-model/blob/main/Part%20A.sql)


## Summary 
The dimensional model consists of clearly defined fact and dimension tables, each serving a specific purpose in sales analysis. The tables and columns were designed based on the data available in the sales receipt, ensuring all necessary details for thorough analysis are captured. This structure supports a wide range of analyses, from customer behaviour and vehicle trends to job performance and parts usage, enabling the business to make informed decisions and optimize operations.


## Acknowledgements
This project is part of the project requirements necessary to graduate from Stage 5 at HNG 11 internship for the Data Analyst Track. Special appreciation to the organizers of the internship, and to my esteemed team members in the data analyst track.
