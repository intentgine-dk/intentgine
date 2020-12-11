update ig_staging.company as t1
set phone_number = trim(t2.company_phone_local)
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and (
		t1.phone_number is null
		or t1.phone_number = ''
		or trim(t1.phone_number) = ''
		)
	and t2.company_phone_local is not null
	and t2.company_phone_local != ''
	and trim(t2.company_phone_local) != ''
	and t1.email_domain is not null
	and t1.email_domain != ''
	and trim(t1.email_domain) != ''
	and lower(trim(t1.email_domain)) = lower(trim(replace(replace(replace(t2.company_domain, 'https://', ''), 'http://', ''), 'www.', '')));