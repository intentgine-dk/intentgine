update ig_staging.company as t1
set revenue_range_id = CASE
						when t2.annual_revenue = '$0 to $49.999'
						then '5f1ae9bd-8392-41a5-88ac-6316346aeed1'::uuid
						when t2.annual_revenue = '$50.000 to $99.999'
						then '5f1ae9bd-8392-41a5-88ac-6316346aeed1'::uuid
						when t2.annual_revenue = '$100.000 to $499.999'
						then '5f1ae9bd-8392-41a5-88ac-6316346aeed1'::uuid
						when t2.annual_revenue = '$500.000 to $999.999'
						then '5f1ae9bd-8392-41a5-88ac-6316346aeed1'::uuid
						when t2.annual_revenue = '$1.000.000 to $2.499.999'
						then '5f1ae9bd-8392-41a5-88ac-6316346aeed1'::uuid
						when t2.annual_revenue = '$2.500.000 to $4.999.999'
						then '5f1ae9bd-8392-41a5-88ac-6316346aeed1'::uuid
						when t2.annual_revenue = '$5.000.000 to $9.999.999'
						then '5f1ae9bd-8392-41a5-88ac-6316346aeed1'::uuid
						when t2.annual_revenue = '$10.000.000 to $19.9999.999'
						then '9a4dd4d2-7d06-4e37-b7de-e5c5052c2fe7'::uuid
						when t2.annual_revenue = '$20.000.000 to $49.9999.999'
						then '9a4dd4d2-7d06-4e37-b7de-e5c5052c2fe7'::uuid
						when t2.annual_revenue = '$50.000.000 to $99.999.999'
						then '1ff29d62-09d5-4ec8-8e92-535fa01b1ac4'::uuid
						when t2.annual_revenue = '$100.000.000 to $499.999.999'
						then 'd75aa472-5604-41fe-8d68-bc4455cdd5a2'::uuid
						when t2.annual_revenue = '$500.000.000 to $999.999.999'
						then '5ff7f0e8-4e63-456d-9559-1efcacc29a9c'::uuid
						when t2.annual_revenue = 'Over $1 Billion'
						then '9c633c91-d675-4ae8-bab3-8c0d4b5110f8'::uuid
						else NULL
					END
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t1.revenue_range_id is null
	and t2.annual_revenue is not null
	and t2.annual_revenue != ''
	and trim(t2.annual_revenue) != ''
	and t1.email_domain is not null
	and t1.email_domain != ''
	and trim(t1.email_domain) != ''
	and lower(trim(t1.email_domain)) = lower(trim(replace(replace(replace(t2.web, 'https://', ''), 'http://', ''), 'www.', '')));