update ig_staging.company as t1
set postal_code = upper(trim(t2.billing_address_postalcode))
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and (
		t1.postal_code is null
		or t1.postal_code = ''
		or trim(t1.postal_code) = ''
		)
	and t2.billing_address_postalcode is not null
	and t2.billing_address_postalcode != ''
	and trim(t2.billing_address_postalcode) != ''
	and t1.company_linkedin_url is not null
	and t1.company_linkedin_url != ''
	and trim(t1.company_linkedin_url) != '' 
	and lower(trim(replace(t1.company_linkedin_url, 'https://www.', ''))) = lower(trim(t2.company_linkedin_url));