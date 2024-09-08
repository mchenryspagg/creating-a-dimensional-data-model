-- Drop a column not needed for initial analysis
ALTER TABLE da_mchenryspagg.vehicles DROP COLUMN OwnerName;

-- Change Column Name Date to TransactionDate in Date Table
ALTER TABLE da_mchenryspagg.dates RENAME COLUMN InvoiceDate TO TransactionDate;

-- Change Column Name Year to TransactionYear in Date Table
ALTER TABLE da_mchenryspagg.dates RENAME COLUMN InvoiceYear TO TransactionYear;

-- Change Column Name Month to TransactionMonth in Date Table
ALTER TABLE da_mchenryspagg.dates RENAME COLUMN InvoiceMonth TO TransactionMonth;

-- Change Column Name Day to TransactionDay in Date Table
ALTER TABLE da_mchenryspagg.dates RENAME COLUMN InvoiceDay TO TransactionDay;


-- Add New columns - DateDue to the Date Table
ALTER TABLE da_mchenryspagg.dates ADD COLUMN DueDate DATE AFTER ReceivedDate;

-- Drop a column not needed for initial analysis