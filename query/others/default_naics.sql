update ig_staging.company
set naics_code = CASE
					WHEN industry_id = 'a563ff01-a983-4fe9-abf5-c34f5d947ca5'
					THEN 561
					WHEN industry_id = '4a9fb6fe-568a-4c6d-846c-bb23a38acb0c'
					THEN 334
					WHEN industry_id = '90629093-1b47-4894-8e0a-420b25a6d338'
					THEN 81
					WHEN industry_id = '10b49d38-568b-47e6-94fd-4941182ae3c9'
					THEN 61
					WHEN industry_id = 'aaa42a86-bc99-4cad-8107-9a01d29cfe09'
					THEN 21
					WHEN industry_id = 'dfd5b099-7109-4395-897c-571eb6671759'
					THEN 52
					WHEN industry_id = '92467282-4610-4a55-abdd-74a12b91f0f9'
					THEN 11
					WHEN industry_id = '4ca3d313-08d6-404e-8423-c0ed5b8b8bbd'
					THEN 92
					WHEN industry_id = 'ff45bb0b-b962-4b37-816a-9bcb69151b5f'
					THEN 62
					--WHEN industry_id = '602a2eef-3aa6-4400-a4b7-74788902ff60'
					--THEN 31
					WHEN industry_id = '88fc4fef-7ba6-4f10-b538-63a121bc56fe'
					THEN 512
					WHEN industry_id = 'df1ebcf6-12b4-4c09-97c6-b722a524cd99'
					THEN 813219
					WHEN industry_id = '5656f706-066a-4bcd-9e3d-4e54cffec1dd'
					THEN 23
					--WHEN industry_id = 'b19c5736-4b04-4768-b095-e97b4e93b867'
					--THEN 44
					WHEN industry_id = '2793f45a-06b3-4cc1-8de0-e4db4bbeebe6'
					THEN 51
					WHEN industry_id = 'ca6aaade-3662-48a0-a4c2-6d42121761e0'
					THEN 517
					--WHEN industry_id = '663ecfeb-4224-4647-a0cc-5525bad573b4'
					--THEN 48
					WHEN industry_id = '562445a1-a0dc-4ee0-afa3-91209ad8424e'
					THEN 72
					WHEN industry_id = '9a1e8bfd-d34d-48a7-808d-17465ad72840'
					THEN 42
					ELSE NULL
				END
WHERE
	naics_code is null;