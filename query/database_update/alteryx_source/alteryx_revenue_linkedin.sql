update ig_staging.company as t1
set revenue_range_id = CASE
						when trim(t2.acc_revenue_range) = 'Upto 10 Million'
						then '5f1ae9bd-8392-41a5-88ac-6316346aeed1'::uuid
						when trim(t2.acc_revenue_range) = '10 Million to 50 Million'
						then '9a4dd4d2-7d06-4e37-b7de-e5c5052c2fe7'::uuid
						when trim(t2.acc_revenue_range) = '50 Million to 100 Million'
						then '1ff29d62-09d5-4ec8-8e92-535fa01b1ac4'::uuid
						when trim(t2.acc_revenue_range) = '100 Million to 250 Million'
						then 'd75aa472-5604-41fe-8d68-bc4455cdd5a2'::uuid
						when trim(t2.acc_revenue_range) = '250 Million to 500 Million'
						then 'c8fb03af-1dc4-42f6-86dc-75b140b305af'::uuid
						when trim(t2.acc_revenue_range) = '500 Million to 1 Billion'
						then '5ff7f0e8-4e63-456d-9559-1efcacc29a9c'::uuid
						when trim(t2.acc_revenue_range) = '1 Billion and above'
						then '9c633c91-d675-4ae8-bab3-8c0d4b5110f8'::uuid
						when trim(t2.acc_revenue_range) = '1 Billion and Above'
						then '9c633c91-d675-4ae8-bab3-8c0d4b5110f8'::uuid
						ELSE Null
						end
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t1.revenue_range_id is null
	and t2.acc_revenue_range is not null
	and t2.acc_revenue_range != ''
	and trim(t2.acc_revenue_range) != ''
	and t1.company_linkedin_url is not null
	and t1.company_linkedin_url != ''
	and trim(t1.company_linkedin_url) != '' 
	and lower(trim(replace(t1.company_linkedin_url, 'https://www.', ''))) = lower(trim(t2.company_linkedin_url));