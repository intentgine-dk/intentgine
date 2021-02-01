update ig_staging.company as t1
set industry_id = t2.industry_id
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t1.industry_id is null
	and t2.industry_id is not null

	and t1.email_domain is not null
	and t1.email_domain != ''
	and trim(t1.email_domain) != ''
	and lower(trim(t1.email_domain)) = lower(trim(replace(replace(replace(t2.company_domain, 'https://', ''), 'http://', ''), 'www.', '')));