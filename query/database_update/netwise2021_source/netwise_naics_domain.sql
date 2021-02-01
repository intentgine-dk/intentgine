update ig_staging.company as t1
set naics_code = t2.company_primary_naics_code
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and (
		t1.naics_code is NULL
		or t1.naics_code = 0
	)
	and t2.company_primary_naics_code is not null
	and t2.company_primary_naics_code != 0
	and t1.email_domain is not null
	and t1.email_domain != ''
	and trim(t1.email_domain) != ''
	and lower(trim(t1.email_domain)) = lower(trim(replace(replace(replace(t2.company_domain, 'https://', ''), 'http://', ''), 'www.', '')))
	and t2.company_primary_naics_code in (select naics_code from ig_master.naics_code);