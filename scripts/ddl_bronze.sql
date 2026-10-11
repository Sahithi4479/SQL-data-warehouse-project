
create or alter procedure bronze.load_bronze as
BEGIN

declare @start_time DATETIME,@end_time DATETIME;
PRINT '====================================';
print 'Loading broze layer';
PRINT '====================================';
PRINT '====================================';
print 'Loading crm source into broze layer';
PRINT '====================================';

set @start_time = GETDATE();
TRUNCATE TABLE bronze.crm_cust_info;
bulk insert bronze.crm_cust_info
from 'C:\Users\ASUS\Downloads\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH(
FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK);
--SELECT * FROM bronze.crm_cust_info;

TRUNCATE TABLE bronze.crm_prd_info;
bulk insert bronze.crm_prd_info
from 'C:\Users\ASUS\Downloads\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH(
FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK);
--SELECT * FROM bronze.crm_prd_info;

TRUNCATE TABLE bronze.crm_sales_details;
bulk insert bronze.crm_sales_details
from 'C:\Users\ASUS\Downloads\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH(
FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK);
--SELECT * FROM bronze.crm_sales_details;


print '====================================';
print 'Loading erp source into broze layer';
print '====================================';

TRUNCATE TABLE bronze.erp_cust_az12;
bulk insert bronze.erp_cust_az12
from 'C:\Users\ASUS\Downloads\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
WITH(
FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK);
--SELECT * FROM bronze.erp_cust_az12;

TRUNCATE TABLE bronze.erp_loc_a101;
bulk insert bronze.erp_loc_a101
from 'C:\Users\ASUS\Downloads\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
WITH(
FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK);
--SELECT * FROM bronze.erp_loc_a101;

TRUNCATE TABLE bronze.erp_px_cat_g1v2;
bulk insert bronze.erp_px_cat_g1v2
from 'C:\Users\ASUS\Downloads\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
WITH(
FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK);
--SELECT * FROM bronze.erp_px_cat_g1v2;

set @end_time=GETDATE();

print 'load duration = '+ cast(datediff(second,@start_time,@end_time) as NVARCHAR) + 'seconds';
END

exec bronze.load_bronze;
