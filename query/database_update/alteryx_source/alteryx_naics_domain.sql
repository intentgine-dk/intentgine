update ig_staging.company as t1
set naics_code = CASE
					when t2.acc_naics_code is not null
					THEN substring(NULLIF(regexp_replace(t2.acc_naics_code, '\D','','g'), ''), 1, 6)::numeric
					ELSE t1.naics_code
				END
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t2.acc_naics_code is not null
	and substring(trim(t2.acc_naics_code), 1, 6)::numeric != 0
	and t1.email_domain is not null
	and t1.email_domain != ''
	and trim(t1.email_domain) != ''
	and lower(trim(t1.email_domain)) = lower(trim(replace(replace(replace(t2.company_website, 'https://', ''), 'http://', ''), 'www.', '')))
	and substring(trim(t2.acc_naics_code), 1, 6)::numeric in (select naics_code from ig_master.naics_code);