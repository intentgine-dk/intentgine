update ig_staging.company as t1
set revenue_range_id = CASE
						WHEN t2.company_revenue_bucket = 'Less than $1 Million'
						THEN '5f1ae9bd-8392-41a5-88ac-6316346aeed1'::uuid
						WHEN t2.company_revenue_bucket = '$1 - 9.99 Million'
						THEN '5f1ae9bd-8392-41a5-88ac-6316346aeed1'::uuid
						WHEN t2.company_revenue_bucket = '$10 - 49.99 Million'
						THEN '9a4dd4d2-7d06-4e37-b7de-e5c5052c2fe7'::uuid
						WHEN t2.company_revenue_bucket = '$50 - 99.99 Million'
						THEN '1ff29d62-09d5-4ec8-8e92-535fa01b1ac4'::uuid
						WHEN t2.company_revenue_bucket = '$100 - 999.99 Million'
						THEN '5ff7f0e8-4e63-456d-9559-1efcacc29a9c'::uuid
						WHEN t2.company_revenue_bucket = '$1+ Billion'
						THEN '9c633c91-d675-4ae8-bab3-8c0d4b5110f8'::uuid
						ELSE t1.revenue_range_id
					END
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t1.revenue_range_id is null
	and t2.company_revenue_bucket is not null
	and t2.company_revenue_bucket != ''
	and trim(t2.company_revenue_bucket) != ''
	and t1.company_linkedin_url is not null
	and t1.company_linkedin_url != ''
	and trim(t1.company_linkedin_url) != '' 
	and lower(trim(t1.company_linkedin_url)) = lower(trim(t2.company_linkedin_url));