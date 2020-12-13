update ig_staging.company as t1
set naics_code = t2.naics_code1
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t1.naics_code is null
	and t2.naics_code1 is not null
	and t2.naics_code1 != 0
	and t1.email_domain is not null
	and t1.email_domain != ''
	and trim(t1.email_domain) != ''
	and lower(trim(t1.email_domain)) = lower(trim(replace(replace(replace(t2.company_website, 'https://', ''), 'http://', ''), 'www.', '')))
	and t2.naics_code1 in (select naics_code from ig_master.naics_code);