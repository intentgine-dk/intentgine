update ig_staging.company as t1
set email_domain = lower(trim(replace(replace(replace(t2.website, 'https://', ''), 'http://', ''), 'www.', '')))
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and (
		t1.email_domain = ''
		or trim(t1.email_domain) = ''
		)
	and t2.website is not null
	and t2.website != ''
	and trim(t2.website) != ''
	and upper(trim(t1.company_name)) = upper(trim(t2.company_name));