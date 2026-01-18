CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	BEGIN TRY
		TRUNCATE TABLE bronze.crm_customer_info;
		BULK INSERT bronze.crm_customer_info 
		FROM 'D:\my papka\IT FOLDER\datasets\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		----------------------------------------------
		TRUNCATE TABLE bronze.crm_prd_info;
		BULK INSERT bronze.crm_prd_info 
		FROM 'D:\my papka\IT FOLDER\datasets\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		-------------------------------------------------

		TRUNCATE TABLE bronze.crm_sales_details;
		BULK INSERT bronze.crm_sales_details 
		FROM 'D:\my papka\IT FOLDER\datasets\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		-------------------------------------------------

		TRUNCATE TABLE bronze.erp_loc_a101;
		BULK INSERT bronze.erp_loc_a101 
		FROM 'D:\my papka\IT FOLDER\datasets\sql-data-warehouse-project-main\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		---------------------------------------------------

		TRUNCATE TABLE bronze.erp_cust_az12;
		BULK INSERT bronze.erp_cust_az12 
		FROM 'D:\my papka\IT FOLDER\datasets\sql-data-warehouse-project-main\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);


		---------------------------------------------------

		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		BULK INSERT bronze.erp_px_cat_g1v2 
		FROM 'D:\my papka\IT FOLDER\datasets\sql-data-warehouse-project-main\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	END TRY
	BEGIN CATCH
	PRINT '==============================================='
	PRINT 'Bronze layerni yuklashda xatolik'
	PRINT 'Error message' + ERROR_MESSAGE()
	PRINT 'Error message' + CAST (ERROR_NUMBER() AS NVARCHAR)
	PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR)
	PRINT '==============================================='
	END CATCH
END

EXEC bronze.load_bronze


