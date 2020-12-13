update ig_staging.company as t1
set email_domain = lower(trim(replace(replace(replace(t2.web, 'https://', ''), 'http://', ''), 'www.', '')))
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and (
		t1.email_domain is null
		or t1.email_domain = ''
		or trim(t1.email_domain) = ''
		)
	and t2.web is not null
	and t2.web != ''
	and trim(t2.web) != ''
	and upper(trim(t1.company_name)) = upper(trim(t2.business_name));