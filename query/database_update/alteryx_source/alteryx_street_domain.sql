update ig_staging.company as t1
set street_address = upper(trim(t2.billing_address_street))
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and (
		t1.street_address is null
		or t1.street_address = ''
		or trim(t1.street_address) = ''
		)
	and t2.billing_address_street is not null
	and t2.billing_address_street != ''
	and trim(t2.billing_address_street) != ''
	and t1.email_domain is not null
	and t1.email_domain != ''
	and trim(t1.email_domain) != ''
	and lower(trim(t1.email_domain)) = lower(trim(replace(replace(replace(t2.company_website, 'https://', ''), 'http://', ''), 'www.', '')));