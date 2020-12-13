update ig_staging.company as t1
set employee_size_id = CASE
						WHEN t2.company_employees_bucket = 'Micro (1-20 Employees)'
						THEN '02c84f8b-e340-4621-9a8e-47795be4dd9a'::uuid
						WHEN t2.company_employees_bucket = 'Small (21-100 Employees)'
						THEN 'ecc3d206-0682-40f9-b827-5eb780efdc0b'::uuid
						WHEN t2.company_employees_bucket = 'Medium (101-500 Employees)'
						THEN '5f560a88-9a2a-4c53-a2eb-24d505bd22e5'::uuid
						WHEN t2.company_employees_bucket = 'Medium-Large (501-1000 Employees)'
						THEN '52d02cd6-f358-4103-992e-563e3d9cab49'::uuid
						WHEN t2.company_employees_bucket = 'Large (1001-5000 Employees)'
						THEN '293998a6-ea29-4bed-ba38-cba6fb7b739c'::uuid
						WHEN t2.company_employees_bucket = 'XLarge (5001+ Employees)'
						THEN '432b4eeb-a106-48b0-8b29-ad07153db437'::uuid
						ELSE NULL
					END
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t1.employee_size_id is null
	and t2.company_employees_bucket is not null
	and t2.company_employees_bucket != ''
	and trim(t2.company_employees_bucket) != ''
	and t1.company_linkedin_url is not null
	and t1.company_linkedin_url != ''
	and trim(t1.company_linkedin_url) != '' 
	and lower(trim(t1.company_linkedin_url)) = lower(trim(t2.company_linkedin_url));