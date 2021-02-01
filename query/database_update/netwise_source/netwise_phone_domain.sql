update ig_staging.company as t1
set phone_number =	CASE
						WHEN trim(t2.company_phone_local) != '' and t2.company_phone_local is not null
						THEN trim(t2.company_phone_local)
					ELSE t1.phone_number
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t2.company_phone_local is not null
	and t2.company_phone_local != ''
	and trim(t2.company_phone_local) != ''
	and t1.email_domain is not null
	and t1.email_domain != ''
	and trim(t1.email_domain) != ''
	and lower(trim(t1.email_domain)) = lower(trim(replace(replace(replace(t2.company_domain, 'https://', ''), 'http://', ''), 'www.', '')));