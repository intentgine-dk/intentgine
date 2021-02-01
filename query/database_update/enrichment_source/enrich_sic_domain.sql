update ig_staging.company as t1
set sic_code =	CASE
					WHEN t2.sic_code1 is not null
						and t2.sic_code1  != 0
						and t2.sic_code1 in (select sic_code from ig_master.sic_code)
					THEN t2.sic_code1 
					ELSE t1.sic_code
				END
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t2.sic_code1 is not null
	and t2.sic_code1 != 0
	and t1.email_domain is not null
	and t1.email_domain != ''
	and trim(t1.email_domain) != ''
	and lower(trim(t1.email_domain)) = lower(trim(replace(replace(replace(t2.company_website, 'https://', ''), 'http://', ''), 'www.', '')))
	and t2.sic_code1 in (select sic_code from ig_master.sic_code);