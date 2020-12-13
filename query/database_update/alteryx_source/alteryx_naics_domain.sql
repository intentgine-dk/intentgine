update ig_staging.company as t1
set naics_code = substring(trim(t2.acc_naics_code), 1, 6)::numeric
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t1.naics_code is null
	and t2.acc_naics_code is not null
	and substring(trim(t2.acc_naics_code), 1, 6)::numeric != 0
	and t1.email_domain is not null
	and t1.email_domain != ''
	and trim(t1.email_domain) != ''
	and lower(trim(t1.email_domain)) = lower(trim(replace(replace(replace(t2.company_website, 'https://', ''), 'http://', ''), 'www.', '')))
	and substring(trim(t2.acc_naics_code), 1, 6)::numeric in (select naics_code from ig_master.naics_code);