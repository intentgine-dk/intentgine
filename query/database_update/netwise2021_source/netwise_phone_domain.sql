update ig_staging.company as t1
set phone_number = t2.company_phone_headquarters
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and (
		t1.phone_number is null
		or trim(t1.phone_number) = ''
	)
	and t2.company_phone_headquarters is not null
	and t2.company_phone_headquarters != ''
	and trim(t2.company_phone_headquarters) != ''
	and t1.email_domain is not null
	and t1.email_domain != ''
	and trim(t1.email_domain) != ''
	and lower(trim(t1.email_domain)) = lower(trim(replace(replace(replace(t2.company_domain, 'https://', ''), 'http://', ''), 'www.', '')));